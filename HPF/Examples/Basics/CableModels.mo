within HPF.Examples.Basics;

model CableModels
extends Modelica.Icons.Example;
  Loads.SinglePhase.HarmonicPQLoad harmonicPQLoad(P = {100}, Q = {5}) annotation(
    Placement(visible = true, transformation(origin = {54, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-20, 46}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(hrms = {1, 3}) annotation(
    Placement(visible = true, transformation(origin = {-70, 76}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  Cables.NEC_CableModelDC nEC_CableModelDC(wireGaugeDC = HPF.Types.WireGaugeDC.gauge_12) annotation(
    Placement(visible = true, transformation(origin = {26, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Sources.VoltageSource v(vArg = {0, 0}, vMag = {120, 1e-6}) annotation(
    Placement(visible = true, transformation(origin = {-20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load dC_Load(pwr = 100) annotation(
    Placement(visible = true, transformation(origin = {64, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 100) annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Cables.NEC_CableModel nEC_CableModel(length = 100) annotation(
    Placement(visible = true, transformation(origin = {10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(v.pin_n, ground.pin) annotation(
    Line(points = {{-20, 60}, {-20, 54}}, color = {117, 80, 123}));
  connect(v.pin_p, nEC_CableModel.pin_p) annotation(
    Line(points = {{-20, 80}, {0, 80}}, color = {92, 53, 102}));
  connect(constantVoltage.p, nEC_CableModelDC.p) annotation(
    Line(points = {{-20, 20}, {16, 20}}, color = {0, 0, 255}));
  connect(constantVoltage.n, ground1.p) annotation(
    Line(points = {{-20, 0}, {-20, -10}}, color = {0, 0, 255}));
  connect(nEC_CableModelDC.n, dC_Load.p) annotation(
    Line(points = {{36, 20}, {54, 20}}, color = {0, 0, 255}));
  connect(dC_Load.n, ground1.p) annotation(
    Line(points = {{74, 20}, {78, 20}, {78, -10}, {-20, -10}}, color = {0, 0, 255}));
  connect(nEC_CableModel.pin_n, harmonicPQLoad.hPin_P) annotation(
    Line(points = {{20, 80}, {43, 80}}, color = {117, 80, 123}));
  annotation(
    Icon(coordinateSystem(grid = {0.1, 0.1})),
    Documentation(info = "<html><head></head><body>Example model showing the usage of cable models.</body></html>"));
end CableModels;