within HPF.Examples.DC_Testbed;
model Configuration_3
  extends Modelica.Icons.Package;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5}) annotation (
    Placement(visible = true, transformation(origin = {-100, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-66, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_1(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {34, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_3(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {48, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {74, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin = {82, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor terminal(r = 1e6) annotation (
    Placement(visible = true, transformation(origin = {-20, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 2 + 3.2 * j) annotation (
    Placement(visible = true, transformation(origin = {-40, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 2 + 3 * j) annotation (
    Placement(visible = true, transformation(origin = {-20, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY(N = 10) annotation (
    Placement(visible = true, transformation(extent = {{-76, -56}, {-56, -36}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {74, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_2(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {34, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_1(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {110, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {132, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground5 annotation (
    Placement(visible = true, transformation(origin = {74, -132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_3(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {50, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground7 annotation (
    Placement(visible = true, transformation(origin = {132, -126}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_2(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation (
    Placement(visible = true, transformation(origin = {110, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop_1(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {60, 14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load laptop_2(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {60, -22}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load laptop_3(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {74, -66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load led_3(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {74, -106}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load led_1(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {132, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load led_2(pwr = 500) annotation (
    Placement(visible = true, transformation(origin = {132, -102}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhA(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_A.mat")  annotation (
    Placement(visible = true, transformation(origin = {-140, -46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {-140, -96}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhB(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_B.mat")  annotation (
    Placement(visible = true, transformation(origin = {-120, -64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhC(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_C.mat")  annotation (
    Placement(visible = true, transformation(origin = {-100, -78}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(laptop_adpt_1.hPin_P, z.pin_n) annotation (
    Line(points = {{24, 24}, {0, 24}, {0, -46}, {-30, -46}}));
  connect(laptop_adpt_3.hPin_P, z1.pin_n) annotation (
    Line(points = {{38, -56}, {-10, -56}}));
  connect(test_DY.hPin_N, ground2.pin) annotation (
    Line(points = {{-66, -61}, {-66, -76}}, color = {117, 80, 123}));
  connect(test_DY.pinSec_C, z1.pin_p) annotation (
    Line(points = {{-56, -56}, {-30, -56}}));
  connect(test_DY.pinSec_B, z.pin_p) annotation (
    Line(points = {{-56, -46}, {-50, -46}}));
  connect(test_DY.pinSec_A, terminal.pin_p) annotation (
    Line(points = {{-56, -36}, {-30, -36}}));
  connect(terminal.pin_n, ground2.pin) annotation (
    Line(points = {{-10, -36}, {-4, -36}, {-4, -76}, {-66, -76}}, color = {117, 80, 123}));
  connect(laptop_adpt_1.hPin_N, ground2.pin) annotation (
    Line(points = {{24, 4}, {14, 4}, {14, -76}, {-66, -76}}, color = {117, 80, 123}));
  connect(laptop_adpt_3.hPin_N, ground2.pin) annotation (
    Line(points = {{38, -76}, {-66, -76}}, color = {117, 80, 123}));
  connect(laptop_adpt_2.hPin_P, z.pin_n) annotation (
    Line(points = {{24, -12}, {0, -12}, {0, -46}, {-30, -46}}));
  connect(laptop_adpt_2.hPin_N, ground2.pin) annotation (
    Line(points = {{24, -32}, {14, -32}, {14, -76}, {-66, -76}}, color = {117, 80, 123}));
  connect(led_driver_1.hPin_P, z.pin_n) annotation (
    Line(points = {{100, -46}, {-30, -46}}));
  connect(led_driver_2.hPin_P, z.pin_n) annotation (
    Line(points = {{100, -92}, {90, -92}, {90, -46}, {-30, -46}}));
  connect(led_driver_1.hPin_N, led_driver_2.hPin_N) annotation (
    Line(points = {{100, -66}, {97, -66}, {97, -66}, {94, -66}, {94, -112}, {97, -112}, {97, -112}, {100, -112}}, color = {117, 80, 123}));
  connect(led_driver_3.hPin_P, z1.pin_n) annotation (
    Line(points = {{40, -96}, {33, -96}, {33, -96}, {26, -96}, {26, -56}, {-10, -56}, {-10, -56}}));
  connect(led_driver_3.hPin_N, ground2.pin) annotation (
    Line(points = {{40, -116}, {-4, -116}, {-4, -76}, {-66, -76}}, color = {117, 80, 123}));
  connect(led_driver_2.hPin_N, ground2.pin) annotation (
    Line(points = {{100, -112}, {94, -112}, {94, -136}, {-4, -136}, {-4, -76}, {-66, -76}}, color = {117, 80, 123}));
  connect(laptop_adpt_1.pin_p, laptop_1.p) annotation (
    Line(points = {{44, 24}, {60, 24}}, color = {0, 0, 255}));
  connect(laptop_adpt_1.pin_n, laptop_1.n) annotation (
    Line(points = {{44, 4}, {60, 4}}, color = {0, 0, 255}));
  connect(ground6.p, laptop_1.n) annotation (
    Line(points = {{74, 4}, {60, 4}}, color = {0, 0, 255}));
  connect(laptop_adpt_2.pin_p, laptop_2.p) annotation (
    Line(points = {{44, -12}, {60, -12}}, color = {0, 0, 255}));
  connect(laptop_adpt_2.pin_n, laptop_2.n) annotation (
    Line(points = {{44, -32}, {60, -32}}, color = {0, 0, 255}));
  connect(laptop_2.n, ground3.p) annotation (
    Line(points = {{60, -32}, {74, -32}}, color = {0, 0, 255}));
  connect(laptop_adpt_3.pin_p, laptop_3.p) annotation (
    Line(points = {{58, -56}, {74, -56}, {74, -56}, {74, -56}}, color = {0, 0, 255}));
  connect(laptop_adpt_3.pin_n, laptop_3.n) annotation (
    Line(points = {{58, -76}, {74, -76}, {74, -76}, {74, -76}}, color = {0, 0, 255}));
  connect(ground8.p, laptop_3.n) annotation (
    Line(points = {{82, -76}, {74, -76}}, color = {0, 0, 255}));
  connect(led_driver_3.pin_p, led_3.p) annotation (
    Line(points = {{60, -96}, {72, -96}, {72, -96}, {74, -96}}, color = {0, 0, 255}));
  connect(led_driver_3.pin_n, led_3.n) annotation (
    Line(points = {{60, -116}, {74, -116}, {74, -116}, {74, -116}}, color = {0, 0, 255}));
  connect(led_3.n, ground5.p) annotation (
    Line(points = {{74, -116}, {74, -122}}, color = {0, 0, 255}));
  connect(led_driver_1.pin_p, led_1.p) annotation (
    Line(points = {{120, -46}, {132, -46}}, color = {0, 0, 255}));
  connect(led_driver_1.pin_n, led_1.n) annotation (
    Line(points = {{120, -66}, {132, -66}}, color = {0, 0, 255}));
  connect(ground4.p, led_1.n) annotation (
    Line(points = {{132, -70}, {132, -66}}, color = {0, 0, 255}));
  connect(led_driver_2.pin_p, led_2.p) annotation (
    Line(points = {{120, -92}, {132, -92}}, color = {0, 0, 255}));
  connect(led_driver_2.pin_n, led_2.n) annotation (
    Line(points = {{120, -112}, {132, -112}}, color = {0, 0, 255}));
  connect(ground7.p, led_2.n) annotation (
    Line(points = {{132, -116}, {132, -112}}, color = {0, 0, 255}));
  connect(PhA.pin_n, ground1.pin) annotation (
    Line(points = {{-140, -56}, {-140, -96}}, color = {117, 80, 123}));
  connect(PhC.pin_n, ground1.pin) annotation (
    Line(points = {{-100, -88}, {-100, -88}, {-100, -96}, {-140, -96}, {-140, -96}}, color = {117, 80, 123}));
  connect(PhB.pin_n, ground1.pin) annotation (
    Line(points = {{-120, -74}, {-120, -74}, {-120, -96}, {-140, -96}, {-140, -96}}, color = {117, 80, 123}));
  connect(PhC.pin_p, test_DY.pinPrim_C) annotation (
    Line(points = {{-100, -68}, {-100, -68}, {-100, -56}, {-76, -56}, {-76, -56}}));
  connect(PhB.pin_p, test_DY.pinPrim_B) annotation (
    Line(points = {{-120, -54}, {-120, -54}, {-120, -46}, {-76, -46}, {-76, -46}}));
  connect(PhA.pin_p, test_DY.pinPrim_A) annotation (
    Line(points = {{-140, -36}, {-76, -36}}));
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}), graphics={  Text(lineColor = {102, 44, 145}, extent = {{26, 76}, {102, -72}}, textString = "1"), Line(points = {{-86, 0}, {-80, 16}, {-74, 26}, {-64, 38}, {-50, 32}, {-40, 8}, {-38, -2}, {-24, -30}, {-8, -38}, {8, -22}, {16, 0}}, color = {28, 108, 200}, smooth = Smooth.Bezier)}),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}, initialScale = 0.1), graphics={  Text(origin = {-131, 125}, extent = {{111, -1}, {-17, 23}}, textString = "DC Testbed: Configuration 3
* AC-DC loads.
* Delta-wye transformer (Unbalanced)", horizontalAlignment = TextAlignment.Left), Text(origin = {-129, 119}, extent = {{189, -61}, {-19, -21}}, textString = "TODO:
* Verify Power calc quantities math (vector multiplication)
 in Voltage source", horizontalAlignment = TextAlignment.Left), Text(origin = {-131, 99}, extent = {{157, -3}, {-17, 23}}, textString = "Notes:
* Enable option: 'Save simulation flags inside model'", horizontalAlignment = TextAlignment.Left)}),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Configuration_3;