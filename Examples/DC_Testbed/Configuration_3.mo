within HPF.Examples.DC_Testbed;
model Configuration_3
  extends Modelica.Icons.Package;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5, 7, 9, 11, 13, 15})  annotation (
    Placement(visible = true, transformation(origin = {-104, 44}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
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
  HPF.Machines.Transformers_iPh.Test_DY test_DY1 annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Terminate terminate1 annotation(
    Placement(visible = true, transformation(origin = {-26, 20}, extent = {{-8, -6}, {6, 8}}, rotation = 0)));
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
  connect(test_DY1.hPin_P1, terminate1.hPin_P) annotation(
    Line(points = {{-40, 20}, {-29, 20}}));
  connect(test_DY1.hPin_P2, Laptop_Adapter_1.hPin_P1) annotation(
    Line(points = {{-40, 10}, {0, 10}, {0, 10}, {0, 10}, {0, 10}}));
  connect(Laptop_Adapter_2.hPin_P1, test_DY1.hPin_P2) annotation(
    Line(points = {{0, -36}, {-6, -36}, {-6, 10}, {-40, 10}}));
  connect(Laptop_Adapter_3.hPin_P1, test_DY1.hPin_P3) annotation(
    Line(points = {{0, -80}, {-14, -80}, {-14, 0}, {-40, 0}}));
  connect(LED_Driver_3.hPin_P1, test_DY1.hPin_P3) annotation(
    Line(points = {{80, -68}, {-14, -68}, {-14, 0}, {-40, 0}, {-40, 0}}));
  connect(LED_Driver_2.hPin_P1, test_DY1.hPin_P2) annotation(
    Line(points = {{80, -20}, {-6, -20}, {-6, 10}, {-40, 10}, {-40, 10}, {-40, 10}}));
  connect(LED_Driver_1.hPin_P1, test_DY1.hPin_P2) annotation(
    Line(points = {{80, 20}, {-6, 20}, {-6, 10}, {-40, 10}, {-40, 10}}));
  connect(LED_Driver_1.hPin_N1, LED_Driver_2.hPin_N1) annotation(
    Line(points = {{80, 0}, {60, 0}, {60, -40}, {80, -40}, {80, -40}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N1, LED_Driver_2.hPin_N1) annotation(
    Line(points = {{80, -88}, {60, -88}, {60, -40}, {80, -40}, {80, -40}}, color = {117, 80, 123}));
  connect(Laptop_Adapter_1.hPin_N1, Laptop_Adapter_2.hPin_N1) annotation(
    Line(points = {{0, -10}, {-22, -10}, {-22, -56}, {0, -56}, {0, -56}}, color = {117, 80, 123}));
  connect(Laptop_Adapter_3.hPin_N1, Laptop_Adapter_1.hPin_N1) annotation(
    Line(points = {{0, -100}, {-22, -100}, {-22, -10}, {0, -10}, {0, -10}}, color = {117, 80, 123}));
  connect(ground3.pin, LED_Driver_3.hPin_N1) annotation(
    Line(points = {{-22, -112}, {60, -112}, {60, -88}, {80, -88}}));
  connect(ground3.pin, Laptop_Adapter_3.hPin_N1) annotation(
    Line(points = {{-22, -112}, {-22, -112}, {-22, -100}, {0, -100}, {0, -100}}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}), graphics={Text(lineColor = {102, 44, 145}, extent = {{26, 76}, {102, -72}}, textString = "1"), Line(
          points={{-86,0},{-80,16},{-74,26},{-64,38},{-50,32},{-40,8},{-38,-2},
              {-24,-30},{-8,-38},{8,-22},{16,0}},
          color={28,108,200},
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}})));
end Configuration_3;