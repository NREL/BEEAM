within HPF.Loads.SinglePhase;

partial model AC_LoadBase1P

  // Harmonic system definition
  outer SystemDef systemDef;
  
  // Device Ratings
  parameter Modelica.SIunits.ActivePower P_nom = 100 "Nominal real power" annotation(
    Dialog(group = "Device Ratings"));
  parameter Modelica.SIunits.ReactivePower Q_nom = 0 "Nominal reactive power" annotation(
    Dialog(group = "Device Ratings"));
  parameter Modelica.SIunits.Voltage V_nom = 120 "Nominal AC operating voltage" annotation(
    Dialog(group = "Device Ratings"));
  final parameter Modelica.SIunits.ComplexPower S_nom = Complex(P_nom, Q_nom) "Nominal AC complex power"; 
  final parameter Modelica.SIunits.Current I_nom = Modelica.ComplexMath.'abs'(S_nom) / V_nom "Nominal AC current";
  
  // Initialization
  parameter Modelica.SIunits.Angle vAngle_init = 0 "Nominal voltage angle for solver init" annotation(Dialog(group = "Initialization"));
  final parameter Modelica.SIunits.ComplexVoltage V_init = Modelica.ComplexMath.fromPolar(V_nom, vAngle_init);
  final parameter Modelica.SIunits.ComplexCurrent I_init = Modelica.ComplexMath.conj(S_nom / V_init);

  // AC measurements
  Real I_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseLN.i);
  Real I_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.i);
  Real V_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseLN.v);
  Real V_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseLN.v);
  
  // AC power
  Modelica.SIunits.ComplexPower S_load "Total complex power";
  
  // Terminals
  HPF.SinglePhase.Interface.HPin_P hPin_L(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-84, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N hPin_N(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-80, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));

  // Load block
  HPF.SinglePhase.Interface.LoadBase phaseLN(start_i_im = cat(1, {I_init.im}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {I_init.re}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im = cat(1, {V_init.im}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {V_init.re}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation(
    Placement(visible = true, transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

equation
  // Connections
  connect(phaseLN.pin_n, hPin_N) annotation(
    Line(points = {{-20, -20}, {-20, -60}, {-80, -60}}, color = {117, 80, 123}));
  connect(hPin_L, phaseLN.pin_p) annotation(
    Line(points = {{-84, 42}, {-20, 42}, {-20, 0}}));

end AC_LoadBase1P;
