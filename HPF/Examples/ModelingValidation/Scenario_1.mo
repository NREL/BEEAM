within HPF.Examples.ModelingValidation;

model Scenario_1
  HPF.Sources.ThreePhase.VoltageSrc_ReadFile voltageSrc_ReadFile annotation(
    Placement(visible = true, transformation(origin = {-108, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye annotation(
    Placement(visible = true, transformation(origin = {-48, 38}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase aC2DC_SinglePhase annotation(
    Placement(visible = true, transformation(origin = {100, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load annotation(
    Placement(visible = true, transformation(origin = {140, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef annotation(
    Placement(visible = true, transformation(origin = {-106, 98}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {-108, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground1 annotation(
    Placement(visible = true, transformation(origin = {-34, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSrc_ReadFile.pinP_phB, deltaWye.pinPrim_A) annotation(
    Line(points = {{-98, 46}, {-76, 46}, {-76, 48}, {-58, 48}}));
  connect(voltageSrc_ReadFile.pinP_phA, deltaWye.pinPrim_B) annotation(
    Line(points = {{-98, 38}, {-58, 38}}));
  connect(voltageSrc_ReadFile.pinP_phC, deltaWye.pinPrim_C) annotation(
    Line(points = {{-98, 30}, {-76, 30}, {-76, 28}, {-58, 28}}));
  connect(deltaWye.pinSec_A, aC2DC_SinglePhase.hPin_P) annotation(
    Line(points = {{-38, 50}, {27, 50}, {27, 60}, {90, 60}}));
  connect(voltageSrc_ReadFile.pinN, ground.pin) annotation(
    Line(points = {{-108, 28}, {-108, 28}, {-108, 18}, {-108, 18}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground1.pin) annotation(
    Line(points = {{-38, 26}, {-34, 26}, {-34, 18}}, color = {117, 80, 123}));

annotation(
    Diagram(coordinateSystem(extent = {{-150, -150}, {150, 150}})),
    Icon(coordinateSystem(extent = {{-150, -150}, {150, 150}})));
end Scenario_1;