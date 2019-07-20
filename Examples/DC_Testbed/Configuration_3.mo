within HPF.Examples.DC_Testbed;

model Configuration_3
  extends Modelica.Icons.Package;
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1, 3, 5}) annotation(
    Placement(visible = true, transformation(origin = {-84, 18}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource PhA(vArg = {0, 1, 0.53}, vMag = {125, 0.25, 0.5}) annotation(
    Placement(visible = true, transformation(origin = {-142, -46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhB(vArg = {1.2, 2.5, 0.3}, vMag = {125, 0.25, 0.5}) annotation(
    Placement(visible = true, transformation(origin = {-122, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource PhC(vArg = {1.9, 2, -0.5}, vMag = {125, 2, 0.3}) annotation(
    Placement(visible = true, transformation(origin = {-102, -66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-142, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {-66, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_1(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {34, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_3(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {48, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground6 annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor laptop_3(R = 50) annotation(
    Placement(visible = true, transformation(origin = {68, -68}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation(
    Placement(visible = true, transformation(origin = {86, -86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r(r = 1e6) annotation(
    Placement(visible = true, transformation(origin = {-22, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(z = 2 + 3.2 * j) annotation(
    Placement(visible = true, transformation(origin = {-40, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1(z = 2 + 3 * j) annotation(
    Placement(visible = true, transformation(origin = {-20, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY(N = 50)  annotation(
    Placement(visible = true, transformation(extent = {{-76, -56}, {-56, -36}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {72, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor laptop_2(R = 50) annotation(
    Placement(visible = true, transformation(origin = {56, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.NonlinearLoads.Rectifier laptop_adpt_2(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {34, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_1(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {116, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor led_1(R = 50) annotation(
    Placement(visible = true, transformation(origin = {138, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {138, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground5 annotation(
    Placement(visible = true, transformation(origin = {72, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor led_3(R = 50) annotation(
    Placement(visible = true, transformation(origin = {72, -106}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_3(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {50, -106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground7 annotation(
    Placement(visible = true, transformation(origin = {138, -126}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor led_2(R = 50) annotation(
    Placement(visible = true, transformation(origin = {138, -102}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.NonlinearLoads.Rectifier led_driver_2(V_Rect = 100, efficiency = 0.95, hrmMdl_coefArg = {-5.02372881045404e-05, 0.00237063924944842, -1.49993957428169, 1.71994407623008}, hrmMdl_coefMag = {2.70064268049248e-05, -0.00156976101310340, -0.00600037080602108, 0.995516922015768}, rectifierModel = 1) annotation(
    Placement(visible = true, transformation(origin = {116, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop_1(pwr = 500)  annotation(
    Placement(visible = true, transformation(origin = {64, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(PhA.pin_n, ground1.pin) annotation(
    Line(points = {{-142, -56}, {-142, -56}, {-142, -56}, {-142, -56}, {-142, -56}, {-142, -56}, {-142, -76}, {-142, -76}, {-142, -76}, {-142, -76}}, color = {117, 80, 123}));
  connect(ground1.pin, PhC.pin_n) annotation(
    Line(points = {{-142, -76}, {-122, -76}, {-122, -76}, {-102, -76}, {-102, -76}, {-102, -76}, {-102, -76}, {-102, -76}}));
  connect(PhB.pin_n, ground1.pin) annotation(
    Line(points = {{-122, -66}, {-122, -66}, {-122, -66}, {-122, -66}, {-122, -76}, {-142, -76}, {-142, -76}}, color = {117, 80, 123}));
  connect(laptop_3.n, ground8.p) annotation(
    Line(points = {{68, -78}, {78, -78}, {78, -76}, {82, -76}, {82, -76}, {86, -76}}, color = {0, 0, 255}));
  connect(laptop_adpt_1.hPin_P, z.pin_n) annotation(
    Line(points = {{24, 40}, {0, 40}, {0, -46}, {-30, -46}}));
  connect(laptop_adpt_3.hPin_P, z1.pin_n) annotation(
    Line(points = {{38, -56}, {-10, -56}}));
  connect(PhA.pin_p, test_DY.pinPrim_A) annotation(
    Line(points = {{-142, -36}, {-126, -36}, {-126, -36}, {-110, -36}, {-110, -36}, {-93, -36}, {-93, -36}, {-76, -36}}));
  connect(PhB.pin_p, test_DY.pinPrim_B) annotation(
    Line(points = {{-122, -46}, {-76, -46}}));
  connect(PhC.pin_p, test_DY.pinPrim_C) annotation(
    Line(points = {{-102, -56}, {-76, -56}}));
  connect(test_DY.hPin_N, ground2.pin) annotation(
    Line(points = {{-66, -61}, {-66, -84}}, color = {117, 80, 123}));
  connect(test_DY.pinSec_C, z1.pin_p) annotation(
    Line(points = {{-56, -56}, {-30, -56}}));
  connect(test_DY.pinSec_B, z.pin_p) annotation(
    Line(points = {{-56, -46}, {-50, -46}}));
  connect(test_DY.pinSec_A, r.pin_p) annotation(
    Line(points = {{-56, -36}, {-32, -36}}));
  connect(r.pin_n, ground2.pin) annotation(
    Line(points = {{-12, -36}, {-8, -36}, {-8, -36}, {-4, -36}, {-4, -84}, {-35, -84}, {-35, -84}, {-66, -84}}, color = {117, 80, 123}));
  connect(laptop_adpt_1.hPin_N, ground2.pin) annotation(
    Line(points = {{24, 20}, {14, 20}, {14, -84}, {-66, -84}}, color = {117, 80, 123}));
  connect(laptop_adpt_3.hPin_N, ground2.pin) annotation(
    Line(points = {{38, -76}, {34, -76}, {34, -76}, {30, -76}, {30, -84}, {-18, -84}, {-18, -84}, {-66, -84}}, color = {117, 80, 123}));
  connect(laptop_adpt_3.pin_p, laptop_3.p) annotation(
    Line(points = {{58, -56}, {61, -56}, {61, -56}, {64, -56}, {64, -58}, {68, -58}}, color = {0, 0, 255}));
  connect(laptop_adpt_3.pin_n, laptop_3.n) annotation(
    Line(points = {{58, -76}, {61, -76}, {61, -76}, {64, -76}, {64, -78}, {66, -78}, {66, -78}, {68, -78}}, color = {0, 0, 255}));
  connect(laptop_adpt_2.pin_p, laptop_2.p) annotation(
    Line(points = {{44, 4}, {48, 4}, {48, 4}, {56, 4}, {56, 4}, {54, 4}, {54, 4}, {55, 4}, {55, 4}, {56, 4}}, color = {0, 0, 255}));
  connect(laptop_adpt_2.pin_n, laptop_2.n) annotation(
    Line(points = {{44, -16}, {51, -16}, {51, -16}, {58, -16}, {58, -16}, {56, -16}, {56, -16}, {56, -16}, {56, -16}}, color = {0, 0, 255}));
  connect(laptop_2.n, ground3.p) annotation(
    Line(points = {{56, -16}, {72, -16}}, color = {0, 0, 255}));
  connect(laptop_adpt_2.hPin_P, z.pin_n) annotation(
    Line(points = {{24, 4}, {12, 4}, {12, 4}, {0, 4}, {0, -46}, {-30, -46}}));
  connect(laptop_adpt_2.hPin_N, ground2.pin) annotation(
    Line(points = {{24, -16}, {14, -16}, {14, -84}, {-64, -84}, {-64, -84}, {-66, -84}, {-66, -84}}, color = {117, 80, 123}));
  connect(led_driver_3.pin_p, led_3.p) annotation(
    Line(points = {{60, -96}, {66, -96}, {66, -96}, {72, -96}, {72, -96}, {72, -96}, {72, -96}, {72, -96}, {72, -96}, {72, -96}}, color = {0, 0, 255}));
  connect(led_driver_3.pin_n, led_3.n) annotation(
    Line(points = {{60, -116}, {66, -116}, {66, -116}, {72, -116}, {72, -116}, {72, -116}, {72, -116}, {72, -116}}, color = {0, 0, 255}));
  connect(ground5.p, led_3.n) annotation(
    Line(points = {{72, -120}, {72, -120}, {72, -120}, {72, -120}, {72, -120}, {72, -120}, {72, -116}, {71, -116}, {71, -116}, {71.5, -116}, {71.5, -116}, {71.75, -116}, {71.75, -116}, {72, -116}}, color = {0, 0, 255}));
  connect(led_driver_1.hPin_P, z.pin_n) annotation(
    Line(points = {{106, -46}, {-30, -46}}));
  connect(led_driver_2.hPin_P, z.pin_n) annotation(
    Line(points = {{106, -92}, {101, -92}, {101, -92}, {96, -92}, {96, -46}, {-30, -46}}));
  connect(led_driver_1.pin_p, led_1.p) annotation(
    Line(points = {{126, -46}, {132, -46}, {132, -46}, {138, -46}, {138, -46}, {138, -46}}, color = {0, 0, 255}));
  connect(led_driver_1.pin_n, led_1.n) annotation(
    Line(points = {{126, -66}, {132, -66}, {132, -66}, {138, -66}, {138, -66}, {138, -66}, {138, -66}, {138, -66}}, color = {0, 0, 255}));
  connect(ground4.p, led_1.n) annotation(
    Line(points = {{138, -70}, {138, -70}, {138, -66}, {138, -66}}, color = {0, 0, 255}));
  connect(ground7.p, led_2.n) annotation(
    Line(points = {{138, -116}, {138, -116}, {138, -112}, {138, -112}}, color = {0, 0, 255}));
  connect(led_driver_2.pin_n, led_2.n) annotation(
    Line(points = {{126, -112}, {132, -112}, {132, -112}, {138, -112}, {138, -112}, {138, -112}}, color = {0, 0, 255}));
  connect(led_driver_2.pin_p, led_2.p) annotation(
    Line(points = {{126, -92}, {132, -92}, {132, -92}, {138, -92}, {138, -92}, {138, -92}, {138, -92}, {138, -92}}, color = {0, 0, 255}));
  connect(led_driver_1.hPin_N, led_driver_2.hPin_N) annotation(
    Line(points = {{106, -66}, {103, -66}, {103, -66}, {100, -66}, {100, -112}, {106, -112}, {106, -112}}, color = {117, 80, 123}));
  connect(led_driver_3.hPin_P, z1.pin_n) annotation(
    Line(points = {{40, -96}, {33, -96}, {33, -96}, {26, -96}, {26, -56}, {-10, -56}, {-10, -56}}));
  connect(led_driver_3.hPin_N, ground2.pin) annotation(
    Line(points = {{40, -116}, {18, -116}, {18, -116}, {-4, -116}, {-4, -84}, {-66, -84}, {-66, -84}}, color = {117, 80, 123}));
  connect(led_driver_2.hPin_N, ground2.pin) annotation(
    Line(points = {{106, -112}, {100, -112}, {100, -136}, {-4, -136}, {-4, -84}, {-66, -84}, {-66, -84}}, color = {117, 80, 123}));
  connect(laptop_adpt_1.pin_p, laptop_1.p) annotation(
    Line(points = {{44, 40}, {64, 40}, {64, 40}, {64, 40}}, color = {0, 0, 255}));
  connect(laptop_adpt_1.pin_n, laptop_1.n) annotation(
    Line(points = {{44, 20}, {64, 20}, {64, 20}, {64, 20}}, color = {0, 0, 255}));
  connect(ground6.p, laptop_1.n) annotation(
    Line(points = {{80, 20}, {64, 20}, {64, 20}, {64, 20}}, color = {0, 0, 255}));
  annotation(
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}), graphics = {Text(lineColor = {102, 44, 145}, extent = {{26, 76}, {102, -72}}, textString = "1"), Line(points = {{-86, 0}, {-80, 16}, {-74, 26}, {-64, 38}, {-50, 32}, {-40, 8}, {-38, -2}, {-24, -30}, {-8, -38}, {8, -22}, {16, 0}}, color = {28, 108, 200}, smooth = Smooth.Bezier)}),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-150, -150}, {150, 150}}, initialScale = 0.1), graphics = {Text(origin = {-131, 125}, extent = {{111, -1}, {-17, 23}}, textString = "DC Testbed: Configuration 2
* AC-DC loads.
* Delta-wye transformer (Unbalanced)", horizontalAlignment = TextAlignment.Left), Text(origin = {-351, -11}, extent = {{273, -7}, {-17, 23}}, textString = "TODO:\n* Power calc quantities math (vector multiplication) in Voltage source", horizontalAlignment = TextAlignment.Left)}));
end Configuration_3;