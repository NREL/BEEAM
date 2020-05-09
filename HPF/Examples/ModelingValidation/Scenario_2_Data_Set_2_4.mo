within HPF.Examples.ModelingValidation;
model Scenario_2_Data_Set_2_4
  SinglePhase.Components.Ground     ground annotation (
    Placement(visible = true, transformation(origin={-236,-28},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground2 annotation (
    Placement(visible = true, transformation(origin={-70,-30},     extent={{-10,-10},
            {10,10}},                                                                               rotation = 0)));
  inner SystemDef     systemDef(fs=10e3, hrms={i for i in 1:2:20})     annotation (
    Placement(visible = true, transformation(origin={-230,78},     extent = {{-14, -14}, {14, 10}}, rotation = 0)));
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
    Placement(visible = true, transformation(origin={-236,8},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_2(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={204,24},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_1(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_1_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={86,68},         extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_3(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={88,20},        extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_1(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={120,64},       extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={120,36},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin={122,-10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Laptop_3(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={122,16},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin={234,-4},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground6 annotation (
    Placement(visible = true, transformation(origin={62,-4},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhA annotation (
    Placement(visible = true, transformation(origin={-164,18},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_3(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={88,-44},       extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     LED_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={234,20},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin={114,-74},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     LED_Driver_1(V_Rect=24,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat")
                                                                                                                                                                               annotation (
    Placement(visible = true, transformation(origin={88,112},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     LED_3(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={114,-48},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  DC.DC_Load     LED_1(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={120,108},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin={120,82},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_4(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={202,-68},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Laptop_Charger_5(V_Rect=18.5,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat")
                                                                                                                                                                                         annotation (
    Placement(visible = true, transformation(origin={80,-140},        extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_2(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_2_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={204,-22},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerElectronicsConverters.AC2DC_SinglePhase     Power_Supply_3(V_Rect=48,
      modelFileName=
        "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Power_Supply_3_3D.mat")
                                                                                                                                                                                   annotation (
    Placement(visible = true, transformation(origin={84,-92},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={234,-26},  extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground12 annotation (
    Placement(visible = true, transformation(origin={234,-52},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground13 annotation (
    Placement(visible = true, transformation(origin={114,-122},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     Load_3(pwr=1e-2) annotation (Placement(visible=true,
        transformation(
        origin={114,-96},
        extent={{-10,-10},{10,10}},
        rotation=-90)));
  DC.DC_Load     Laptop_2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={236,-72},     extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin={236,-98},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Ground     ground17 annotation (
    Placement(visible = true, transformation(origin={174,-86},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin={116,-170},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  DC.DC_Load     dC_Load2(pwr=1e-2)   annotation (
    Placement(visible = true, transformation(origin={116,-144},      extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Ground     ground19 annotation (
    Placement(visible = true, transformation(origin={54,-156},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhB annotation (
    Placement(visible = true, transformation(origin={-132,8},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_prim_PhC annotation (
    Placement(visible = true, transformation(origin={-166,-2},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin={-50,26},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin={-40,-2},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Sensors.CurrentSensor     iMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin={-14,12},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    annotation (Placement(transformation(extent={{-92,-2},{-72,18}})));
equation
  connect(voltageSource.pinN,ground. pin) annotation (
    Line(points={{-236,-4.75},{-236,-16.75}},  color = {117, 80, 123}));
  connect(Power_Supply_1.pin_p,Load_1. p) annotation (
    Line(points={{96,74},{120,74}},       color = {0, 0, 255}));
  connect(ground1.p,Load_1. n) annotation (
    Line(points={{120,46},{120,54}},      color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_n,Laptop_3. n) annotation (
    Line(points={{98,14},{112,14},{112,6},{122,6}},             color = {0, 0, 255}));
  connect(ground3.p,Laptop_3. n) annotation (
    Line(points={{122,0},{122,6}},        color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p,Laptop_3. p) annotation (
    Line(points={{98,26},{122,26}},       color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N,ground6. pin) annotation (
    Line(points={{78,14},{62,14},{62,7.25}},      color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p,LED_2. p) annotation (
    Line(points={{214,30},{234,30}},      color = {0, 0, 255}));
  connect(ground4.p,LED_2. n) annotation (
    Line(points={{234,6},{234,10}},       color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p,LED_3. p) annotation (
    Line(points={{98,-38},{114,-38}},       color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n,LED_3. n) annotation (
    Line(points={{98,-50},{110,-50},{110,-58},{114,-58}},           color = {0, 0, 255}));
  connect(ground8.p,LED_3. n) annotation (
    Line(points={{114,-64},{114,-58}},      color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p,LED_1. p) annotation (
    Line(points={{98,118},{120,118}},       color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n,LED_1. n) annotation (
    Line(points={{98,106},{111.5,106},{111.5,98},{120,98}},             color = {0, 0, 255}));
  connect(ground10.p,LED_1. n) annotation (
    Line(points={{120,92},{120,98}},        color = {0, 0, 255}));
  connect(Load_2.n,Power_Supply_2. pin_n) annotation (
    Line(points={{234,-36},{234,-28},{214,-28}},   color = {0, 0, 255}));
  connect(Power_Supply_2.pin_p,Load_2. p) annotation (
    Line(points={{214,-16},{234,-16}},    color = {0, 0, 255}));
  connect(Load_2.n,ground12. p) annotation (
    Line(points={{234,-36},{234,-42}},     color = {0, 0, 255}));
  connect(Power_Supply_3.pin_p,Load_3. p)
    annotation (Line(points={{94,-86},{114,-86}},  color={0,0,255}));
  connect(ground13.p,Load_3. n)
    annotation (Line(points={{114,-112},{114,-106}},
                                                   color={0,0,255}));
  connect(LED_Driver_2.pin_n,LED_2. n) annotation (
    Line(points={{214,18},{233,18},{233,10},{234,10}},          color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p,dC_Load2. p) annotation (
    Line(points={{90,-134},{116,-134}},       color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n,dC_Load2. n) annotation (
    Line(points={{90,-146},{100,-146},{100,-154},{116,-154}},           color = {0, 0, 255}));
  connect(ground18.p,dC_Load2. n) annotation (
    Line(points={{116,-160},{116,-154}},      color = {0, 0, 255}));
  connect(ground19.pin,Laptop_Charger_5. hPin_N) annotation (
    Line(points={{54,-144.75},{54,-146},{70,-146}},     color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N,ground17. pin) annotation (
    Line(points={{192,-74},{187.5,-74},{187.5,-74.75},{174,-74.75}},    color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p,Laptop_2. p) annotation (
    Line(points={{212,-62},{236,-62}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n,Laptop_2. n) annotation (
    Line(points={{212,-74},{232,-74},{232,-82},{236,-82}},          color = {0, 0, 255}));
  connect(ground16.p,Laptop_2. n) annotation (
    Line(points={{236,-88},{236,-82}},      color = {0, 0, 255}));
  connect(Power_Supply_1.pin_n,Load_1. n) annotation (
    Line(points={{96,62},{105,62},{105,54},{120,54}},           color = {0, 0, 255}));
  connect(Power_Supply_3.pin_n,Load_3. n) annotation (Line(points={{94,-98},{
          101,-98},{101,-106},{114,-106}},
                                     color={0,0,255}));
  connect(LED_Driver_1.hPin_N,ground6. pin) annotation (
    Line(points={{78,106},{62,106},{62,7.25}},      color = {117, 80, 123}));
  connect(Power_Supply_1.hPin_N,ground6. pin) annotation (
    Line(points={{76,62},{62,62},{62,7.25}},      color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N,ground17. pin) annotation (
    Line(points={{194,18},{174,18},{174,-74.75}},     color = {117, 80, 123}));
  connect(Power_Supply_2.hPin_N,ground17. pin) annotation (
    Line(points={{194,-28},{174,-28},{174,-74.75}}, color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N,ground19. pin) annotation (
    Line(points={{78,-50},{54,-50},{54,-144.75}},      color = {117, 80, 123}));
  connect(Power_Supply_3.hPin_N,ground19. pin) annotation (
    Line(points={{74,-98},{54,-98},{54,-144.75}},     color = {117, 80, 123}));
  connect(voltageSource.pinP_phB,iMsr_prim_PhB. pin_p) annotation (
    Line(points={{-223.5,8},{-142,8}},        color = {92, 53, 102}));
  connect(voltageSource.pinP_phA,iMsr_prim_PhA. pin_p) annotation (
    Line(points={{-223.5,18},{-174,18}},                                  color = {92, 53, 102}));
  connect(voltageSource.pinP_phC,iMsr_prim_PhC. pin_p) annotation (
    Line(points={{-223.5,-2},{-176,-2}},                                    color = {92, 53, 102}));
  connect(iMsr_prim_PhA.pin_n,deltaWye. pinPrim_A)
    annotation (Line(points={{-154,18},{-92,18}}, color={117,80,123}));
  connect(iMsr_prim_PhB.pin_n,deltaWye. pinPrim_B) annotation (Line(points={{-122,8},
          {-92,8}},                          color={117,80,123}));
  connect(iMsr_prim_PhC.pin_n,deltaWye. pinPrim_C)
    annotation (Line(points={{-156,-2},{-92,-2}}, color={117,80,123}));
  connect(deltaWye.pinSec_A,iMsr_Sec_phA. pin_p) annotation (Line(points={{-72,20},
          {-66,20},{-66,26},{-60,26}}, color={92,53,102}));
  connect(deltaWye.pinSec_B,iMsr_Sec_phB. pin_p)
    annotation (Line(points={{-72,12},{-24,12}}, color={92,53,102}));
  connect(deltaWye.pinSec_C,iMsr_Sec_phC. pin_p) annotation (Line(points={{-72,4},
          {-64,4},{-64,-2},{-50,-2}},  color={92,53,102}));
  connect(LED_Driver_1.hPin_P,iMsr_Sec_phA. pin_n) annotation (Line(points={{78,118},
          {48,118},{48,26},{-40,26}},      color={92,53,102}));
  connect(Power_Supply_1.hPin_P,iMsr_Sec_phA. pin_n) annotation (Line(points={{76,74},
          {48,74},{48,26},{-40,26}},       color={92,53,102}));
  connect(Laptop_Charger_3.hPin_P,iMsr_Sec_phA. pin_n)
    annotation (Line(points={{78,26},{-40,26}}, color={92,53,102}));
  connect(iMsr_Sec_phB.pin_n,LED_Driver_2. hPin_P) annotation (Line(points={{-4,12},
          {12,12},{12,-16},{166,-16},{166,30},{194,30}},
                                                       color={117,80,123}));
  connect(iMsr_Sec_phB.pin_n,Power_Supply_2. hPin_P) annotation (Line(points={{-4,12},
          {12,12},{12,-16},{194,-16}},   color={117,80,123}));
  connect(iMsr_Sec_phB.pin_n,Laptop_Charger_4. hPin_P) annotation (Line(points={{-4,12},
          {12,12},{12,-16},{166,-16},{166,-62},{192,-62}},      color={117,80,123}));
  connect(LED_Driver_3.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{78,-38},
          {2,-38},{2,-2},{-30,-2}},    color={92,53,102}));
  connect(Power_Supply_3.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{74,-86},
          {2,-86},{2,-2},{-30,-2}},      color={92,53,102}));
  connect(Laptop_Charger_5.hPin_P,iMsr_Sec_phC. pin_n) annotation (Line(points={{70,-134},
          {2,-134},{2,-2},{-30,-2}},           color={92,53,102}));
  connect(deltaWye.pinSec_N,ground2. pin) annotation (Line(points={{-72,-4},{
          -70,-4},{-70,-18.75}},
                            color={117,80,123}));
  annotation (
    Diagram(coordinateSystem(extent={{-280,-220},{260,240}}),      graphics={Text(origin={
              -36,-16},                                                                                lineColor = {28, 108, 200}, extent = {{-182, 192}, {146, 164}}, textString = "Scenario 2 | Data Set 2.4
Load Phase a-n	Total Load - 700W		Load Bank 1 (78W), LED 1 (22W), Resistor 4 (600W)
Load Phase b-n	Total Load - 500W		Load Bank 2 (78W), LED 2 (22W), Resistor 3 (400W)
Load Phase c-n	Total Load - 0W		", fontSize = 9, horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent={{-280,-220},{260,240}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_2_Data_Set_2_4;
