within HPF.Examples.ModelingValidation;
model Scenario_2_Data_Set_2_3
  SinglePhase.Components.Ground     ground annotation (
    Placement(visible = true, transformation(origin={-194,-22},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef     systemDef(fs=10e3, hrms={i for i in 1:2:20})     annotation (
    Placement(visible = true, transformation(origin={-224,84},     extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  Sources.ThreePhase.VotlageSource     voltageSource(
    vArg_phA={0.52196,5.0309,3.137,5.1211,0.88185,0.5405,2.7381,3.3571,3.1032,
        1.0556,4.7534,0.08957,4.2676,4.1244,4.4068},
    vArg_phB={4.7098,2.6393,0.15983,3.0248,0.54992,2.8356,0.30425,1.6224,5.1955,
        4.6578,1.421,1.561,2.3545,1.471,0.6687},
    vArg_phC={2.616,0.41259,4.8314,0.56289,3.7924,4.8133,4.8348,-0.2768,0.88781,
        2.6372,4.1405,4.1314,0.31627,0.0998,2.1076},
    vMag_phA={281.6099,0.52895,0.47049,0.73987,0.12572,0.73742,0.42769,0.058304,
        0.29207,0.058748,0.015748,0.02911,0.017013,0.0086381,0.017564},
    vMag_phB={281.5887,0.66547,0.46821,1.1624,0.27892,0.72691,0.37598,0.030611,
        0.254,0.065578,0.021447,0.041925,0.013833,0.0068935,0.013253},
    vMag_phC={281.39,0.46521,0.075759,1.0168,0.39967,0.60233,0.28322,0.061309,
        0.27537,0.028665,0.0058585,0.053376,0.017543,0.0048111,0.010129})                                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={-194,14},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground2 annotation (
    Placement(visible = true, transformation(origin={-116,-24},    extent={{-10,-10},
            {10,10}},                                                                               rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y deltaWye(Rc = 15117.5, Rp = 8.333, Rs = 1.4404E-01, Xm = 2.3311e+03, Xp = 3.3002, Xs = 0.6197)
    annotation (Placement(transformation(extent={{-138,4},{-118,24}})));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_2(V_Rect=24,
      modelFileName="HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat",
    nomP=28)                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={144,36},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl     Power_Supply_1(P_DCmin = 8, P_stby = 23.34,V_Rect=48,
      modelFileName="HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat",
    nomP=200)                                                                                                                                                                            annotation (
    Placement(visible = true, transformation(origin={40,66},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_3(P_DCmin = 2, P_stby = 0.44,V_Rect=
        18.5, modelFileName="HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat",
    nomP=72)                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={42,18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_1(pwr=231.3)   annotation (
    Placement(visible = true, transformation(origin={74,62},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={74,34},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={76,-12},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Laptop_3(pwr=72.66)   annotation (
    Placement(visible = true, transformation(origin={76,14},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={174,8},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground6 annotation (
    Placement(visible = true, transformation(origin={16,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_3(V_Rect=24,
      modelFileName="HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat",
    nomP=28)                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={44,-42},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     LED_2(pwr=28.3)   annotation (
    Placement(visible = true, transformation(origin={174,32},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={70,-72},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_1(V_Rect=24,
      modelFileName="HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat",
    nomP=28)                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={42,110},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     LED_3(pwr=26.981409)   annotation (
    Placement(visible = true, transformation(origin={70,-46},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load     LED_1(pwr=27.74)   annotation (
    Placement(visible = true, transformation(origin={74,106},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={74,80},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_4(P_DCmin = 2, P_stby = 0.33,V_Rect=
        18.5, modelFileName="HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat",
    nomP=72)                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={142,-56},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_5(P_DCmin = 2, P_stby = 0.27,V_Rect=
        18.5, modelFileName="HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat",
    nomP=72)                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={36,-138},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl     Power_Supply_2(P_DCmin = 10, P_stby = 4.89,V_Rect=48,
      modelFileName="HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2_3D.mat",
    nomP=400)                                                                                                                                                                            annotation (
    Placement(visible = true, transformation(origin={144,-10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl     Power_Supply_3(P_DCmin = 10, P_stby = 17.7,V_Rect=48,
      modelFileName="HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3_3D.mat",
    nomP=600)                                                                                                                                                                            annotation (
    Placement(visible = true, transformation(origin={40,-90},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_2(pwr=404.62)   annotation (
    Placement(visible = true, transformation(origin={176,-14},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={176,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={70,-120},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     dC_Load(pwr=559.89)   annotation (
    Placement(visible = true, transformation(origin={70,-94},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load     dC_Load1(pwr=70.49)   annotation (
    Placement(visible = true, transformation(origin={176,-60},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={176,-86},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground17 annotation (
    Placement(visible = true, transformation(origin={114,-74},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={72,-168},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     dC_Load2(pwr=71.32)   annotation (
    Placement(visible = true, transformation(origin={72,-142},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground     ground19 annotation (
    Placement(visible = true, transformation(origin={10,-154},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN,ground. pin) annotation (
    Line(points={{-194,1.25},{-194,-10.75}},   color = {117, 80, 123}));
  connect(deltaWye.pinSec_N,ground2. pin) annotation (
    Line(points={{-118,2},{-116,2},{-116,-12.75}},      color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, deltaWye.pinPrim_A)
    annotation (Line(points={{-181.5,24},{-138,24}}, color={92,53,102}));
  connect(voltageSource.pinP_phB, deltaWye.pinPrim_B)
    annotation (Line(points={{-181.5,14},{-138,14}}, color={92,53,102}));
  connect(voltageSource.pinP_phC, deltaWye.pinPrim_C)
    annotation (Line(points={{-181.5,4},{-138,4}}, color={92,53,102}));
  connect(Power_Supply_1.pin_p,Load_1. p) annotation (
    Line(points={{50,72},{74,72}},       color = {0, 0, 255}));
  connect(ground1.p,Load_1. n) annotation (
    Line(points={{74,44},{74,52}},        color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n,Laptop_3. n) annotation (
    Line(points={{52,12},{66,12},{66,4},{76,4}},                   color = {0, 0, 255}));
  connect(ground3.p,Laptop_3. n) annotation (
    Line(points={{76,-2},{76,4}},           color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p,Laptop_3. p) annotation (
    Line(points={{52,24},{76,24}},     color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N,ground6. pin) annotation (
    Line(points={{32,12},{16,12},{16,11.25}},        color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p,LED_2. p) annotation (
    Line(points={{154,42},{174,42}},      color = {0, 0, 255}));
  connect(ground4.p,LED_2. n) annotation (
    Line(points={{174,18},{174,22}},     color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p,LED_3. p) annotation (
    Line(points={{54,-36},{70,-36}},       color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n,LED_3. n) annotation (
    Line(points={{54,-48},{66,-48},{66,-52},{70,-52},{70,-56}},                color = {0, 0, 255}));
  connect(ground8.p,LED_3. n) annotation (
    Line(points={{70,-62},{70,-56}},        color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p,LED_1. p) annotation (
    Line(points={{52,116},{74,116}},     color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n,LED_1. n) annotation (
    Line(points={{52,104},{65.5,104},{65.5,96},{74,96}},           color = {0, 0, 255}));
  connect(ground10.p,LED_1. n) annotation (
    Line(points={{74,90},{74,96}},        color = {0, 0, 255}));
  connect(Load_2.n,Power_Supply_2. pin_n) annotation (
    Line(points={{176,-24},{176,-20},{168,-20},{168,-16},{154,-16}},            color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p,Load_2. p) annotation (
    Line(points={{154,-4},{176,-4}},        color = {0, 0, 255}));
  connect(Load_2.n,ground12. p) annotation (
    Line(points={{176,-24},{176,-30}},      color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p,dC_Load. p) annotation (
    Line(points={{50,-84},{70,-84}},         color = {0, 0, 255}));
  connect(ground13.p,dC_Load. n) annotation (
    Line(points={{70,-110},{70,-104}},        color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n,LED_2. n) annotation (
    Line(points={{154,30},{172,30},{172,26},{174,26},{174,22}},       color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p,dC_Load2. p) annotation (
    Line(points={{46,-132},{72,-132}},       color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n,dC_Load2. n) annotation (
    Line(points={{46,-144},{62,-144},{62,-152},{72,-152}},             color = {0, 0, 255}));
  connect(ground18.p,dC_Load2. n) annotation (
    Line(points={{72,-158},{72,-152}},        color = {0, 0, 255}));
  connect(ground19.pin,Laptop_Charger_5. hPin_N) annotation (
    Line(points={{10,-142.75},{10,-144},{26,-144}},     color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N,ground17. pin) annotation (
    Line(points={{132,-62},{131,-62},{131,-62.75},{114,-62.75}},    color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p,dC_Load1. p) annotation (
    Line(points={{152,-50},{176,-50}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n,dC_Load1. n) annotation (
    Line(points={{152,-62},{172,-62},{172,-66},{176,-66},{176,-70}},            color = {0, 0, 255}));
  connect(ground16.p,dC_Load1. n) annotation (
    Line(points={{176,-76},{176,-70}},      color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n,Load_1. n) annotation (
    Line(points={{50,60},{70,60},{70,56},{74,56},{74,52}},                color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n,dC_Load. n) annotation (
    Line(points={{50,-96},{60,-96},{60,-104},{70,-104}},             color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N,ground6. pin) annotation (
    Line(points={{32,104},{16,104},{16,11.25}},    color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N,ground6. pin) annotation (
    Line(points={{30,60},{16,60},{16,11.25}},      color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N,ground17. pin) annotation (
    Line(points={{134,30},{114,30},{114,-62.75}},   color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N,ground17. pin) annotation (
    Line(points={{134,-16},{114,-16},{114,-62.75}},     color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N,ground19. pin) annotation (
    Line(points={{34,-48},{10,-48},{10,-142.75}},     color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N,ground19. pin) annotation (
    Line(points={{30,-96},{10,-96},{10,-142.75}},       color = {117, 80, 123}));
  connect(deltaWye.pinSec_A, LED_Driver_1.hPin_P) annotation (Line(points={{-118,
          26},{-4,26},{-4,116},{32,116}}, color={92,53,102}));
  connect(Power_Supply_1.hPin_P, LED_Driver_1.hPin_P) annotation (Line(points={{
          30,72},{-4,72},{-4,116},{32,116}}, color={92,53,102}));
  connect(Laptop_Charger_3.hPin_P, LED_Driver_1.hPin_P) annotation (Line(points=
         {{32,24},{16,24},{16,26},{-4,26},{-4,116},{32,116}}, color={92,53,102}));
  connect(deltaWye.pinSec_B, LED_Driver_2.hPin_P) annotation (Line(points={{-118,
          18},{-32,18},{-32,-12},{100,-12},{100,42},{134,42}}, color={92,53,102}));
  connect(Power_Supply_2.hPin_P, LED_Driver_2.hPin_P) annotation (Line(points={{
          134,-4},{100,-4},{100,42},{134,42}}, color={92,53,102}));
  connect(Laptop_Charger_4.hPin_P, LED_Driver_2.hPin_P) annotation (Line(points=
         {{132,-50},{100,-50},{100,42},{134,42}}, color={92,53,102}));
  connect(deltaWye.pinSec_C, LED_Driver_3.hPin_P) annotation (Line(points={{-118,
          10},{-100,10},{-100,-20},{34,-20},{34,-36}}, color={92,53,102}));
  connect(Power_Supply_3.hPin_P, LED_Driver_3.hPin_P) annotation (Line(points={{
          30,-84},{-28,-84},{-28,-20},{34,-20},{34,-36}}, color={92,53,102}));
  connect(Laptop_Charger_5.hPin_P, LED_Driver_3.hPin_P) annotation (Line(points=
         {{26,-132},{-28,-132},{-28,-20},{34,-20},{34,-36}}, color={92,53,102}));
  annotation (
    Diagram(coordinateSystem(extent={{-280,-220},{260,240}},      initialScale = 0.1), graphics={Text(origin = {-28, 0}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {208, 154}}, textString = "Scenario 2 | Data Set 2.3
LLoad Phase a-n        Total Load - 300W                Load Bank 1 (78W), LED 1 (22W), Resistor 2 (200W)
Load Phase b-n        Total Load - 500W                Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Phase c-n        Total Load - 700W                Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)",
            horizontalAlignment =                                                                           TextAlignment.Left)}),
    Icon(coordinateSystem(extent={{-280,-220},{260,240}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_INIT_V,LOG_RES_INIT,LOG_SIMULATION,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton", iim = "none"),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ");
end Scenario_2_Data_Set_2_3;
