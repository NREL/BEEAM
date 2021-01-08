within HPF.Examples.ModelingValidation;
model Scenario_4_Data_Set_4_2
  SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-148,-38},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef     systemDef(fs=10e3, hrms={i for i in 1:2:20})     annotation (
    Placement(visible = true, transformation(origin={-146,68},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  Sources.ThreePhase.VotlageSource voltageSource(
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
    Placement(visible = true, transformation(origin={-148,-4},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-82,-42},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y     deltaWye(
    Rc=15117.5,
    Rp=8.333,
    Rs=1.4404E-01,
    Xm=2.3311e+03,
    Xp=3.3002,
    Xs=0.6197)                                                                                                                             annotation (
    Placement(visible = true, transformation(extent={{-106,-14},{-86,6}},      rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_2(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_2.mat",

    nomP=28)                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={162,-22},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_3(
    P_DCmin=2,
    P_stby=0.44,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_3.mat",
    nomP=72)                                                                                                                                                                                           annotation (
    Placement(visible = true, transformation(origin={62,6},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={96,-24},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr=72.741145)   annotation (
    Placement(visible = true, transformation(origin={96,2},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={190,-50},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin={36,-12},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_3(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_3.mat",

    nomP=28)                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={64,-94},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr=28.071211)   annotation (
    Placement(visible = true, transformation(origin={190,-26},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={90,-124},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_1(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_1.mat",

    nomP=28)                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={64,50},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr=27.069063)   annotation (
    Placement(visible = true, transformation(origin={90,-98},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load LED_1(pwr=27.721808)   annotation (
    Placement(visible = true, transformation(origin={96,46},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={96,20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_4(
    P_DCmin=2,
    P_stby=0.33,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_4.mat",
    nomP=72)                                                                                                                                                                                           annotation (
    Placement(visible = true, transformation(origin={162,-68},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_5(
    P_DCmin=2,
    P_stby=0.27,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_5.mat",
    nomP=72)                                                                                                                                                                                           annotation (
    Placement(visible = true, transformation(origin={56,-142},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_4(pwr=70.519849)   annotation (
    Placement(visible = true, transformation(origin={196,-72},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={196,-98},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={134,-86},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={92,-172},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Latop_5(pwr=71.537540) annotation (Placement(visible=true,
        transformation(
        origin={92,-146},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={30,-170},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Resistor Heater_1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={36,72})));
  SinglePhase.Components.Resistor Heater_2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={134,6})));
  SinglePhase.Components.Resistor Heater_3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-72})));
equation
  connect(voltageSource.pinN,ground. pin) annotation (
    Line(points={{-148,-16.75},{-148,-26.75}},     color = {117, 80, 123}));
  connect(deltaWye.pinSec_N,ground2. pin) annotation (
    Line(points={{-86,-16},{-82,-16},{-82,-30.75}},      color = {117, 80, 123}));
  connect(voltageSource.pinP_phA,deltaWye. pinPrim_A) annotation (
    Line(points={{-135.5,6},{-106,6}},        color = {92, 53, 102}));
  connect(voltageSource.pinP_phB,deltaWye. pinPrim_B) annotation (
    Line(points={{-135.5,-4},{-106,-4}},    color = {92, 53, 102}));
  connect(voltageSource.pinP_phC,deltaWye. pinPrim_C) annotation (
    Line(points={{-135.5,-14},{-106,-14}},    color = {92, 53, 102}));
  connect(Laptop_Charger_3.pin_n,Laptop_3. n) annotation (
    Line(points={{72,0},{86,0},{86,-8},{96,-8}},        color = {0, 0, 255}));
  connect(ground3.p,Laptop_3. n) annotation (
    Line(points={{96,-14},{96,-8}},    color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p,Laptop_3. p) annotation (
    Line(points={{72,12},{96,12}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N,ground6. pin) annotation (
    Line(points={{52,0},{36,0},{36,-0.75}},       color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p,LED_2. p) annotation (
    Line(points={{172,-16},{190,-16}},    color = {0, 0, 255}));
  connect(ground4.p,LED_2. n) annotation (
    Line(points={{190,-40},{190,-36}},    color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p,LED_3. p) annotation (
    Line(points={{74,-88},{90,-88}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n,LED_3. n) annotation (
    Line(points={{74,-100},{86,-100},{86,-104},{90,-104},{90,-108}},       color = {0, 0, 255}));
  connect(ground8.p,LED_3. n) annotation (
    Line(points={{90,-114},{90,-108}},    color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p,LED_1. p) annotation (
    Line(points={{74,56},{96,56}},        color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n,LED_1. n) annotation (
    Line(points={{74,44},{87.5,44},{87.5,36},{96,36}},            color = {0, 0, 255}));
  connect(ground10.p,LED_1. n) annotation (
    Line(points={{96,30},{96,36}},      color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n,LED_2. n) annotation (
    Line(points={{172,-28},{176,-28},{176,-36},{190,-36}},                 color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, Latop_5.p)
    annotation (Line(points={{66,-136},{92,-136}}, color={0,0,255}));
  connect(Laptop_Charger_5.pin_n, Latop_5.n) annotation (Line(points={{66,-148},
          {82,-148},{82,-156},{92,-156}}, color={0,0,255}));
  connect(ground18.p, Latop_5.n)
    annotation (Line(points={{92,-162},{92,-156}}, color={0,0,255}));
  connect(ground19.pin,Laptop_Charger_5. hPin_N) annotation (
    Line(points={{30,-158.75},{30,-148},{46,-148}},        color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N,ground17. pin) annotation (
    Line(points={{152,-74},{151,-74},{151,-74.75},{134,-74.75}},          color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p,Laptop_4. p) annotation (
    Line(points={{172,-62},{196,-62}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n,Laptop_4. n) annotation (
    Line(points={{172,-74},{192,-74},{192,-78},{196,-78},{196,-82}},            color = {0, 0, 255}));
  connect(ground16.p,Laptop_4. n) annotation (
    Line(points={{196,-88},{196,-82}},      color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N,ground6. pin) annotation (
    Line(points={{54,44},{36,44},{36,-0.75}},         color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N,ground17. pin) annotation (
    Line(points={{152,-28},{134,-28},{134,-74.75}},      color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N,ground19. pin) annotation (
    Line(points={{54,-100},{30,-100},{30,-158.75}},      color = {117, 80, 123}));
  connect(deltaWye.pinSec_A,LED_Driver_1. hPin_P) annotation (
    Line(points={{-86,8},{10,8},{10,56},{54,56}},            color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P,LED_Driver_1. hPin_P) annotation (
    Line(points={{52,12},{10,12},{10,56},{54,56}},          color = {92, 53, 102}));
  connect(deltaWye.pinSec_B,LED_Driver_2. hPin_P) annotation (
    Line(points={{-86,0},{20,0},{20,-36},{122,-36},{122,-16},{152,-16}},          color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P,LED_Driver_2. hPin_P) annotation (
    Line(points={{152,-62},{140,-62},{140,-16},{152,-16}},        color = {92, 53, 102}));
  connect(deltaWye.pinSec_C,LED_Driver_3. hPin_P) annotation (
    Line(points={{-86,-8},{-24,-8},{-24,-88},{54,-88}},        color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P,LED_Driver_3. hPin_P) annotation (
    Line(points={{46,-136},{-24,-136},{-24,-88},{54,-88}},          color = {92, 53, 102}));
  connect(Heater_1.pin_n, ground6.pin)
    annotation (Line(points={{36,62},{36,-0.75}}, color={117,80,123}));
  connect(Heater_1.pin_p, LED_Driver_1.hPin_P) annotation (Line(points={{36,82},
          {10,82},{10,56},{54,56}}, color={92,53,102}));
  connect(Heater_2.pin_p, LED_Driver_2.hPin_P) annotation (Line(points={{134,16},
          {122,16},{122,-16},{152,-16}}, color={92,53,102}));
  connect(Heater_2.pin_n, ground17.pin)
    annotation (Line(points={{134,-4},{134,-74.75}}, color={117,80,123}));
  connect(Heater_3.pin_p, LED_Driver_3.hPin_P) annotation (Line(points={{30,-62},
          {-24,-62},{-24,-88},{54,-88}}, color={92,53,102}));
  connect(Heater_3.pin_n, ground19.pin)
    annotation (Line(points={{30,-82},{30,-158.75}}, color={117,80,123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}), graphics={
          Text(
          extent={{-258,182},{176,130}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Data Set 4.2
	Load Phase a-n	Total Load - 700W	Laptop Charger 3 + LED Driver 1	Load Bank 1 (78W), LED 1 (22W), Heater 1 - A (200W), Heater 2 - A (400W)
	Load Phase b-n	Total Load - 100W	Laptop Charger 4 + LED Driver 2	Load Bank 2 (78W), LED 2 (22W)
	Load Phase c-n	Total Load - 700W	Laptop Charger 5 + LED Driver 3	Load Bank 3 (78W), LED 3 (22W), Heater 1 - C (200W), Heater 2 - C (400W)
")}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_4_Data_Set_4_2;
