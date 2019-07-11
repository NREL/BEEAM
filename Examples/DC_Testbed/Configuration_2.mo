within HPF.Examples.DC_Testbed;
model Configuration_2
  extends Modelica.Icons.Package;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5, 7, 9, 11, 13, 15})  annotation (
    Placement(visible = true, transformation(origin = {-76, 102}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource PhA annotation (Placement(visible=true,
        transformation(
        origin={-120,10},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  HPF.SinglePhase.Sources.VoltageSource PhB annotation (Placement(visible=true,
        transformation(
        origin={-100, 0},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  HPF.SinglePhase.Sources.VoltageSource PhC annotation (Placement(visible=true,
        transformation(
        origin={-80, -10},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  HPF.SinglePhase.NonlinearLoads.Rectifier LED_Driver_1 annotation(
    Placement(visible = true, transformation(origin = {112,50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier LED_Driver_2 annotation(
    Placement(visible = true, transformation(origin = {36, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier LED_Driver_3 annotation(
    Placement(visible = true, transformation(origin = {110, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier Laptop_Adapter_1 annotation(
    Placement(visible = true, transformation(origin = {70, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier Laptop_Adapter_2 annotation(
    Placement(visible = true, transformation(origin = {42, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier Laptop_Adapter_3 annotation(
    Placement(visible = true, transformation(origin = {74, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY1 annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Laptop_1 annotation(
    Placement(visible = true, transformation(origin = {98, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Laptop_2 annotation(
    Placement(visible = true, transformation(origin = {-104, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Laptop_3 annotation(
    Placement(visible = true, transformation(origin = {-98, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor LED_1 annotation(
    Placement(visible = true, transformation(origin = {28, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor LED_2 annotation(
    Placement(visible = true, transformation(origin = {-150, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor LED_3 annotation(
    Placement(visible = true, transformation(origin = {-172, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PhB.pin_p, test_DY1.pinPrim_B) annotation(
    Line(points = {{-100, 10}, {-60, 10}}));
  connect(PhA.pin_p, test_DY1.pinPrim_A) annotation(
    Line(points = {{-120, 20}, {-60, 20}, {-60, 20}, {-60, 20}}));
  connect(PhC.pin_p, test_DY1.pinPrim_C) annotation(
    Line(points = {{-80, 0}, {-60, 0}, {-60, 0}, {-60, 0}}));
  connect(PhA.pin_n, ground1.pin) annotation(
    Line(points = {{-120, 0}, {-120, 0}, {-120, -20}, {-120, -20}}, color = {117, 80, 123}));
  connect(ground1.pin, PhC.pin_n) annotation(
    Line(points = {{-120, -20}, {-80, -20}, {-80, -20}, {-80, -20}}));
  connect(PhB.pin_n, ground1.pin) annotation(
    Line(points = {{-100, -10}, {-100, -10}, {-100, -20}, {-120, -20}, {-120, -20}}, color = {117, 80, 123}));
  connect(test_DY1.hPin_N, ground2.pin) annotation(
    Line(points = {{-50, -6}, {-50, -20}}, color = {117, 80, 123}));

annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}), graphics={Text(lineColor = {102, 44, 145}, extent = {{26, 76}, {102, -72}}, textString = "1"), Line(
          points={{-86,0},{-80,16},{-74,26},{-64,38},{-50,32},{-40,8},{-38,-2},
              {-24,-30},{-8,-38},{8,-22},{16,0}},
          color={28,108,200},
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}})));
end Configuration_2;
