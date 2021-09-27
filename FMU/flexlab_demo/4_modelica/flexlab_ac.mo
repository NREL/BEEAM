within ;
model flexlab_ac_Cable
  inner HPF.SystemDef systemDef(fFund = 60, fs = 5000, hrms = {1, 3, 5, 7, 9}, numPh = 1)  annotation (
    Placement(visible = true, transformation(origin={-182,86.5714},    extent = {{-16, -16}, {16, 11.4286}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource Vin(start_v_re = {120, 0, 0, 0, 0}, vArg = {0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0})  annotation (
    Placement(visible = true, transformation(origin={-6,90},   extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground GndAC annotation (
    Placement(visible = true, transformation(origin={-40,90},    extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  HPF.DC.Variable_DC_Load Light_1 annotation (
    Placement(visible = true, transformation(origin = {-88, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Ground GndDC annotation (
    Placement(visible = true, transformation(origin = {136, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_1 annotation (
    Placement(visible = true, transformation(origin = {91, 83}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Light_2 annotation (
    Placement(visible = true, transformation(origin = {-90, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_3 annotation (
    Placement(visible = true, transformation(origin = {-92, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_4 annotation (
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_5 annotation (
    Placement(visible = true, transformation(origin = {-86, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_6 annotation (
    Placement(visible = true, transformation(origin = {-86, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_2 annotation (
    Placement(visible = true, transformation(origin = {91, 51}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_3 annotation (
    Placement(visible = true, transformation(origin = {93, 21}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_4 annotation (
    Placement(visible = true, transformation(origin = {96, -16}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_5 annotation (
    Placement(visible = true, transformation(origin = {95, -47}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_6 annotation (
    Placement(visible = true, transformation(origin = {100, -76}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS1(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {54, 80}, extent = {{-8, -6}, {8, 6}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS3(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {57, 19}, extent = {{-9, -7}, {9, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS2(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {56, 51}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS5(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {58, -46}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS6(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {60, -77}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS4(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {56, -16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_1(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {-50, 73}, extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_2(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {-52, 47}, extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_3(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {-52, 20}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_4(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {-51, -7}, extent = {{9, -7}, {-9, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_5(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {-52, -35}, extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_6(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {-52, -65}, extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation (
    Placement(visible = true, transformation(origin = {-169, 5}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add add1 annotation (
    Placement(visible = true, transformation(origin = {-162, -40}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Math.Add add2 annotation (
    Placement(visible = true, transformation(origin = {-173, 49}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add3 Plenum annotation (
    Placement(visible = true, transformation(origin = {-187, -51}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add add4 annotation (
    Placement(visible = true, transformation(origin = {145, 45}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add add5 annotation (
    Placement(visible = true, transformation(origin = {155, 1}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add add6 annotation (
    Placement(visible = true, transformation(origin = {151, -57}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add3 Cond_Space annotation (
    Placement(visible = true, transformation(origin = {187, -77}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant No_Loads(k = 6) annotation (
    Placement(visible = true, transformation(origin = {186, 48}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation (
    Placement(visible = true, transformation(origin = {150, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation (
    Placement(visible = true, transformation(origin = {-119, 89}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  'in_fmu' 'in_fmu1'(
    fmi_StartTime=27216000,
    fmi_StopTime=27734400,
    fmi_NumberOfSteps=576)
    annotation (Placement(transformation(extent={{-8,-126},{12,-106}})));
  Modelica.Blocks.Sources.Constant DCHUB(k=0)
    annotation (Placement(transformation(extent={{-76,-138},{-56,-118}})));
  HPF.Cables.NEC_CableModel nEC_CableModel(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=15.24)
    annotation (Placement(transformation(extent={{10,68},{30,88}})));
  HPF.Cables.NEC_CableModel nEC_CableModel1(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=15.24)
    annotation (Placement(transformation(extent={{16,46},{36,66}})));
  HPF.Cables.NEC_CableModel nEC_CableModel2(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=15.24)
    annotation (Placement(transformation(extent={{14,16},{34,36}})));
  HPF.Cables.NEC_CableModel nEC_CableModel3(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=15.24)
    annotation (Placement(transformation(extent={{14,-20},{34,0}})));
  HPF.Cables.NEC_CableModel nEC_CableModel4(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=15.24)
    annotation (Placement(transformation(extent={{20,-50},{40,-30}})));
  HPF.Cables.NEC_CableModel nEC_CableModel5(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=15.24)
    annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
  HPF.Cables.NEC_CableModel nEC_CableModel6(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-10,68},{-30,88}})));
  HPF.Cables.NEC_CableModel nEC_CableModel7(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-14,42},{-34,62}})));
  HPF.Cables.NEC_CableModel nEC_CableModel8(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-14,16},{-34,36}})));
  HPF.Cables.NEC_CableModel nEC_CableModel9(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-12,-10},{-32,10}})));
  HPF.Cables.NEC_CableModel nEC_CableModel10(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-12,-38},{-32,-18}})));
  HPF.Cables.NEC_CableModel nEC_CableModel11(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-12,-70},{-32,-50}})));
equation
  connect(Vin.pin_n, GndAC.pin) annotation (
    Line(points={{-16,90},{-32,90}},     color = {117, 80, 123}));
  connect(Desk_PS1.pin_p, Prog_DC_Ld_1.p) annotation (
    Line(points={{62,84.8},{71,84.8},{71,83},{80,83}},      color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.p, Desk_PS2.pin_p) annotation (
    Line(points={{80,51},{79,51},{79,56.6},{64,56.6}},      color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.p, Desk_PS4.pin_p) annotation (
    Line(points={{84,-16},{73,-16},{73,-9.6},{64,-9.6}},        color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.p, Desk_PS5.pin_p) annotation (
    Line(points={{84,-47},{84,-39.6},{66,-39.6}},    color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.p, Desk_PS6.pin_p) annotation (
    Line(points={{88,-76},{78,-76},{78,-71.4},{68,-71.4}},      color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.p, Desk_PS3.pin_p) annotation (
    Line(points={{82,21},{83,21},{83,24.6},{66,24.6}},      color = {0, 0, 255}));
  connect(Light_1.p, Driver_1.pin_p) annotation (
    Line(points={{-78,78},{-69,78},{-69,78.6},{-58,78.6}},      color = {0, 0, 255}));
  connect(Driver_2.pin_p, Light_2.p) annotation (
    Line(points={{-60,52.6},{-70,52.6},{-70,52},{-80,52}},      color = {0, 0, 255}));
  connect(Light_3.p, Driver_3.pin_p) annotation (
    Line(points={{-82,28},{-72,28},{-72,26.4},{-60,26.4}},      color = {0, 0, 255}));
  connect(Light_4.p, Driver_4.pin_p) annotation (
    Line(points={{-80,0},{-70,0},{-70,-1.4},{-60,-1.4}},      color = {0, 0, 255}));
  connect(Light_5.p, Driver_5.pin_p) annotation (
    Line(points={{-76,-30},{-67,-30},{-67,-29.4},{-60,-29.4}},      color = {0, 0, 255}));
  connect(Light_6.p, Driver_6.pin_p) annotation (
    Line(points={{-76,-60},{-68,-60},{-68,-59.4},{-60,-59.4}},      color = {0, 0, 255}));
  connect(Desk_PS1.hPin_P, Vin.pin_p) annotation (
    Line(points={{46,84.8},{4,84.8},{4,90}},      color = {92, 53, 102}));
  connect(Desk_PS6.hPin_N, Vin.pin_n) annotation (
    Line(points={{52,-82.6},{-16,-82.6},{-16,90}},  color = {117, 80, 123}));
  connect(Driver_1.hPin_N, Vin.pin_n) annotation (
    Line(points={{-42,67.4},{-16,67.4},{-16,90}},  color = {117, 80, 123}));
  connect(Driver_2.hPin_N, Vin.pin_n) annotation (
    Line(points={{-44,41.4},{-16,41.4},{-16,90}},  color = {117, 80, 123}));
  connect(Driver_3.hPin_N, Vin.pin_n) annotation (
    Line(points={{-44,13.6},{-16,13.6},{-16,90}},  color = {117, 80, 123}));
  connect(Driver_4.hPin_N, Vin.pin_n) annotation (
    Line(points={{-42,-12.6},{-16,-12.6},{-16,90}},  color = {117, 80, 123}));
  connect(Driver_5.hPin_N, Vin.pin_n) annotation (
    Line(points={{-44,-40.6},{-16,-40.6},{-16,90}},  color = {117, 80, 123}));
  connect(Driver_6.hPin_N, Vin.pin_n) annotation (
    Line(points={{-44,-70.6},{-16,-70.6},{-16,90}},  color = {117, 80, 123}));
  connect(Light_1.n, GndDC.p) annotation (
    Line(points = {{-98, 78}, {-134, 78}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.n, GndDC.p) annotation (
    Line(points = {{112, -76}, {117, -76}, {117, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.n, GndDC.p) annotation (
    Line(points={{106,-47},{126,-47},{126,-90}},        color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.n, GndDC.p) annotation (
    Line(points={{104,21},{126,21},{126,-90}},        color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.n, GndDC.p) annotation (
    Line(points={{102,51},{126,51},{126,-90}},        color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.n, GndDC.p) annotation (
    Line(points = {{108, -16}, {126, -16}, {126, -90}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_1.n, GndDC.p) annotation (
    Line(points={{102,83},{126,83},{126,-90}},        color = {0, 0, 255}));
  connect(Desk_PS6.pin_n, GndDC.p) annotation (
    Line(points={{68,-82.6},{80,-82.6},{80,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Desk_PS5.pin_n, GndDC.p) annotation (
    Line(points={{66,-52.4},{76,-52.4},{76,-60},{126,-60},{126,-90}},        color = {0, 0, 255}));
  connect(Desk_PS4.pin_n, GndDC.p) annotation (
    Line(points={{64,-22.4},{74,-22.4},{74,-34},{126,-34},{126,-90}},        color = {0, 0, 255}));
  connect(Desk_PS1.hPin_N, Vin.pin_n) annotation (
    Line(points={{46,75.2},{-16,75.2},{-16,90}},  color = {117, 80, 123}));
  connect(Desk_PS2.hPin_N, Vin.pin_n) annotation (
    Line(points={{48,45.4},{-16,45.4},{-16,90}},  color = {117, 80, 123}));
  connect(Desk_PS3.hPin_N, Vin.pin_n) annotation (
    Line(points={{48,13.4},{-16,13.4},{-16,90}},  color = {117, 80, 123}));
  connect(Desk_PS4.hPin_N, Vin.pin_n) annotation (
    Line(points={{48,-22.4},{-16,-22.4},{-16,90}},  color = {117, 80, 123}));
  connect(Desk_PS5.hPin_N, Vin.pin_n) annotation (
    Line(points={{50,-52.4},{-16,-52.4},{-16,90}},  color = {117, 80, 123}));
  connect(Light_6.n, GndDC.p) annotation (
    Line(points = {{-96, -60}, {-134, -60}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Light_2.n, GndDC.p) annotation (
    Line(points = {{-100, 52}, {-134, 52}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Light_5.n, GndDC.p) annotation (
    Line(points = {{-96, -30}, {-134, -30}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Light_4.n, GndDC.p) annotation (
    Line(points = {{-100, 0}, {-134, 0}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Light_3.n, GndDC.p) annotation (
    Line(points = {{-102, 28}, {-134, 28}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Driver_1.pin_n, GndDC.p) annotation (
    Line(points={{-58,67.4},{-134,67.4},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Driver_3.pin_n, GndDC.p) annotation (
    Line(points={{-60,13.6},{-134,13.6},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Driver_2.pin_n, GndDC.p) annotation (
    Line(points={{-60,41.4},{-134,41.4},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Driver_4.pin_n, GndDC.p) annotation (
    Line(points={{-60,-12.6},{-134,-12.6},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Driver_5.pin_n, GndDC.p) annotation (
    Line(points={{-60,-40.6},{-134,-40.6},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Driver_6.pin_n, GndDC.p) annotation (
    Line(points={{-60,-70.6},{-134,-70.6},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Desk_PS3.pin_n, GndDC.p) annotation (
    Line(points={{66,13.4},{126,13.4},{126,-90}},    color = {0, 0, 255}));
  connect(Desk_PS2.pin_n, GndDC.p) annotation (
    Line(points={{64,45.4},{126,45.4},{126,-90}},    color = {0, 0, 255}));
  connect(Desk_PS1.pin_n, GndDC.p) annotation (
    Line(points={{62,75.2},{126,75.2},{126,-90}},    color = {0, 0, 255}));
  connect(Driver_3.PLoss, add.u2) annotation (
    Line(points={{-52,28.8},{-173.2,28.8},{-173.2,13.4}},
                                                       color = {0, 0, 127}));
  connect(Driver_4.PLoss, add.u1) annotation (
    Line(points={{-51,0.7},{-164.8,0.7},{-164.8,13.4}},
                                                     color = {0, 0, 127}));
  connect(Driver_5.PLoss, add1.u2) annotation (
    Line(points={{-52,-27.3},{-165.6,-27.3},{-165.6,-32.8}},
                                                          color = {0, 0, 127}));
  connect(Driver_6.PLoss, add1.u1) annotation (
    Line(points={{-52,-57.3},{-158.4,-57.3},{-158.4,-32.8}},
                                                          color = {0, 0, 127}));
  connect(Driver_1.PLoss, add2.u2) annotation (
    Line(points={{-50,80.7},{-177.2,80.7},{-177.2,57.4}},
                                                       color = {0, 0, 127}));
  connect(Driver_2.PLoss, add2.u1) annotation (
    Line(points={{-52,54.7},{-168.8,54.7},{-168.8,57.4}},
                                                       color = {0, 0, 127}));
  connect(add2.y, Plenum.u3) annotation (
    Line(points={{-173,41.3},{-192.6,41.3},{-192.6,-42.6}},
                                                         color = {0, 0, 127}));
  connect(add.y, Plenum.u2) annotation (
    Line(points={{-169,-2.7},{-187,-2.7},{-187,-42.6}},  color = {0, 0, 127}));
  connect(add1.y, Plenum.u1) annotation (
    Line(points={{-162,-46.6},{-181.4,-46.6},{-181.4,-42.6}},
                                                           color = {0, 0, 127}));
  connect(add6.y, Cond_Space.u1) annotation (
    Line(points={{151,-64.7},{192.6,-64.7},{192.6,-68.6}},
                                                        color = {0, 0, 127}));
  connect(add5.y, Cond_Space.u2) annotation (
    Line(points={{155,-6.7},{187,-6.7},{187,-68.6}},  color = {0, 0, 127}));
  connect(add4.y, Cond_Space.u3) annotation (
    Line(points={{145,37.3},{181.4,37.3},{181.4,-68.6}},
                                                      color = {0, 0, 127}));
  connect(Desk_PS6.PLoss, add6.u2) annotation (
    Line(points={{60,-69.3},{146.8,-69.3},{146.8,-48.6}},
                                                       color = {0, 0, 127}));
  connect(Desk_PS5.PLoss, add6.u1) annotation (
    Line(points={{58,-37.2},{155.2,-37.2},{155.2,-48.6}},
                                                       color = {0, 0, 127}));
  connect(Desk_PS4.PLoss, add5.u2) annotation (
    Line(points={{56,-7.2},{150.8,-7.2},{150.8,9.4}},
                                                    color = {0, 0, 127}));
  connect(Desk_PS3.PLoss, add5.u1) annotation (
    Line(points={{57,26.7},{159.2,26.7},{159.2,9.4}},
                                                    color = {0, 0, 127}));
  connect(Desk_PS2.PLoss, add4.u2) annotation (
    Line(points={{56,58.7},{140.8,58.7},{140.8,53.4}},
                                                    color = {0, 0, 127}));
  connect(Desk_PS1.PLoss, add4.u1) annotation (
    Line(points={{54,86.6},{149.2,86.6},{149.2,53.4}},
                                                    color = {0, 0, 127}));
  connect(No_Loads.y, division.u2) annotation (
    Line(points={{177.2,48},{162,48},{162,70}},      color = {0, 0, 127}));
  connect(division.y, Prog_DC_Ld_1.u) annotation (
    Line(points={{139,76},{91.22,76},{91.22,88.5}},color = {0, 0, 127}));
  connect(Prog_DC_Ld_2.u, division.y) annotation (
    Line(points={{91.22,56.5},{139,56.5},{139,76}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_3.u, division.y) annotation (
    Line(points={{93.22,26.5},{139,26.5},{139,76}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_4.u, division.y) annotation (
    Line(points={{96.24,-10},{139,-10},{139,76}},     color = {0, 0, 127}));
  connect(Prog_DC_Ld_3.u, division.y) annotation (
    Line(points={{93.22,26.5},{139,26.5},{139,76}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_5.u, division.y) annotation (
    Line(points={{95.22,-41.5},{139,-41.5},{139,76}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_6.u, division.y) annotation (
    Line(points={{100.24,-70},{139,-70},{139,76}},     color = {0, 0, 127}));
  connect(division1.u2, No_Loads.y) annotation (
    Line(points={{-110.6,84.8},{177.2,84.8},{177.2,48}},
                                                      color = {0, 0, 127}));
  connect(division1.y, Light_6.u) annotation (
    Line(points={{-126.7,89},{-150,89},{-150,-65},{-86.2,-65}},      color = {0, 0, 127}));
  connect(Light_5.u, division1.y) annotation (
    Line(points={{-86.2,-35},{-150,-35},{-150,89},{-126.7,89}},      color = {0, 0, 127}));
  connect(Light_4.u, division1.y) annotation (
    Line(points={{-90.2,-5},{-150,-5},{-150,89},{-126.7,89}},      color = {0, 0, 127}));
  connect(Light_3.u, division1.y) annotation (
    Line(points={{-92.2,23},{-150,23},{-150,89},{-126.7,89}},      color = {0, 0, 127}));
  connect(Light_2.u, division1.y) annotation (
    Line(points={{-90.2,47},{-150,47},{-150,89},{-126.7,89}},      color = {0, 0, 127}));
  connect(Light_1.u, division1.y) annotation (
    Line(points={{-88.2,73},{-150,73},{-150,89},{-126.7,89}},      color = {0, 0, 127}));
  connect(Plenum.y, 'in_fmu1'.PlnmBLightsDriver) annotation (Line(points={{-187,
          -58.7},{-187,-111},{-8.4,-111}}, color={0,0,127}));
  connect(Cond_Space.y, 'in_fmu1'.ZoneBPlugsConverters) annotation (Line(points=
         {{187,-84.7},{187,-100},{-18,-100},{-18,-116},{-8.4,-116}}, color={0,0,
          127}));
  connect(DCHUB.y, 'in_fmu1'.PlnmBDCHub) annotation (Line(points={{-55,-128},{
          -32,-128},{-32,-121},{-8.4,-121}}, color={0,0,127}));
  connect('in_fmu1'.ZoneB_plugs_heating_rate, division.u1) annotation (Line(
        points={{12,-116},{208,-116},{208,82},{162,82}}, color={0,0,127}));
  connect('in_fmu1'.ZoneB_light_heating_rate, division1.u1) annotation (Line(
        points={{12,-116},{20,-116},{20,93.2},{-110.6,93.2}}, color={0,0,127}));
  connect(nEC_CableModel5.pin_n, Desk_PS6.hPin_P) annotation (Line(points={{40,
          -70},{46,-70},{46,-71.4},{52,-71.4}}, color={117,80,123}));
  connect(nEC_CableModel4.pin_n, Desk_PS5.hPin_P) annotation (Line(points={{40,
          -40},{46,-40},{46,-39.6},{50,-39.6}}, color={117,80,123}));
  connect(nEC_CableModel3.pin_n, Desk_PS4.hPin_P) annotation (Line(points={{34,
          -10},{42,-10},{42,-9.6},{48,-9.6}}, color={117,80,123}));
  connect(nEC_CableModel2.pin_n, Desk_PS3.hPin_P) annotation (Line(points={{34,
          26},{40,26},{40,24.6},{48,24.6}}, color={117,80,123}));
  connect(nEC_CableModel1.pin_n, Desk_PS2.hPin_P) annotation (Line(points={{36,
          56},{42,56},{42,56.6},{48,56.6}}, color={117,80,123}));
  connect(nEC_CableModel.pin_n, Desk_PS1.hPin_P) annotation (Line(points={{30,
          78},{36,78},{36,82},{46,82},{46,84.8}}, color={117,80,123}));
  connect(nEC_CableModel.pin_p, Vin.pin_p) annotation (Line(points={{10,78},{6,
          78},{6,90},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel1.pin_p, Vin.pin_p) annotation (Line(points={{16,56},{
          10,56},{10,58},{4,58},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel2.pin_p, Vin.pin_p) annotation (Line(points={{14,26},{8,
          26},{8,66},{4,66},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel3.pin_p, Vin.pin_p) annotation (Line(points={{14,-10},{
          8,-10},{8,0},{4,0},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel4.pin_p, Vin.pin_p) annotation (Line(points={{20,-40},{
          12,-40},{12,90},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel5.pin_p, Vin.pin_p) annotation (Line(points={{20,-70},{
          12,-70},{12,-62},{4,-62},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel11.pin_n, Driver_6.hPin_P) annotation (Line(points={{
          -32,-60},{-38,-60},{-38,-59.4},{-44,-59.4}}, color={117,80,123}));
  connect(nEC_CableModel10.pin_n, Driver_5.hPin_P) annotation (Line(points={{
          -32,-28},{-36,-28},{-36,-29.4},{-44,-29.4}}, color={117,80,123}));
  connect(nEC_CableModel9.pin_n, Driver_4.hPin_P)
    annotation (Line(points={{-32,0},{-42,0},{-42,-1.4}}, color={117,80,123}));
  connect(nEC_CableModel8.pin_n, Driver_3.hPin_P) annotation (Line(points={{-34,
          26},{-40,26},{-40,26.4},{-44,26.4}}, color={117,80,123}));
  connect(nEC_CableModel7.pin_n, Driver_2.hPin_P) annotation (Line(points={{-34,
          52},{-40,52},{-40,52.6},{-44,52.6}}, color={117,80,123}));
  connect(nEC_CableModel6.pin_n, Driver_1.hPin_P) annotation (Line(points={{-30,
          78},{-36,78},{-36,78.6},{-42,78.6}}, color={117,80,123}));
  connect(nEC_CableModel6.pin_p, Vin.pin_p)
    annotation (Line(points={{-10,78},{4,78},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel7.pin_p, Vin.pin_p) annotation (Line(points={{-14,52},{
          -8,52},{-8,56},{4,56},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel8.pin_p, Vin.pin_p) annotation (Line(points={{-14,26},{
          -8,26},{-8,32},{4,32},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel9.pin_p, Vin.pin_p) annotation (Line(points={{-12,0},{
          -4,0},{-4,66},{4,66},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel10.pin_p, Vin.pin_p) annotation (Line(points={{-12,-28},
          {-6,-28},{-6,-20},{4,-20},{4,90}}, color={92,53,102}));
  connect(nEC_CableModel11.pin_p, Vin.pin_p) annotation (Line(points={{-12,-60},
          {-8,-60},{-8,-54},{4,-54},{4,90}}, color={92,53,102}));
  annotation (
    uses(HPF(version = "0.1.0-beta"), Modelica(version = "3.2.3")),
    experiment(
      StartTime=27216000,
      StopTime=27734400,
      Interval=900,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=900,
      __Dymola_Algorithm="Euler"),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics={  Text(origin = {-196, -54}, rotation = 90, extent = {{-37, -5}, {37, 5}}, textString = "Heat Gain To E+ (Plenum)"), Text(origin = {173, -55}, rotation = 90, extent = {{-42, -10}, {42, 10}}, textString = "Heat Gain To E+ (Cond Space)"), Text(origin = {-74, -84}, extent = {{-64, -10}, {64, 10}}, textString = "Individual Lights will have Power In from E+"), Text(origin = {94, 94}, extent = {{-64, -10}, {64, 10}}, textString = "Individual Prog DC Load will have Power in from E+")}),
  Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  version = "");
end flexlab_ac_Cable;
