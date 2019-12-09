within HPF.Examples;
model MATLAB_Implementation_Cmplx
  import Modelica.ComplexMath.j;
  HPF.SinglePhase.Sources.VoltageSource V_0h(vArg = {0 for i in 1:systemDef.numHrm}, vMag = cat(1, {120}, {1e-3 for i in 2:systemDef.numHrm})) annotation (
    Placement(visible = true, transformation(origin = {-36, 4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor r3(r = 1e-6) annotation (
    Placement(visible = true, transformation(origin = {12, -32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner HPF.SystemDef systemDef(hrms = {1}) annotation (
    Placement(visible = true, transformation(origin = {-62.4898, 52.3499}, extent = {{-13.5102, -13.5102}, {13.5102, 9.65013}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r(r = 1e-6) annotation (
    Placement(visible = true, transformation(origin = {12, 22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-36, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 0.4330 + 0.25 * j) annotation (
    Placement(visible = true, transformation(origin = {-12, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 25 - 43.3013 * j) annotation (
    Placement(visible = true, transformation(origin = {36, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Test_components.HarmonicSource_MATLAB_Implementation_Cmplx harmonicSource_MATLAB_Implementation_Cmplx(P=-1000)
                                                                                                            annotation (
    Placement(visible = true, transformation(origin = {12, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(V_0h.pin_n, ground.pin) annotation (
    Line(points = {{-36, -6}, {-36, -48}}, color = {117, 80, 123}));
  connect(r3.pin_n, ground.pin) annotation (
    Line(points = {{12, -42}, {12, -48}, {-36, -48}}, color = {117, 80, 123}));
  connect(r.pin_p, z1.pin_p) annotation (
    Line(points = {{12, 32}, {12, 36}, {26, 36}}));
  connect(r.pin_p, z.pin_n) annotation (
    Line(points = {{12, 32}, {12, 36}, {-2, 36}}));
  connect(z.pin_p, V_0h.pin_p) annotation (
    Line(points = {{-22, 36}, {-36, 36}, {-36, 14}}));
  connect(z1.pin_n, ground.pin) annotation (
    Line(points = {{46, 36}, {50, 36}, {50, -48}, {-36, -48}, {-36, -48}, {-36, -48}}, color = {117, 80, 123}));
  connect(harmonicSource_MATLAB_Implementation_Cmplx.pin_p, r.pin_n) annotation (
    Line(points = {{12, 4}, {12, 12}}));
  connect(harmonicSource_MATLAB_Implementation_Cmplx.pin_n, r3.pin_p) annotation (
    Line(points = {{12, -16}, {12, -16}, {12, -22}, {12, -22}}, color = {117, 80, 123}));
annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end MATLAB_Implementation_Cmplx;