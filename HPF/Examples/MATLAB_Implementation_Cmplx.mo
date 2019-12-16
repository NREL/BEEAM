within HPF.Examples;

model MATLAB_Implementation_Cmplx
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {i for i in 1:2:5}) annotation(
    Placement(visible = true, transformation(origin = {-69.125, 52.1459}, extent = {{-12.875, -12.875}, {12.875, 9.19641}}, rotation = 0)));
  HPF.Test_components.HarmonicSource_MATLAB_Implementation_Cmplx harmonicSource_MATLAB_Implementation_Cmplx2(P = 1000, phi = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {12, 54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance impedance2(z = 0.8 + 0.008 * j) annotation(
    Placement(visible = true, transformation(origin = {-14, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance impedance3(z = 25 + 0.3013 * j) annotation(
    Placement(visible = true, transformation(origin = {42, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-34, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource voltageSource1(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-34, 56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-34, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource2(V = 120, f = 60, phi = 0) annotation(
    Placement(visible = true, transformation(origin = {-34, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Test_components.Load_QuasiLib load_QuasiLib(arg_S = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {18, -16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Impedance impedance4(Z_ref = Complex(0.4330, 0.25))  annotation(
    Placement(visible = true, transformation(origin = {-6, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Impedance impedance5(Z_ref = Complex(25, -43.3013))  annotation(
    Placement(visible = true, transformation(origin = {44, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(impedance2.pin_p, voltageSource1.pin_p) annotation(
    Line(points = {{-24, 80}, {-34, 80}, {-34, 66}}));
  connect(harmonicSource_MATLAB_Implementation_Cmplx2.pin_n, ground.pin) annotation(
    Line(points = {{12, 44}, {12, 30}, {-34, 30}}, color = {117, 80, 123}));
  connect(impedance3.pin_p, impedance2.pin_n) annotation(
    Line(points = {{32, 80}, {-4, 80}}));
  connect(voltageSource1.pin_n, ground.pin) annotation(
    Line(points = {{-34, 46}, {-34, 30}}, color = {117, 80, 123}));
  connect(harmonicSource_MATLAB_Implementation_Cmplx2.pin_p, impedance2.pin_n) annotation(
    Line(points = {{12, 64}, {12, 80}, {-4, 80}}));
  connect(impedance3.pin_n, ground.pin) annotation(
    Line(points = {{52, 80}, {62, 80}, {62, 30}, {-34, 30}}, color = {117, 80, 123}));
  connect(voltageSource2.pin_n, ground2.pin) annotation(
    Line(points = {{-34, -18}, {-34, -36}}, color = {85, 170, 255}));
  connect(load_QuasiLib.pin_n, ground2.pin) annotation(
    Line(points = {{18, -26}, {18, -36}, {-34, -36}}, color = {85, 170, 255}));
  connect(impedance5.pin_n, ground2.pin) annotation(
    Line(points = {{54, 2}, {72, 2}, {72, -36}, {-34, -36}}, color = {85, 170, 255}));
  connect(impedance4.pin_n, impedance5.pin_p) annotation(
    Line(points = {{4, 2}, {34, 2}}, color = {85, 170, 255}));
  connect(load_QuasiLib.pin_p, impedance4.pin_n) annotation(
    Line(points = {{18, -6}, {18, 2}, {4, 2}}, color = {85, 170, 255}));
  connect(impedance4.pin_p, voltageSource2.pin_p) annotation(
    Line(points = {{-16, 2}, {-34, 2}}, color = {85, 170, 255}));  protected
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end MATLAB_Implementation_Cmplx;