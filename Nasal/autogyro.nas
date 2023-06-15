# Maik Justus < fg # mjustus : de >, based on bo105.nas by Melchior FRANZ, < mfranz # aon : at >

if (!contains(globals, "cprint")) {
  globals.cprint = func {};
}

var optarg         = aircraft.optarg;
var makeNode       = aircraft.makeNode;

var sin            = func(a) { math.sin(a * math.pi / 180.0) }
var cos            = func(a) { math.cos(a * math.pi / 180.0) }
var pow            = func(v, w) { math.exp(math.ln(v) * w) }
var npow           = func(v, w) { math.exp(math.ln(abs(v)) * w) * (v < 0 ? -1 : 1) }
var clamp          = func(v, min = 0, max = 1) { v < min ? min : v > max ? max : v }
var normatan       = func(x) { math.atan2(x, 1) * 2 / math.pi }

# rotor =====================================================
var rotor_rpm      = props.globals.getNode("rotors/main/rpm");
var stall          = props.globals.getNode("rotors/main/stall", 1);
var stall_filtered = props.globals.getNode("rotors/main/stall-filtered", 1);

# sound =============================================================

# stall sound
var stall_val = 0;
stall.setDoubleValue(0);

var update_stall = func(dt) {
  var s = stall.getValue();
  if (s < stall_val) {
    var f = dt / (0.3 + dt);
    stall_val = s * f + stall_val * (1 - f);
  } else {
    stall_val = s;
  }
  stall_filtered.setDoubleValue(stall_val);
}

# crash handler =====================================================
#var load = nil;
var crash = func {
  if (arg[0]) {
    # crash
    setprop("rotors/main/rpm", 0);
    setprop("rotors/main/blade[0]/flap-deg", -60);
    setprop("rotors/main/blade[1]/flap-deg", -50);
    setprop("rotors/main/blade[0]/incidence-deg", -30);
    setprop("rotors/main/blade[1]/incidence-deg", -20);
    stall_filtered.setValue(stall_val = 0);
  } else {
    # uncrash (for replay)
    setprop("rotors/main/rpm", 350);
    for (i = 0; i < 2; i += 1) {
      setprop("rotors/main/blade[" ~ i ~ "]/flap-deg", 0);
      setprop("rotors/main/blade[" ~ i ~ "]/incidence-deg", 0);
    }
  }
}

# "manual" rotor animation for flight data recorder replay ============
var rotor_step = props.globals.getNode("sim/model/TF-G2/rotor-step-deg",1);
var blade1_pos = props.globals.getNode("rotors/main/blade[0]/position-deg", 1);
var blade2_pos = props.globals.getNode("rotors/main/blade[1]/position-deg", 1);
var rotorangle = 0;

var rotoranim_loop = func {
  i = rotor_step.getValue();
  if (i >= 0.0) {
    blade1_pos.setValue(rotorangle);
    blade2_pos.setValue(rotorangle + 180);
    rotorangle += i;
    settimer(rotoranim_loop, 0.1);
  }
}

var init_rotoranim = func {
  if (rotor_step.getValue() >= 0.0) {
    settimer(rotoranim_loop, 0.1);
  }
}

# view management ===================================================

var elapsedN = props.globals.getNode("/sim/time/elapsed-sec", 1);
var flap_mode = 0;
var down_time = 0;
controls.flapsDown = func(v) {
  if (!flap_mode) {
    if (v < 0) {
      down_time = elapsedN.getValue();
      flap_mode = 1;
      dynamic_view.lookat(
          5,     # heading left
          -20,   # pitch up
          0,     # roll right
          0.2,   # right
          0.6,   # up
          0.85,  # back
          0.2,   # time
          55,    # field of view
      );
    } elsif (v > 0) {
      flap_mode = 2;
      var p = "/sim/view/dynamic/enabled";
      setprop(p, !getprop(p));
    }

  } else {
    if (flap_mode == 1) {
      if (elapsedN.getValue() < down_time + 0.2) {
        return;
      }
      dynamic_view.resume();
    }
    flap_mode = 0;
  }
}

# register function that may set me.heading_offset, me.pitch_offset, me.roll_offset,
# me.x_offset, me.y_offset, me.z_offset, and me.fov_offset
#
dynamic_view.register(func {
  var lowspeed = 1 - normatan(me.speedN.getValue() / 50);
  var r = sin(me.roll) * cos(me.pitch);

  #                     heading change due to   | roll left/right
  me.heading_offset = (me.roll < 0 ? -50 : -30) * r * abs(r);

  #                     pitch change due to    |     pitch down/up        |                 roll
  me.pitch_offset = (me.pitch < 0 ? -50 : -50) * sin(me.pitch) * lowspeed + 15 * sin(me.roll) * sin(me.roll);

  #              roll change due to roll
  me.roll_offset = -15 * r * lowspeed;
});

# main() ============================================================
var delta_time = props.globals.getNode("/sim/time/delta-realtime-sec", 1);
var adf_rotation = props.globals.getNode("/instrumentation/adf/rotation-deg", 1);
var hi_heading = props.globals.getNode("/instrumentation/heading-indicator/indicated-heading-deg", 1);

var main_loop = func {
  # adf_rotation.setDoubleValue(hi_heading.getValue());

  var dt = delta_time.getValue();
  update_stall(dt);
  settimer(main_loop, 0);
}

var crashed = 0;

# initialization
setlistener("/sim/signals/fdm-initialized", func {

  init_rotoranim();

  setlistener("/sim/signals/reinit", func(n) {
    n.getBoolValue() and return;
    cprint("32;1", "reinit");
    crashed = 0;
  });

  setlistener("sim/crashed", func(n) {
    cprint("31;1", "crashed ", n.getValue());
    if (n.getBoolValue()) {
      crash(crashed = 1);
    }
  });

  setlistener("/sim/freeze/replay-state", func(n) {
    cprint("33;1", n.getValue() ? "replay" : "pause");
    if (crashed) {
      crash(!n.getBoolValue())
    }
  });

  main_loop();
});
