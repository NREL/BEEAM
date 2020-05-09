within HPF.Examples.ModelingValidation;
model Scenario_2_Data_Set_2_2
  SinglePhase.Components.Ground     ground annotation (
    Placement(visible = true, transformation(origin={-230,-24},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground2 annotation (
    Placement(visible = true, transformation(origin={-64,-26},     extent={{-10,-10},
            {10,10}},                                                                               rotation = 0)));
  inner SystemDef     systemDef(fs=10e3, hrms={i for i in 1:2:20})     annotation (
    Placement(visible = true, transformation(origin={-224,82},     extent = {{-14, -14}, {14, 10}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin={-230,12},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_2(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={210,28},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_1(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={92,72},         extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_3(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={94,24},        extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_1(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={126,68},       extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={126,40},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={128,-6},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Laptop_3(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={128,20},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={240,0},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground6 annotation (
    Placement(visible = true, transformation(origin={68,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhA annotation (
    Placement(visible = true, transformation(origin={-158,22},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_3(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={94,-40},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     LED_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={240,24},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={120,-70},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_1(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={94,116},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     LED_3(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={120,-44},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load     LED_1(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={126,112},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={126,86},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_4(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={208,-64},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_5(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={86,-136},        extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_2(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={210,-18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_3(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={90,-88},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={240,-22},  extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={240,-48},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={120,-118},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_3(pwr=1e-2) annotation (Placement(visible=true,
        transformation(
        origin={120,-92},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  DC.DC_Load     Laptop_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={242,-68},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={242,-94},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground17 annotation (
    Placement(visible = true, transformation(origin={180,-82},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={122,-166},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     dC_Load2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={122,-140},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground     ground19 annotation (
    Placement(visible = true, transformation(origin={60,-152},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhB annotation (
    Placement(visible = true, transformation(origin={-126,12},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhC annotation (
    Placement(visible = true, transformation(origin={-160,2},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin={-44,30},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin={-34,2},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin={-8,16},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    annotation (Placement(transformation(extent={{-86,2},{-66,22}})));
equation
  connect(voltageSource.pinN,ground. pin) annotation (
    Line(points={{-230,-0.75},{-230,-12.75}},  color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p,Load_1. p) annotation (
    Line(points={{102,78},{126,78}},      color = {0, 0, 255}));
  connect(ground1.p,Load_1. n) annotation (
    Line(points={{126,50},{126,58}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n,Laptop_3. n) annotation (
    Line(points={{104,18},{118,18},{118,10},{128,10}},          color = {0, 0, 255}));
  connect(ground3.p,Laptop_3. n) annotation (
    Line(points={{128,4},{128,10}},       color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p,Laptop_3. p) annotation (
    Line(points={{104,30},{128,30}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N,ground6. pin) annotation (
    Line(points={{84,18},{68,18},{68,11.25}},     color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p,LED_2. p) annotation (
    Line(points={{220,34},{240,34}},      color = {0, 0, 255}));
  connect(ground4.p,LED_2. n) annotation (
    Line(points={{240,10},{240,14}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p,LED_3. p) annotation (
    Line(points={{104,-34},{120,-34}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n,LED_3. n) annotation (
    Line(points={{104,-46},{116,-46},{116,-54},{120,-54}},          color = {0, 0, 255}));
  connect(ground8.p,LED_3. n) annotation (
    Line(points={{120,-60},{120,-54}},      color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p,LED_1. p) annotation (
    Line(points={{104,122},{126,122}},      color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n,LED_1. n) annotation (
    Line(points={{104,110},{117.5,110},{117.5,102},{126,102}},          color = {0, 0, 255}));
  connect(ground10.p,LED_1. n) annotation (
    Line(points={{126,96},{126,102}},       color = {0, 0, 255}));
  connect(Load_2.n,Power_Supply_2. pin_n) annotation (
    Line(points={{240,-32},{240,-24},{220,-24}},   color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p,Load_2. p) annotation (
    Line(points={{220,-12},{240,-12}},    color = {0, 0, 255}));
  connect(Load_2.n,ground12. p) annotation (
    Line(points={{240,-32},{240,-38}},     color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p,Load_3. p)
    annotation (Line(points={{100,-82},{120,-82}}, color={0,0,255}));
  connect(ground13.p,Load_3. n)
    annotation (Line(points={{120,-108},{120,-102}},
                                                   color={0,0,255}));
  connect(LED_Driver_2.pin_n,LED_2. n) annotation (
    Line(points={{220,22},{239,22},{239,14},{240,14}},          color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p,dC_Load2. p) annotation (
    Line(points={{96,-130},{122,-130}},       color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n,dC_Load2. n) annotation (
    Line(points={{96,-142},{106,-142},{106,-150},{122,-150}},           color = {0, 0, 255}));
  connect(ground18.p,dC_Load2. n) annotation (
    Line(points={{122,-156},{122,-150}},      color = {0, 0, 255}));
  connect(ground19.pin,Laptop_Charger_5. hPin_N) annotation (
    Line(points={{60,-140.75},{60,-142},{76,-142}},     color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N,ground17. pin) annotation (
    Line(points={{198,-70},{193.5,-70},{193.5,-70.75},{180,-70.75}},    color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p,Laptop_2. p) annotation (
    Line(points={{218,-58},{242,-58}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n,Laptop_2. n) annotation (
    Line(points={{218,-70},{238,-70},{238,-78},{242,-78}},          color = {0, 0, 255}));
  connect(ground16.p,Laptop_2. n) annotation (
    Line(points={{242,-84},{242,-78}},      color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n,Load_1. n) annotation (
    Line(points={{102,66},{111,66},{111,58},{126,58}},          color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n,Load_3. n) annotation (Line(points={{100,-94},{
          107,-94},{107,-102},{120,-102}},
                                     color={0,0,255}));
  connect(LED_Driver_1.hPin_N,ground6. pin) annotation (
    Line(points={{84,110},{68,110},{68,11.25}},     color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N,ground6. pin) annotation (
    Line(points={{82,66},{68,66},{68,11.25}},     color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N,ground17. pin) annotation (
    Line(points={{200,22},{180,22},{180,-70.75}},     color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N,ground17. pin) annotation (
    Line(points={{200,-24},{180,-24},{180,-70.75}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N,ground19. pin) annotation (
    Line(points={{84,-46},{60,-46},{60,-140.75}},      color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N,ground19. pin) annotation (
    Line(points={{80,-94},{60,-94},{60,-140.75}},     color = {117, 80, 123}));
  connect(voltageSource.pinP_phB,iMsr_prim_PhB. pin_p) annotation (
    Line(points={{-217.5,12},{-136,12}},      color = {92, 53, 102}));
  connect(voltageSource.pinP_phA,iMsr_prim_PhA. pin_p) annotation (
    Line(points={{-217.5,22},{-168,22}},                                  color = {92, 53, 102}));
  connect(voltageSource.pinP_phC,iMsr_prim_PhC. pin_p) annotation (
    Line(points={{-217.5,2},{-170,2}},                                      color = {92, 53, 102}));
  connect(iMsr_prim_PhA.pin_n,deltaWye. pinPrim_A)
    annotation (Line(points={{-148,22},{-86,22}}, color={117,80,123}));
  connect(iMsr_prim_PhB.pin_n,deltaWye. pinPrim_B) annotation (Line(points={{-116,12},
          {-86,12}},                         color={117,80,123}));
  connect(iMsr_prim_PhC.pin_n,deltaWye. pinPrim_C)
    annotation (Line(points={{-150,2},{-86,2}},   color={117,80,123}));
  connect(deltaWye.pinSec_A,iMsr_Sec_phA. pin_p) annotation (Line(points={{-66,24},
          {-60,24},{-60,30},{-54,30}}, color={92,53,102}));
  connect(deltaWye.pinSec_B,iMsr_Sec_phB. pin_p)
    annotation (Line(points={{-66,16},{-18,16}}, color={92,53,102}));
  connect(deltaWye.pinSec_C,iMsr_Sec_phC. pin_p) annotation (Line(points={{-66,8},
          {-58,8},{-58,2},{-44,2}},    color={92,53,102}));
  connect(LED_Driver_1.hPin_P,iMsr_Sec_phA. pin_n) annotation (Line(points={{84,122},
          {54,122},{54,30},{-34,30}},      color={92,53,102}));
  connect(Power_Supply_1.hPin_P,iMsr_Sec_phA. pin_n) annotation (Line(points={{82,78},
          {54,78},{54,30},{-34,30}},       color={92,53,102}));
  connect(Laptop_Charger_3.hPin_P,iMsr_Sec_phA. pin_n)
    annotation (Line(points={{84,30},{-34,30}}, color={92,53,102}));
  connect(iMsr_Sec_phB.pin_n,LED_Driver_2. hPin_P) annotation (Line(points={{2,16},{
          18,16},{18,-12},{172,-12},{172,34},{200,34}},color={117,80,123}));
  connect(iMsr_Sec_phB.pin_n,Power_Supply_2. hPin_P) annotation (Line(points={{2,16},{
          18,16},{18,-12},{200,-12}},    color={117,80,123}));
  connect(iMsr_Sec_phB.pin_n,Laptop_Charger_4. hPin_P) annotation (Line(points={{2,16},{
          18,16},{18,-12},{172,-12},{172,-58},{198,-58}},       color={117,80,123}));
  connect(LED_Driver_3.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{84,-34},
          {8,-34},{8,2},{-24,2}},      color={92,53,102}));
  connect(Power_Supply_3.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{80,-82},
          {8,-82},{8,2},{-24,2}},        color={92,53,102}));
  connect(Laptop_Charger_5.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{76,-130},
          {8,-130},{8,2},{-24,2}},             color={92,53,102}));
  connect(deltaWye.pinSec_N,ground2. pin) annotation (Line(points={{-66,0},{-64,
          0},{-64,-14.75}}, color={117,80,123}));
  annotation (
    Diagram(coordinateSystem(extent={{-260,-220},{260,240}},      initialScale = 0.1), graphics={Text(origin = {-10, -32}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 2 | Data Set 2.2
Load Phase a-n    Total Load - 700W     Load Bank 1 (78W), LED 1 (22W), Resistor 4 (600W)
Load Phase b-n    Total Load - 100W     Load Bank 2 (78W), LED 2 (22W)
Load Phase c-n    Total Load - 700W     Load Bank 3 (78W), LED 3 (22W), Resistor 4 (600W)", fontSize = 9,
            horizontalAlignment =                                                                                               TextAlignment.Left)}),
    Icon(coordinateSystem(extent={{-260,-220},{260,240}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2_Data_Set_2_2;
