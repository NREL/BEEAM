within HPF.Examples;
model MATLAB_Implementation_fundamental
  import Modelica.ComplexMath.j;
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R=0.5)   annotation (
    Placement(visible = true, transformation(origin={-24,30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-48, -74},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage V1(V=120)  annotation (
    Placement(visible = true, transformation(origin={-48,20},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Test_components.g_h_fundamental g_h_fundamental1(P= 800) annotation (Placement(
        visible = true, transformation(origin={2, -18},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 28) annotation (
    Placement(visible = true, transformation(origin = {40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 1e-6) annotation (
    Placement(visible = true, transformation(origin = {2, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R = 1e-6) annotation (
    Placement(visible = true, transformation(origin = {2, -46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(V1.p, resistor3.p) annotation (
    Line(points = {{-48, 30}, {-34, 30}}, color = {0, 0, 255}));
  connect(V1.n, ground2.p) annotation (
    Line(points = {{-48, 10}, {-48, -64}}, color = {0, 0, 255}));
  connect(resistor.n, ground2.p) annotation (
    Line(points = {{50, 30}, {68, 30}, {68, -64}, {-48, -64}}, color = {0, 0, 255}));
  connect(resistor.p, resistor3.n) annotation (
    Line(points = {{30, 30}, {-14, 30}}, color = {0, 0, 255}));
  connect(resistor2.p, g_h_fundamental1.n) annotation (
    Line(points = {{2, -36}, {2, -36}, {2, -28}, {2, -28}, {2, -28}}, color = {0, 0, 255}));
  connect(resistor2.n, ground2.p) annotation (
    Line(points = {{2, -56}, {2, -56}, {2, -64}, {-48, -64}, {-48, -64}}, color = {0, 0, 255}));
  connect(g_h_fundamental1.p, resistor1.n) annotation (
    Line(points = {{2, -8}, {2, -8}, {2, -2}, {2, -2}}, color = {0, 0, 255}));
  connect(resistor1.p, resistor3.n) annotation (
    Line(points = {{2, 18}, {2, 18}, {2, 30}, {-14, 30}, {-14, 30}}, color = {0, 0, 255}));
  annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end MATLAB_Implementation_fundamental;
