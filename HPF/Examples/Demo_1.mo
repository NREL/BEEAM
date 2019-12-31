within HPF.Examples;
model Demo_1
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhA(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_A.mat")  annotation (
    Placement(visible = true, transformation(origin = {-80, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhB(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_B.mat")  annotation (
    Placement(visible = true, transformation(origin = {-66, 12}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Sources.VoltageSrcLoadData PhC(fileName = "HPF/InputData/Examples/DC_Testbed/hrmsData_volt_prim_confAC_1_C.mat")  annotation (
    Placement(visible = true, transformation(origin = {-52, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Machines.Transformers_iPh.Test_DY test_DY annotation (
    Placement(visible = true, transformation(origin = {-16, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-80, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase laptop(V_Rect = 19.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_laptop.mat")  annotation (
    Placement(visible = true, transformation(origin = {60, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase led_driver(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/hrmMdl_LedDriver.mat")  annotation (
    Placement(visible = true, transformation(origin = {60, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load laptop_load(pwr = 50)  annotation (
    Placement(visible = true, transformation(origin = {84, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load led_load(pwr = 25)  annotation (
    Placement(visible = true, transformation(origin = {86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {98, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {86, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {-16, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor r(r = 10e6)  annotation (
    Placement(visible = true, transformation(origin = {10, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(hrms = {k for k in 1:2:30})  annotation (
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(PhA.pin_p, test_DY.pinPrim_A) annotation (
    Line(points = {{-80, 42}, {-26, 42}}));
  connect(PhB.pin_p, test_DY.pinPrim_B) annotation (
    Line(points = {{-66, 22}, {-66, 32}, {-26, 32}}));
  connect(PhC.pin_p, test_DY.pinPrim_C) annotation (
    Line(points = {{-52, 4}, {-52, 22}, {-26, 22}}));
  connect(PhA.pin_n, ground.pin) annotation (
    Line(points = {{-80, 22}, {-80, 22}, {-80, -24}, {-80, -24}}, color = {117, 80, 123}));
  connect(PhC.pin_n, ground.pin) annotation (
    Line(points = {{-52, -16}, {-52, -16}, {-52, -24}, {-80, -24}, {-80, -24}}, color = {117, 80, 123}));
  connect(PhB.pin_n, ground.pin) annotation (
    Line(points = {{-66, 2}, {-66, 2}, {-66, -24}, {-80, -24}, {-80, -24}}, color = {117, 80, 123}));
  connect(test_DY.pinSec_A, laptop.hPin_P) annotation (
    Line(points = {{-6, 42}, {50, 42}}));
  connect(laptop.pin_p, laptop_load.p) annotation (
    Line(points = {{70, 42}, {84, 42}}, color = {0, 0, 255}));
  connect(laptop.pin_n, laptop_load.n) annotation (
    Line(points = {{70, 30}, {76, 30}, {76, 22}, {84, 22}}, color = {0, 0, 255}));
  connect(led_driver.pin_p, led_load.p) annotation (
    Line(points = {{70, 10}, {86, 10}}, color = {0, 0, 255}));
  connect(led_driver.pin_n, led_load.n) annotation (
    Line(points = {{70, -2}, {76, -2}, {76, -10}, {86, -10}}, color = {0, 0, 255}));
  connect(laptop_load.n, ground1.p) annotation (
    Line(points = {{84, 22}, {98, 22}, {98, 20}}, color = {0, 0, 255}));
  connect(led_load.n, ground2.p) annotation (
    Line(points = {{86, -10}, {86, -18}}, color = {0, 0, 255}));
  connect(test_DY.pinSec_B, led_driver.hPin_P) annotation (
    Line(points = {{-6, 32}, {36, 32}, {36, 10}, {50, 10}}));
  connect(laptop.hPin_N, test_DY.hPin_N) annotation (
    Line(points = {{50, 30}, {42, 30}, {42, 0}, {-16, 0}, {-16, 16}}, color = {117, 80, 123}));
  connect(led_driver.hPin_N, test_DY.hPin_N) annotation (
    Line(points = {{50, -2}, {-16, -2}, {-16, 16}}, color = {117, 80, 123}));
  connect(ground3.pin, test_DY.hPin_N) annotation (
    Line(points = {{-16, -10}, {-16, -10}, {-16, 18}, {-16, 18}, {-16, 16}}));
  connect(r.pin_p, test_DY.pinSec_C) annotation (
    Line(points = {{0, 22}, {-6, 22}}));
  connect(r.pin_n, ground3.pin) annotation (
    Line(points = {{20, 22}, {20, 22}, {20, -10}, {-16, -10}, {-16, -10}}, color = {117, 80, 123}));
end Demo_1;
