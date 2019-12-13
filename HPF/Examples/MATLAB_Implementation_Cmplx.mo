within HPF.Examples;

model MATLAB_Implementation_Cmplx
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1}) annotation(
    Placement(visible = true, transformation(origin = {-69.125, 52.1459}, extent = {{-12.875, -12.875}, {12.875, 9.19641}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-36, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource voltageSource(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-36, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance impedance(z = 25 - 43.3013 * j) annotation(
    Placement(visible = true, transformation(origin = {40, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance impedance1(z = 0.4330 + 0.25 * j) annotation(
    Placement(visible = true, transformation(origin = {-16, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Test_components.HarmonicSource_MATLAB_Implementation_Cmplx harmonicSource_MATLAB_Implementation_Cmplx annotation(
    Placement(visible = true, transformation(origin = {10, 2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Test_components.HarmonicSource_MATLAB_Implementation_Cmplx harmonicSource_MATLAB_Implementation_Cmplx1(P = 0, phi = 0.3) annotation(
    Placement(visible = true, transformation(origin = {62, 2}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Test_components.HarmonicSource_MATLAB_Implementation_Cmplx harmonicSource_MATLAB_Implementation_Cmplx2(P = 1000, phi = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {10, 66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance impedance2(z = 0.4330 + 0.25 * j) annotation(
    Placement(visible = true, transformation(origin = {-16, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance impedance3(z = 25 - 43.3013 * j) annotation(
    Placement(visible = true, transformation(origin = {40, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-36, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource voltageSource1(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm})) annotation(
    Placement(visible = true, transformation(origin = {-36, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-32, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sources.VoltageSource voltageSource2(V = 120, f = 60, phi = 0) annotation(
    Placement(visible = true, transformation(origin = {-32, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Test_components.Load_QuasiLib load_QuasiLib(arg_S = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {20, -64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Impedance impedance4(Z_ref = Complex(0.4330, 0.25))  annotation(
    Placement(visible = true, transformation(origin = {-4, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Impedance impedance5(Z_ref = Complex(25, -43.3013))  annotation(
    Placement(visible = true, transformation(origin = {46, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pin_n, ground1.pin) annotation(
    Line(points = {{-36, -14}, {-36, -22}}, color = {117, 80, 123}));
  connect(impedance.pin_p, impedance1.pin_n) annotation(
    Line(points = {{30, 28}, {-6, 28}}));
  connect(impedance1.pin_p, voltageSource.pin_p) annotation(
    Line(points = {{-26, 28}, {-36, 28}, {-36, 6}}));
  connect(harmonicSource_MATLAB_Implementation_Cmplx.pin_p, impedance1.pin_n) annotation(
    Line(points = {{10, 12}, {10, 28}, {-6, 28}}));
  connect(harmonicSource_MATLAB_Implementation_Cmplx.pin_n, ground1.pin) annotation(
    Line(points = {{10, -8}, {10, -22}, {-36, -22}}, color = {117, 80, 123}));
  connect(harmonicSource_MATLAB_Implementation_Cmplx1.pin_n, harmonicSource_MATLAB_Implementation_Cmplx.pin_n) annotation(
    Line(points = {{62, -8}, {10, -8}}, color = {117, 80, 123}));
  connect(harmonicSource_MATLAB_Implementation_Cmplx1.pin_p, impedance.pin_n) annotation(
    Line(points = {{62, 12}, {62, 28}, {50, 28}}));
  connect(impedance2.pin_p, voltageSource1.pin_p) annotation(
    Line(points = {{-26, 92}, {-36, 92}, {-36, 70}}));
  connect(harmonicSource_MATLAB_Implementation_Cmplx2.pin_n, ground.pin) annotation(
    Line(points = {{10, 56}, {10, 42}, {-36, 42}}, color = {117, 80, 123}));
  connect(impedance3.pin_p, impedance2.pin_n) annotation(
    Line(points = {{30, 92}, {-6, 92}}));
  connect(voltageSource1.pin_n, ground.pin) annotation(
    Line(points = {{-36, 50}, {-36, 42}}, color = {117, 80, 123}));
  connect(harmonicSource_MATLAB_Implementation_Cmplx2.pin_p, impedance2.pin_n) annotation(
    Line(points = {{10, 76}, {10, 92}, {-6, 92}}));
  connect(impedance3.pin_n, ground.pin) annotation(
    Line(points = {{50, 92}, {60, 92}, {60, 42}, {-36, 42}}, color = {117, 80, 123}));
  connect(voltageSource2.pin_n, ground2.pin) annotation(
    Line(points = {{-32, -66}, {-32, -84}}, color = {85, 170, 255}));
  connect(load_QuasiLib.pin_n, ground2.pin) annotation(
    Line(points = {{20, -74}, {20, -84}, {-32, -84}}, color = {85, 170, 255}));
  connect(impedance5.pin_n, ground2.pin) annotation(
    Line(points = {{56, -46}, {74, -46}, {74, -84}, {-32, -84}}, color = {85, 170, 255}));
  connect(impedance4.pin_n, impedance5.pin_p) annotation(
    Line(points = {{6, -46}, {36, -46}, {36, -46}, {36, -46}}, color = {85, 170, 255}));
  connect(load_QuasiLib.pin_p, impedance4.pin_n) annotation(
    Line(points = {{20, -54}, {20, -46}, {6, -46}}, color = {85, 170, 255}));
  connect(impedance4.pin_p, voltageSource2.pin_p) annotation(
    Line(points = {{-14, -46}, {-32, -46}, {-32, -46}, {-32, -46}}, color = {85, 170, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end MATLAB_Implementation_Cmplx;