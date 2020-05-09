within HPF.Examples.ModelingValidation;
model Scenario_2_Data_Set_2_3
  SinglePhase.Components.Ground     ground annotation (
    Placement(visible = true, transformation(origin={-230,-22},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground2 annotation (
    Placement(visible = true, transformation(origin={-64,-24},     extent={{-10,-10},
            {10,10}},                                                                               rotation = 0)));
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
    Placement(visible = true, transformation(origin={-230,14},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_2(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={210,30},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_1(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={92,74},         extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_3(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={94,26},        extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_1(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={126,70},       extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={126,42},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={128,-4},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Laptop_3(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={128,22},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={240,2},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground6 annotation (
    Placement(visible = true, transformation(origin={68,2},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhA annotation (
    Placement(visible = true, transformation(origin={-158,24},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_3(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={94,-38},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     LED_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={240,26},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={120,-68},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_1(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={94,118},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     LED_3(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={120,-42},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load     LED_1(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={126,114},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={126,88},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_4(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={208,-62},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_5(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={86,-134},        extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_2(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={210,-16},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_3(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={90,-86},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={240,-20},  extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={240,-46},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={120,-116},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_3(pwr=1e-2) annotation (Placement(visible=true,
        transformation(
        origin={120,-90},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  DC.DC_Load     Laptop_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={242,-66},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={242,-92},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground17 annotation (
    Placement(visible = true, transformation(origin={180,-80},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={122,-164},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     dC_Load2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={122,-138},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground     ground19 annotation (
    Placement(visible = true, transformation(origin={60,-150},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhB annotation (
    Placement(visible = true, transformation(origin={-126,14},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhC annotation (
    Placement(visible = true, transformation(origin={-160,4},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin={-44,32},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin={-34,4},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin={-8,18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.DeltaWye deltaWye(
    Rp=2.7672,
    Xp=1.1006,
    Rs=0.2576,
    Xs=0.5003,
    Rc=3.7626e+03,
    Xm=711.1091,
    fW=0.9,
    fEC=0.0670,
    fOSL=0.0330)
    annotation (Placement(transformation(extent={{-86,4},{-66,24}})));
equation
  connect(voltageSource.pinN,ground. pin) annotation (
    Line(points={{-230,1.25},{-230,-10.75}},   color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p,Load_1. p) annotation (
    Line(points={{102,80},{126,80}},      color = {0, 0, 255}));
  connect(ground1.p,Load_1. n) annotation (
    Line(points={{126,52},{126,60}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n,Laptop_3. n) annotation (
    Line(points={{104,20},{118,20},{118,12},{128,12}},          color = {0, 0, 255}));
  connect(ground3.p,Laptop_3. n) annotation (
    Line(points={{128,6},{128,12}},       color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p,Laptop_3. p) annotation (
    Line(points={{104,32},{128,32}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N,ground6. pin) annotation (
    Line(points={{84,20},{68,20},{68,13.25}},     color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p,LED_2. p) annotation (
    Line(points={{220,36},{240,36}},      color = {0, 0, 255}));
  connect(ground4.p,LED_2. n) annotation (
    Line(points={{240,12},{240,16}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p,LED_3. p) annotation (
    Line(points={{104,-32},{120,-32}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n,LED_3. n) annotation (
    Line(points={{104,-44},{116,-44},{116,-52},{120,-52}},          color = {0, 0, 255}));
  connect(ground8.p,LED_3. n) annotation (
    Line(points={{120,-58},{120,-52}},      color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p,LED_1. p) annotation (
    Line(points={{104,124},{126,124}},      color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n,LED_1. n) annotation (
    Line(points={{104,112},{117.5,112},{117.5,104},{126,104}},          color = {0, 0, 255}));
  connect(ground10.p,LED_1. n) annotation (
    Line(points={{126,98},{126,104}},       color = {0, 0, 255}));
  connect(Load_2.n,Power_Supply_2. pin_n) annotation (
    Line(points={{240,-30},{240,-22},{220,-22}},   color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p,Load_2. p) annotation (
    Line(points={{220,-10},{240,-10}},    color = {0, 0, 255}));
  connect(Load_2.n,ground12. p) annotation (
    Line(points={{240,-30},{240,-36}},     color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p,Load_3. p)
    annotation (Line(points={{100,-80},{120,-80}}, color={0,0,255}));
  connect(ground13.p,Load_3. n)
    annotation (Line(points={{120,-106},{120,-100}},
                                                   color={0,0,255}));
  connect(LED_Driver_2.pin_n,LED_2. n) annotation (
    Line(points={{220,24},{239,24},{239,16},{240,16}},          color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p,dC_Load2. p) annotation (
    Line(points={{96,-128},{122,-128}},       color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n,dC_Load2. n) annotation (
    Line(points={{96,-140},{106,-140},{106,-148},{122,-148}},           color = {0, 0, 255}));
  connect(ground18.p,dC_Load2. n) annotation (
    Line(points={{122,-154},{122,-148}},      color = {0, 0, 255}));
  connect(ground19.pin,Laptop_Charger_5. hPin_N) annotation (
    Line(points={{60,-138.75},{60,-140},{76,-140}},     color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N,ground17. pin) annotation (
    Line(points={{198,-68},{193.5,-68},{193.5,-68.75},{180,-68.75}},    color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p,Laptop_2. p) annotation (
    Line(points={{218,-56},{242,-56}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n,Laptop_2. n) annotation (
    Line(points={{218,-68},{238,-68},{238,-76},{242,-76}},          color = {0, 0, 255}));
  connect(ground16.p,Laptop_2. n) annotation (
    Line(points={{242,-82},{242,-76}},      color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n,Load_1. n) annotation (
    Line(points={{102,68},{111,68},{111,60},{126,60}},          color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n,Load_3. n) annotation (Line(points={{100,-92},{
          107,-92},{107,-100},{120,-100}},
                                     color={0,0,255}));
  connect(LED_Driver_1.hPin_N,ground6. pin) annotation (
    Line(points={{84,112},{68,112},{68,13.25}},     color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N,ground6. pin) annotation (
    Line(points={{82,68},{68,68},{68,13.25}},     color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N,ground17. pin) annotation (
    Line(points={{200,24},{180,24},{180,-68.75}},     color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N,ground17. pin) annotation (
    Line(points={{200,-22},{180,-22},{180,-68.75}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N,ground19. pin) annotation (
    Line(points={{84,-44},{60,-44},{60,-138.75}},      color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N,ground19. pin) annotation (
    Line(points={{80,-92},{60,-92},{60,-138.75}},     color = {117, 80, 123}));
  connect(voltageSource.pinP_phB,iMsr_prim_PhB. pin_p) annotation (
    Line(points={{-217.5,14},{-136,14}},      color = {92, 53, 102}));
  connect(voltageSource.pinP_phA,iMsr_prim_PhA. pin_p) annotation (
    Line(points={{-217.5,24},{-168,24}},                                  color = {92, 53, 102}));
  connect(voltageSource.pinP_phC,iMsr_prim_PhC. pin_p) annotation (
    Line(points={{-217.5,4},{-170,4}},                                      color = {92, 53, 102}));
  connect(iMsr_prim_PhA.pin_n,deltaWye. pinPrim_A)
    annotation (Line(points={{-148,24},{-86,24}}, color={117,80,123}));
  connect(iMsr_prim_PhB.pin_n,deltaWye. pinPrim_B) annotation (Line(points={{-116,14},
          {-86,14}},                         color={117,80,123}));
  connect(iMsr_prim_PhC.pin_n,deltaWye. pinPrim_C)
    annotation (Line(points={{-150,4},{-86,4}},   color={117,80,123}));
  connect(deltaWye.pinSec_A,iMsr_Sec_phA. pin_p) annotation (Line(points={{-66,26},
          {-60,26},{-60,32},{-54,32}}, color={92,53,102}));
  connect(deltaWye.pinSec_B,iMsr_Sec_phB. pin_p)
    annotation (Line(points={{-66,18},{-18,18}}, color={92,53,102}));
  connect(deltaWye.pinSec_C,iMsr_Sec_phC. pin_p) annotation (Line(points={{-66,10},
          {-58,10},{-58,4},{-44,4}},   color={92,53,102}));
  connect(LED_Driver_1.hPin_P,iMsr_Sec_phA. pin_n) annotation (Line(points={{84,124},
          {54,124},{54,32},{-34,32}},      color={92,53,102}));
  connect(Power_Supply_1.hPin_P,iMsr_Sec_phA. pin_n) annotation (Line(points={{82,80},
          {54,80},{54,32},{-34,32}},       color={92,53,102}));
  connect(Laptop_Charger_3.hPin_P,iMsr_Sec_phA. pin_n)
    annotation (Line(points={{84,32},{-34,32}}, color={92,53,102}));
  connect(iMsr_Sec_phB.pin_n,LED_Driver_2. hPin_P) annotation (Line(points={{2,18},{
          18,18},{18,-10},{172,-10},{172,36},{200,36}},color={117,80,123}));
  connect(iMsr_Sec_phB.pin_n,Power_Supply_2. hPin_P) annotation (Line(points={{2,18},{
          18,18},{18,-10},{200,-10}},    color={117,80,123}));
  connect(iMsr_Sec_phB.pin_n,Laptop_Charger_4. hPin_P) annotation (Line(points={{2,18},{
          18,18},{18,-10},{172,-10},{172,-56},{198,-56}},       color={117,80,123}));
  connect(LED_Driver_3.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{84,-32},
          {8,-32},{8,4},{-24,4}},      color={92,53,102}));
  connect(Power_Supply_3.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{80,-80},
          {8,-80},{8,4},{-24,4}},        color={92,53,102}));
  connect(Laptop_Charger_5.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{76,-128},
          {8,-128},{8,4},{-24,4}},             color={92,53,102}));
  connect(deltaWye.pinSec_N,ground2. pin) annotation (Line(points={{-66,2},{-64,
          2},{-64,-12.75}}, color={117,80,123}));
  annotation (
    Diagram(coordinateSystem(extent={{-280,-220},{260,240}},      initialScale = 0.1), graphics={Text(origin = {-28, 0}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {208, 154}}, textString = "Scenario 2 | Data Set 2.3
LLoad Phase a-n	Total Load - 300W		Load Bank 1 (78W), LED 1 (22W), Resistor 2 (200W)
Load Phase b-n	Total Load - 500W		Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Phase c-n	Total Load - 700W		Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)",
            horizontalAlignment =                                                                           TextAlignment.Left)}),
    Icon(coordinateSystem(extent={{-280,-220},{260,240}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_INIT,LOG_INIT_V,LOG_RES_INIT,LOG_SIMULATION,LOG_SOTI,LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton", iim = "none"),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ");
end Scenario_2_Data_Set_2_3;
