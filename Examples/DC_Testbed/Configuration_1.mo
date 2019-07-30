within HPF.Examples.DC_Testbed;

model Configuration_1
  extends Modelica.Icons.Package;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5}) annotation(
    Placement(visible = true, transformation(origin = {-126, 88}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource PhA(vArg = {0, 1, 0.53}, vMag = {125, 0.25, 0.5}) annotation(
    Placement(visible = true, transformation(origin = {-140, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhB(vArg = {1.2, 2.5, 0.3}, vMag = {125, 0.25, 0.5}) annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhC(vArg = {1.9, 2, -0.5}, vMag = {125, 2, 0.3}) annotation(
    Placement(visible = true, transformation(origin = {-100, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-140, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-64, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_1(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_3(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {28, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {70, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation(
    Placement(visible = true, transformation(origin = {68, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 2 + 3.2 * j) annotation(
    Placement(visible = true, transformation(origin = {-34, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 2 + 3 * j) annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY(N = 10) annotation(
    Placement(visible = true, transformation(extent = {{-74, 0}, {-54, 20}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {144, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_2(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {104, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_1(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {66, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground5 annotation(
    Placement(visible = true, transformation(origin = {66, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_3(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {28, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground7 annotation(
    Placement(visible = true, transformation(origin = {142, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_2(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {104, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop_1(pwr = 500) annotation(
    Placement(visible = true, transformation(origin = {56, 84}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load laptop_2(pwr = 500) annotation(
    Placement(visible = true, transformation(origin = {130, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load laptop_3(pwr = 500) annotation(
    Placement(visible = true, transformation(origin = {54, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load led_3(pwr = 500) annotation(
    Placement(visible = true, transformation(origin = {58, -76}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load led_1(pwr = 500) annotation(
    Placement(visible = true, transformation(origin = {52, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load led_2(pwr = 500) annotation(
    Placement(visible = true, transformation(origin = {126, -38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Impedance z2(z = 2 + 3 * j) annotation(
    Placement(visible = true, transformation(origin = {-36, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PhA.pin_n, ground1.pin) annotation(
    Line(points = {{-140, 0}, {-140, 0}, {-140, 0}, {-140, 0}, {-140, 0}, {-140, 0}, {-140, 0}, {-140, 0}, {-140, 0}, {-140, 0}, {-140, -20}, {-140, -20}, {-140, -20}, {-140, -20}, {-140, -20}, {-140, -20}, {-140, -20}, {-140, -20}, {-140, -20}, {-140, -20}}, color = {117, 80, 123}));
  connect(ground1.pin, PhC.pin_n) annotation(
    Line(points = {{-140, -20}, {-130, -20}, {-130, -20}, {-120, -20}, {-120, -20}, {-100, -20}, {-100, -20}, {-100, -20}, {-100, -20}, {-100, -20}, {-100, -20}, {-100, -20}}));
  connect(PhB.pin_n, ground1.pin) annotation(
    Line(points = {{-120, -10}, {-120, -10}, {-120, -10}, {-120, -10}, {-120, -10}, {-120, -10}, {-120, -10}, {-120, -10}, {-120, -20}, {-140, -20}, {-140, -19}, {-140, -19}, {-140, -20.5}, {-140, -20.5}, {-140, -20}}, color = {117, 80, 123}));
  connect(PhA.pin_p, test_DY.pinPrim_A) annotation(
    Line(points = {{-140, 20}, {-138, 20}, {-138, 20}, {-136, 20}, {-136, 20}, {-132, 20}, {-132, 20}, {-124, 20}, {-124, 20}, {-108, 20}, {-108, 20}, {-91, 20}, {-91, 20}, {-82.5, 20}, {-82.5, 20}, {-78.25, 20}, {-78.25, 20}, {-76.125, 20}, {-76.125, 20}, {-74, 20}}));
  connect(PhB.pin_p, test_DY.pinPrim_B) annotation(
    Line(points = {{-120, 10}, {-74, 10}}));
  connect(PhC.pin_p, test_DY.pinPrim_C) annotation(
    Line(points = {{-100, 0}, {-74, 0}}));
  connect(test_DY.hPin_N, ground2.pin) annotation(
    Line(points = {{-64, -5}, {-64, -26}}, color = {117, 80, 123}));
  connect(laptop_adpt_1.pin_p, laptop_1.p) annotation(
    Line(points = {{40, 94}, {56, 94}}, color = {0, 0, 255}));
  connect(laptop_adpt_1.pin_n, laptop_1.n) annotation(
    Line(points = {{40, 74}, {56, 74}}, color = {0, 0, 255}));
  connect(ground6.p, laptop_1.n) annotation(
    Line(points = {{70, 74}, {56, 74}}, color = {0, 0, 255}));
  connect(laptop_adpt_2.pin_p, laptop_2.p) annotation(
    Line(points = {{114, 10}, {130, 10}}, color = {0, 0, 255}));
  connect(laptop_adpt_2.pin_n, laptop_2.n) annotation(
    Line(points = {{114, -10}, {130, -10}}, color = {0, 0, 255}));
  connect(laptop_2.n, ground3.p) annotation(
    Line(points = {{130, -10}, {144, -10}}, color = {0, 0, 255}));
  connect(laptop_adpt_3.pin_p, laptop_3.p) annotation(
    Line(points = {{38, -28}, {54, -28}}, color = {0, 0, 255}));
  connect(laptop_adpt_3.pin_n, laptop_3.n) annotation(
    Line(points = {{38, -48}, {54, -48}}, color = {0, 0, 255}));
  connect(ground8.p, laptop_3.n) annotation(
    Line(points = {{68, -48}, {54, -48}}, color = {0, 0, 255}));
  connect(led_driver_3.pin_p, led_3.p) annotation(
    Line(points = {{38, -66}, {58, -66}}, color = {0, 0, 255}));
  connect(led_driver_3.pin_n, led_3.n) annotation(
    Line(points = {{38, -86}, {58, -86}}, color = {0, 0, 255}));
  connect(led_3.n, ground5.p) annotation(
    Line(points = {{58, -86}, {58, -88}, {66, -88}}, color = {0, 0, 255}));
  connect(led_driver_1.pin_p, led_1.p) annotation(
    Line(points = {{40, 56}, {46, 56}, {46, 56}, {52, 56}, {52, 56}, {52, 56}}, color = {0, 0, 255}));
  connect(led_driver_1.pin_n, led_1.n) annotation(
    Line(points = {{40, 36}, {46, 36}, {46, 36}, {52, 36}, {52, 36}, {51, 36}, {51, 36}, {52, 36}}, color = {0, 0, 255}));
  connect(ground4.p, led_1.n) annotation(
    Line(points = {{66, 36}, {52, 36}}, color = {0, 0, 255}));
  connect(led_driver_2.pin_p, led_2.p) annotation(
    Line(points = {{114, -28}, {126, -28}, {126, -28}, {126, -28}, {126, -28}, {126, -28}}, color = {0, 0, 255}));
  connect(led_driver_2.pin_n, led_2.n) annotation(
    Line(points = {{114, -48}, {126, -48}, {126, -48}, {126, -48}, {126, -48}, {126, -48}}, color = {0, 0, 255}));
  connect(ground7.p, led_2.n) annotation(
    Line(points = {{142, -48}, {126, -48}}, color = {0, 0, 255}));
  connect(test_DY.pinSec_A, z.pin_p) annotation(
    Line(points = {{-54, 20}, {-51.5, 20}, {-51.5, 20}, {-49, 20}, {-49, 20}, {-44, 20}, {-44, 20}, {-44, 20}, {-44, 20}, {-44, 20}}));
  connect(test_DY.pinSec_B, z1.pin_p) annotation(
    Line(points = {{-54, 10}, {-48, 10}, {-48, 10}, {-42, 10}, {-42, 10}, {-30, 10}, {-30, 10}, {-30, 10}}));
  connect(test_DY.pinSec_C, z2.pin_p) annotation(
    Line(points = {{-54, 0}, {-46, 0}, {-46, 0}, {-46, 0}, {-46, 0}, {-46, 0}}));
  connect(led_driver_3.hPin_P, laptop_adpt_3.hPin_P) annotation(
    Line(points = {{18, -66}, {6, -66}, {6, -28}, {18, -28}}));
  connect(laptop_adpt_2.hPin_P, led_driver_2.hPin_P) annotation(
    Line(points = {{94, 10}, {82, 10}, {82, -28}, {94, -28}}));
  connect(laptop_adpt_1.hPin_P, led_driver_1.hPin_P) annotation(
    Line(points = {{20, 94}, {6, 94}, {6, 56}, {20, 56}}));
  connect(z.pin_n, led_driver_1.hPin_P) annotation(
    Line(points = {{-24, 20}, {6, 20}, {6, 56}, {20, 56}}, color = {117, 80, 123}));
  connect(z1.pin_n, laptop_adpt_2.hPin_P) annotation(
    Line(points = {{-10, 10}, {94, 10}}, color = {117, 80, 123}));
  connect(z2.pin_n, laptop_adpt_3.hPin_P) annotation(
    Line(points = {{-26, 0}, {6, 0}, {6, -28}, {18, -28}}, color = {117, 80, 123}));
  connect(laptop_adpt_1.hPin_N, led_driver_1.hPin_N) annotation(
    Line(points = {{20, 74}, {14, 74}, {14, 36}, {20, 36}, {20, 36}}, color = {117, 80, 123}));
  connect(led_driver_3.hPin_N, laptop_adpt_3.hPin_N) annotation(
    Line(points = {{18, -86}, {14, -86}, {14, -86}, {10, -86}, {10, -48}, {18, -48}, {18, -48}, {18, -48}, {18, -48}}, color = {117, 80, 123}));
  connect(laptop_adpt_2.hPin_N, led_driver_2.hPin_N) annotation(
    Line(points = {{94, -10}, {88, -10}, {88, -48}, {94, -48}, {94, -48}}, color = {117, 80, 123}));
  connect(ground2.pin, led_driver_3.hPin_N) annotation(
    Line(points = {{-64, -26}, {-16, -26}, {-16, -86}, {18, -86}, {18, -86}}));
  connect(led_driver_2.hPin_N, ground2.pin) annotation(
    Line(points = {{94, -48}, {88, -48}, {88, -108}, {-16, -108}, {-16, -26}, {-64, -26}, {-64, -26}}, color = {117, 80, 123}));
  connect(led_driver_1.hPin_N, ground2.pin) annotation(
    Line(points = {{20, 36}, {14, 36}, {14, -14}, {-64, -14}, {-64, -26}}, color = {117, 80, 123}));
  annotation(
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}), graphics = {Text(lineColor = {102, 44, 145}, extent = {{26, 76}, {102, -72}}, textString = "1"), Line(points = {{-86, 0}, {-80, 16}, {-74, 26}, {-64, 38}, {-50, 32}, {-40, 8}, {-38, -2}, {-24, -30}, {-8, -38}, {8, -22}, {16, 0}}, color = {28, 108, 200}, smooth = Smooth.Bezier)}),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}, initialScale = 0.1), graphics = {Text(origin = {-121, 136}, extent = {{-27, 14}, {97, -38}}, textString = "DC-Testbed: Configuration 1\n* Balanced phases", horizontalAlignment = TextAlignment.Left)}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_simulationFlags(ls = "totalpivot", lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"));
end Configuration_1;