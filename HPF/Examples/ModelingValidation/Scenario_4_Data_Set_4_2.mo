within HPF.Examples.ModelingValidation;
model Scenario_4_Data_Set_4_2
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-1of3.mat", nomP = 25.2, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={34,30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_1(pwr = 29.272) annotation (
    Placement(visible = true, transformation(origin={68,26},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation (
    Placement(visible = true, transformation(origin={-132,-12},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={82,-26},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr = 28.465) annotation (
    Placement(visible = true, transformation(origin={68,-106},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load Laptop_4(pwr = 70.760) annotation (
    Placement(visible = true, transformation(origin={164,-96},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Loads.SinglePhase.HarmonicPQLoad Heater_1A(P = {192.854}) annotation (
    Placement(visible = true, transformation(origin={28,54},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-3of3.mat", nomP = 25.2, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {36, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr = 29.059) annotation (
    Placement(visible = true, transformation(origin={164,-56},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(P1(start = 72), P_DCmin = 2, P_stby = 0.33, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1900-15C2.mat", nomP = 90, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={136,-92},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={106,-108},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_5(pwr = 66.042) annotation (
    Placement(visible = true, transformation(origin={72,-144},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={86,-164},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr = 70.575) annotation (
    Placement(visible = true, transformation(origin = {68, -6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-2of3.mat", nomP = 25.2, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={136,-52},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-66,-50},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.44, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-391174-001.mat", nomP = 120, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {34, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={176,-76},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 72), P_DCmin = 2, P_stby = 0.27, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={36,-140},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin={-130,46},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-132,-46},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin = {8, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={82,6},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation (
    Placement(visible = true, transformation(extent={{-98,-22},{-78,-2}},        rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={80,-126},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={176,-116},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={4,-162},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Loads.SinglePhase.HarmonicPQLoad Heater_2A(P = {383.774}) annotation (
    Placement(visible = true, transformation(origin={28,74},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Loads.SinglePhase.HarmonicPQLoad Heater_1C(P = {189.227}, vAngle = 2.0944) annotation (
    Placement(visible = true, transformation(origin = {34, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Loads.SinglePhase.HarmonicPQLoad Heater_2C(P = {394.718}, vAngle = 2.0944) annotation (
    Placement(visible = true, transformation(origin = {32, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points = {{44, -8}, {58, -8}, {58, -16}, {68, -16}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points={{82,16},{68,16}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, Laptop_4.n) annotation (
    Line(points={{146,-98},{150,-98},{150,-106},{164,-106}},                    color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points={{44,24},{59.5,24},{59.5,16},{68,16}},          color = {0, 0, 255}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation (
    Line(points={{-119.5,-22},{-98,-22}},       color = {92, 53, 102}));
  connect(ground18.p, Laptop_5.n) annotation (
    Line(points={{86,-154},{72,-154}},      color = {0, 0, 255}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation (
    Line(points={{-78,-16},{-52,-16},{-52,-96},{26,-96}},           color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation (
    Line(points={{-119.5,-12},{-98,-12}},       color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_N, ground1.pin) annotation (
    Line(points = {{24, -8}, {8, -8}, {8, -26}}, color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation (
    Line(points={{126,-58},{106,-58},{106,-98}},        color = {117, 80, 123}));
  connect(LED_Driver_1.hPin_N, ground1.pin) annotation (
    Line(points={{24,24},{8,24},{8,-26}},        color = {117, 80, 123}));
  connect(Laptop_Charger_5.pin_n, Laptop_5.n) annotation (
    Line(points={{46,-146},{62,-146},{62,-154},{72,-154}},          color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points={{4,-152},{4,-146},{26,-146}},        color = {92, 53, 102}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points={{176,-66},{164,-66}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation (
    Line(points={{46,-108},{52,-108},{52,-116},{68,-116}},                      color = {0, 0, 255}));
  connect(ground16.p, Laptop_4.n) annotation (
    Line(points={{176,-106},{164,-106}},    color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation (
    Line(points={{80,-116},{68,-116}},                              color = {0, 0, 255}));
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points={{-132,-24.75},{-132,-36}},      color = {117, 80, 123}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points={{26,-134},{-52,-134},{-52,-96},{26,-96}},          color = {92, 53, 102}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points={{44,36},{68,36}},      color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points={{82,-16},{68,-16}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_p, Laptop_4.p) annotation (
    Line(points={{146,-86},{164,-86}},      color = {0, 0, 255}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation (
    Line(points={{26,-108},{4,-108},{4,-152}},        color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points={{-78,-24},{-66,-24},{-66,-40}},           color = {117, 80, 123}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points={{146,-58},{150,-58},{150,-66},{164,-66}},          color = {0, 0, 255}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation (
    Line(points={{-78,0},{-18,0},{-18,36},{24,36}},           color = {92, 53, 102}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points={{146,-46},{164,-46}},      color = {0, 0, 255}));
  connect(Heater_1A.hPin_P, deltaWye.pinSec_A) annotation (
    Line(points={{17,54},{-18,54},{-18,0},{-78,0}},           color = {92, 53, 102}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points = {{44, 4}, {68, 4}}, color = {0, 0, 255}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation (
    Line(points={{-119.5,-2},{-98,-2}},       color = {92, 53, 102}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation (
    Line(points={{46,-96},{68,-96}},                            color = {0, 0, 255}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation (
    Line(points={{126,-86},{114,-86},{114,-46},{126,-46}},          color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points={{126,-98},{106,-98}},                              color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation (
    Line(points={{24,4},{-18,4},{-18,36},{24,36}},          color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation (
    Line(points={{-78,-8},{-6,-8},{-6,-46},{126,-46}},                                 color = {92, 53, 102}));
  connect(Laptop_Charger_5.pin_p, Laptop_5.p) annotation (
    Line(points={{46,-134},{72,-134}},      color = {0, 0, 255}));
  connect(Heater_2A.hPin_P, deltaWye.pinSec_A) annotation (
    Line(points={{17,74},{-18,74},{-18,0},{-78,0}},                      color = {92, 53, 102}));
  connect(Heater_1C.hPin_P, deltaWye.pinSec_C) annotation (
    Line(points={{23,-76},{-52,-76},{-52,-16},{-78,-16}},           color = {92, 53, 102}));
  connect(Heater_2C.hPin_P, deltaWye.pinSec_C) annotation (
    Line(points={{21,-58},{-52,-58},{-52,-16},{-78,-16}},                        color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}, initialScale = 0.1), graphics={  Text(lineColor = {28, 108, 200}, extent = {{-258, 182}, {176, 130}}, textString = "Data Set 4.2
	Load Phase a-n	Total Load - 700W	Laptop Charger 3 + LED Driver 1	Load Bank 1 (78W), LED 1 (22W), Heater 1 - A (200W), Heater 2 - A (400W)
	Load Phase b-n	Total Load - 100W	Laptop Charger 4 + LED Driver 2	Load Bank 2 (78W), LED 2 (22W)
	Load Phase c-n	Total Load - 700W	Laptop Charger 5 + LED Driver 3	Load Bank 3 (78W), LED 3 (22W), Heater 1 - C (200W), Heater 2 - C (400W)
    ", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_4_Data_Set_4_2;
