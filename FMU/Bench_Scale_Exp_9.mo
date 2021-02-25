model Bench_Scale_Exp_9
  inner HPF.SystemDef systemDef(fFund = 60, fs = 5000, hrms = {1, 3, 5, 7, 9}, numPh = 1)  annotation(
    Placement(visible = true, transformation(origin = {-174, 86.5714}, extent = {{-16, -16}, {16, 11.4286}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource Vin(start_v_re = {120, 0, 0, 0, 0}, theta(fixed = true), vArg = {0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0})  annotation(
    Placement(visible = true, transformation(origin = {-160, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl PowerSupply1(P1(start = 12), Q1(start = 0), V_Rect = 19.92, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_LBNL_1.mat", nomP = 90, nomV = 120)  "HP P/N 608428-002" annotation(
    Placement(visible = true, transformation(origin = {-100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl PowerSupply2(P1(start = 12), Q1(start = 0), V_Rect = 19.51, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_LBNL_2.mat", nomP = 90, nomV = 120)  "HP P/N 677777-002" annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground GndAC annotation(
    Placement(visible = true, transformation(origin = {-160, -86}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground GndDC annotation(
    Placement(visible = true, transformation(origin = {102, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Load1(R = 32.7, T (displayUnit = "degC") = 296.15, T_ref (displayUnit = "degC") = 294.15, alpha = 0.000255, useHeatPort = true)  annotation(
    Placement(visible = true, transformation(origin = {80, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Load2(R = 32.7, T (displayUnit = "degC") = 296.15, T_ref (displayUnit = "degC") = 294.15, alpha = 0.000255, useHeatPort = true)  annotation(
    Placement(visible = true, transformation(origin = {80, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput UnconditionedZoneHeatGain annotation(
    Placement(visible = true, transformation(origin = {166, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {166, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature ConditionedZoneAir annotation(
    Placement(visible = true, transformation(origin = {134, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add FanSystemLoss annotation(
    Placement(visible = true, transformation(origin = {136, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput ConditionedZoneHeatGain annotation(
    Placement(visible = true, transformation(origin = {186, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {186, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ResistorLoss annotation(
    Placement(visible = true, transformation(origin = {136, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Add3 UnconditionedZoneTotalLoss annotation(
    Placement(visible = true, transformation(origin = {0, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl FanPowerSupply(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_1.mat", nomP = 25, nomV = 120) "P/N ??" annotation(
    Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Fan1(pwr = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {50, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Fan2(pwr = 0.5) annotation(
    Placement(visible = true, transformation(origin = {50, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ConditionedZoneTotalLoss annotation(
    Placement(visible = true, transformation(origin = {156, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor Load1_Power annotation(
    Placement(visible = true, transformation(origin = {50, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor Load2_Power annotation(
    Placement(visible = true, transformation(origin = {50, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor FanPower2 annotation(
    Placement(visible = true, transformation(origin = {0, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor FanPower1 annotation(
    Placement(visible = true, transformation(origin = {20, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput ConditionedZoneTemp annotation(
    Placement(visible = true, transformation(origin = {184, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0), iconTransformation(extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Trapezoid DummyZoneTemp(amplitude = 40, falling = 900, offset = 296, period = 3600, rising = 900, startTime = 900, width = 900)  annotation(
    Placement(visible = true, transformation(origin = {180, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(Load1.n, GndDC.p) annotation(
    Line(points = {{90, 46}, {102, 46}, {102, -80}}, color = {0, 0, 255}));
  connect(Load2.n, GndDC.p) annotation(
    Line(points = {{90, 6}, {102, 6}, {102, -80}}, color = {0, 0, 255}));
  connect(PowerSupply2.pin_n, GndDC.p) annotation(
    Line(points = {{-70, -6}, {102, -6}, {102, -80}}, color = {0, 0, 255}));
  connect(PowerSupply1.pin_n, GndDC.p) annotation(
    Line(points = {{-90, 34}, {102, 34}, {102, -80}}, color = {0, 0, 255}));
  connect(GndAC.pin, Vin.pin_n) annotation(
    Line(points = {{-160, -77}, {-160, -30}}, color = {92, 53, 102}));
  connect(ConditionedZoneAir.port, Load2.heatPort) annotation(
    Line(points = {{124, -80}, {112, -80}, {112, -20}, {80, -20}, {80, -4}}, color = {191, 0, 0}));
  connect(Load1.heatPort, ConditionedZoneAir.port) annotation(
    Line(points = {{80, 36}, {80, 21}, {112, 21}, {112, -80}, {124, -80}}, color = {191, 0, 0}));
  connect(Vin.pin_p, PowerSupply1.hPin_P) annotation(
    Line(points = {{-160, -10}, {-160, 46}, {-110, 46}}, color = {92, 53, 102}));
  connect(FanPowerSupply.pin_n, GndDC.p) annotation(
    Line(points = {{-50, -46}, {-40, -46}, {-40, -76}, {102, -76}, {102, -80}}, color = {0, 0, 255}));
  connect(Load1_Power.nv, PowerSupply1.pin_n) annotation(
    Line(points = {{50, 36}, {49.5, 36}, {49.5, 34}, {-90, 34}}, color = {0, 0, 255}));
  connect(Load1_Power.nc, Load1.p) annotation(
    Line(points = {{60, 46}, {70, 46}}, color = {0, 0, 255}));
  connect(Load1_Power.pc, PowerSupply1.pin_p) annotation(
    Line(points = {{40, 46}, {-90, 46}}, color = {0, 0, 255}));
  connect(Load1_Power.pv, PowerSupply1.pin_p) annotation(
    Line(points = {{50, 56}, {40, 56}, {40, 46}, {-90, 46}}, color = {0, 0, 255}));
  connect(Load2_Power.nc, Load2.p) annotation(
    Line(points = {{60, 6}, {70, 6}, {70, 6}, {70, 6}}, color = {0, 0, 255}));
  connect(Load2_Power.pc, PowerSupply2.pin_p) annotation(
    Line(points = {{40, 6}, {-70, 6}}, color = {0, 0, 255}));
  connect(Load2_Power.nv, PowerSupply2.pin_n) annotation(
    Line(points = {{50, -4}, {50, -6}, {-70, -6}}, color = {0, 0, 255}));
  connect(FanPower1.pc, FanPowerSupply.pin_p) annotation(
    Line(points = {{10, -62}, {-32, -62}, {-32, -34}, {-50, -34}}, color = {0, 0, 255}));
  connect(FanPower2.pc, FanPowerSupply.pin_p) annotation(
    Line(points = {{-10, -34}, {-50, -34}}, color = {0, 0, 255}));
  connect(FanPower2.pv, FanPower2.pc) annotation(
    Line(points = {{0, -24}, {-10, -24}, {-10, -34}}, color = {0, 0, 255}));
  connect(FanPower1.pv, FanPower1.pc) annotation(
    Line(points = {{20, -52}, {10, -52}, {10, -62}}, color = {0, 0, 255}));
  connect(FanPower2.nc, Fan2.p) annotation(
    Line(points = {{10, -34}, {40, -34}}, color = {0, 0, 255}));
  connect(FanPower1.nc, Fan1.p) annotation(
    Line(points = {{30, -62}, {40, -62}}, color = {0, 0, 255}));
  connect(FanPower1.nv, GndDC.p) annotation(
    Line(points = {{20, -72}, {20, -76}, {102, -76}, {102, -80}}, color = {0, 0, 255}));
  connect(Fan1.n, GndDC.p) annotation(
    Line(points = {{60, -62}, {102, -62}, {102, -80}}, color = {0, 0, 255}));
  connect(Fan2.n, GndDC.p) annotation(
    Line(points = {{60, -34}, {102, -34}, {102, -80}}, color = {0, 0, 255}));
  connect(ConditionedZoneTotalLoss.u1, ResistorLoss.y) annotation(
    Line(points = {{144, 6}, {136, 6}, {136, 20}, {136, 20}}, color = {0, 0, 127}));
  connect(ConditionedZoneTotalLoss.u2, FanSystemLoss.y) annotation(
    Line(points = {{144, -6}, {136, -6}, {136, -18}, {136, -18}}, color = {0, 0, 127}));
  connect(ConditionedZoneTotalLoss.y, ConditionedZoneHeatGain) annotation(
    Line(points = {{168, 0}, {176, 0}, {176, 0}, {186, 0}}, color = {0, 0, 127}));
  connect(UnconditionedZoneTotalLoss.y, UnconditionedZoneHeatGain) annotation(
    Line(points = {{11, 80}, {166, 80}}, color = {0, 0, 127}));
  connect(ResistorLoss.u2, Load1_Power.power) annotation(
    Line(points = {{130, 42}, {130, 42}, {130, 62}, {34, 62}, {34, 30}, {40, 30}, {40, 34}, {40, 34}}, color = {0, 0, 127}));
  connect(ResistorLoss.u1, Load2_Power.power) annotation(
    Line(points = {{142, 42}, {142, 42}, {142, 66}, {30, 66}, {30, -10}, {40, -10}, {40, -4}, {40, -4}}, color = {0, 0, 127}));
  connect(FanPowerSupply.PLoss, FanSystemLoss.u2) annotation(
    Line(points = {{-60, -28}, {-60, -24}, {-82, -24}, {-82, -88}, {82, -88}, {82, -56}, {142, -56}, {142, -42}}, color = {0, 0, 127}));
  connect(FanPower1.power, FanSystemLoss.u1) annotation(
    Line(points = {{10, -73}, {10, -84}, {78, -84}, {78, -52}, {130, -52}, {130, -42}}, color = {0, 0, 127}));
  connect(UnconditionedZoneTotalLoss.u3, FanPower2.power) annotation(
    Line(points = {{-12, 72}, {-24, 72}, {-24, -50}, {-10, -50}, {-10, -45}}, color = {0, 0, 127}));
  connect(PowerSupply1.PLoss, UnconditionedZoneTotalLoss.u1) annotation(
    Line(points = {{-100, 52}, {-100, 88}, {-12, 88}}, color = {0, 0, 127}));
  connect(PowerSupply2.PLoss, UnconditionedZoneTotalLoss.u2) annotation(
    Line(points = {{-80, 12}, {-80, 80}, {-12, 80}}, color = {0, 0, 127}));
  connect(FanPowerSupply.hPin_P, Vin.pin_p) annotation(
    Line(points = {{-70, -34}, {-140, -34}, {-140, 46}, {-160, 46}, {-160, -10}}, color = {92, 53, 102}));
  connect(PowerSupply1.hPin_N, Vin.pin_n) annotation(
    Line(points = {{-110, 34}, {-120, 34}, {-120, -46}, {-160, -46}, {-160, -30}}, color = {117, 80, 123}));
  connect(PowerSupply2.hPin_N, Vin.pin_n) annotation(
    Line(points = {{-90, -6}, {-120, -6}, {-120, -46}, {-160, -46}, {-160, -30}}, color = {117, 80, 123}));
  connect(FanPowerSupply.hPin_N, Vin.pin_n) annotation(
    Line(points = {{-70, -46}, {-160, -46}, {-160, -30}, {-160, -30}}, color = {117, 80, 123}));
  connect(PowerSupply2.hPin_P, Vin.pin_p) annotation(
    Line(points = {{-90, 6}, {-140, 6}, {-140, 46}, {-160, 46}, {-160, -10}, {-160, -10}, {-160, -10}}, color = {92, 53, 102}));
  connect(FanPower2.nv, GndDC.p) annotation(
    Line(points = {{0, -44}, {-1, -44}, {-1, -76}, {102, -76}, {102, -80}}, color = {0, 0, 255}));
  connect(Load2_Power.pv, Load2_Power.pc) annotation(
    Line(points = {{50, 16}, {40, 16}, {40, 6}, {40, 6}}, color = {0, 0, 255}));
  connect(DummyZoneTemp.y, ConditionedZoneAir.T) annotation(
    Line(points = {{168, -40}, {160, -40}, {160, -80}, {146, -80}, {146, -80}}, color = {0, 0, 127}));
  annotation(
    uses(HPF(version = "0.1.0-beta"), Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 129600, Tolerance = 1e-6, Interval = 60),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  version = "");
end Bench_Scale_Exp_9;
