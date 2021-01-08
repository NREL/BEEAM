within HPF.Examples.ModelingValidation;
model Scenario_4_Data_Set_4_3
  SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-154,-38},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef     systemDef(fs=10e3, hrms={i for i in 1:2:20})     annotation (
    Placement(visible = true, transformation(origin={-152,68},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin={-154,-4},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-88,-42},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y     deltaWye(
    Rc=15117.5,
    Rp=8.333,
    Rs=1.4404E-01,
    Xm=2.3311e+03,
    Xp=3.3002,
    Xs=0.6197)                                                                                                                             annotation (
    Placement(visible = true, transformation(extent={{-112,-14},{-92,6}},      rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_2(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_2.mat",

    nomP=28)                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={156,-22},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_3(
    P_DCmin=2,
    P_stby=0.44,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_3.mat",
    nomP=72)                                                                                                                                                                                           annotation (
    Placement(visible = true, transformation(origin={56,6},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={90,-24},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr=72.741145)   annotation (
    Placement(visible = true, transformation(origin={90,2},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={184,-50},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin={30,-12},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_3(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_3.mat",

    nomP=28)                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={58,-94},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr=28.071211)   annotation (
    Placement(visible = true, transformation(origin={184,-26},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={84,-124},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     LED_Driver_1(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_1.mat",

    nomP=28)                                                                                                                                                     annotation (
    Placement(visible = true, transformation(origin={58,50},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr=27.069063)   annotation (
    Placement(visible = true, transformation(origin={84,-98},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load LED_1(pwr=27.721808)   annotation (
    Placement(visible = true, transformation(origin={90,46},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={90,20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_4(
    P_DCmin=2,
    P_stby=0.33,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_4.mat",
    nomP=72)                                                                                                                                                                                           annotation (
    Placement(visible = true, transformation(origin={156,-68},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl     Laptop_Charger_5(
    P_DCmin=2,
    P_stby=0.27,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_5.mat",
    nomP=72)                                                                                                                                                                                           annotation (
    Placement(visible = true, transformation(origin={50,-142},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_4(pwr=70.519849)   annotation (
    Placement(visible = true, transformation(origin={190,-72},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={190,-98},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={128,-86},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={86,-172},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Latop_5(pwr=71.537540) annotation (Placement(visible=true,
        transformation(
        origin={86,-146},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={24,-170},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Resistor Heater_1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,72})));
  SinglePhase.Components.Resistor Heater_2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={128,6})));
  SinglePhase.Components.Resistor Heater_3 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={24,-72})));
equation
  connect(voltageSource.pinN,ground. pin) annotation (
    Line(points={{-154,-16.75},{-154,-26.75}},     color = {117, 80, 123}));
  connect(deltaWye.pinSec_N,ground2. pin) annotation (
    Line(points={{-92,-16},{-88,-16},{-88,-30.75}},      color = {117, 80, 123}));
  connect(voltageSource.pinP_phA,deltaWye. pinPrim_A) annotation (
    Line(points={{-141.5,6},{-112,6}},        color = {92, 53, 102}));
  connect(voltageSource.pinP_phB,deltaWye. pinPrim_B) annotation (
    Line(points={{-141.5,-4},{-112,-4}},    color = {92, 53, 102}));
  connect(voltageSource.pinP_phC,deltaWye. pinPrim_C) annotation (
    Line(points={{-141.5,-14},{-112,-14}},    color = {92, 53, 102}));
  connect(Laptop_Charger_3.pin_n,Laptop_3. n) annotation (
    Line(points={{66,0},{80,0},{80,-8},{90,-8}},        color = {0, 0, 255}));
  connect(ground3.p,Laptop_3. n) annotation (
    Line(points={{90,-14},{90,-8}},    color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p,Laptop_3. p) annotation (
    Line(points={{66,12},{90,12}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N,ground6. pin) annotation (
    Line(points={{46,0},{30,0},{30,-0.75}},       color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p,LED_2. p) annotation (
    Line(points={{166,-16},{184,-16}},    color = {0, 0, 255}));
  connect(ground4.p,LED_2. n) annotation (
    Line(points={{184,-40},{184,-36}},    color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p,LED_3. p) annotation (
    Line(points={{68,-88},{84,-88}},      color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n,LED_3. n) annotation (
    Line(points={{68,-100},{80,-100},{80,-104},{84,-104},{84,-108}},       color = {0, 0, 255}));
  connect(ground8.p,LED_3. n) annotation (
    Line(points={{84,-114},{84,-108}},    color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p,LED_1. p) annotation (
    Line(points={{68,56},{90,56}},        color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n,LED_1. n) annotation (
    Line(points={{68,44},{81.5,44},{81.5,36},{90,36}},            color = {0, 0, 255}));
  connect(ground10.p,LED_1. n) annotation (
    Line(points={{90,30},{90,36}},      color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n,LED_2. n) annotation (
    Line(points={{166,-28},{170,-28},{170,-36},{184,-36}},                 color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, Latop_5.p)
    annotation (Line(points={{60,-136},{86,-136}}, color={0,0,255}));
  connect(Laptop_Charger_5.pin_n, Latop_5.n) annotation (Line(points={{60,-148},
          {76,-148},{76,-156},{86,-156}}, color={0,0,255}));
  connect(ground18.p, Latop_5.n)
    annotation (Line(points={{86,-162},{86,-156}}, color={0,0,255}));
  connect(ground19.pin,Laptop_Charger_5. hPin_N) annotation (
    Line(points={{24,-158.75},{24,-148},{40,-148}},        color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N,ground17. pin) annotation (
    Line(points={{146,-74},{145,-74},{145,-74.75},{128,-74.75}},          color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p,Laptop_4. p) annotation (
    Line(points={{166,-62},{190,-62}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n,Laptop_4. n) annotation (
    Line(points={{166,-74},{186,-74},{186,-78},{190,-78},{190,-82}},            color = {0, 0, 255}));
  connect(ground16.p,Laptop_4. n) annotation (
    Line(points={{190,-88},{190,-82}},      color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N,ground6. pin) annotation (
    Line(points={{48,44},{30,44},{30,-0.75}},         color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N,ground17. pin) annotation (
    Line(points={{146,-28},{128,-28},{128,-74.75}},      color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N,ground19. pin) annotation (
    Line(points={{48,-100},{24,-100},{24,-158.75}},      color = {117, 80, 123}));
  connect(deltaWye.pinSec_A,LED_Driver_1. hPin_P) annotation (
    Line(points={{-92,8},{4,8},{4,56},{48,56}},              color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_P,LED_Driver_1. hPin_P) annotation (
    Line(points={{46,12},{4,12},{4,56},{48,56}},            color = {92, 53, 102}));
  connect(deltaWye.pinSec_B,LED_Driver_2. hPin_P) annotation (
    Line(points={{-92,0},{14,0},{14,-36},{116,-36},{116,-16},{146,-16}},          color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_P,LED_Driver_2. hPin_P) annotation (
    Line(points={{146,-62},{134,-62},{134,-16},{146,-16}},        color = {92, 53, 102}));
  connect(deltaWye.pinSec_C,LED_Driver_3. hPin_P) annotation (
    Line(points={{-92,-8},{-30,-8},{-30,-88},{48,-88}},        color = {92, 53, 102}));
  connect(Laptop_Charger_5.hPin_P,LED_Driver_3. hPin_P) annotation (
    Line(points={{40,-136},{-30,-136},{-30,-88},{48,-88}},          color = {92, 53, 102}));
  connect(Heater_1.pin_n, ground6.pin)
    annotation (Line(points={{30,62},{30,-0.75}}, color={117,80,123}));
  connect(Heater_1.pin_p, LED_Driver_1.hPin_P) annotation (Line(points={{30,82},
          {4,82},{4,56},{48,56}}, color={92,53,102}));
  connect(Heater_2.pin_p, LED_Driver_2.hPin_P) annotation (Line(points={{128,16},
          {116,16},{116,-16},{146,-16}}, color={92,53,102}));
  connect(Heater_2.pin_n, ground17.pin)
    annotation (Line(points={{128,-4},{128,-74.75}}, color={117,80,123}));
  connect(Heater_3.pin_p, LED_Driver_3.hPin_P) annotation (Line(points={{24,-62},
          {-30,-62},{-30,-88},{48,-88}}, color={92,53,102}));
  connect(Heater_3.pin_n, ground19.pin)
    annotation (Line(points={{24,-82},{24,-158.75}}, color={117,80,123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-280, -220}, {260, 240}}), graphics={
          Text(
          extent={{-258,182},{182,136}},
          lineColor={28,108,200},
          horizontalAlignment=TextAlignment.Left,
          textString="Data Set 4.3
	Load Phase a-n	Total Load - 300W	Laptop Charger 3 + LED Driver 1	Load Bank 1 (78W), LED 1 (22W), Heater 1 - A (200W)
	Load Phase b-n	Total Load - 500W	Laptop Charger 4 + LED Driver 2	Load Bank 2 (78W), LED 2 (22W), Heater 2 - B (400W)
	Load Phase c-n	Total Load - 700W	Laptop Charger 5 + LED Driver 3	Load Bank 3 (78W), LED 3 (22W), Heater 1 - C (200W), Heater 2 - C (400W)
")}),
    Icon(coordinateSystem(extent = {{-280, -220}, {260, 240}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_4_Data_Set_4_3;
