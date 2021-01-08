within HPF.Examples.ModelingValidation;
model Scenario_4_Data_Set_4_4
  SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-144,-38},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef     systemDef(fs=10e3, hrms={i for i in 1:2:20})     annotation (
    Placement(visible = true, transformation(origin={-142,68},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin={-144,-4},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-78,-42},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y     deltaWye(
    Rc=15117.5,
    Rp=8.333,
    Rs=1.4404E-01,
    Xm=2.3311e+03,
    Xp=3.3002,
    Xs=0.6197)                                                                                                                             annotation (
    Placement(visible = true, transformation(extent={{-102,-14},{-82,6}},      rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_2(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_2.mat",

    nomP=28)                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={166,-22},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_3(
    P_DCmin=2,
    P_stby=0.44,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_3.mat",
    nomP=72)                                                                                                                                                                                           annotation (
    Placement(visible = true, transformation(origin={66,6},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={100,-24},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr=72.741145)   annotation (
    Placement(visible = true, transformation(origin={100,2},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={194,-50},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin={40,-12},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_3(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_3.mat",

    nomP=28)                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={68,-94},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr=28.071211)   annotation (
    Placement(visible = true, transformation(origin={194,-26},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={94,-124},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_1(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_1.mat",

    nomP=28)                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={68,50},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr=27.069063)   annotation (
    Placement(visible = true, transformation(origin={94,-98},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load LED_1(pwr=27.721808)   annotation (
    Placement(visible = true, transformation(origin={100,46},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={100,20},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_4(
    P_DCmin=2,
    P_stby=0.33,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_4.mat",
    nomP=72)                                                                                                                                                                                           annotation (
    Placement(visible = true, transformation(origin={166,-68},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_5(
    P_DCmin=2,
    P_stby=0.27,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_5.mat",
    nomP=72)                                                                                                                                                                                           annotation (
    Placement(visible = true, transformation(origin={60,-142},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_4(pwr=70.519849)   annotation (
    Placement(visible = true, transformation(origin={200,-72},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={200,-98},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={138,-86},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={96,-172},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Latop_5(pwr=71.537540) annotation (Placement(visible=true,
        transformation(
        origin={96,-146},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={34,-170},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Resistor Heater_1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,72})));
  SinglePhase.Components.Resistor Heater_2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={138,6})));
  SinglePhase.Components.Resistor Heater_3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={34,-72})));
equation
  connect(voltageSource.pinN,ground. pin) annotation (
    Line(points={{-144,-16.75},{-144,-26.75}},     color = {117, 80, 123}));
  connect(deltaWye.pinSec_N,ground2. pin) annotation (
    Line(points={{-82,-16},{-78,-16},{-78,-30.75}},      color = {117, 80, 123}));
  connect(voltageSource.pinP_phA,deltaWye. pinPrim_A) annotation (
    Line(points={{-131.5,6},{-102,6}},        color = {92, 53, 102}));
  connect(voltageSource.pinP_phB,deltaWye. pinPrim_B) annotation (
    Line(points={{-131.5,-4},{-102,-4}},    color = {92, 53, 102}));
  connect(voltageSource.pinP_phC,deltaWye. pinPrim_C) annotation (
    Line(points={{-131.5,-14},{-102,-14}},    color = {92, 53, 102}));
  connect(Laptop_Charger_3.pin_n,Laptop_3. n) annotation (
    Line(points={{76,0},{90,0},{90,-8},{100,-8}},       color = {0, 0, 255}));
  connect(ground3.p,Laptop_3. n) annotation (
    Line(points={{100,-14},{100,-8}},  color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p,Laptop_3. p) annotation (
    Line(points={{76,12},{100,12}},     color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N,ground6. pin) annotation (
    Line(points={{56,0},{40,0},{40,-0.75}},       color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p,LED_2. p) annotation (
    Line(points={{176,-16},{194,-16}},    color = {0, 0, 255}));
  connect(ground4.p,LED_2. n) annotation (
    Line(points={{194,-40},{194,-36}},    color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p,LED_3. p) annotation (
    Line(points={{78,-88},{94,-88}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n,LED_3. n) annotation (
    Line(points={{78,-100},{90,-100},{90,-104},{94,-104},{94,-108}},       color = {0, 0, 255}));
  connect(ground8.p,LED_3. n) annotation (
    Line(points={{94,-114},{94,-108}},    color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p,LED_1. p) annotation (
    Line(points={{78,56},{100,56}},       color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n,LED_1. n) annotation (
    Line(points={{78,44},{91.5,44},{91.5,36},{100,36}},           color = {0, 0, 255}));
  connect(ground10.p,LED_1. n) annotation (
    Line(points={{100,30},{100,36}},    color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n,LED_2. n) annotation (
    Line(points={{176,-28},{180,-28},{180,-36},{194,-36}},                 color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, Latop_5.p)
    annotation (Line(points={{70,-136},{96,-136}}, color={0,0,255}));
  connect(Laptop_Charger_5.pin_n, Latop_5.n) annotation (Line(points={{70,-148},
          {86,-148},{86,-156},{96,-156}}, color={0,0,255}));
  connect(ground18.p, Latop_5.n)
    annotation (Line(points={{96,-162},{96,-156}}, color={0,0,255}));
  connect(ground19.pin,Laptop_Charger_5. hPin_N) annotation (
    Line(points={{34,-158.75},{34,-148},{50,-148}},        color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N,ground17. pin) annotation (
    Line(points={{156,-74},{155,-74},{155,-74.75},{138,-74.75}},          color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p,Laptop_4. p) annotation (
    Line(points={{176,-62},{200,-62}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n,Laptop_4. n) annotation (
    Line(points={{176,-74},{196,-74},{196,-78},{200,-78},{200,-82}},            color = {0, 0, 255}));
  connect(ground16.p,Laptop_4. n) annotation (
    Line(points={{200,-88},{200,-82}},      color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N,ground6. pin) annotation (
    Line(points={{58,44},{40,44},{40,-0.75}},         color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N,ground17. pin) annotation (
    Line(points={{156,-28},{138,-28},{138,-74.75}},      color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N,ground19. pin) annotation (
    Line(points={{58,-100},{34,-100},{34,-158.75}},      color = {117, 80, 123}));
  connect(deltaWye.pinSec_A,LED_Driver_1. hPin_P) annotation (
    Line(points={{-82,8},{14,8},{14,56},{58,56}},            color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P,LED_Driver_1. hPin_P) annotation (
    Line(points={{56,12},{14,12},{14,56},{58,56}},          color = {92, 53, 102}));
  connect(deltaWye.pinSec_B,LED_Driver_2. hPin_P) annotation (
    Line(points={{-82,0},{24,0},{24,-36},{126,-36},{126,-16},{156,-16}},          color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P,LED_Driver_2. hPin_P) annotation (
    Line(points={{156,-62},{144,-62},{144,-16},{156,-16}},        color = {92, 53, 102}));
  connect(deltaWye.pinSec_C,LED_Driver_3. hPin_P) annotation (
    Line(points={{-82,-8},{-20,-8},{-20,-88},{58,-88}},        color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P,LED_Driver_3. hPin_P) annotation (
    Line(points={{50,-136},{-20,-136},{-20,-88},{58,-88}},          color = {92, 53, 102}));
  connect(Heater_1.pin_n, ground6.pin)
    annotation (Line(points={{40,62},{40,-0.75}}, color={117,80,123}));
  connect(Heater_1.pin_p, LED_Driver_1.hPin_P) annotation (Line(points={{40,82},
          {14,82},{14,56},{58,56}}, color={92,53,102}));
  connect(Heater_2.pin_p, LED_Driver_2.hPin_P) annotation (Line(points={{138,16},
          {126,16},{126,-16},{156,-16}}, color={92,53,102}));
  connect(Heater_2.pin_n, ground17.pin)
    annotation (Line(points={{138,-4},{138,-74.75}}, color={117,80,123}));
  connect(Heater_3.pin_p, LED_Driver_3.hPin_P) annotation (Line(points={{34,-62},
          {-20,-62},{-20,-88},{58,-88}}, color={92,53,102}));
  connect(Heater_3.pin_n, ground19.pin)
    annotation (Line(points={{34,-82},{34,-158.75}}, color={117,80,123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}), graphics={
          Text(
          textString="Edit Here",
          extent={{-256,64},{-250,64}},
          lineColor={28,108,200}), Text(
          extent={{-234,200},{150,150}},
          lineColor={28,108,200},
          textString="Data Set 4.4
	Load Phase a-n	Total Load - 700W	Laptop Charger 3 + LED Driver 1	Load Bank 1 (78W), LED 1 (22W), Heater 1 - A (200W), Heater 2 - A (400W)
	Load Phase b-n	Total Load - 500W	Laptop Charger 4 + LED Driver 2	Load Bank 2 (78W), LED 2 (22W), Heater 2 - B (400W)
	Load Phase c-n	Total Load - 100W	Laptop Charger 5 + LED Driver 3	Load Bank 2 (78W), LED 2 (22W)
",        horizontalAlignment=TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_4_Data_Set_4_4;
