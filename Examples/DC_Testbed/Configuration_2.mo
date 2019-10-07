within HPF.Examples.DC_Testbed;
model Configuration_2
  extends Modelica.Icons.Package;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5}) annotation (
    Placement(visible = true, transformation(origin = {-108, 32}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource PhA(vArg = {0, 1, 0.53}, vMag = {125, 0.25, 0.5}) annotation (
    Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhB(vArg = {1.2, 2.5, 0.3}, vMag = {125, 0.25, 0.5}) annotation (
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhC(vArg = {1.9, 2, -0.5}, vMag = {125, 2, 0.3}) annotation (
    Placement(visible = true, transformation(origin = {-100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-140, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-64, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_1(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {36, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_3(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {36, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {76, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin = {72, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 2 + 3.2 * j) annotation (
    Placement(visible = true, transformation(origin = {-16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY(N = 10)  annotation (
    Placement(visible = true, transformation(extent = {{-74, -20}, {-54, 0}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {76, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_2(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {36, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_1(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {106, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {128, -44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground5 annotation (
    Placement(visible = true, transformation(origin = {144, -134}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_3(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {108, -114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground7 annotation (
    Placement(visible = true, transformation(origin = {128, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_2(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {106, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop_1(pwr = 500)  annotation (
    Placement(visible = true, transformation(origin = {62, 66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load laptop_2(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {62, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load laptop_3(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {62, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load led_3(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {132, -114}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load led_1(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {128, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load led_2(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {128, -66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor terminal_PhB annotation (
    Placement(visible = true, transformation(origin = {-36, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor terminal_PhC(r = 1e6) annotation (
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PhA.pin_n, ground1.pin) annotation (
    Line(points = {{-140, -20}, {-140, -20}, {-140, -20}, {-138, -20}, {-138, -20}, {-140, -20}, {-140, -20}, {-138, -20}, {-138, -40}, {-140, -40}, {-140, -40}, {-140, -40}, {-140, -40}, {-140, -40}}, color = {117, 80, 123}));
  connect(ground1.pin, PhC.pin_n) annotation (
    Line(points = {{-140, -40}, {-130, -40}, {-130, -40}, {-118, -40}, {-118, -40}, {-98, -40}, {-98, -40}, {-100, -40}, {-100, -40}, {-100, -40}}));
  connect(PhB.pin_n, ground1.pin) annotation (
    Line(points = {{-120, -30}, {-120, -30}, {-120, -30}, {-120, -30}, {-120, -40}, {-140, -40}, {-140, -40}}, color = {117, 80, 123}));
  connect(PhA.pin_p, test_DY.pinPrim_A) annotation (
    Line(points = {{-140, 0}, {-132, 0}, {-132, 0}, {-124, 0}, {-124, 0}, {-108, 0}, {-108, 0}, {-91, 0}, {-91, 0}, {-74, 0}}));
  connect(PhB.pin_p, test_DY.pinPrim_B) annotation (
    Line(points = {{-120, -10}, {-74, -10}}));
  connect(PhC.pin_p, test_DY.pinPrim_C) annotation (
    Line(points = {{-100, -20}, {-74, -20}}));
  connect(test_DY.hPin_N, ground2.pin) annotation (
    Line(points = {{-64, -25}, {-64, -40}}, color = {117, 80, 123}));
  connect(led_driver_1.hPin_N, led_driver_2.hPin_N) annotation (
    Line(points = {{96, -30}, {93, -30}, {93, -30}, {90, -30}, {90, -76}, {98, -76}, {98, -76}, {96, -76}, {96, -76}}, color = {117, 80, 123}));
  connect(laptop_adpt_1.pin_p, laptop_1.p) annotation (
    Line(points = {{46, 76}, {62, 76}}, color = {0, 0, 255}));
  connect(laptop_adpt_1.pin_n, laptop_1.n) annotation (
    Line(points = {{46, 56}, {62, 56}}, color = {0, 0, 255}));
  connect(ground6.p, laptop_1.n) annotation (
    Line(points = {{76, 56}, {62, 56}}, color = {0, 0, 255}));
  connect(laptop_adpt_2.pin_p, laptop_2.p) annotation (
    Line(points = {{46, 40}, {62, 40}}, color = {0, 0, 255}));
  connect(laptop_adpt_2.pin_n, laptop_2.n) annotation (
    Line(points = {{46, 20}, {62, 20}}, color = {0, 0, 255}));
  connect(laptop_2.n, ground3.p) annotation (
    Line(points = {{62, 20}, {76, 20}}, color = {0, 0, 255}));
  connect(laptop_adpt_3.pin_p, laptop_3.p) annotation (
    Line(points = {{46, 0}, {62, 0}}, color = {0, 0, 255}));
  connect(laptop_adpt_3.pin_n, laptop_3.n) annotation (
    Line(points = {{46, -20}, {62, -20}}, color = {0, 0, 255}));
  connect(ground8.p, laptop_3.n) annotation (
    Line(points = {{72, -20}, {62, -20}}, color = {0, 0, 255}));
  connect(led_driver_3.pin_p, led_3.p) annotation (
    Line(points = {{118, -104}, {130, -104}, {130, -104}, {131, -104}, {131, -104}, {132, -104}}, color = {0, 0, 255}));
  connect(led_driver_3.pin_n, led_3.n) annotation (
    Line(points = {{118, -124}, {125, -124}, {125, -124}, {132, -124}, {132, -124}, {132, -124}}, color = {0, 0, 255}));
  connect(led_3.n, ground5.p) annotation (
    Line(points = {{132, -124}, {138, -124}, {138, -124}, {144, -124}, {144, -124}, {144, -124}, {144, -124}, {144, -124}, {144, -124}, {144, -124}, {144, -124}}, color = {0, 0, 255}));
  connect(led_driver_1.pin_p, led_1.p) annotation (
    Line(points = {{116, -10}, {128, -10}, {128, -10}, {128, -10}}, color = {0, 0, 255}));
  connect(led_driver_1.pin_n, led_1.n) annotation (
    Line(points = {{116, -30}, {122, -30}, {122, -30}, {128, -30}, {128, -30}, {128, -30}}, color = {0, 0, 255}));
  connect(ground4.p, led_1.n) annotation (
    Line(points = {{128, -34}, {128, -34}, {128, -30}, {128, -30}}, color = {0, 0, 255}));
  connect(led_driver_2.pin_p, led_2.p) annotation (
    Line(points = {{116, -56}, {128, -56}, {128, -56}, {128, -56}}, color = {0, 0, 255}));
  connect(led_driver_2.pin_n, led_2.n) annotation (
    Line(points = {{116, -76}, {128, -76}, {128, -76}, {128, -76}}, color = {0, 0, 255}));
  connect(ground7.p, led_2.n) annotation (
    Line(points = {{128, -80}, {128, -80}, {128, -76}, {128, -76}, {128, -76}, {128, -76}}, color = {0, 0, 255}));
  connect(led_driver_3.hPin_N, led_driver_2.hPin_N) annotation (
    Line(points = {{98, -124}, {90, -124}, {90, -76}, {96, -76}, {96, -76}}, color = {117, 80, 123}));
  connect(laptop_adpt_1.hPin_N, laptop_adpt_2.hPin_N) annotation (
    Line(points = {{26, 56}, {20, 56}, {20, 20}, {26, 20}, {26, 20}}, color = {117, 80, 123}));
  connect(laptop_adpt_2.hPin_N, laptop_adpt_3.hPin_N) annotation (
    Line(points = {{26, 20}, {20, 20}, {20, -20}, {26, -20}}, color = {117, 80, 123}));
  connect(test_DY.pinSec_C, terminal_PhC.pin_p) annotation (
    Line(points = {{-54, -20}, {-30, -20}, {-30, -20}, {-30, -20}}));
  connect(test_DY.pinSec_B, terminal_PhB.pin_p) annotation (
    Line(points = {{-54, -10}, {-46, -10}, {-46, -10}, {-46, -10}}));
  connect(test_DY.pinSec_A, z.pin_p) annotation (
    Line(points = {{-54, 0}, {-26, 0}, {-26, 0}, {-26, 0}}));
  connect(terminal_PhB.pin_n, terminal_PhC.pin_n) annotation (
    Line(points = {{-26, -10}, {0, -10}, {0, -20}, {-10, -20}, {-10, -20}}, color = {117, 80, 123}));
  connect(z.pin_n, laptop_adpt_3.hPin_P) annotation (
    Line(points = {{-6, 0}, {26, 0}, {26, 0}, {26, 0}}, color = {117, 80, 123}));
  connect(laptop_adpt_1.hPin_P, z.pin_n) annotation (
    Line(points = {{26, 76}, {8, 76}, {8, 0}, {-6, 0}, {-6, 0}}));
  connect(laptop_adpt_2.hPin_P, z.pin_n) annotation (
    Line(points = {{26, 40}, {8, 40}, {8, 0}, {-6, 0}, {-6, 0}, {-6, 0}}));
  connect(led_driver_2.hPin_P, z.pin_n) annotation (
    Line(points = {{96, -56}, {8, -56}, {8, 0}, {-6, 0}}));
  connect(led_driver_1.hPin_P, z.pin_n) annotation (
    Line(points = {{96, -10}, {82, -10}, {82, -56}, {8, -56}, {8, 0}, {-6, 0}}));
  connect(led_driver_3.hPin_P, z.pin_n) annotation (
    Line(points = {{98, -104}, {82, -104}, {82, -56}, {8, -56}, {8, 0}, {-6, 0}}));
  connect(ground2.pin, terminal_PhC.pin_n) annotation (
    Line(points = {{-64, -40}, {0, -40}, {0, -20}, {-10, -20}, {-10, -20}}));
  connect(laptop_adpt_3.hPin_N, ground2.pin) annotation (
    Line(points = {{26, -20}, {20, -20}, {20, -40}, {-64, -40}, {-64, -40}}, color = {117, 80, 123}));
  connect(led_driver_3.hPin_N, ground2.pin) annotation (
    Line(points = {{98, -124}, {20, -124}, {20, -40}, {-64, -40}}, color = {117, 80, 123}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}, initialScale = 0.1), graphics={Text(lineColor = {102, 44, 145}, extent = {{26, 76}, {102, -72}}, textString = "2"), Line(
          points={{-86,0},{-80,16},{-74,26},{-64,38},{-50,32},{-40,8},{-38,-2},
              {-24,-30},{-8,-38},{8,-22},{16,0}},
          color={28,108,200},
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}, initialScale = 0.1), graphics = {Text(origin = {-120, 74}, extent = {{-20, 18}, {96, -20}}, textString = "DC-Testbed: Configuration 2
* Unbalanced, all loads on PhaseA", horizontalAlignment = TextAlignment.Left)}),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Configuration_2;