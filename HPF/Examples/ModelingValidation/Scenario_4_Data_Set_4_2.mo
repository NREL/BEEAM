within HPF.Examples.ModelingValidation;
model Scenario_4_Data_Set_4_2

  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_1.mat",

    nomP=28)                                                                                                                                                 annotation (
    Placement(visible = true, transformation(origin={36,42},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_1(pwr=27.721808)   annotation (
    Placement(visible = true, transformation(origin={68,38},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
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
    Placement(visible = true, transformation(origin={-176,-12},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={68,-32},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_3(pwr=27.069063)   annotation (
    Placement(visible = true, transformation(origin={60,-108},   extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load Laptop_4(pwr=70.519849)   annotation (
    Placement(visible = true, transformation(origin={168,-80},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Loads.UserDefined.HarmonicPQLoad Heater_1(P={193.13})   annotation (
    Placement(visible = true, transformation(origin={36,64},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_3.mat",

    nomP=28)                                                                                                                                                 annotation (
    Placement(visible = true, transformation(origin={36,-102},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load LED_2(pwr=28.071211)   annotation (
    Placement(visible = true, transformation(origin={162,-34},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(
    P_DCmin=2,
    P_stby=0.33,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_4.mat",
    nomP=72)                                                                                                                                                                                       annotation (
    Placement(visible = true, transformation(origin={134,-76},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin={106,-94},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Latop_5(pwr=71.537540)   annotation (
    Placement(visible = true, transformation(origin={64,-154},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={64,-180},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load Laptop_3(pwr=72.741145)   annotation (
    Placement(visible = true, transformation(origin={68,-6},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(
    V_Rect=24,
    modelFileName="HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_2.mat",

    nomP=28)                                                                                                                                                 annotation (
    Placement(visible = true, transformation(origin={134,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin={-110,-50},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(
    P_DCmin=2,
    P_stby=0.44,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_3.mat",
    nomP=72)                                                                                                                                                                                       annotation (
    Placement(visible = true, transformation(origin={34,-2},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={162,-58},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(
    P_DCmin=2,
    P_stby=0.27,
    V_Rect=18.5,
    modelFileName=
        "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_5.mat",
    nomP=72)                                                                                                                                                                                       annotation (
    Placement(visible = true, transformation(origin={28,-150},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner SystemDef systemDef(fs=10e3, hrms={i for i in 1:2:20})     annotation (
    Placement(visible = true, transformation(origin={-174,60},    extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin={-176,-46},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={8,-36},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={68,12},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Transformers.ThreePhase.Symmetric.D1Y deltaWye(
    Rc=15117.5,
    Rp=8.333,
    Rs=1.4404E-01,
    Xm=2.3311e+03,
    Xp=3.3002,
    Xs=0.6197)                                                                                                                         annotation (
    Placement(visible = true, transformation(extent={{-134,-22},{-114,-2}},    rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={62,-132},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Loads.UserDefined.HarmonicPQLoad Heater_3(P={193.13})   annotation (
    Placement(visible = true, transformation(origin={34,-76},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={168,-106},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin={2,-178},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Laptop_Charger_3.pin_n,Laptop_3. n) annotation (
    Line(points={{44,-8},{58,-8},{58,-16},{68,-16}},    color = {0, 0, 255}));
  connect(ground10.p,LED_1. n) annotation (
    Line(points={{68,22},{68,28}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n,Laptop_4. n) annotation (
    Line(points={{144,-82},{164,-82},{164,-86},{168,-86},{168,-90}},            color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n,LED_1. n) annotation (
    Line(points={{46,36},{59.5,36},{59.5,28},{68,28}},          color = {0, 0, 255}));
  connect(voltageSource.pinP_phC,deltaWye. pinPrim_C) annotation (
    Line(points={{-163.5,-22},{-134,-22}},    color = {92, 53, 102}));
  connect(ground18.p,Latop_5. n) annotation (
    Line(points={{64,-170},{64,-164}},      color = {0, 0, 255}));
  connect(deltaWye.pinSec_C,LED_Driver_3. hPin_P) annotation (
    Line(points={{-114,-16},{-52,-16},{-52,-96},{26,-96}},     color = {92, 53, 102}));
  connect(voltageSource.pinP_phB,deltaWye. pinPrim_B) annotation (
    Line(points={{-163.5,-12},{-134,-12}},  color = {92, 53, 102}));
  connect(Laptop_Charger_3.hPin_N,ground1. pin) annotation (
    Line(points={{24,-8},{8,-8},{8,-26}},                   color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N,ground17. pin) annotation (
    Line(points={{124,-36},{106,-36},{106,-84}},           color = {117, 80, 123}));
  connect(LED_Driver_1.hPin_N,ground1. pin) annotation (
    Line(points={{26,36},{8,36},{8,-26}},                     color = {117, 80, 123}));
  connect(Laptop_Charger_5.pin_n,Latop_5. n) annotation (
    Line(points={{38,-156},{54,-156},{54,-164},{64,-164}},          color = {0, 0, 255}));
  connect(ground19.pin,Laptop_Charger_5. hPin_N) annotation (
    Line(points={{2,-168},{2,-156},{18,-156}},             color = {92, 53, 102}));
  connect(ground4.p,LED_2. n) annotation (
    Line(points={{162,-48},{162,-44}},      color = {0, 0, 255}));
  connect(Heater_3.hPin_P,deltaWye. pinSec_C) annotation (
    Line(points={{23,-76},{-52,-76},{-52,-16},{-114,-16}},                                     color = {92, 53, 102}));
  connect(LED_Driver_3.pin_n,LED_3. n) annotation (
    Line(points={{46,-108},{58,-108},{58,-112},{60,-112},{60,-118}},        color = {0, 0, 255}));
  connect(ground16.p,Laptop_4. n) annotation (
    Line(points={{168,-96},{168,-90}},      color = {0, 0, 255}));
  connect(ground8.p,LED_3. n) annotation (
    Line(points={{62,-122},{62,-119},{60,-119},{60,-118}},          color = {0, 0, 255}));
  connect(voltageSource.pinN,ground. pin) annotation (
    Line(points={{-176,-24.75},{-176,-36}},        color = {117, 80, 123}));
  connect(Laptop_Charger_5.hPin_P,LED_Driver_3. hPin_P) annotation (
    Line(points={{18,-144},{-52,-144},{-52,-96},{26,-96}},          color = {92, 53, 102}));
  connect(LED_Driver_1.pin_p,LED_1. p) annotation (
    Line(points={{46,48},{68,48}},      color = {0, 0, 255}));
  connect(ground3.p,Laptop_3. n) annotation (
    Line(points={{68,-22},{68,-16}},   color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_p,Laptop_4. p) annotation (
    Line(points={{144,-70},{168,-70}},      color = {0, 0, 255}));
  connect(LED_Driver_3.hPin_N,ground19. pin) annotation (
    Line(points={{26,-108},{2,-108},{2,-168}},           color = {117, 80, 123}));
  connect(deltaWye.pinSec_N,ground2. pin) annotation (
    Line(points={{-114,-24},{-110,-24},{-110,-40}},      color = {117, 80, 123}));
  connect(LED_Driver_2.pin_n,LED_2. n) annotation (
    Line(points={{144,-36},{148,-36},{148,-44},{162,-44}},          color = {0, 0, 255}));
  connect(deltaWye.pinSec_A,LED_Driver_1. hPin_P) annotation (
    Line(points={{-114,0},{-18,0},{-18,48},{26,48}},         color = {92, 53, 102}));
  connect(LED_Driver_2.pin_p,LED_2. p) annotation (
    Line(points={{144,-24},{162,-24}},    color = {0, 0, 255}));
  connect(Heater_1.hPin_P,deltaWye. pinSec_A) annotation (
    Line(points={{25,64},{-18,64},{-18,0},{-114,0}},         color = {92, 53, 102}));
  connect(Laptop_Charger_3.pin_p,Laptop_3. p) annotation (
    Line(points={{44,4},{68,4}},        color = {0, 0, 255}));
  connect(voltageSource.pinP_phA,deltaWye. pinPrim_A) annotation (
    Line(points={{-163.5,-2},{-134,-2}},      color = {92, 53, 102}));
  connect(LED_Driver_3.pin_p,LED_3. p) annotation (
    Line(points={{46,-96},{54,-96},{54,-98},{60,-98}},          color = {0, 0, 255}));
  connect(Laptop_Charger_4.hPin_P,LED_Driver_2. hPin_P) annotation (
    Line(points={{124,-70},{112,-70},{112,-24},{124,-24}},        color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N,ground17. pin) annotation (
    Line(points={{124,-82},{123,-82},{123,-84},{106,-84}},                color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_P,LED_Driver_1. hPin_P) annotation (
    Line(points={{24,4},{-18,4},{-18,48},{26,48}},          color = {92, 53, 102}));
  connect(deltaWye.pinSec_B,LED_Driver_2. hPin_P) annotation (
    Line(points={{-114,-8},{-8,-8},{-8,-44},{94,-44},{94,-24},{124,-24}},           color = {92, 53, 102}));
  connect(Laptop_Charger_5.pin_p,Latop_5. p) annotation (
    Line(points={{38,-144},{64,-144}},      color = {0, 0, 255}));
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
