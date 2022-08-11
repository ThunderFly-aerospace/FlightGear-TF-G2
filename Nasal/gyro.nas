var g_dt = 0;
var gyro_crashed = 0;
var platform_mass = 0   ;  #initial startup value
var platform_active = 0;

var init = func {

	setprop("/sim/platform/weight-kg", platform_mass);
	setprop("/sim/platform/active", platform_active);
	print("Init Nasal Gyro ...done");

	main_loop();
}

# Setup listener call to start update loop once the fdm is initialized
setlistener("sim/signals/fdm-initialized", init);

var reinit = func {

	g_dt = 0;
	gyro_crashed = 0;
	setprop("/controls/rotor/brake", 0);
	setprop("/sim/platform/weight-kg", platform_mass);
	setprop("/sim/platform/active", platform_active);
	print("ReInit Nasal Gyro ...done");

}
setlistener("/sim/signals/reinit", reinit);


#main loop
var main_loop = func {

	check_g_load();
	check_vne_structure();

	check_rotor_rpm();
	check_platform_force();

	settimer(main_loop, 0);
}

var check_g_load = func {

	var g_load = getprop("/accelerations/pilot-g");

	if(g_load!=nil and g_load>4.1 )
	{
		screen.log.write("Too much G load !!!", 1, 0, 0);
	}

	if(g_load!=nil and g_load<0)
	{
		screen.log.write("Negative G load !!!", 1, 0, 0);
	}

}

var	check_vne_structure = func {
	var kias = getprop("velocities/airspeed-kt");
	if(kias!=nil and kias>110){
		screen.log.write("VNE exceeded !!!", 1, 0, 0);
	}
}

var	toggle_platform = func {
		platform_mass_active = 15;
		if (0 < getprop("/sim/platform/active"))  {
			setprop("/sim/platform/weight-kg", 0);
			setprop("/sim/platform/active", 0);
			gui.popupTip(sprintf("Load ejected"));
		}  else  {
			setprop("/sim/platform/active", 1);
			setprop("/sim/platform/weight-kg", platform_mass);
			gui.popupTip(sprintf("Load activated"));
		}
}

var	check_platform_force = func {
		if (0 < getprop("/sim/platform/active"))  {
			platform_mass = 10*getprop("/fdm/yasim/forces/f-z-lift") + 1;
			setprop("/sim/platform/weight-kg", platform_mass);
		}  else  {
			setprop("/sim/platform/weight-kg", 0);
		}
}


var	add_platform = func {
	mass = getprop("/sim/platform/weight-kg");
    setprop("/sim/platform/weight-kg", mass + 1);
	gui.popupTip(sprintf("Mass added %d", mass+1));
}

var	check_rotor_rpm = func {
		var rpm = getprop("/rotors/main/rpm");
		if(rpm!=nil and rpm>1200){
			#setprop("/sim/sound/crash",1);
			#setprop("/sim/messages/copilot","Rotor overspeed !!!");
			screen.log.write("Rotor overspeed !!!", 1, 0, 0);

			#uncomment when you want to crash
			#gyro_crashed = 1;
		}
}


var	apply_rotor_brake = func {

	if (gyro_crashed<1){
		interpolate("/controls/rotor/brake", 1.0, 2);
		#print("apply_rotor_brake");
	}
}

var	release_rotor_brake = func {

	if (gyro_crashed<1){
		interpolate("/controls/rotor/brake", 0.0, 2);
		#print("release_rotor_brake");
	}

}
