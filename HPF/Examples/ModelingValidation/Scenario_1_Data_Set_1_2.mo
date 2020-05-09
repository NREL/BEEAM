within HPF.Examples.ModelingValidation;
model Scenario_1_Data_Set_1_2
  SinglePhase.Components.Ground     ground annotation (
    Placement(visible = true, transformation(origin={-230, 2},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground2 annotation (
    Placement(visible = true, transformation(origin={-64,0},       extent={{-10,-10},
            {10,10}},                                                                               rotation = 0)));
  inner SystemDef     systemDef(fs=10e3, hrms={i for i in 1:2:20})     annotation (
    Placement(visible = true, transformation(origin={-224,108},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin={-230, 38},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_2(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={210, 54},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_1(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={92,98},         extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_3(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={94,50},        extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_1(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={126,94},       extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={126,66},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={128,20},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Laptop_3(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={128,46},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={240, 26},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground6 annotation (
    Placement(visible = true, transformation(origin={68,26},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhA annotation (
    Placement(visible = true, transformation(origin={-158, 48},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_3(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={94,-14},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     LED_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={240, 50},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={120,-44},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_1(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={94,142},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     LED_3(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={120,-18},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load     LED_1(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={126,138},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={126,112},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_4(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={208, -38},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_5(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={86,-110},        extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_2(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={210, 8},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_3(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={90,-62},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={240,4},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={240,-22},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={120,-92},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_3(pwr=1e-2) annotation (Placement(visible=true,
        transformation(
        origin={120,-66},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  DC.DC_Load     Laptop_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={242, -42},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={242, -68},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground17 annotation (
    Placement(visible = true, transformation(origin={180, -56},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={122,-140},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     dC_Load2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={122,-114},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground     ground19 annotation (
    Placement(visible = true, transformation(origin={60,-126},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhB annotation (
    Placement(visible = true, transformation(origin = {-126, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhC annotation (
    Placement(visible = true, transformation(origin={-160,28},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin={-44,56},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin={-34,28},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin={-8,42},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    annotation (Placement(transformation(extent={{-86,28},{-66,48}})));
equation
  connect(voltageSource.pinN,ground. pin) annotation (
    Line(points={{-230,25.25},{-230,13.25}},   color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p,Load_1. p) annotation (
    Line(points={{102,104},{126,104}},    color = {0, 0, 255}));
  connect(ground1.p,Load_1. n) annotation (
    Line(points={{126,76},{126,84}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n,Laptop_3. n) annotation (
    Line(points={{104,44},{118,44},{118,36},{128,36}},          color = {0, 0, 255}));
  connect(ground3.p,Laptop_3. n) annotation (
    Line(points={{128,30},{128,36}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p,Laptop_3. p) annotation (
    Line(points={{104,56},{128,56}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N,ground6. pin) annotation (
    Line(points={{84,44},{68,44},{68,37.25}},     color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p,LED_2. p) annotation (
    Line(points = {{220, 60}, {240, 60}}, color = {0, 0, 255}));
  connect(ground4.p,LED_2. n) annotation (
    Line(points = {{240, 36}, {240, 40}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p,LED_3. p) annotation (
    Line(points={{104,-8},{120,-8}},        color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n,LED_3. n) annotation (
    Line(points={{104,-20},{116,-20},{116,-28},{120,-28}},          color = {0, 0, 255}));
  connect(ground8.p,LED_3. n) annotation (
    Line(points={{120,-34},{120,-28}},      color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p,LED_1. p) annotation (
    Line(points={{104,148},{126,148}},      color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n,LED_1. n) annotation (
    Line(points={{104,136},{117.5,136},{117.5,128},{126,128}},          color = {0, 0, 255}));
  connect(ground10.p,LED_1. n) annotation (
    Line(points={{126,122},{126,128}},      color = {0, 0, 255}));
  connect(Load_2.n,Power_Supply_2. pin_n) annotation (
    Line(points={{240,-6},{240,2},{220,2}},        color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p,Load_2. p) annotation (
    Line(points={{220,14},{240,14}},      color = {0, 0, 255}));
  connect(Load_2.n,ground12. p) annotation (
    Line(points={{240,-6},{240,-12}},      color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p,Load_3. p)
    annotation (Line(points={{100,-56},{120,-56}}, color={0,0,255}));
  connect(ground13.p,Load_3. n)
    annotation (Line(points={{120,-82},{120,-76}}, color={0,0,255}));
  connect(LED_Driver_2.pin_n,LED_2. n) annotation (
    Line(points = {{220, 48}, {239, 48}, {239, 40}, {240, 40}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p,dC_Load2. p) annotation (
    Line(points={{96,-104},{122,-104}},       color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n,dC_Load2. n) annotation (
    Line(points={{96,-116},{106,-116},{106,-124},{122,-124}},           color = {0, 0, 255}));
  connect(ground18.p,dC_Load2. n) annotation (
    Line(points={{122,-130},{122,-124}},      color = {0, 0, 255}));
  connect(ground19.pin,Laptop_Charger_5. hPin_N) annotation (
    Line(points={{60,-114.75},{60,-116},{76,-116}},     color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N,ground17. pin) annotation (
    Line(points={{198,-44},{193.5,-44},{193.5,-44.75},{180,-44.75}},    color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p,Laptop_2. p) annotation (
    Line(points = {{218, -32}, {242, -32}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n,Laptop_2. n) annotation (
    Line(points = {{218, -44}, {238, -44}, {238, -52}, {242, -52}}, color = {0, 0, 255}));
  connect(ground16.p,Laptop_2. n) annotation (
    Line(points = {{242, -58}, {242, -52}}, color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n,Load_1. n) annotation (
    Line(points={{102,92},{111,92},{111,84},{126,84}},          color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n,Load_3. n) annotation (Line(points={{100,-68},{107,
          -68},{107,-76},{120,-76}}, color={0,0,255}));
  connect(LED_Driver_1.hPin_N,ground6. pin) annotation (
    Line(points={{84,136},{68,136},{68,37.25}},     color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N,ground6. pin) annotation (
    Line(points={{82,92},{68,92},{68,37.25}},     color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N,ground17. pin) annotation (
    Line(points={{200,48},{180,48},{180,-44.75}},     color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N,ground17. pin) annotation (
    Line(points={{200,2},{180,2},{180,-44.75}},     color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N,ground19. pin) annotation (
    Line(points={{84,-20},{60,-20},{60,-114.75}},      color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N,ground19. pin) annotation (
    Line(points={{80,-68},{60,-68},{60,-114.75}},     color = {117, 80, 123}));
  connect(voltageSource.pinP_phB,iMsr_prim_PhB. pin_p) annotation (
    Line(points={{-217.5,38},{-176,38},{-176,38},{-136,38}},
                                              color = {92, 53, 102}));
  connect(voltageSource.pinP_phA,iMsr_prim_PhA. pin_p) annotation (
    Line(points={{-217.5,48},{-186,48},{-186,48},{-168,48}},              color = {92, 53, 102}));
  connect(voltageSource.pinP_phC,iMsr_prim_PhC. pin_p) annotation (
    Line(points={{-217.5,28},{-170,28}},                                    color = {92, 53, 102}));
  connect(iMsr_prim_PhA.pin_n,deltaWye. pinPrim_A)
    annotation (Line(points={{-148,48},{-86,48}}, color={117,80,123}));
  connect(iMsr_prim_PhB.pin_n,deltaWye. pinPrim_B) annotation (Line(points={{-116,
          38},{-102,38},{-102,38},{-86,38}}, color={117,80,123}));
  connect(iMsr_prim_PhC.pin_n,deltaWye. pinPrim_C)
    annotation (Line(points={{-150,28},{-86,28}}, color={117,80,123}));
  connect(deltaWye.pinSec_A,iMsr_Sec_phA. pin_p) annotation (Line(points={{-66,50},
          {-60,50},{-60,56},{-54,56}}, color={92,53,102}));
  connect(deltaWye.pinSec_B,iMsr_Sec_phB. pin_p)
    annotation (Line(points={{-66,42},{-18,42}}, color={92,53,102}));
  connect(deltaWye.pinSec_C,iMsr_Sec_phC. pin_p) annotation (Line(points={{-66,34},
          {-58,34},{-58,28},{-44,28}}, color={92,53,102}));
  connect(LED_Driver_1.hPin_P,iMsr_Sec_phA. pin_n) annotation (Line(points={{84,
          148},{54,148},{54,56},{-34,56}}, color={92,53,102}));
  connect(Power_Supply_1.hPin_P,iMsr_Sec_phA. pin_n) annotation (Line(points={{82,
          104},{54,104},{54,56},{-34,56}}, color={92,53,102}));
  connect(Laptop_Charger_3.hPin_P,iMsr_Sec_phA. pin_n)
    annotation (Line(points={{84,56},{-34,56}}, color={92,53,102}));
  connect(iMsr_Sec_phB.pin_n,LED_Driver_2. hPin_P) annotation (Line(points={{2,42},
          {18,42},{18,14},{172,14},{172,60},{200,60}}, color={117,80,123}));
  connect(iMsr_Sec_phB.pin_n,Power_Supply_2. hPin_P) annotation (Line(points={{2,
          42},{18,42},{18,14},{200,14}}, color={117,80,123}));
  connect(iMsr_Sec_phB.pin_n,Laptop_Charger_4. hPin_P) annotation (Line(points={
          {2,42},{18,42},{18,14},{172,14},{172,-32},{198,-32}}, color={117,80,123}));
  connect(LED_Driver_3.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{84,
          -8},{8,-8},{8,28},{-24,28}}, color={92,53,102}));
  connect(Power_Supply_3.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{80,
          -56},{8,-56},{8,28},{-24,28}}, color={92,53,102}));
  connect(Laptop_Charger_5.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={
          {76,-104},{8,-104},{8,28},{-24,28}}, color={92,53,102}));
  connect(deltaWye.pinSec_N,ground2. pin) annotation (Line(points={{-66,26},{-64,
          26},{-64,11.25}}, color={117,80,123}));
  annotation (
    Diagram(coordinateSystem(extent={{-300,-220},{300,240}},      initialScale = 0.1), graphics={Text(origin = {-8, -26}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 1 | Data Set 1.2
Load Phase a-n	Total Load - 100W		Load Bank 1 (78W), LED 1 (22W)
Load Phase b-n	Total Load - 100W		Load Bank 2 (78W), LED 2 (22W)
Load Phase c-n	Total Load - 100W		Load Bank 3 (78W), LED 3 (22W)",
            horizontalAlignment =                                                        TextAlignment.Left)}),
    Icon(coordinateSystem(extent={{-300,-220},{300,240}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_1_Data_Set_1_2;
