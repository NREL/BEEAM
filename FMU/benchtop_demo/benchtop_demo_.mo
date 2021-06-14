model benchtop_demo
  inner HPF.SystemDef systemDef(fFund = 60, fs = 5000, hrms = {1, 3, 5, 7, 9}, numPh = 1)  annotation (
    Placement(visible = true, transformation(origin={-182,86.5714},    extent = {{-16, -16}, {16, 11.4286}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource Vin(start_v_re = {120, 0, 0, 0, 0}, vArg = {0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0})  annotation (
    Placement(visible = true, transformation(origin={-188,-20},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl PowerSupply1(P1(start = 12), Q1(start = 0), V_Rect = 19.92, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_LBNL_1.mat", nomP = 90, nomV = 120)  "HP P/N 608428-002" annotation (
    Placement(visible = true, transformation(origin={-128,40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl PowerSupply2(P1(start = 12), Q1(start = 0), V_Rect = 19.51, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Laptop_Charger_LBNL_2.mat", nomP = 90, nomV = 120)  "HP P/N 677777-002" annotation (
    Placement(visible = true, transformation(origin={-108,0},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground GndAC annotation (
    Placement(visible = true, transformation(origin={-188,-86},    extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground GndDC annotation (
    Placement(visible = true, transformation(origin={74,-90},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Load1(R = 32.7, T( displayUnit = "degC") = 296.15, T_ref( displayUnit = "degC") = 294.15, alpha = 0.000255, useHeatPort = true)  annotation (
    Placement(visible = true, transformation(origin={52,46},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Load2(R = 32.7, T( displayUnit = "degC") = 296.15, T_ref( displayUnit = "degC") = 294.15, alpha = 0.000255, useHeatPort = true)  annotation (
    Placement(visible = true, transformation(origin={52,6},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature ConditionedZoneAir annotation (
    Placement(visible = true, transformation(origin={106,-80},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add FanSystemLoss annotation (
    Placement(visible = true, transformation(origin={108,-30},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Add ResistorLoss annotation (
    Placement(visible = true, transformation(origin={108,30},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Add3 UnconditionedZoneTotalLoss annotation (
    Placement(visible = true, transformation(origin={-28,80},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl FanPowerSupply(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 5, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/LED_Driver_1.mat", nomP = 25, nomV = 120) "P/N ??" annotation (
    Placement(visible = true, transformation(origin={-88,-40},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Fan1(pwr = 0.5)  annotation (
    Placement(visible = true, transformation(origin={22,-62},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.DC_Load Fan2(pwr = 0.5) annotation (
    Placement(visible = true, transformation(origin={22,-34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add ConditionedZoneTotalLoss annotation (
    Placement(visible = true, transformation(origin={128,0},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor Load1_Power annotation (
    Placement(visible = true, transformation(origin={22,46},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor Load2_Power annotation (
    Placement(visible = true, transformation(origin={22,6},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor FanPower2 annotation (
    Placement(visible = true, transformation(origin={-28,-34},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor FanPower1 annotation (
    Placement(visible = true, transformation(origin={-8,-62},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{156,-92},{136,-72}})));
  Modelica.Blocks.Sources.Constant const(k=273.15)
    annotation (Placement(transformation(extent={{132,-52},{152,-32}})));
  'in_fmu' 'in_fmu1'(fmi_StopTime=345600, fmi_NumberOfSteps=5760)
    annotation (Placement(transformation(extent={{164,50},{184,70}})));
equation
  connect(Load1.n, GndDC.p) annotation (
    Line(points={{62,46},{74,46},{74,-80}},          color = {0, 0, 255}));
  connect(Load2.n, GndDC.p) annotation (
    Line(points={{62,6},{74,6},{74,-80}},          color = {0, 0, 255}));
  connect(PowerSupply2.pin_n, GndDC.p) annotation (
    Line(points={{-98,-8},{74,-8},{74,-80}},          color = {0, 0, 255}));
  connect(PowerSupply1.pin_n, GndDC.p) annotation (
    Line(points={{-118,32},{74,32},{74,-80}},         color = {0, 0, 255}));
  connect(GndAC.pin, Vin.pin_n) annotation (
    Line(points={{-188,-78},{-188,-30}},      color = {92, 53, 102}));
  connect(ConditionedZoneAir.port, Load2.heatPort) annotation (
    Line(points={{96,-80},{84,-80},{84,-20},{52,-20},{52,-4}},               color = {191, 0, 0}));
  connect(Load1.heatPort, ConditionedZoneAir.port) annotation (
    Line(points={{52,36},{52,21},{84,21},{84,-80},{96,-80}},               color = {191, 0, 0}));
  connect(Vin.pin_p, PowerSupply1.hPin_P) annotation (
    Line(points={{-188,-10},{-188,48},{-138,48}},        color = {92, 53, 102}));
  connect(FanPowerSupply.pin_n, GndDC.p) annotation (
    Line(points={{-78,-48},{-68,-48},{-68,-76},{74,-76},{74,-80}},              color = {0, 0, 255}));
  connect(Load1_Power.nv, PowerSupply1.pin_n) annotation (
    Line(points={{22,36},{21.5,36},{21.5,32},{-118,32}},         color = {0, 0, 255}));
  connect(Load1_Power.nc, Load1.p) annotation (
    Line(points={{32,46},{42,46}},      color = {0, 0, 255}));
  connect(Load1_Power.pc, PowerSupply1.pin_p) annotation (
    Line(points={{12,46},{-54,46},{-54,48},{-118,48}},
                                         color = {0, 0, 255}));
  connect(Load1_Power.pv, PowerSupply1.pin_p) annotation (
    Line(points={{22,56},{12,56},{12,48},{-118,48}},         color = {0, 0, 255}));
  connect(Load2_Power.nc, Load2.p) annotation (
    Line(points={{32,6},{42,6}},                        color = {0, 0, 255}));
  connect(Load2_Power.pc, PowerSupply2.pin_p) annotation (
    Line(points={{12,6},{-44,6},{-44,8},{-98,8}},
                                       color = {0, 0, 255}));
  connect(Load2_Power.nv, PowerSupply2.pin_n) annotation (
    Line(points={{22,-4},{22,-8},{-98,-8}},        color = {0, 0, 255}));
  connect(FanPower1.pc, FanPowerSupply.pin_p) annotation (
    Line(points={{-18,-62},{-60,-62},{-60,-32},{-78,-32}},         color = {0, 0, 255}));
  connect(FanPower2.pc, FanPowerSupply.pin_p) annotation (
    Line(points={{-38,-34},{-58,-34},{-58,-32},{-78,-32}},
                                            color = {0, 0, 255}));
  connect(FanPower2.pv, FanPower2.pc) annotation (
    Line(points={{-28,-24},{-38,-24},{-38,-34}},      color = {0, 0, 255}));
  connect(FanPower1.pv, FanPower1.pc) annotation (
    Line(points={{-8,-52},{-18,-52},{-18,-62}},      color = {0, 0, 255}));
  connect(FanPower2.nc, Fan2.p) annotation (
    Line(points={{-18,-34},{12,-34}},     color = {0, 0, 255}));
  connect(FanPower1.nc, Fan1.p) annotation (
    Line(points={{2,-62},{12,-62}},       color = {0, 0, 255}));
  connect(FanPower1.nv, GndDC.p) annotation (
    Line(points={{-8,-72},{-8,-76},{74,-76},{74,-80}},            color = {0, 0, 255}));
  connect(Fan1.n, GndDC.p) annotation (
    Line(points={{32,-62},{74,-62},{74,-80}},          color = {0, 0, 255}));
  connect(Fan2.n, GndDC.p) annotation (
    Line(points={{32,-34},{74,-34},{74,-80}},          color = {0, 0, 255}));
  connect(ConditionedZoneTotalLoss.u1, ResistorLoss.y) annotation (
    Line(points={{116,6},{108,6},{108,19}},                   color = {0, 0, 127}));
  connect(ConditionedZoneTotalLoss.u2, FanSystemLoss.y) annotation (
    Line(points={{116,-6},{108,-6},{108,-19}},                    color = {0, 0, 127}));
  connect(ResistorLoss.u2, Load1_Power.power) annotation (
    Line(points={{102,42},{102,62},{6,62},{6,30},{12,30},{12,35}},                                     color = {0, 0, 127}));
  connect(ResistorLoss.u1, Load2_Power.power) annotation (
    Line(points={{114,42},{114,66},{2,66},{2,-10},{12,-10},{12,-5}},                                     color = {0, 0, 127}));
  connect(FanPowerSupply.PLoss, FanSystemLoss.u2) annotation (
    Line(points={{-88,-29},{-88,-24},{-110,-24},{-110,-88},{54,-88},{54,-56},{
          114,-56},{114,-42}},                                                                                    color = {0, 0, 127}));
  connect(FanPower1.power, FanSystemLoss.u1) annotation (
    Line(points={{-18,-73},{-18,-84},{50,-84},{50,-52},{102,-52},{102,-42}},            color = {0, 0, 127}));
  connect(UnconditionedZoneTotalLoss.u3, FanPower2.power) annotation (
    Line(points={{-40,72},{-52,72},{-52,-50},{-38,-50},{-38,-45}},            color = {0, 0, 127}));
  connect(PowerSupply1.PLoss, UnconditionedZoneTotalLoss.u1) annotation (
    Line(points={{-128,51},{-128,88},{-40,88}},        color = {0, 0, 127}));
  connect(PowerSupply2.PLoss, UnconditionedZoneTotalLoss.u2) annotation (
    Line(points={{-108,11},{-108,80},{-40,80}},      color = {0, 0, 127}));
  connect(FanPowerSupply.hPin_P, Vin.pin_p) annotation (
    Line(points={{-98,-32},{-168,-32},{-168,46},{-188,46},{-188,-10}},            color = {92, 53, 102}));
  connect(PowerSupply1.hPin_N, Vin.pin_n) annotation (
    Line(points={{-138,32},{-148,32},{-148,-46},{-188,-46},{-188,-30}},            color = {117, 80, 123}));
  connect(PowerSupply2.hPin_N, Vin.pin_n) annotation (
    Line(points={{-118,-8},{-148,-8},{-148,-46},{-188,-46},{-188,-30}},           color = {117, 80, 123}));
  connect(FanPowerSupply.hPin_N, Vin.pin_n) annotation (
    Line(points={{-98,-48},{-188,-48},{-188,-30}},                     color = {117, 80, 123}));
  connect(PowerSupply2.hPin_P, Vin.pin_p) annotation (
    Line(points={{-118,8},{-168,8},{-168,46},{-188,46},{-188,-10}},                                     color = {92, 53, 102}));
  connect(FanPower2.nv, GndDC.p) annotation (
    Line(points={{-28,-44},{-29,-44},{-29,-76},{74,-76},{74,-80}},          color = {0, 0, 255}));
  connect(Load2_Power.pv, Load2_Power.pc) annotation (
    Line(points={{22,16},{12,16},{12,6}},                 color = {0, 0, 255}));
  connect(add.y, ConditionedZoneAir.T) annotation (Line(points={{135,-82},{126,
          -82},{126,-80},{118,-80}}, color={0,0,127}));
  connect(const.y, add.u1) annotation (Line(points={{153,-42},{176,-42},{176,
          -76},{158,-76}}, color={0,0,127}));
  connect(UnconditionedZoneTotalLoss.y, 'in_fmu1'.plenum_space_load)
    annotation (Line(points={{-17,80},{148,80},{148,63.4},{163.6,63.4}}, color={
          0,0,127}));
  connect(ConditionedZoneTotalLoss.y, 'in_fmu1'.conditioned_space_load)
    annotation (Line(points={{139,0},{146,0},{146,56.7},{163.6,56.7}}, color={0,
          0,127}));
  connect('in_fmu1'.conditioned_zone_temp, add.u2) annotation (Line(points={{184,
          60},{192,60},{192,-88},{158,-88}}, color={0,0,127}));
  annotation (
    uses(HPF(version = "0.1.0-beta"), Modelica(version = "3.2.3")),
    experiment(
      StopTime=345600,
      Interval=60,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=60,
      __Dymola_Algorithm="Euler"),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  version = "");
end benchtop_demo;
