within HPF.Examples.Basics;
model DC2DC_Converter
  extends Modelica.Icons.Example;
  Modelica.Electrical.Analog.Basic.Ground ground annotation (
    Placement(visible = true, transformation(extent = {{-64, -20}, {-44, 0}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 10) annotation (
    Placement(visible = true, transformation(origin = {54, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sensors.PowerSensor msrPwr_In annotation (
    Placement(visible = true, transformation(extent = {{-40, 30}, {-20, 50}}, rotation = 0)));
  parameter Data.ConverterModels.DC2DC_StepDown.ModelData modelData1(V = 18, alpha = 1.484, beta = 0.0252, gamma = 0.005) annotation (
    Placement(visible = true, transformation(extent = {{-96, 12}, {-76, 32}}, rotation = 0)));
  DC.DC2DC_Converters.StepDown stepDown(modelData = modelData1) annotation (
    Placement(visible = true, transformation(extent = {{-14, 20}, {6, 40}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor msrPwr_Out annotation (
    Placement(visible = true, transformation(extent = {{20, 30}, {40, 50}}, rotation = 0)));
  Modelica.Blocks.Math.Division efficiency annotation (
    Placement(visible = true, transformation(extent = {{4, -38}, {24, -18}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(extent={{44,-20},{64,0}},      rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 15) annotation (
    Placement(visible = true, transformation(origin = {-54, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
equation
  connect(constantVoltage.n, ground.p) annotation (
    Line(points = {{-54, 20}, {-54, 0}}, color = {0, 0, 255}));
  connect(msrPwr_In.power, efficiency.u2) annotation (
    Line(points = {{-40, 29}, {-40, -34}, {2, -34}}, color = {0, 0, 127}));
  connect(stepDown.p2, msrPwr_Out.pc) annotation (
    Line(points = {{6, 40}, {20, 40}}, color = {0, 0, 255}));
  connect(constantVoltage.n, stepDown.n1) annotation (
    Line(points = {{-54, 20}, {-14, 20}}, color = {0, 0, 255}));
  connect(msrPwr_Out.pv, msrPwr_Out.pc) annotation (
    Line(points = {{30, 50}, {20, 50}, {20, 40}}, color = {0, 0, 255}));
  connect(msrPwr_In.nv, stepDown.n1) annotation (
    Line(points = {{-30, 30}, {-30, 20}, {-14, 20}}, color = {0, 0, 255}));
  connect(msrPwr_Out.nc, resistor1.p) annotation (
    Line(points = {{40, 40}, {54, 40}}, color = {0, 0, 255}));
  connect(stepDown.p1, msrPwr_In.nc) annotation (
    Line(points = {{-14, 40}, {-20, 40}}, color = {0, 0, 255}));
  connect(msrPwr_Out.power, efficiency.u1) annotation (
    Line(points = {{20, 29}, {20, 4}, {-12, 4}, {-12, -22}, {2, -22}}, color = {0, 0, 127}));
  connect(msrPwr_In.pc, constantVoltage.p) annotation (
    Line(points = {{-40, 40}, {-54, 40}}, color = {0, 0, 255}));
  connect(resistor1.n, stepDown.n2) annotation (
    Line(points = {{54, 20}, {6, 20}}, color = {0, 0, 255}));
  connect(msrPwr_In.pv, msrPwr_In.pc) annotation (
    Line(points = {{-30, 50}, {-40, 50}, {-40, 40}}, color = {0, 0, 255}));
  connect(msrPwr_Out.nv, stepDown.n2) annotation (
    Line(points = {{30, 30}, {30, 20}, {6, 20}}, color = {0, 0, 255}));
  connect(resistor1.n, ground1.p) annotation (
    Line(points={{54,20},{54,0}},                          color = {0, 0, 255}));
annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 1),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end DC2DC_Converter;