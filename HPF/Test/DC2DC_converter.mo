within HPF.Test;
model DC2DC_converter
  HPF.DC.DC2DC_Converters.StepDown stepDown(modelData= modelData1)
    annotation (Placement(visible = true, transformation(extent = {{-10, 0}, {10, 20}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=15)
    annotation (Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(visible = true, transformation(extent = {{-60, -40}, {-40, -20}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1
    annotation (Placement(visible = true, transformation(extent = {{38, -40}, {58, -20}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R=10) annotation (
      Placement(visible = true, transformation(origin = {58, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sensors.PowerSensor msrPwr_In
    annotation (Placement(visible = true, transformation(extent = {{-36, 10}, {-16, 30}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor msrPwr_Out
    annotation (Placement(visible = true, transformation(extent = {{24, 10}, {44, 30}}, rotation = 0)));
  Modelica.Blocks.Math.Division efficiency
    annotation (Placement(visible = true, transformation(extent = {{0, -60}, {20, -40}}, rotation = 0)));
  parameter HPF.Data.ConverterModels.DC2DC_StepDown.ModelData modelData1(V = 18, alpha = 1.484, beta = 0.0252, gamma = 0.005) annotation (
    Placement(visible = true, transformation(extent = {{-86, 20}, {-66, 40}}, rotation = 0)));
equation
  connect(constantVoltage.n, ground.p) annotation (
    Line(points = {{-50, 0}, {-50, -20}}, color = {0, 0, 255}));
  connect(constantVoltage.n, stepDown.n1) annotation (
    Line(points = {{-50, 0}, {-10, 0}}, color = {0, 0, 255}));
  connect(resistor1.n, stepDown.n2) annotation (
    Line(points = {{58, 0}, {10, 0}}, color = {0, 0, 255}));
  connect(resistor1.n, ground1.p) annotation (
    Line(points = {{58, 0}, {58, -10}, {48, -10}, {48, -20}}, color = {0, 0, 255}));
  connect(msrPwr_In.pc, constantVoltage.p) annotation (
    Line(points = {{-36, 20}, {-50, 20}}, color = {0, 0, 255}));
  connect(stepDown.p1, msrPwr_In.nc) annotation (
    Line(points = {{-10, 20}, {-16, 20}}, color = {0, 0, 255}));
  connect(msrPwr_Out.nc, resistor1.p) annotation (
    Line(points = {{44, 20}, {58, 20}}, color = {0, 0, 255}));
  connect(stepDown.p2, msrPwr_Out.pc) annotation (
    Line(points = {{10, 20}, {24, 20}}, color = {0, 0, 255}));
  connect(msrPwr_Out.nv, stepDown.n2) annotation (
    Line(points = {{34, 10}, {34, 0}, {10, 0}}, color = {0, 0, 255}));
  connect(msrPwr_In.nv, stepDown.n1) annotation (
    Line(points = {{-26, 10}, {-26, 0}, {-10, 0}}, color = {0, 0, 255}));
  connect(msrPwr_In.pv, msrPwr_In.pc)
    annotation (Line(points={{-30,50},{-40,50},{-40,40}}, color={0,0,255}));
  connect(msrPwr_Out.pv, msrPwr_Out.pc)
    annotation (Line(points={{30,50},{20,50},{20,40}}, color={0,0,255}));
  connect(msrPwr_In.power, efficiency.u2) annotation (
    Line(points = {{-36, 9}, {-36, -56}, {-2, -56}}, color = {0, 0, 127}));
  connect(msrPwr_Out.power, efficiency.u1) annotation (
    Line(points = {{24, 9}, {24, -16}, {-8, -16}, {-8, -44}, {-2, -44}}, color = {0, 0, 127}));
end DC2DC_converter;
