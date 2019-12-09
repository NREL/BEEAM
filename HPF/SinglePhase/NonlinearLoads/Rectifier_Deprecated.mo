within HPF.SinglePhase.NonlinearLoads;
model Rectifier_Deprecated
                          // visible only within this class (internal use variables)
/*
          Populating S (apparent power) vector. S = P + iQ
          S = {S1, 0, 0, ...}
        */
  outer SystemDef systemDef;
  HPF.Utilities.ComponentProperties properties(ComponentType = "NonlinearLoad");

  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation (
    Placement(visible = true, transformation(origin = {74, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation (
    Placement(visible = true, transformation(origin = {80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-94, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N hPin_N(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-92, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real V_Rect(start = 0) = 1 "Rectifier DC output";
  parameter Real efficiency(start = 1) = 0.9 "Rectifier efficiency";
  parameter Real hrmMdl_coefMag[:] = {1} "Harmonic model magnitude polynomial coefficient";
  parameter Real hrmMdl_coefArg[:] = {0} "Harmonic model argument (angle, [rad]) polynomial coefficient";
  parameter Real rectifierModel "Rectifier model (Other model parameters passed as a record?)";
  Real P = constantVoltage1.v * constantVoltage1.i;
  HPF.SinglePhase.Interface.LoadBase loadBase1 annotation (
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage vDC(V=V_Rect) annotation (
    Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
protected
  Real Q = 0.5;
  // reactive power (tmp)
  Complex S_vect[systemDef.numHrm](each re(start = 0, nominal = 1), each im(start = 0, nominal = 1)) = cat(1, {Complex(P * efficiency, Q)}, {Complex(0.0) for i in 1:systemDef.numHrm - 1});
  //Complex vHrmFundPre(re( start = 0), im( start = 0)) "tmp variable to store voltage from power flow analysis";
  /*
        Additional varialbes for unique file name (intermediary simulation data storage).
      */
  Real globalSeed = 9854;
equation

/*
    -----------------------------------------------
    Power flow 
    * Fundamental at negative real power (power sink)
    * Higher harmonics at zero power.
  */
  if systemDef.modeSelect == false then
    S_vect[:].re = loadBase1.v[:].re .* loadBase1.i[:].re;
    S_vect[:].im = loadBase1.v[:].im .* (-loadBase1.i[:].im);
/*
      DC side,
      
      Power consumed by AC side should be a function of power drawn by the DC side.
    */
  else
/*
    Current source
    
    r*exp(i*theta) = r(sin(theta) + i*cos(theta)) 
    Evaluate model polynomial at given harmonics for the magnitude and phase.
  */
    loadBase1.i[:].re = {Utilities.polyval(hrmMdl_coefMag, h) for h in systemDef.hrms} .* Modelica.Math.sin({Utilities.polyval(hrmMdl_coefArg, h) for h in systemDef.hrms});
    loadBase1.i[:].im = {Utilities.polyval(hrmMdl_coefMag, h) for h in systemDef.hrms} .* Modelica.Math.cos({Utilities.polyval(hrmMdl_coefArg, h) for h in systemDef.hrms});
/*
      DC side, voltage source
    */
//vDC = V_Rect;
  end if;

  /*
    Connections section 
    ---------------------------------------------
  */

  connect(hPin_P, loadBase1.pin_p) annotation (
    Line(points = {{-94, 40}, {-30, 40}, {-30, 10}}));
  connect(loadBase1.pin_n, hPin_N) annotation (
    Line(points = {{-30, -10}, {-30, -64}, {-92, -64}}, color = {117, 80, 123}));
  connect(vDC.p, pin_p) annotation (
    Line(points = {{20, 0}, {20, 0}, {20, 38}, {74, 38}, {74, 38}}, color = {0, 0, 255}));
  connect(vDC.n, pin_n) annotation (
    Line(points = {{20, -20}, {20, -20}, {20, -62}, {80, -62}, {80, -60}}, color = {0, 0, 255}));
algorithm
/*
    Event: save computed voltages to file.
  */
  when change(systemDef.eventWriteData) then
  end when;
//HPF.SinglePhase.NonlinearLoads.DataIO.writeNodeVoltage(vHrm[1], "testLoad");
/*
    Event: read saved voltages from file.
  */
  when change(systemDef.eventReadData) then
  end when;
//vHrmFundPre := HPF.SinglePhase.NonlinearLoads.DataIO.readNodeVoltage("testLoad");
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(origin = {-1, 0}, extent = {{-89, 140}, {91, -140}}), Line(origin = {-40.3058, -20.4264}, points = {{-40.9518, -0.0403469}, {-36.9518, 15.9597}, {-30.9518, 31.9597}, {-20.9518, 39.9597}, {-12.9518, 35.9597}, {-6.95182, 19.9597}, {-2.95182, 1.95965}, {1.04818, -18.0403}, {9.04818, -34.0403}, {21.0482, -40.0403}, {31.0482, -30.0403}, {39.0482, -14.0403}, {41.0482, -0.04035}}, smooth = Smooth.Bezier), Line(origin = {-23.8557, 63.6406}, points = {{0, 24}, {0, -24}}), Line(origin = {-13.0842, 63.6959}, points = {{0, 14}, {0, -24}}), Line(origin = {-3.85568, 63.8354}, points = {{0, 4}, {0, -24}}), Line(origin = {25.1858, 63.9938}, points = {{0, -12}, {0, -24}}), Line(origin = {15.8502, 63.9612}, points = {{0, -4}, {0, -24}}), Line(origin = {5.18579, 63.2641}, points = {{0, 2}, {0, -24}}), Line(origin = {-5.08799, 39.4966}, rotation = -90, points = {{0, 36}, {0, -24}}), Line(origin = {55.026, -9.08678}, points = {{-25, 0}, {25, 0}}), Line(origin = {13.8215, -23.0969}, points = {{21.8292, 43.5528}, {-22.1708, -44.4472}, {-22.1708, -42.4472}}), Text(origin = {-29, 171}, extent = {{-51, 33}, {97, -43}}, textString = "%name"), Line(origin = {55.4, -31.76}, points = {{-25, 0}, {25, 0}}, pattern = LinePattern.Dash)}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0}, initialScale = 0.1)));
end Rectifier_Deprecated;
