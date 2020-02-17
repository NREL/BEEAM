within HPF.Examples.ModelingValidation;
model Scenario_2
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-178,30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.ThreePhase.DeltaWye deltaWye(Rc = 3.5366e+03, Rp = 2.7672, Rs = 0.2576,VPrimRated = 480, VSecRated = 208, Xm = 711.1091, Xp = 1.1006, Xs = 0.5003,fEC = 0.067, fOSL = 0.033, fW = 0.9) annotation (
    Placement(visible = true, transformation(origin={-96,48},    extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-78,30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin={-148,126},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA = {0.52192, 6.1952, 3.641, 8.2279, 4.6037, 6.1521, 9.054, 11.1771, 11.547, 9.5299}, vArg_phB = {4.7065, 3.5627, 4.2216, 5.9383, 4.7501, 8.371, 6.837, 8.9513, 7.4465, 13.0091}, vArg_phC = {2.6138, 1.127, 6.9575, 3.4123, 7.8346, 10.4191, 11.1108, 6.5894, 9.3993, 10.5656}, vMag_phA = {282.8166, 0.45117, 0.39336, 0.76549, 0.19582, 0.74027, 0.44753, 0.031767, 0.56648, 0.11503}, vMag_phB = {282.9682, 0.65765, 0.17303, 1.3199, 0.3038, 0.75239, 0.43691, 0.046575, 0.5116, 0.15362}, vMag_phC = {281.8661, 0.35229, 0.54619, 0.99899, 0.49719, 0.66452, 0.39451, 0.037451, 0.50007, 0.058614}) annotation (
    Placement(visible = true, transformation(origin={-178,48},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2.mat") annotation (
    Placement(visible = true, transformation(origin={134,62},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_1(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1.mat") annotation (
    Placement(visible = true, transformation(origin={6,92},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3.mat") annotation (
    Placement(visible = true, transformation(origin={8,44},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_1(pwr = 200) annotation (
    Placement(visible = true, transformation(origin={40,88},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={40,60},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={42,14},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 78) annotation (
    Placement(visible = true, transformation(origin={42,40},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={164,34},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground5 annotation (
    Placement(visible = true, transformation(origin={110,46},    extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin={-18,26},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground7 annotation (
    Placement(visible = true, transformation(origin={-18,78},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhA annotation (
    Placement(visible = true, transformation(origin={-152,58},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3.mat") annotation (
    Placement(visible = true, transformation(origin={10,-16},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr = 22) annotation (
    Placement(visible = true, transformation(origin={164,58},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={36,-46},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground9 annotation (
    Placement(visible = true, transformation(origin={-12,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1.mat") annotation (
    Placement(visible = true, transformation(origin = {8, 136}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 22) annotation (
    Placement(visible = true, transformation(origin={36, -20},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr = 22) annotation (
    Placement(visible = true, transformation(origin = {40, 132}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {40, 106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground11 annotation (
    Placement(visible = true, transformation(origin = {-16, 122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4.mat") annotation (
    Placement(visible = true, transformation(origin={132,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5.mat") annotation (
    Placement(visible = true, transformation(origin={2,-112},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_2(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2.mat") annotation (
    Placement(visible = true, transformation(origin={134,16},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase Power_Supply_3(V_Rect = 48, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3.mat") annotation (
    Placement(visible = true, transformation(origin={6,-64},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Load_2(pwr = 400) annotation (
    Placement(visible = true, transformation(origin={166,12},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={166,-14},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={36,-94},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load(pwr = 600) annotation (
    Placement(visible = true, transformation(origin={36,-68},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground14 annotation (
    Placement(visible = true, transformation(origin={110,-2},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground15 annotation (
    Placement(visible = true, transformation(origin={-20,-82},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 78) annotation (
    Placement(visible = true, transformation(origin={166,-34},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={166,-60},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={104,-48},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={38,-142},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 78) annotation (
    Placement(visible = true, transformation(origin={38,-116},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={-24,-128},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhB annotation(
    Placement(visible = true, transformation(origin = {-124, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_prim_PhC annotation(
    Placement(visible = true, transformation(origin = {-146, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation(
    Line(points = {{-178, 38}, {-178, 30}}, color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p, Load_1.p) annotation (
    Line(points={{16,98},{40,98}},        color = {0, 0, 255}));
  connect(ground1.p, Load_1.n) annotation (
    Line(points={{40,70},{40,78}},        color = {0, 0, 255}));
  connect(Laptop_charger_3.pin_n, Laptop_3.n) annotation (
    Line(points={{18,38},{32,38},{32,30},{42,30}},          color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points={{42,24},{42,30}},     color = {0, 0, 255}));
  connect(Laptop_charger_3.pin_p, Laptop_3.p) annotation (
    Line(points={{18,50},{42,50}},      color = {0, 0, 255}));
  connect(ground5.pin, LED_Driver_2.hPin_N) annotation (
    Line(points={{110,46},{110,56},{124,56}},       color = {92, 53, 102}));
  connect(ground7.pin, Power_Supply_1.hPin_N) annotation (
    Line(points={{-18,78},{-18,86},{-4,86}},       color = {92, 53, 102}));
  connect(Laptop_charger_3.hPin_N, ground6.pin) annotation (
    Line(points={{-2,38},{-18,38},{-18,26}},     color = {117, 80, 123}));
  connect(voltageSource.pinP_phB, iMsr_prim_PhA.pin_p) annotation(
    Line(points = {{-168, 56}, {-162, 56}, {-162, 58}}, color = {92, 53, 102}));
  connect(iMsr_prim_PhA.pin_n, deltaWye.pinPrim_A) annotation(
    Line(points = {{-142, 58}, {-106, 58}}, color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points={{144,68},{164,68}},      color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points={{164,44},{164,48}},    color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation(
    Line(points = {{20, -10}, {36, -10}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation(
    Line(points = {{20, -22}, {28, -22}, {28, -30}, {36, -30}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation(
    Line(points = {{36, -36}, {36, -30}}, color = {0, 0, 255}));
  connect(LED_Driver_3.hPin_N, ground9.pin) annotation(
    Line(points = {{0, -22}, {-12, -22}, {-12, -30}}, color = {117, 80, 123}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points = {{18, 142}, {40, 142}, {40, 142}, {40, 142}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points = {{18, 130}, {28, 130}, {28, 122}, {40, 122}, {40, 122}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points = {{40, 116}, {40, 116}, {40, 122}, {40, 122}}, color = {0, 0, 255}));
  connect(ground11.pin, LED_Driver_1.hPin_N) annotation (
    Line(points = {{-16, 122}, {-16, 122}, {-16, 130}, {-2, 130}, {-2, 130}}, color = {92, 53, 102}));
  connect(Load_2.n, Power_Supply_2.pin_n) annotation (
    Line(points={{166,2},{158,2},{158,10},{144,10}},            color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p, Load_2.p) annotation (
    Line(points={{144,22},{166,22}},                                    color = {0, 0, 255}));
  connect(Load_2.n, ground12.p) annotation (
    Line(points={{166,2},{166,-4}},                         color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p, dC_Load.p) annotation (
    Line(points={{16,-58},{36,-58}},                              color = {0, 0, 255}));
  connect(ground13.p, dC_Load.n) annotation (
    Line(points={{36,-84},{36,-78}},                            color = {0, 0, 255}));
  connect(ground14.pin, Power_Supply_2.hPin_N) annotation (
    Line(points={{110,-2},{110,10},{124,10}},                                   color = {92, 53, 102}));
  connect(Power_Supply_3.hPin_N, ground15.pin) annotation (
    Line(points={{-4,-70},{-20,-70},{-20,-82}},            color = {117, 80, 123}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points={{144,56},{156,56},{156,48},{164,48}},        color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation (
    Line(points={{12,-106},{38,-106}},        color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation (
    Line(points={{12,-118},{28,-118},{28,-126},{38,-126}},              color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation (
    Line(points={{38,-132},{38,-126}},        color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points={{-24,-128},{-24,-118},{-8,-118}},      color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points={{122,-36},{104,-36},{104,-48}},     color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation (
    Line(points={{142,-24},{166,-24}},                              color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation (
    Line(points={{142,-36},{158,-36},{158,-44},{166,-44}},                      color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation (
    Line(points={{166,-50},{166,-44}},      color = {0, 0, 255}));
  connect(deltaWye.pinSec_N, ground2.pin) annotation (
    Line(points={{-86,36},{-78,36},{-78,30}},                 color = {117, 80, 123}));
  connect(Power_Supply_1.pin_n, Load_1.n) annotation (
    Line(points={{16,86},{28,86},{28,78},{40,78}},                         color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n, dC_Load.n) annotation (Line(points={{16,-70},{
          26,-70},{26,-78},{36,-78}}, color={0,0,255}));
  connect(LED_Driver_1.hPin_P, deltaWye.pinSec_A) annotation (Line(points={{-2,
          142},{-42,142},{-42,60},{-86,60}}, color={92,53,102}));
  connect(Power_Supply_1.hPin_P, deltaWye.pinSec_A) annotation (Line(points={{
          -4,98},{-42,98},{-42,60},{-86,60}}, color={92,53,102}));
  connect(Laptop_charger_3.hPin_P, deltaWye.pinSec_A) annotation (Line(points={
          {-2,50},{-42,50},{-42,60},{-86,60}}, color={92,53,102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation (Line(points={{-86,
          52},{-52,52},{-52,2},{84,2},{84,68},{124,68}}, color={92,53,102}));
  connect(Power_Supply_2.hPin_P, LED_Driver_2.hPin_P) annotation (Line(points={
          {124,22},{84,22},{84,68},{124,68}}, color={92,53,102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation (Line(points
        ={{122,-24},{84,-24},{84,68},{124,68}}, color={92,53,102}));
  connect(iMsr_prim_PhC.pin_n, deltaWye.pinPrim_C) annotation(
    Line(points = {{-136, 38}, {-108, 38}, {-108, 38}, {-106, 38}}, color = {117, 80, 123}));
  connect(iMsr_prim_PhB.pin_n, deltaWye.pinPrim_B) annotation(
    Line(points = {{-114, 48}, {-106, 48}, {-106, 48}, {-106, 48}}, color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-4, -58}, {-62, -58}, {-62, -10}, {0, -10}}, color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-8, -106}, {-62, -106}, {-62, -10}, {0, -10}}, color = {92, 53, 102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation(
    Line(points = {{-86, 44.2}, {-78, 44.2}, {-78, 44}, {-62, 44}, {-62, -10}, {0, -10}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phA, iMsr_prim_PhB.pin_p) annotation(
    Line(points = {{-168, 48}, {-134, 48}, {-134, 48}, {-134, 48}}, color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_prim_PhC.pin_p) annotation(
    Line(points = {{-168, 40}, {-162, 40}, {-162, 38}, {-156, 38}, {-156, 38}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, initialScale = 0.1), graphics={Text(origin = {-12, 4}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 2 | Data Set 2.3
Load Phase a-n	Total Load - 300W      Load Bank 1 (78W), LED 1 (22W), Resistor 2 (200W)
Load Phase b-n	Total Load - 500W      Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Phase c-n	Total Load - 700W      Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)", fontSize = 9, horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-200, -200}, {200, 200}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2;