within HPF.Examples.ModelingValidation;
model Scenario_2_Data_Set_2_2
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-58, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-56, 64}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VoltageSource voltageSource(vArg_phA = {0.52196, 5.0309, 3.137, 5.1211, 0.88185, 0.5405, 2.7381, 3.3571, 3.1032, 1.0556, 4.7534, 0.08957, 4.2676, 4.1244, 4.4068}, vArg_phB = {4.7098, 2.6393, 0.15983, 3.0248, 0.54992, 2.8356, 0.30425, 1.6224, 5.1955, 4.6578, 1.421, 1.561, 2.3545, 1.471, 0.6687}, vArg_phC = {2.616, 0.41259, 4.8314, 0.56289, 3.7924, 4.8133, 4.8348, -0.2768, 0.88781, 2.6372, 4.1405, 4.1314, 0.31627, 0.0998, 2.1076}, vMag_phA = {281.6099, 0.52895, 0.47049, 0.73987, 0.12572, 0.73742, 0.42769, 0.058304, 0.29207, 0.058748, 0.015748, 0.02911, 0.017013, 0.0086381, 0.017564}, vMag_phB = {281.5887, 0.66547, 0.46821, 1.1624, 0.27892, 0.72691, 0.37598, 0.030611, 0.254, 0.065578, 0.021447, 0.041925, 0.013833, 0.0068935, 0.013253}, vMag_phC = {281.39, 0.46521, 0.075759, 1.0168, 0.39967, 0.60233, 0.28322, 0.061309, 0.27537, 0.028665, 0.0058585, 0.053376, 0.017543, 0.0048111, 0.010129}) annotation (
    Placement(visible = true, transformation(origin = {-58, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {2, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197) annotation (
    Placement(visible = true, transformation(extent = {{-20, 0}, {0, 20}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-2of3.mat", nomP = 25.2, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={176,34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Power_Supply_1(P1(start = 600), S1(start = 600), P_DCmin = 8, P_stby = 23.34, V_Rect = 48, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-RSP-1000-48.mat", nomP = 1000, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={76,52},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(P1(start = 72), S1(start = 72), P_DCmin = 2, P_stby = 0.44, V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-391174-001.mat", nomP = 120, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={74,18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_1(pwr = 580.362096) annotation (
    Placement(visible = true, transformation(origin={106,48},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={118,28},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={120,-6},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr = 72.733709) annotation (
    Placement(visible = true, transformation(origin={108,14},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={206,6},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin={48,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-3of3.mat", nomP = 25.2, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={76,-26},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr = 27.534833) annotation (
    Placement(visible = true, transformation(origin={206,30},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={120,-50},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(P1(start = 28), S1(start = 28), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-APV-25-24-1of3.mat", nomP = 25.2, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={76,86},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr = 26.578419) annotation (
    Placement(visible = true, transformation(origin={106,-30},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load LED_1(pwr = 27.007361) annotation (
    Placement(visible = true, transformation(origin={104,82},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={120,62},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(P1(start = 72), P_DCmin = 2, P_stby = 0.33, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1900-15C2.mat", nomP = 90, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin = {174, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(P1(start = 72), P_DCmin = 2, P_stby = 0.27, S1(start = 72), V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/HP-PA-1121-12H.mat", nomP = 120, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={76,-92},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Power_Supply_2(P1(start = 1e-2), P_DCmin = 10, P_stby = 4.89, S1(start = 1e-2), V_Rect = 48, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Xunbuma-T-1000-48.mat", nomP = 1000, nomV = 120, vAngle = -2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={174,-8},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Power_Supply_3(P1(start = 600), P_DCmin = 10, P_stby = 17.7, S1(start = 600), V_Rect = 48, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Mean-Well-SE-1000-48.mat", nomP = 1000, nomV = 120, vAngle = 2.094395102393195) annotation (
    Placement(visible = true, transformation(origin={76,-58},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_2(pwr = 1e-6) annotation (
    Placement(visible = true, transformation(origin={208,-12},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin = {208, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={122,-82},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Load_3(pwr = 559.796403) annotation (
    Placement(visible = true, transformation(origin={106,-62},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load Laptop_4(pwr = 70.534021) annotation (
    Placement(visible = true, transformation(origin = {208, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {208, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={146,-70},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={120,-116},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_5(pwr = 71.327585) annotation (
    Placement(visible = true, transformation(origin={106,-96},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={44,-108},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points = {{-58, -2.75}, {-58, -12.75}}, color = {117, 80, 123}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points = {{0, -2}, {2, -2}, {2, -16.75}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B) annotation (
    Line(points = {{-45.5, 10}, {-20, 10}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A) annotation (
    Line(points = {{-45.5, 20}, {-20, 20}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C) annotation (
    Line(points = {{-45.5, 0}, {-20, 0}}, color = {92, 53, 102}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation (
    Line(points={{86,58},{106,58}},      color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation (
    Line(points={{118,38},{106,38}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points={{84,12},{94,12},{94,4},{108,4}},          color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points={{120,4},{108,4}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points={{84,24},{108,24}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points={{64,12},{48,12},{48,11.25}},        color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points={{186,40},{206,40}},      color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points={{206,16},{206,20}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation (
    Line(points={{86,-20},{106,-20}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation (
    Line(points={{86,-32},{92,-32},{92,-40},{106,-40}},                      color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation (
    Line(points={{120,-40},{106,-40}},      color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points={{86,92},{104,92}},        color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points={{86,80},{90,80},{90,72},{104,72}},                  color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points={{120,72},{104,72}},       color = {0, 0, 255}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation (
    Line(points={{208,-22},{192,-22},{192,-14},{184,-14}},                      color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation (
    Line(points={{184,-2},{208,-2}},    color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation (
    Line(points={{208,-22},{208,-26}},      color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p, Load_3.p) annotation (
    Line(points={{86,-52},{106,-52}},      color = {0, 0, 255}));
  connect(ground13.p, Load_3.n) annotation (
    Line(points={{122,-72},{106,-72}},        color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points={{186,28},{190,28},{190,20},{206,20}},                     color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, Laptop_5.p) annotation (
    Line(points={{86,-86},{106,-86}},        color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, Laptop_5.n) annotation (
    Line(points={{86,-98},{96,-98},{96,-106},{106,-106}},            color = {0, 0, 255}));
  connect(ground18.p, Laptop_5.n) annotation (
    Line(points={{120,-106},{106,-106}},      color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points={{44,-96.75},{44,-98},{66,-98}},           color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points={{164,-58},{163,-58},{163,-58.75},{146,-58.75}},          color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, Laptop_4.p) annotation (
    Line(points = {{184, -46}, {208, -46}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, Laptop_4.n) annotation (
    Line(points = {{184, -58}, {204, -58}, {204, -62}, {208, -62}, {208, -66}}, color = {0, 0, 255}));
  connect(ground16.p, Laptop_4.n) annotation (
    Line(points = {{208, -72}, {208, -66}}, color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation (
    Line(points={{86,46},{92,46},{92,38},{106,38}},                       color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, Load_3.n) annotation (
    Line(points={{86,-64},{96,-64},{96,-72},{106,-72}},            color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation (
    Line(points={{66,80},{48,80},{48,11.25}},          color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N, ground6.pin) annotation (
    Line(points={{66,46},{48,46},{48,11.25}},        color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation (
    Line(points={{166,28},{146,28},{146,-58.75}},        color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N, ground17.pin) annotation (
    Line(points={{164,-14},{146,-14},{146,-58.75}},        color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation (
    Line(points={{66,-32},{44,-32},{44,-96.75}},         color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N, ground19.pin) annotation (
    Line(points={{66,-64},{44,-64},{44,-96.75}},         color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation (
    Line(points={{0,22},{32,22},{32,92},{66,92}},            color = {92, 53, 102}));
  connect(Power_Supply_1.hPin_P, LED_Driver_1.hPin_P) annotation (
    Line(points={{66,58},{32,58},{32,92},{66,92}},            color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation (
    Line(points={{64,24},{32,24},{32,92},{66,92}},            color = {92, 53, 102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation (
    Line(points={{0,14},{30,14},{30,-12},{130,-12},{130,40},{166,40}},              color = {92, 53, 102}));
  connect(Power_Supply_2.hPin_P, LED_Driver_2.hPin_P) annotation (
    Line(points={{164,-2},{130,-2},{130,40},{166,40}},        color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation (
    Line(points={{164,-46},{130,-46},{130,40},{166,40}},          color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation (
    Line(points={{0,6},{20,6},{20,-20},{66,-20}},          color = {92, 53, 102}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points={{66,-52},{30,-52},{30,-20},{66,-20}},          color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation (
    Line(points={{66,-86},{30,-86},{30,-20},{66,-20}},            color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-260, -220}, {260, 240}}, initialScale = 0.1), graphics={  Text(origin = {-22, 12}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 2 | Data Set 2.2
Load Phase a-n    Total Load - 700W     Load Bank 1 (78W), LED 1 (22W), Resistor 4 (600W)
Load Phase b-n    Total Load - 100W     Load Bank 2 (78W), LED 2 (22W)
Load Phase c-n    Total Load - 700W     Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)", fontSize = 9,
            horizontalAlignment =                                                                                               TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-260, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2_Data_Set_2_2;
