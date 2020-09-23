within HPF.Examples.ModelingValidation.NoTfmr;
model Scenario_3_Data_Set_3_1
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {-172, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground2 annotation (
    Placement(visible = true, transformation(origin = {-100, -102}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner HPF.SystemDef systemDef(fs = 10e3, hrms = {i for i in 1:2:20}) annotation (
    Placement(visible = true, transformation(origin = {-200, 50}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
  HPF.Sources.ThreePhase.VotlageSource voltageSource(vArg_phA= {-0.0013222, -1.5152, 0.66384, 4.7102, -0.4141, 0.24556, 1.8318, 2.6032, 2.627, 1.0003, -0.54943, -0.79045, -1.014, 3.1827, -1.1721},vArg_phB= {2.0917, -0.29167, 3.9398, -0.07821, 3.1562, 4.4798, 3.7855, 4.4308, 0.40616, -0.0063042, -0.34931, 3.1876, 0.56636, 4.1595, 2.4111},vArg_phC= {4.1846, 1.9927, 0.9433, 2.4664, -0.097787, 2.498, -0.46304, 1.6668, -1.5483, 3.8329, -0.099532, 0.6889, 2.7384, 2.53, 0.35959},vMag_phA= {122.9846, 0.16071, 0.12394, 0.21143, 0.084299, 0.40191, 0.22104, 0.036055, 0.1771, 0.025998, 0.031223, 0.026073, 0.03631, 0.011238, 0.036128},vMag_phB= {122.6897, 0.14882, 0.23948, 0.30374, 0.18877, 0.32913, 0.19082, 0.010882, 0.17719, 0.00096972, 0.021515, 0.067425, 0.030861, 0.018384, 0.03489},vMag_phC= {122.9826, 0.28378, 0.11215, 0.38624, 0.12344, 0.39684, 0.24078, 0.040213, 0.17019, 0.030922, 0.0062281, 0.045636, 0.04271, 0.025372, 0.022581}) annotation (
    Placement(visible = true, transformation(origin = {-172, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_2(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_2_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {182, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_3(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {80, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground3 annotation (
    Placement(visible = true, transformation(origin = {114, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Laptop_3(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin = {114, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground4 annotation (
    Placement(visible = true, transformation(origin = {212, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground6 annotation (
    Placement(visible = true, transformation(origin = {54, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_3(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_3_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {78, -108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_2(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin = {212, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground8 annotation (
    Placement(visible = true, transformation(origin = {104, -138}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl LED_Driver_1(V_Rect = 24, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_LED_Driver_1_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {80, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load LED_3(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin = {104, -112}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.DC_Load LED_1(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin = {112, 54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground10 annotation (
    Placement(visible = true, transformation(origin = {112, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_4(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_4_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {178, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Laptop_Charger_5(V_Rect = 18.5, modelFileName = "HPF/PowerElectronicsConverters/AC2DC_ConverterModels/AC2DC_Laptop_Charger_5_3D.mat") annotation (
    Placement(visible = true, transformation(origin = {74, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load1(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin = {212, -54}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Electrical.Analog.Basic.Ground ground16 annotation (
    Placement(visible = true, transformation(origin = {212, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground17 annotation (
    Placement(visible = true, transformation(origin = {150, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground18 annotation (
    Placement(visible = true, transformation(origin = {110, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load dC_Load2(pwr = 1e-2) annotation (
    Placement(visible = true, transformation(origin = {110, -164}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground19 annotation (
    Placement(visible = true, transformation(origin = {48, -176}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin = {-82, -62}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin = {-100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.VoltageSensor vMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin = {-64, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phA annotation (
    Placement(visible = true, transformation(origin = {-38, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phB annotation (
    Placement(visible = true, transformation(origin = {-6, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Sensors.CurrentSensor iMsr_Sec_phC annotation (
    Placement(visible = true, transformation(origin = {-40, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(voltageSource.pinN, ground.pin) annotation (
    Line(points={{-172,-24.75},{-172,-16.75}},  color = {117, 80, 123}));
  connect(Laptop_Charger_3.pin_n, Laptop_3.n) annotation (
    Line(points = {{90, -10}, {104, -10}, {104, -18}, {114, -18}}, color = {0, 0, 255}));
  connect(ground3.p, Laptop_3.n) annotation (
    Line(points = {{114, -24}, {114, -18}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.pin_p, Laptop_3.p) annotation (
    Line(points = {{90, 2}, {114, 2}}, color = {0, 0, 255}));
  connect(Laptop_Charger_3.hPin_N, ground6.pin) annotation (
    Line(points={{70,-10},{54,-10},{54,-10.75}},     color = {117, 80, 123}));
  connect(LED_Driver_2.pin_p, LED_2.p) annotation (
    Line(points = {{192, 20}, {212, 20}}, color = {0, 0, 255}));
  connect(ground4.p, LED_2.n) annotation (
    Line(points = {{212, -4}, {212, 0}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_p, LED_3.p) annotation (
    Line(points = {{88, -102}, {104, -102}}, color = {0, 0, 255}));
  connect(LED_Driver_3.pin_n, LED_3.n) annotation (
    Line(points = {{88, -114}, {100, -114}, {100, -118}, {104, -118}, {104, -122}}, color = {0, 0, 255}));
  connect(ground8.p, LED_3.n) annotation (
    Line(points = {{104, -128}, {104, -122}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_p, LED_1.p) annotation (
    Line(points = {{90, 64}, {112, 64}}, color = {0, 0, 255}));
  connect(LED_Driver_1.pin_n, LED_1.n) annotation (
    Line(points = {{90, 52}, {103.5, 52}, {103.5, 44}, {112, 44}}, color = {0, 0, 255}));
  connect(ground10.p, LED_1.n) annotation (
    Line(points = {{112, 38}, {112, 44}}, color = {0, 0, 255}));
  connect(LED_Driver_2.pin_n, LED_2.n) annotation (
    Line(points = {{192, 8}, {210, 8}, {210, 4}, {212, 4}, {212, 0}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_p, dC_Load2.p) annotation (
    Line(points = {{84, -154}, {110, -154}}, color = {0, 0, 255}));
  connect(Laptop_Charger_5.pin_n, dC_Load2.n) annotation (
    Line(points = {{84, -166}, {100, -166}, {100, -174}, {110, -174}}, color = {0, 0, 255}));
  connect(ground18.p, dC_Load2.n) annotation (
    Line(points = {{110, -180}, {110, -174}}, color = {0, 0, 255}));
  connect(ground19.pin, Laptop_Charger_5.hPin_N) annotation (
    Line(points={{48,-164.75},{48,-166},{64,-166}},     color = {92, 53, 102}));
  connect(Laptop_Charger_4.hPin_N, ground17.pin) annotation (
    Line(points={{168,-56},{167,-56},{167,-56.75},{150,-56.75}},    color = {117, 80, 123}));
  connect(Laptop_Charger_4.pin_p, dC_Load1.p) annotation (
    Line(points = {{188, -44}, {212, -44}}, color = {0, 0, 255}));
  connect(Laptop_Charger_4.pin_n, dC_Load1.n) annotation (
    Line(points = {{188, -56}, {208, -56}, {208, -60}, {212, -60}, {212, -64}}, color = {0, 0, 255}));
  connect(ground16.p, dC_Load1.n) annotation (
    Line(points = {{212, -70}, {212, -64}}, color = {0, 0, 255}));
  connect(LED_Driver_1.hPin_N, ground6.pin) annotation (
    Line(points={{70,52},{54,52},{54,-10.75}},     color = {117, 80, 123}));
  connect(LED_Driver_2.hPin_N, ground17.pin) annotation (
    Line(points={{172,8},{150,8},{150,-56.75}},     color = {117, 80, 123}));
  connect(LED_Driver_3.hPin_N, ground19.pin) annotation (
    Line(points={{68,-114},{48,-114},{48,-164.75}},     color = {117, 80, 123}));
  connect(vMsr_Sec_phA.pin_n, ground2.pin) annotation (
    Line(points={{-100,-50},{-100,-90.75}},    color = {117, 80, 123}));
  connect(vMsr_Sec_phB.pin_n, ground2.pin) annotation (
    Line(points={{-82,-72},{-100,-72},{-100,-90.75}},      color = {117, 80, 123}));
  connect(vMsr_Sec_phC.pin_n, ground2.pin) annotation (
    Line(points={{-64,-50},{-64,-78},{-100,-78},{-100,-90.75}},        color = {117, 80, 123}));
  connect(iMsr_Sec_phA.pin_n, LED_Driver_1.hPin_P) annotation (
    Line(points = {{-28, 2}, {42, 2}, {42, 64}, {70, 64}}, color = {117, 80, 123}));
  connect(Laptop_Charger_3.hPin_P, iMsr_Sec_phA.pin_n) annotation (
    Line(points = {{70, 2}, {-28, 2}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phB.pin_n, LED_Driver_2.hPin_P) annotation (
    Line(points = {{4, -12}, {28, -12}, {28, -44}, {140, -44}, {140, 20}, {172, 20}, {172, 20}}, color = {117, 80, 123}));
  connect(Laptop_Charger_4.hPin_P, iMsr_Sec_phB.pin_n) annotation (
    Line(points = {{168, -44}, {28, -44}, {28, -12}, {4, -12}}, color = {92, 53, 102}));
  connect(iMsr_Sec_phC.pin_n, LED_Driver_3.hPin_P) annotation (
    Line(points = {{-30, -24}, {4, -24}, {4, -102}, {68, -102}}, color = {117, 80, 123}));
  connect(iMsr_Sec_phC.pin_n, Laptop_Charger_5.hPin_P) annotation (
    Line(points = {{-30, -24}, {4, -24}, {4, -154}, {64, -154}, {64, -154}}, color = {117, 80, 123}));
  connect(voltageSource.pinP_phA, iMsr_Sec_phA.pin_p) annotation (
    Line(points={{-159.5,-2},{-106,-2},{-106,2},{-48,2}},        color = {92, 53, 102}));
  connect(voltageSource.pinP_phB, iMsr_Sec_phB.pin_p) annotation (
    Line(points={{-159.5,-12},{-90,-12},{-90,-12},{-16,-12}},            color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, iMsr_Sec_phC.pin_p) annotation (
    Line(points={{-159.5,-22},{-74,-22},{-74,-22},{-50,-22},{-50,-24}},          color = {92, 53, 102}));
  connect(vMsr_Sec_phA.pin_p, voltageSource.pinP_phA) annotation (
    Line(points={{-100,-30},{-100,-2},{-159.5,-2}},      color = {92, 53, 102}));
  connect(vMsr_Sec_phB.pin_p, voltageSource.pinP_phB) annotation (
    Line(points={{-82,-52},{-82,-12},{-159.5,-12}},          color = {92, 53, 102}));
  connect(voltageSource.pinP_phC, vMsr_Sec_phC.pin_p) annotation (
    Line(points={{-159.5,-22},{-64,-22},{-64,-30}},      color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-230, -230}, {230, 230}}, initialScale = 0.1), graphics={Text(origin = {-26, -4}, lineColor = {28, 108, 200}, extent = {{-182, 192}, {310, 152}}, textString = "Scenario 3 | Data Set 3.1 (0W)
No Load
No Load
No Load
    ", horizontalAlignment = TextAlignment.Left)}),
    Icon(coordinateSystem(extent = {{-230, -230}, {230, 230}})),
    experiment(StartTime = 0, StopTime = 0.15, Tolerance = 1e-10, Interval = 0.0005),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", ls = "totalpivot", nls = "newton"));
end Scenario_3_Data_Set_3_1;
