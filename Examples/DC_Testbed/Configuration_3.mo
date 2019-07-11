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
  HPF.SinglePhase.NonlinearLoads.Rectifier LED_Driver_1 annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier LED_Driver_2 annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier LED_Driver_3 annotation(
    Placement(visible = true, transformation(origin = {90, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier Laptop_Adapter_1 annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier Laptop_Adapter_2 annotation(
    Placement(visible = true, transformation(origin = {10, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier Laptop_Adapter_3 annotation(
    Placement(visible = true, transformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY1 annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Laptop_1 annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor Laptop_2 annotation(
    Placement(visible = true, transformation(origin = {40, -46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor Laptop_3 annotation(
    Placement(visible = true, transformation(origin = {36, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor LED_1 annotation(
    Placement(visible = true, transformation(origin = {114, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor LED_2 annotation(
    Placement(visible = true, transformation(origin = {114, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Resistor LED_3 annotation(
    Placement(visible = true, transformation(origin = {114, -78}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Terminate terminate1 annotation(
    Placement(visible = true, transformation(origin = {-26, 20}, extent = {{-8, -6}, {6, 8}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {-22, -112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground5 annotation(
    Placement(visible = true, transformation(origin = {52, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {52, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground7 annotation(
    Placement(visible = true, transformation(origin = {124, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation(
    Placement(visible = true, transformation(origin = {124, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground9 annotation(
    Placement(visible = true, transformation(origin = {124, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  connect(Laptop_Adapter_1.pin_p, Laptop_1.p) annotation(
    Line(points = {{20, 10}, {40, 10}, {40, 10}, {40, 10}}, color = {0, 0, 255}));
  connect(Laptop_1.n, Laptop_Adapter_1.pin_n) annotation(
    Line(points = {{40, -10}, {20, -10}, {20, -10}, {20, -10}}, color = {0, 0, 255}));
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
  connect(Laptop_Adapter_2.pin_p, Laptop_2.p) annotation(
    Line(points = {{20, -36}, {40, -36}, {40, -36}, {40, -36}}, color = {0, 0, 255}));
  connect(Laptop_Adapter_2.pin_n, Laptop_2.n) annotation(
    Line(points = {{20, -56}, {40, -56}, {40, -56}, {40, -56}}, color = {0, 0, 255}));
  connect(Laptop_1.n, ground5.p) annotation(
    Line(points = {{40, -10}, {50, -10}, {50, -10}, {52, -10}}, color = {0, 0, 255}));
  connect(Laptop_2.n, ground6.p) annotation(
    Line(points = {{40, -56}, {52, -56}, {52, -56}, {52, -56}}, color = {0, 0, 255}));
  connect(Laptop_Adapter_3.pin_p, Laptop_3.p) annotation(
    Line(points = {{20, -80}, {36, -80}, {36, -80}, {36, -80}}, color = {0, 0, 255}));
  connect(Laptop_Adapter_3.pin_n, Laptop_3.n) annotation(
    Line(points = {{20, -100}, {36, -100}, {36, -100}, {36, -100}}, color = {0, 0, 255}));
  connect(Laptop_3.n, ground4.p) annotation(
    Line(points = {{36, -100}, {50, -100}, {50, -100}, {50, -100}, {50, -100}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{100, -68}, {114, -68}, {114, -68}, {114, -68}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{100, -88}, {114, -88}, {114, -88}, {114, -88}}, color = {0, 0, 255}));
  connect(LED_3.n, ground7.p) annotation(
    Line(points = {{114, -88}, {124, -88}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation(
    Line(points = {{100, -40}, {114, -40}, {114, -40}, {114, -40}}, color = {0, 0, 255}));
  connect(ground8.p, LED_2.n) annotation(
    Line(points = {{124, -40}, {114, -40}, {114, -40}, {114, -40}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation(
    Line(points = {{100, -20}, {114, -20}, {114, -20}, {114, -20}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation(
    Line(points = {{100, 0}, {114, 0}, {114, 0}, {114, 0}}, color = {0, 0, 255}));
  connect(LED_1.n, ground9.p) annotation(
    Line(points = {{114, 0}, {124, 0}, {124, 0}, {124, 0}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation(
    Line(points = {{100, 20}, {114, 20}, {114, 20}, {114, 20}}, color = {0, 0, 255}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}), graphics={Text(lineColor = {102, 44, 145}, extent = {{26, 76}, {102, -72}}, textString = "1"), Line(
          points={{-86,0},{-80,16},{-74,26},{-64,38},{-50,32},{-40,8},{-38,-2},
              {-24,-30},{-8,-38},{8,-22},{16,0}},
          color={28,108,200},
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}})));
end Configuration_3;