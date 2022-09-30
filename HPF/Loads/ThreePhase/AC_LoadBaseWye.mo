within HPF.Loads.ThreePhase;

partial model AC_LoadBaseWye
  
  // Harmonic system definition
  outer SystemDef systemDef;
  
  // Device Ratings
  parameter Modelica.SIunits.ActivePower P_nom = 100 "Nominal real power" annotation(
    Dialog(group = "Device Ratings"));
  parameter Modelica.SIunits.ReactivePower Q_nom = 0 "Nominal reactive power" annotation(
    Dialog(group = "Device Ratings"));
  parameter Modelica.SIunits.Voltage V_nom = 277 "Nominal AC operating voltage (line-neutral)" annotation(
    Dialog(group = "Device Ratings"));
  final parameter Modelica.SIunits.ComplexPower S_nom = Complex(P_nom, Q_nom) "Nominal AC complex power";
  final parameter Modelica.SIunits.Current I_nom = (Modelica.ComplexMath.'abs'(S_nom) / 3) / V_nom "Nominal AC current";
  
  // Initialization
  parameter Modelica.SIunits.Angle vAngle_init = 0 "Nominal phase A voltage angle for solver init" annotation(
    Dialog(group = "Initialization"));
  final parameter Modelica.SIunits.ComplexVoltage VA_init = Modelica.ComplexMath.fromPolar(V_nom, vAngle_init);
  final parameter Modelica.SIunits.ComplexVoltage VB_init = Modelica.ComplexMath.fromPolar(V_nom, vAngle_init - Modelica.SIunits.Conversions.from_deg(120));
  final parameter Modelica.SIunits.ComplexVoltage VC_init = Modelica.ComplexMath.fromPolar(V_nom, vAngle_init + Modelica.SIunits.Conversions.from_deg(120));
  final parameter Modelica.SIunits.ComplexCurrent IA_init = Modelica.ComplexMath.conj(S_nom / 3 / VA_init);
  final parameter Modelica.SIunits.ComplexCurrent IB_init = Modelica.ComplexMath.conj(S_nom / 3 / VB_init);
  final parameter Modelica.SIunits.ComplexCurrent IC_init = Modelica.ComplexMath.conj(S_nom / 3 / VC_init);
  
  // AC measurements: Phases A, B, C
  Real IA_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseA.i);
  Real IB_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseB.i);
  Real IC_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseC.i);
  Real IA_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseA.i);
  Real IB_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseB.i);
  Real IC_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseC.i);
  Real VA_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseA.v);
  Real VB_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseB.v);
  Real VC_mag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(phaseC.v);
  Real VA_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseA.v);
  Real VB_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseB.v);
  Real VC_arg[systemDef.numHrm] = Modelica.ComplexMath.arg(phaseC.v);
  
  // AC power
  Modelica.SIunits.ComplexPower S_load "Total complex power";
  
  // Terminals
  HPF.SinglePhase.Interface.HPin_P hPin_A(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, 70}, {-90, 90}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_B(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, 20}, {-90, 40}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_C(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -30}, {-90, -10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N hPin_N(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(extent = {{-110, -90}, {-90, -70}}, rotation = 0)));
  
  // Load block
  HPF.SinglePhase.Interface.LoadBase phaseA(start_i_im = cat(1, {IA_init.im}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {IA_init.re}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im = cat(1, {VA_init.im}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {VA_init.re}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation(
    Placement(visible = true, transformation(origin = {10, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Interface.LoadBase phaseC(start_i_im = cat(1, {IC_init.im}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {IC_init.re}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im = cat(1, {VC_init.im}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {VC_init.re}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Interface.LoadBase phaseB(start_i_im = cat(1, {IB_init.im}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {IB_init.re}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im = cat(1, {VB_init.im}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_re = cat(1, {VB_init.re}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
    
  // Connections
  connect(phaseA.pin_p, hPin_A) annotation(
    Line(points = {{10, -20}, {10, 80}, {-80, 80}}, color = {92, 53, 102}));
  connect(phaseB.pin_n, hPin_N) annotation(
    Line(points = {{-20, -40}, {-20, -80}, {-80, -80}}, color = {117, 80, 123}));
  connect(phaseB.pin_p, hPin_B) annotation(
    Line(points = {{-20, -20}, {-20, 40}, {-80, 40}}, color = {92, 53, 102}));
  connect(phaseC.pin_n, hPin_N) annotation(
    Line(points = {{-50, -40}, {-50, -80}, {-80, -80}}, color = {117, 80, 123}));
  connect(phaseA.pin_n, hPin_N) annotation(
    Line(points = {{10, -40}, {10, -80}, {-80, -80}}, color = {117, 80, 123}));
  connect(phaseC.pin_p, hPin_C) annotation(
    Line(points = {{-50, -20}, {-50, 0}, {-80, 0}}, color = {92, 53, 102}));
end AC_LoadBaseWye;
