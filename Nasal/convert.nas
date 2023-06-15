#############################################################################
#### Helijah                                                     08-2020 ####
####                                                             03-2021 ####
####                                                             03-2022 ####
####                                                             08-2022 ####
####                                                             09-2022 ####
#### Quelques propriétés utiles                                          ####
#############################################################################

var convert = func {
  ###########################################################################
  var rpm0 = getprop("/engines/engine[0]/rpm");
  if ( ! rpm0 ) {
    rpm0 = 0;
  }
  var cht0 = getprop("/engines/engine[0]/cht-degC");
  if ( ! cht0 ) {
    cht0 = 0;
  }
  var mp0 = getprop("/engines/engine[0]/mp-osi");
  if (! mp0 ) {
    mp0 = 0;
  }
  var run0 = getprop("/engines/engine[0]/running");
  if (! run0 ) {
    run0 = 0;
  }
  var flow0 = getprop("/engines/engine[0]/fuel-flow-gph");
  if ( ! flow0 ) {
    flow0 = 0;
  }
  var oilt0 = getprop("/engines/engine[0]/oil-temperature");
  if ( ! oilt0 ) {
    oilt0 = 0;
  }
  ###########################################################################
  var rpm1 = getprop("/engines/engine[1]/rpm");
  if ( ! rpm1 ) {
    rpm1 = 0;
  }
  var cht1 = getprop("/engines/engine[1]/cht-degC");
  if ( ! cht1 ) {
    cht1 = 0;
  }
  var mp1 = getprop("/engines/engine[1]/mp-osi");
  if (! mp1 ) {
    mp1 = 0;
  }
  var run1 = getprop("/engines/engine[1]/running");
  if (! run1 ) {
    run1 = 0;
  }
  var flow1 = getprop("/engines/engine[1]/fuel-flow-gph");
  if ( ! flow1 ) {
    flow1 = 0;
  }
  var oilt1 = getprop("/engines/engine[1]/oil-temperature");
  if ( ! oilt1 ) {
    oilt1 = 0;
  }
  ###########################################################################
  var rpm2 = getprop("/engines/engine[2]/rpm");
  if ( ! rpm2 ) {
    rpm2 = 0;
  }
  var cht2 = getprop("/engines/engine[2]/cht-degC");
  if ( ! cht2 ) {
    cht2 = 0;
  }
  var mp2 = getprop("/engines/engine[2]/mp-osi");
  if (! mp2 ) {
    mp2 = 0;
  }
  var run2 = getprop("/engines/engine[2]/running");
  if (! run2 ) {
    run2 = 0;
  }
  var flow2 = getprop("/engines/engine[2]/fuel-flow-gph");
  if ( ! flow2 ) {
    flow2 = 0;
  }
  var oilt2 = getprop("/engines/engine[2]/oil-temperature");
  if ( ! oilt2 ) {
    oilt2 = 0;
  }
  ###########################################################################
  var rpm3 = getprop("/engines/engine[3]/rpm");
  if ( ! rpm3 ) {
    rpm3 = 0;
  }
  var cht3 = getprop("/engines/engine[3]/cht-degC");
  if ( ! cht3 ) {
    cht3 = 0;
  }
  var mp3 = getprop("/engines/engine[3]/mp-osi");
  if (! mp3 ) {
    mp3 = 0;
  }
  var run3 = getprop("/engines/engine[3]/running");
  if (! run3 ) {
    run3 = 0;
  }
  var flow3 = getprop("/engines/engine[3]/fuel-flow-gph");
  if ( ! flow3 ) {
    flow3 = 0;
  }
  var oilt3 = getprop("/engines/engine[3]/oil-temperature");
  if ( ! oilt3 ) {
    oilt3 = 0;
  }
  ###########################################################################
  var rpm4 = getprop("/engines/engine[4]/rpm");
  if ( ! rpm4 ) {
    rpm4 = 0;
  }
  var cht4 = getprop("/engines/engine[4]/cht-degC");
  if ( ! cht4 ) {
    cht4 = 0;
  }
  var mp4 = getprop("/engines/engine[4]/mp-osi");
  if (! mp4 ) {
    mp4 = 0;
  }
  var run4 = getprop("/engines/engine[4]/running");
  if (! run4 ) {
    run4 = 0;
  }
  var flow4 = getprop("/engines/engine[4]/fuel-flow-gph");
  if ( ! flow4 ) {
    flow4 = 0;
  }
  var oilt4 = getprop("/engines/engine[4]/oil-temperature");
  if ( ! oilt4 ) {
    oilt4 = 0;
  }
  ###########################################################################
  var rpm5 = getprop("/engines/engine[5]/rpm");
  if ( ! rpm5 ) {
    rpm5 = 0;
  }
  var cht5 = getprop("/engines/engine[5]/cht-degC");
  if ( ! cht5 ) {
    cht5 = 0;
  }
  var mp5 = getprop("/engines/engine[5]/mp-osi");
  if (! mp5 ) {
    mp5 = 0;
  }
  var run5 = getprop("/engines/engine[5]/running");
  if (! run5 ) {
    run5 = 0;
  }
  var flow5 = getprop("/engines/engine[5]/fuel-flow-gph");
  if ( ! flow5 ) {
    flow5 = 0;
  }
  var oilt5 = getprop("/engines/engine[5]/oil-temperature");
  if ( ! oilt5 ) {
    oilt5 = 0;
  }
  ###########################################################################
  var oat = getprop("/environment/temperature-degc");
  if ( ! oat ) {
    oat = 0;
  }
  var ias = getprop("/instrumentation/airspeed-indicator/indicated-speed-kt");
  if ( ! ias ) {
    ias = 0;
  }

  var mb0 = getprop("/engines/engine[0]/torque-ftlb");
  if ( ! mb0 ) {
    mb0 = 0;
  }
  var mb1 = getprop("/engines/engine[1]/torque-ftlb");
  if ( ! mb1 ) {
    mb1 = 0;
  }
  var mb2 = getprop("/engines/engine[2]/torque-ftlb");
  if ( ! mb2 ) {
    mb2 = 0;
  }
  var mb3 = getprop("/engines/engine[3]/torque-ftlb");
  if ( ! mb3 ) {
    mb3 = 0;
  }
  var mb4 = getprop("/engines/engine[4]/torque-ftlb");
  if ( ! mb4 ) {
    mb4 = 0;
  }
  var mb5 = getprop("/engines/engine[5]/torque-ftlb");
  if ( ! mb5 ) {
    mb5 = 0;
  }

  var fuel_pres0 = 0.0;
  var oil_pres0 = 0.0;
  var fuel_pres1 = 0.0;
  var oil_pres1 = 0.0;
  var fuel_pres2 = 0.0;
  var oil_pres2 = 0.0;
  var fuel_pres3 = 0.0;
  var oil_pres3 = 0.0;
  var fuel_pres4 = 0.0;
  var oil_pres4 = 0.0;
  var fuel_pres5 = 0.0;
  var oil_pres5 = 0.0;
  ###########################################################################

  if ( mp0 < 10) {
     mp0 = 10;
  }
  if ( mp1 < 10) {
     mp1 = 10;
  }
  if ( mp2 < 10) {
     mp2 = 10;
  }
  if ( mp3 < 10) {
     mp3 = 10;
  }
  if ( mp4 < 10) {
     mp4 = 10;
  }
  if ( mp5 < 10) {
     mp5 = 10;
  }

  #Engine 0
  if (run0) {
    cht0  = cht0 + (mp0 * 8 + oat - ias/3 - cht0) / 250;
    oilt0 = oilt0 +(rpm0 / 25 + oat - oilt0) / 250;
  } else {
    if ( ! cht0  ) {
      cht0 = oat;
    }
    if ( ! oilt0 ) {
      oilt0 = oat;
    }
    cht0 = cht0 + (oat - cht0)/100;
    oilt0 = oilt0 + (oat - oilt0)/100;
  }
  #Engine 1
  if (run1) {
    cht1  = cht1 + (mp1 * 8 + oat - ias/3 - cht1) / 250;
    oilt1 = oilt1 +(rpm1 / 25 + oat - oilt1) / 250;
  } else {
    if ( ! cht1  ) {
      cht1 = oat;
    }
    if ( ! oilt1 ) {
      oilt1 = oat;
    }
    cht1 = cht1 + (oat - cht1)/100;
    oilt1 = oilt1 + (oat - oilt1)/100;
  }
  #Engine 2
  if (run2) {
    cht2  = cht2 + (mp2 * 8 + oat - ias/3 - cht2) / 250;
    oilt2 = oilt2 +(rpm2 / 25 + oat - oilt2) / 250;
  } else {
    if ( ! cht2  ) {
      cht2 = oat;
    }
    if ( ! oilt2 ) {
      oilt2 = oat;
    }
    cht2 = cht2 + (oat - cht2)/100;
    oilt2 = oilt2 + (oat - oilt2)/100;
  }
  #Engine 3
  if (run3) {
    cht3  = cht3 + (mp3 * 8 + oat - ias/3 - cht3) / 250;
    oilt3 = oilt3 +(rpm3 / 25 + oat - oilt3) / 250;
  } else {
    if ( ! cht3  ) {
      cht3 = oat;
    }
    if ( ! oilt3 ) {
      oilt3 = oat;
    }
    cht3 = cht3 + (oat - cht3)/100;
    oilt3 = oilt3 + (oat - oilt3)/100;
  }
  #Engine 4
  if (run4) {
    cht4  = cht4 + (mp4 * 8 + oat - ias/3 - cht4) / 250;
    oilt4 = oilt4 +(rpm4 / 25 + oat - oilt4) / 250;
  } else {
    if ( ! cht4  ) {
      cht4 = oat;
    }
    if ( ! oilt4 ) {
      oilt4 = oat;
    }
    cht4 = cht4 + (oat - cht4)/100;
    oilt4 = oilt4 + (oat - oilt4)/100;
  }
  #Engine 5
  if (run5) {
    cht5  = cht5 + (mp5 * 8 + oat - ias/3 - cht5) / 250;
    oilt5 = oilt5 +(rpm5 / 25 + oat - oilt5) / 250;
  } else {
    if ( ! cht5  ) {
      cht5 = oat;
    }
    if ( ! oilt5 ) {
      oilt5 = oat;
    }
    cht5 = cht5 + (oat - cht5)/100;
    oilt5 = oilt5 + (oat - oilt5)/100;
  }

  #Engine 0
  if (rpm0 > 100.0) {
    fuel_pres0 = rpm0 / 100;
    oil_pres0 = rpm0 / 25;
  }
  #Engine 1
  if (rpm1 > 100.0) {
    fuel_pres1 = rpm1 / 100;
    oil_pres1 = rpm1 / 25;
  }
  #Engine 2
  if (rpm2 > 100.0) {
    fuel_pres2 = rpm2 / 100;
    oil_pres2 = rpm2 / 25;
  }
  #Engine 3
  if (rpm3 > 100.0) {
    fuel_pres3 = rpm3 / 100;
    oil_pres3 = rpm3 / 25;
  }
  #Engine 4
  if (rpm4 > 100.0) {
    fuel_pres4 = rpm4 / 100;
    oil_pres4 = rpm4 / 25;
  }
  #Engine 5
  if (rpm5 > 100.0) {
    fuel_pres5 = rpm5 / 100;
    oil_pres5 = rpm5 / 25;
  }

  setprop("/engines/engine[0]/oil-pressure-psi", oil_pres0);
  setprop("/engines/engine[0]/fuel-pressure-psi", fuel_pres0);

  setprop("/engines/engine[1]/oil-pressure-psi", oil_pres1);
  setprop("/engines/engine[1]/fuel-pressure-psi", fuel_pres1);

  setprop("/engines/engine[2]/oil-pressure-psi", oil_pres2);
  setprop("/engines/engine[2]/fuel-pressure-psi", fuel_pres2);

  setprop("/engines/engine[3]/oil-pressure-psi", oil_pres3);
  setprop("/engines/engine[3]/fuel-pressure-psi", fuel_pres3);

  setprop("/engines/engine[4]/oil-pressure-psi", oil_pres3);
  setprop("/engines/engine[4]/fuel-pressure-psi", fuel_pres3);

  setprop("/engines/engine[5]/oil-pressure-psi", oil_pres3);
  setprop("/engines/engine[5]/fuel-pressure-psi", fuel_pres3);

  setprop("/engines/engine[0]/cht-degC", cht0);
  setprop("/engines/engine[0]/oil-temperature", oilt0);

  setprop("/engines/engine[1]/cht-degC", cht1);
  setprop("/engines/engine[1]/oil-temperature", oilt1);

  setprop("/engines/engine[2]/cht-degC", cht2);
  setprop("/engines/engine[2]/oil-temperature", oilt2);

  setprop("/engines/engine[3]/cht-degC", cht3);
  setprop("/engines/engine[3]/oil-temperature", oilt3);

  setprop("/engines/engine[4]/cht-degC", cht4);
  setprop("/engines/engine[4]/oil-temperature", oilt4);

  setprop("/engines/engine[5]/cht-degC", cht5);
  setprop("/engines/engine[5]/oil-temperature", oilt5);

  setprop("/systems/electrical/amp", (rpm0 + rpm1 + rpm2 + rpm3 + rpm4 + rpm5) / 100 );

  ##################################################
  # Torque -> Pourcent by Helijah : Max 4094 -> 100%
  ##################################################
  var torqpourcent = mb0  * 0.0244259892526;
  setprop("/engines/engine[0]/torque-pourcent", torqpourcent);
  var smb = sprintf("%03.f", torqpourcent);

  setprop("/engines/engine[0]/Torque/unit100", chr(smb[0]));
  setprop("/engines/engine[0]/Torque/unit10", chr(smb[1]));
  setprop("/engines/engine[0]/Torque/unit1", chr(smb[2]));

  torqpourcent = mb1  * 0.0244259892526;
  setprop("/engines/engine[1]/torque-pourcent", torqpourcent);
  smb = sprintf("%03.f", torqpourcent);

  setprop("/engines/engine[1]/Torque/unit100", chr(smb[0]));
  setprop("/engines/engine[1]/Torque/unit10", chr(smb[1]));
  setprop("/engines/engine[1]/Torque/unit1", chr(smb[2]));

  torqpourcent = mb2  * 0.0244259892526;
  setprop("/engines/engine[2]/torque-pourcent", torqpourcent);
  smb = sprintf("%03.f", torqpourcent);

  setprop("/engines/engine[2]/Torque/unit100", chr(smb[0]));
  setprop("/engines/engine[2]/Torque/unit10", chr(smb[1]));
  setprop("/engines/engine[2]/Torque/unit1", chr(smb[2]));

  torqpourcent = mb3  * 0.0244259892526;
  setprop("/engines/engine[3]/torque-pourcent", torqpourcent);
  smb = sprintf("%03.f", torqpourcent);

  setprop("/engines/engine[3]/Torque/unit100", chr(smb[0]));
  setprop("/engines/engine[3]/Torque/unit10", chr(smb[1]));
  setprop("/engines/engine[3]/Torque/unit1", chr(smb[2]));

  torqpourcent = mb4  * 0.0244259892526;
  setprop("/engines/engine[4]/torque-pourcent", torqpourcent);
  smb = sprintf("%03.f", torqpourcent);

  setprop("/engines/engine[4]/Torque/unit100", chr(smb[0]));
  setprop("/engines/engine[4]/Torque/unit10", chr(smb[1]));
  setprop("/engines/engine[4]/Torque/unit1", chr(smb[2]));

  torqpourcent = mb5  * 0.0244259892526;
  setprop("/engines/engine[5]/torque-pourcent", torqpourcent);
  smb = sprintf("%03.f", torqpourcent);

  setprop("/engines/engine[5]/Torque/unit100", chr(smb[0]));
  setprop("/engines/engine[5]/Torque/unit10", chr(smb[1]));
  setprop("/engines/engine[5]/Torque/unit1", chr(smb[2]));
  ##################################################

  setprop("/engines/engine[0]/egt-degC", convertTemp(getprop("/engines/engine[0]/egt-degf")));
  setprop("/engines/engine[0]/oil-temperature-degC", getprop("/engines/engine[0]/oil-temperature"));

  setprop("/engines/engine[1]/egt-degC", convertTemp(getprop("/engines/engine[1]/egt-degf")));
  setprop("/engines/engine[1]/oil-temperature-degC", getprop("/engines/engine[1]/oil-temperature"));

  setprop("/engines/engine[2]/egt-degC", convertTemp(getprop("/engines/engine[2]/egt-degf")));
  setprop("/engines/engine[2]/oil-temperature-degC", getprop("/engines/engine[2]/oil-temperature"));

  setprop("/engines/engine[3]/egt-degC", convertTemp(getprop("/engines/engine[3]/egt-degf")));
  setprop("/engines/engine[3]/oil-temperature-degC", getprop("/engines/engine[3]/oil-temperature"));

  setprop("/engines/engine[4]/egt-degC", convertTemp(getprop("/engines/engine[4]/egt-degf")));
  setprop("/engines/engine[4]/oil-temperature-degC", getprop("/engines/engine[4]/oil-temperature"));

  setprop("/engines/engine[5]/egt-degC", convertTemp(getprop("/engines/engine[5]/egt-degf")));
  setprop("/engines/engine[5]/oil-temperature-degC", getprop("/engines/engine[5]/oil-temperature"));

  setprop("/engines/engine[0]/itt-norm", getprop("/engines/engine[0]/cht-degC") / 100);
  setprop("/engines/engine[1]/itt-norm", getprop("/engines/engine[1]/cht-degC") / 100);
  setprop("/engines/engine[2]/itt-norm", getprop("/engines/engine[2]/cht-degC") / 100);
  setprop("/engines/engine[3]/itt-norm", getprop("/engines/engine[3]/cht-degC") / 100);
  setprop("/engines/engine[4]/itt-norm", getprop("/engines/engine[4]/cht-degC") / 100);
  setprop("/engines/engine[5]/itt-norm", getprop("/engines/engine[5]/cht-degC") / 100);
}

var convertTemp = func(degF) {
  var degC = 0;
  if ( degF != nil ) {
    #print(degF);
    degC = (degF - 32) * 5/9;
  }
  return degC;
}

###  Main loop ###
var update_convert = func {
  convert();
  settimer(update_convert, 0);
}
setlistener("/sim/signals/fdm-initialized", update_convert);
