within HPF.Examples.ModelingValidation.NoTfmr;
model Scenario_3_Data_Set_3_2
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-174, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-100, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-200, 50}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA= {-0.0015475, 1.4278, -0.53463, 3.3378, 0.27174, 4.6164, 1.4071, -1.3429, 2.4666, 1.3382, 0.020037, 3.9465, 0.74727, 4.469, -0.51012},vArg_phB= {2.0913, 1.0729, 3.6108, -0.91717, 0.12011, 2.0555, 3.2072, 4.3928, -0.14034, 0.12123, 0.038153, 1.9243, 1.6258, 3.3582, 4.3559},vArg_phC= {4.1857, 1.3663, 0.87612, 1.2383, -0.87835, 3.2507, 3.4392, 2.0378, -0.95395, 2.2189, 1.5488, 1.1598, 1.3079, 1.7904, 1.4979},vMag_phA= {123.2714, 0.44004, 0.76039, 0.79257, 0.77231, 0.51717, 0.53753, 0.20949, 0.26287, 0.01541, 0.11621, 0.12125, 0.085913, 0.077692, 0.0021743},vMag_phB= {123.1192, 0.62985, 0.92254, 0.88668, 0.46105, 0.42407, 0.42865, 0.2331, 0.2436, 0.064554, 0.055802, 0.049724, 0.085821, 0.1201, 0.049831},vMag_phC= {123.3456, 0.86515, 0.66265, 0.3095, 0.5683, 0.30526, 0.16869, 0.25296, 0.037744, 0.046995, 0.076601, 0.12888, 0.081022, 0.042497, 0.063973}) annotation (
    Placement(visible = true, transformation(origin = {-172, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_2.mat") annotation (
    Placement(visible = true, transformation(origin = {182, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_3.mat") annotation (
    Placement(visible = true, transformation(origin = {80, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {114, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 72.741145) annotation (
    Placement(visible = true, transformation(origin = {114, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {212, -58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {54, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_3.mat") annotation (
    Placement(visible = true, transformation(origin = {80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr = 28.071211) annotation (
    Placement(visible = true, transformation(origin = {212, -34}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin = {106, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_1.mat") annotation (
    Placement(visible = true, transformation(origin = {80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 28.11) annotation (
    Placement(visible = true, transformation(origin = {106, -114}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr = 27.601220) annotation (
    Placement(visible = true, transformation(origin = {110, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {112, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_4.mat") annotation (
    Placement(visible = true, transformation(origin = {178, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_5.mat") annotation (
    Placement(visible = true, transformation(origin = {74, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 70.519849) annotation (
    Placement(visible = true, transformation(origin={214,-82},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {214, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {150, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin = {110, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 70.27028) annotation (
    Placement(visible = true, transformation(origin = {110, -164}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin = {48, -176}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin = {-82, -62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin = {-64, -42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin = {-38, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin = {-6, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin = {-40, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points={{-172,-24.75},{-172,-27.1},{-174,-27.1},{-174,-24.75}},      color = {117, 80, 123}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points = {{90, -10}, {104, -10}, {104, -18}, {114, -18}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points = {{114, -24}, {114, -18}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points = {{90, 2}, {114, 2}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points={{70,-10},{54,-10},{54,-10.75}},     color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points = {{192, -24}, {212, -24}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points = {{212, -48}, {212, -44}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation (
    Line(points = {{90, -104}, {106, -104}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation (
    Line(points = {{90, -116}, {100, -116}, {100, -120}, {106, -120}, {106, -124}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation (
    Line(points = {{106, -130}, {106, -124}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points = {{90, 56}, {110, 56}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points = {{90, 44}, {103.5, 44}, {103.5, 36}, {110, 36}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points = {{112, 30}, {112, 33}, {110, 33}, {110, 36}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points = {{192, -36}, {202, -36}, {202, -40}, {212, -40}, {212, -44}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation (
    Line(points = {{84, -154}, {110, -154}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation (
    Line(points = {{84, -166}, {100, -166}, {100, -174}, {110, -174}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation (
    Line(points = {{110, -180}, {110, -174}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points={{48,-164.75},{48,-166},{64,-166}},     color = {92, 53, 102}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation (
    Line(points={{188,-72},{214,-72}},      color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation (
    Line(points={{188,-84},{210,-84},{210,-88},{214,-88},{214,-92}},            color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation (
    Line(points={{214,-98},{214,-92}},      color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation (
    Line(points={{70,44},{54,44},{54,-10.75}},     color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation (
    Line(points={{172,-36},{150,-36},{150,-90.75}},      color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation (
    Line(points={{70,-116},{48,-116},{48,-164.75}},     color = {117, 80, 123}));
  connect(vMsr_Sec_phA.pin_n, ground2.pin) annotation (
    Line(points={{-100,-50},{-100,-90.75}},    color = {117, 80, 123}));
  connect(vMsr_Sec_phB.pin_n, ground2.pin) annotation (
    Line(points={{-82,-72},{-100,-72},{-100,-90.75}},      color = {117, 80, 123}));
  connect(vMsr_Sec_phC.pin_n, ground2.pin) annotation (
    Line(points={{-64,-52},{-64,-78},{-100,-78},{-100,-90.75}},        color = {117, 80, 123}));
  connect(iMsr_Sec_phA.pin_n, LED_Driver_1.hPin_P) annotation (
    Line(points = {{-28, 2}, {42, 2}, {42, 56}, {70, 56}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_P, iMsr_Sec_phA.pin_n) annotation (
    Line(points = {{70, 2}, {-28, 2}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phB.pin_n, LED_Driver_2.hPin_P) annotation (
    Line(points = {{4, -12}, {28, -12}, {28, -44}, {140, -44}, {140, -24}, {172, -24}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.hPin_P, iMsr_Sec_phB.pin_n) annotation (
    Line(points = {{168, -72}, {140, -72}, {140, -44}, {28, -44}, {28, -12}, {4, -12}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phC.pin_n, LED_Driver_3.hPin_P) annotation (
    Line(points = {{-30, -24}, {4, -24}, {4, -104}, {70, -104}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phC.pin_n, Laptop_Charger_5.hPin_P) annotation (
    Line(points = {{-30, -24}, {4, -24}, {4, -154}, {64, -154}, {64, -154}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, iMsr_Sec_phA.pin_p) annotation (
    Line(points={{-159.5,-2},{-106,-2},{-106,2},{-48,2}},        color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, iMsr_Sec_phB.pin_p) annotation (
    Line(points={{-159.5,-12},{-90,-12},{-90,-12},{-16,-12}},            color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_Sec_phC.pin_p) annotation (
    Line(points={{-159.5,-22},{-120,-22},{-120,-20},{-50,-20},{-50,-24}},          color = {92, 53, 102}));
  connect(vMsr_Sec_phA.pin_p, voltageSource.pinP_phA) annotation (
    Line(points={{-100,-30},{-100,-2},{-159.5,-2}},      color = {92, 53, 102}));
  connect(vMsr_Sec_phB.pin_p, voltageSource.pinP_phB) annotation (
    Line(points={{-82,-52},{-82,-12},{-159.5,-12}},          color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, vMsr_Sec_phC.pin_p) annotation (
    Line(points={{-159.5,-22},{-64,-22},{-64,-32}},      color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (Line(points={{168,-84},
          {162,-84},{162,-86},{150,-86},{150,-90.75}},    color={117,80,123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-230, -230}, {230, 230}}, initialScale = 0.1), graphics={Text(origin = {-26, -4}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {310, 152}}, textString = "Scenario 3 | Data Set 3.2 (300W)
Load Bank 1 (78W), LED 1 (22W)
Load Bank 2 (78W), LED 2 (22W)
Load Bank 3 (78W), LED 3 (22W)
    ", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-230, -230}, {230, 230}})),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-10, Interval = 1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_3_Data_Set_3_2;
