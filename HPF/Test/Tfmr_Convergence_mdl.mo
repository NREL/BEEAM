within HPF.Test;

model Tfmr_Convergence_mdl
  import Modelica.ComplexMath.j;
  
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(origin = {74, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase_New_2 aC2DC_SinglePhase_New(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation(
    Placement(visible = true, transformation(origin = {36, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop(pwr = 100) annotation(
    Placement(visible = true, transformation(origin = {74, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSource v(vArg = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vMag = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}) annotation(
    Placement(visible = true, transformation(origin = {-122, -4}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-14, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor currentSensor annotation(
    Placement(visible = true, transformation(origin = {-18, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation(
    Placement(visible = true, transformation(origin = {-113, 71.5}, extent = {{-13, -15.1667}, {13, 10.8333}}, rotation = 0)));
  HPF.Transformers.SinglePhase.Simplified simplified(N = 277 / 120,Rc = 1e6, Rp = 1e-5, Rs = 1e-5, Xm = 1e6, Xp = 1e-5, Xs = 1e-5, fEC = 0.1, fOSL = 0.1, fW = 1)  annotation(
    Placement(visible = true, transformation(origin = {-74, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground3 annotation(
    Placement(visible = true, transformation(origin = {-48, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Impedance z1(z = 100 + 60 * j) annotation(
    Placement(visible = true, transformation(origin = {54, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground4 annotation(
    Placement(visible = true, transformation(origin = {122, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(currentSensor.pin_n, aC2DC_SinglePhase_New.hPin_P) annotation(
    Line(points = {{-18, -2}, {26, -2}}, color = {117, 80, 123}));
  connect(laptop.n, ground2.p) annotation(
    Line(points = {{74, -24}, {74, -28}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase_New.hPin_N, ground.pin) annotation(
    Line(points = {{26, -14}, {-14, -14}, {-14, -25}}, color = {117, 80, 123}));
  connect(v.pin_n, ground1.pin) annotation(
    Line(points = {{-122, -14}, {-122, -21.5}, {-120, -21.5}, {-120, -29}}, color = {117, 80, 123}));
  connect(aC2DC_SinglePhase_New.pin_p, laptop.p) annotation(
    Line(points = {{46, -2}, {52, -2}, {52, -4}, {74, -4}}, color = {0, 0, 255}));
  connect(aC2DC_SinglePhase_New.pin_n, laptop.n) annotation(
    Line(points = {{46, -14}, {46, -24}, {74, -24}}, color = {0, 0, 255}));
  connect(v.pin_p, simplified.pinP_prim) annotation(
    Line(points = {{-122, 6}, {-122, 26}, {-84, 26}}, color = {92, 53, 102}));
  connect(ground1.pin, simplified.pinN_prim) annotation(
    Line(points = {{-120, -28}, {-104, -28}, {-104, 6}, {-84, 6}}, color = {92, 53, 102}));
  connect(simplified.pinN_sec, ground3.pin) annotation(
    Line(points = {{-64, 6}, {-48, 6}, {-48, -2}}, color = {117, 80, 123}));
  connect(simplified.pinP_sec, currentSensor.pin_p) annotation(
    Line(points = {{-64, 26}, {-18, 26}, {-18, 18}, {-18, 18}}, color = {92, 53, 102}));
  connect(z1.pin_p, simplified.pinP_sec) annotation(
    Line(points = {{44, 26}, {-64, 26}}, color = {92, 53, 102}));
  connect(z1.pin_n, ground4.pin) annotation(
    Line(points = {{64, 26}, {122, 26}, {122, 15}}, color = {117, 80, 123}));
  annotation(
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
  Documentation(info = "<html><head></head><body>Test model based on the punch list. Simulating a single phase transformer with a converter.</body></html>"));
end Tfmr_Convergence_mdl;