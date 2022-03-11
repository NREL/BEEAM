within ;
model flexlab_ac_Cable
  inner HPF.SystemDef systemDef(fFund = 60, fs = 5000, hrms = {1, 3, 5, 7, 9}, numPh = 1)  annotation (
    Placement(visible = true, transformation(origin={-260,142.07},     extent={{
            -20.0002,-19.5014},{20.0002,13.9299}},                                                           rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource Vin(start_v_re = {120, 0, 0, 0, 0}, vArg = {0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0})  annotation (
    Placement(visible = true, transformation(origin={-10,130}, extent={{14,-14},
            {-14,14}},                                                                          rotation = 0)));
  HPF.SinglePhase.Components.Ground GndAC annotation (
    Placement(visible = true, transformation(origin={-44,134},   extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  HPF.DC.Variable_DC_Load Light_1 annotation (
    Placement(visible = true, transformation(origin={-134,80},   extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Ground GndDC annotation (
    Placement(visible = true, transformation(origin={144,114},    extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_1 annotation (
    Placement(visible = true, transformation(origin = {91, 83}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Light_2 annotation (
    Placement(visible = true, transformation(origin={-134,50},   extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_3 annotation (
    Placement(visible = true, transformation(origin={-136,22},   extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_4 annotation (
    Placement(visible = true, transformation(origin={-132,-16}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_5 annotation (
    Placement(visible = true, transformation(origin={-132,-52},   extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_6 annotation (
    Placement(visible = true, transformation(origin={-138,-88},   extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_2 annotation (
    Placement(visible = true, transformation(origin={89,53},    extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_3 annotation (
    Placement(visible = true, transformation(origin = {93, 21}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_4 annotation (
    Placement(visible = true, transformation(origin = {96, -16}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_5 annotation (
    Placement(visible = true, transformation(origin={95,-51},    extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_6 annotation (
    Placement(visible = true, transformation(origin={102,-84},    extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS1(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={60,78},    extent = {{-8, -6}, {8, 6}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS3(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={55,17},    extent = {{-9, -7}, {9, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS2(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {56, 51}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS5(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={60,-54},    extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS6(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={58,-89},    extent = {{-8, -7}, {8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS4(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation (
    Placement(visible = true, transformation(origin = {56, -16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_1(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={-88,77},    extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_2(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={-92,45},    extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_3(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={-92,18},    extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_4(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={-89,-21},   extent = {{9, -7}, {-9, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_5(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={-88,-57},    extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_6(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation (
    Placement(visible = true, transformation(origin={-90,-93},    extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Add Light_Driver_Loss annotation (Placement(visible=true,
        transformation(
        origin={-265,-95},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add3 Plenum annotation (
    Placement(visible = true, transformation(origin={-259,-127},   extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add3 Cond_Space annotation (
    Placement(visible = true, transformation(origin={231,-115},   extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant No_Loads(k = 6) annotation (
    Placement(visible = true, transformation(origin={198,-126},  extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation (
    Placement(visible = true, transformation(origin={156,-120},  extent={{8,-8},{
            -8,8}},                                                                               rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation (
    Placement(visible = true, transformation(origin={-167,-131},  extent = {{7, -7}, {-7, 7}}, rotation = 0)));
  'in_fmu' 'in_fmu1'(
    fmi_StartTime=27216000,
    fmi_StopTime=27734400,
    fmi_NumberOfSteps=576)
    annotation (Placement(transformation(extent={{-10,-166},{10,-146}})));
  Modelica.Blocks.Sources.Constant DCHUB(k=0)
    annotation (Placement(transformation(extent={{-86,-184},{-66,-164}})));
  HPF.Cables.NEC_CableModel nEC_CableModel(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12, length=
        9.14)
    annotation (Placement(transformation(extent={{16,80},{36,100}})));
  HPF.Cables.NEC_CableModel nEC_CableModel2(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12, length=
        9.14)
    annotation (Placement(transformation(extent={{10,18},{30,38}})));
  HPF.Cables.NEC_CableModel nEC_CableModel4(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=15.24)
    annotation (Placement(transformation(extent={{14,-52},{34,-32}})));
  HPF.Cables.NEC_CableModel nEC_CableModel6(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-38,74},{-58,94}})));
  HPF.Cables.NEC_CableModel nEC_CableModel7(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-34,46},{-54,66}})));
  HPF.Cables.NEC_CableModel nEC_CableModel8(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-34,16},{-54,36}})));
  HPF.Cables.NEC_CableModel nEC_CableModel9(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-36,-22},{-56,-2}})));
  HPF.Cables.NEC_CableModel nEC_CableModel10(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-36,-62},{-56,-42}})));
  HPF.Cables.NEC_CableModel nEC_CableModel11(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=6.1)
    annotation (Placement(transformation(extent={{-36,-96},{-56,-76}})));
  Modelica.Blocks.Math.Add3 Light_Driver_loss1 annotation (Placement(visible=
          true, transformation(
        origin={-281,-59},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add3 Light_Driver_loss2 annotation (Placement(visible=
          true, transformation(
        origin={-257,-67},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add3 Light_cbl_loss3 annotation (Placement(visible=true,
        transformation(
        origin={-235,-53},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add3 Light_cbl_loss1 annotation (Placement(visible=true,
        transformation(
        origin={-217,-101},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add3 PS_loss3 annotation (Placement(visible=true,
        transformation(
        origin={231,-67},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add3 PS_loss1 annotation (Placement(visible=true,
        transformation(
        origin={251,-25},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add3 PS_cable_loss1 annotation (Placement(visible=true,
        transformation(
        origin={191,-77},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
equation
  connect(Vin.pin_n, GndAC.pin) annotation (
    Line(points={{-24,130},{-28,130},{-28,134},{-36,134}},
                                         color={162,29,33}));
  connect(Desk_PS1.pin_p, Prog_DC_Ld_1.p) annotation (
    Line(points={{68,82.8},{71,82.8},{71,83},{80,83}},      color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.p, Desk_PS2.pin_p) annotation (
    Line(points={{78,53},{79,53},{79,56.6},{64,56.6}},      color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.p, Desk_PS4.pin_p) annotation (
    Line(points={{84,-16},{73,-16},{73,-9.6},{64,-9.6}},        color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.p, Desk_PS5.pin_p) annotation (
    Line(points={{84,-51},{84,-47.6},{68,-47.6}},    color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.p, Desk_PS6.pin_p) annotation (
    Line(points={{90,-84},{78,-84},{78,-83.4},{66,-83.4}},      color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.p, Desk_PS3.pin_p) annotation (
    Line(points={{82,21},{83,21},{83,22.6},{64,22.6}},      color = {0, 0, 255}));
  connect(Light_1.p, Driver_1.pin_p) annotation (
    Line(points={{-124,80},{-117,80},{-117,82.6},{-96,82.6}},   color = {0, 0, 255}));
  connect(Driver_2.pin_p, Light_2.p) annotation (
    Line(points={{-100,50.6},{-118,50.6},{-118,50},{-124,50}},  color = {0, 0, 255}));
  connect(Light_3.p, Driver_3.pin_p) annotation (
    Line(points={{-126,22},{-120,22},{-120,24.4},{-100,24.4}},  color = {0, 0, 255}));
  connect(Light_4.p, Driver_4.pin_p) annotation (
    Line(points={{-122,-16},{-118,-16},{-118,-15.4},{-98,-15.4}},
                                                              color = {0, 0, 255}));
  connect(Light_5.p, Driver_5.pin_p) annotation (
    Line(points={{-122,-52},{-115,-52},{-115,-51.4},{-96,-51.4}},   color = {0, 0, 255}));
  connect(Light_6.p, Driver_6.pin_p) annotation (
    Line(points={{-128,-88},{-116,-88},{-116,-87.4},{-98,-87.4}},   color = {0, 0, 255}));
  connect(Desk_PS6.hPin_N, Vin.pin_n) annotation (
    Line(points={{50,-94.6},{-24,-94.6},{-24,130}}, color={162,29,33}));
  connect(Driver_1.hPin_N, Vin.pin_n) annotation (
    Line(points={{-80,71.4},{-24,71.4},{-24,130}}, color={162,29,33}));
  connect(Driver_2.hPin_N, Vin.pin_n) annotation (
    Line(points={{-84,39.4},{-24,39.4},{-24,130}}, color={162,29,33}));
  connect(Driver_3.hPin_N, Vin.pin_n) annotation (
    Line(points={{-84,11.6},{-24,11.6},{-24,130}}, color={162,29,33}));
  connect(Driver_4.hPin_N, Vin.pin_n) annotation (
    Line(points={{-80,-26.6},{-24,-26.6},{-24,130}}, color={162,29,33}));
  connect(Driver_5.hPin_N, Vin.pin_n) annotation (
    Line(points={{-80,-62.6},{-24,-62.6},{-24,130}}, color={162,29,33}));
  connect(Driver_6.hPin_N, Vin.pin_n) annotation (
    Line(points={{-82,-98.6},{-24,-98.6},{-24,130}}, color={162,29,33}));
  connect(Light_1.n, GndDC.p) annotation (
    Line(points={{-144,80},{-178,80},{-178,114},{134,114}},         color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.n, GndDC.p) annotation (
    Line(points={{114,-84},{133,-84},{133,114},{134,114}},          color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.n, GndDC.p) annotation (
    Line(points={{106,-51},{134,-51},{134,114}},        color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.n, GndDC.p) annotation (
    Line(points={{104,21},{134,21},{134,114}},        color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.n, GndDC.p) annotation (
    Line(points={{100,53},{134,53},{134,114}},        color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.n, GndDC.p) annotation (
    Line(points={{108,-16},{134,-16},{134,114}},        color = {0, 0, 255}));
  connect(Prog_DC_Ld_1.n, GndDC.p) annotation (
    Line(points={{102,83},{134,83},{134,114}},        color = {0, 0, 255}));
  connect(Desk_PS6.pin_n, GndDC.p) annotation (
    Line(points={{66,-94.6},{134,-94.6},{134,114}},              color = {0, 0, 255}));
  connect(Desk_PS5.pin_n, GndDC.p) annotation (
    Line(points={{68,-60.4},{76,-60.4},{76,-78},{134,-78},{134,114}},        color = {0, 0, 255}));
  connect(Desk_PS4.pin_n, GndDC.p) annotation (
    Line(points={{64,-22.4},{74,-22.4},{74,-46},{134,-46},{134,114}},        color = {0, 0, 255}));
  connect(Desk_PS1.hPin_N, Vin.pin_n) annotation (
    Line(points={{52,73.2},{-24,73.2},{-24,130}}, color={162,29,33}));
  connect(Desk_PS2.hPin_N, Vin.pin_n) annotation (
    Line(points={{48,45.4},{-24,45.4},{-24,130}}, color={162,29,33}));
  connect(Desk_PS3.hPin_N, Vin.pin_n) annotation (
    Line(points={{46,11.4},{-24,11.4},{-24,130}}, color={162,29,33}));
  connect(Desk_PS4.hPin_N, Vin.pin_n) annotation (
    Line(points={{48,-22.4},{-24,-22.4},{-24,130}}, color={162,29,33}));
  connect(Desk_PS5.hPin_N, Vin.pin_n) annotation (
    Line(points={{52,-60.4},{-24,-60.4},{-24,130}}, color={162,29,33}));
  connect(Light_6.n, GndDC.p) annotation (
    Line(points={{-148,-88},{-178,-88},{-178,114},{134,114}},         color = {0, 0, 255}));
  connect(Light_2.n, GndDC.p) annotation (
    Line(points={{-144,50},{-178,50},{-178,114},{134,114}},          color = {0, 0, 255}));
  connect(Light_5.n, GndDC.p) annotation (
    Line(points={{-142,-52},{-178,-52},{-178,114},{134,114}},         color = {0, 0, 255}));
  connect(Light_4.n, GndDC.p) annotation (
    Line(points={{-142,-16},{-178,-16},{-178,114},{134,114}},      color = {0, 0, 255}));
  connect(Light_3.n, GndDC.p) annotation (
    Line(points={{-146,22},{-178,22},{-178,114},{134,114}},          color = {0, 0, 255}));
  connect(Driver_1.pin_n, GndDC.p) annotation (
    Line(points={{-96,71.4},{-178,71.4},{-178,114},{134,114}},      color = {0, 0, 255}));
  connect(Driver_3.pin_n, GndDC.p) annotation (
    Line(points={{-100,11.6},{-178,11.6},{-178,114},{134,114}},     color = {0, 0, 255}));
  connect(Driver_2.pin_n, GndDC.p) annotation (
    Line(points={{-100,39.4},{-178,39.4},{-178,114},{134,114}},     color = {0, 0, 255}));
  connect(Driver_4.pin_n, GndDC.p) annotation (
    Line(points={{-98,-26.6},{-178,-26.6},{-178,114},{134,114}},      color = {0, 0, 255}));
  connect(Driver_5.pin_n, GndDC.p) annotation (
    Line(points={{-96,-62.6},{-178,-62.6},{-178,114},{134,114}},      color = {0, 0, 255}));
  connect(Driver_6.pin_n, GndDC.p) annotation (
    Line(points={{-98,-98.6},{-178,-98.6},{-178,114},{134,114}},      color = {0, 0, 255}));
  connect(Desk_PS3.pin_n, GndDC.p) annotation (
    Line(points={{64,11.4},{134,11.4},{134,114}},    color = {0, 0, 255}));
  connect(Desk_PS2.pin_n, GndDC.p) annotation (
    Line(points={{64,45.4},{134,45.4},{134,114}},    color = {0, 0, 255}));
  connect(Desk_PS1.pin_n, GndDC.p) annotation (
    Line(points={{68,73.2},{134,73.2},{134,114}},    color = {0, 0, 255}));
  connect(No_Loads.y, division.u2) annotation (
    Line(points={{189.2,-126},{165.6,-126},{165.6,-124.8}},
                                                     color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(division.y, Prog_DC_Ld_1.u) annotation (
    Line(points={{147.2,-120},{148,-120},{148,94},{91.22,94},{91.22,88.5}},
                                                   color={0,0,127},
      pattern=LinePattern.Dash));
  connect(Prog_DC_Ld_2.u, division.y) annotation (
    Line(points={{89.22,58.5},{147.2,58.5},{147.2,-120}},
                                                    color={0,0,127},
      pattern=LinePattern.Dash));
  connect(Prog_DC_Ld_3.u, division.y) annotation (
    Line(points={{93.22,26.5},{147.2,26.5},{147.2,-120}},
                                                    color={0,0,127},
      pattern=LinePattern.Dash));
  connect(Prog_DC_Ld_4.u, division.y) annotation (
    Line(points={{96.24,-10},{147.2,-10},{147.2,-120}},
                                                      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(Prog_DC_Ld_3.u, division.y) annotation (
    Line(points={{93.22,26.5},{147.2,26.5},{147.2,-120}},
                                                    color={0,0,127},
      pattern=LinePattern.Dash));
  connect(Prog_DC_Ld_5.u, division.y) annotation (
    Line(points={{95.22,-45.5},{147.2,-45.5},{147.2,-120}},
                                                      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(Prog_DC_Ld_6.u, division.y) annotation (
    Line(points={{102.24,-78},{147.2,-78},{147.2,-120}},
                                                       color={0,0,127},
      pattern=LinePattern.Dash));
  connect(division1.u2, No_Loads.y) annotation (
    Line(points={{-158.6,-135.2},{189.2,-135.2},{189.2,-126}},
                                                      color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(division1.y, Light_6.u) annotation (
    Line(points={{-174.7,-131},{-194,-131},{-194,-93},{-138.2,-93}}, color={0,0,127},

      pattern=LinePattern.Dash));
  connect(Light_5.u, division1.y) annotation (
    Line(points={{-132.2,-57},{-194,-57},{-194,-131},{-174.7,-131}}, color={0,0,127},

      pattern=LinePattern.Dash));
  connect(Light_4.u, division1.y) annotation (
    Line(points={{-132.2,-21},{-194,-21},{-194,-131},{-174.7,-131}},
                                                                   color={0,0,127},

      pattern=LinePattern.Dash));
  connect(Light_3.u, division1.y) annotation (
    Line(points={{-136.2,17},{-194,17},{-194,-131},{-174.7,-131}}, color={0,0,127},

      pattern=LinePattern.Dash));
  connect(Light_2.u, division1.y) annotation (
    Line(points={{-134.2,45},{-194,45},{-194,-131},{-174.7,-131}}, color={0,0,127},

      pattern=LinePattern.Dash));
  connect(Light_1.u, division1.y) annotation (
    Line(points={{-134.2,75},{-194,75},{-194,-131},{-174.7,-131}}, color={0,0,127},

      pattern=LinePattern.Dash));
  connect(Plenum.y, 'in_fmu1'.PlnmBLightsDriver) annotation (Line(points={{-259,
          -134.7},{-259,-151},{-10.4,-151}},
                                           color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(Cond_Space.y, 'in_fmu1'.ZoneBPlugsConverters) annotation (Line(points={{231,
          -122.7},{231,-174},{-24,-174},{-24,-156},{-10.4,-156}},    color={0,0,127},

      pattern=LinePattern.DashDot));
  connect(DCHUB.y, 'in_fmu1'.PlnmBDCHub) annotation (Line(points={{-65,-174},{
          -32,-174},{-32,-161},{-10.4,-161}},color={0,0,127},
      pattern=LinePattern.DashDot));
  connect('in_fmu1'.ZoneB_plugs_heating_rate, division.u1) annotation (Line(
        points={{10,-156},{176,-156},{176,-115.2},{165.6,-115.2}},
                                                         color={0,0,127},
      pattern=LinePattern.DashDot));
  connect('in_fmu1'.ZoneB_light_heating_rate, division1.u1) annotation (Line(
        points={{10,-156},{20,-156},{20,-126.8},{-158.6,-126.8}},
                                                              color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(nEC_CableModel4.pin_n, Desk_PS5.hPin_P) annotation (Line(points={{34,-42},
          {46,-42},{46,-47.6},{52,-47.6}},      color={117,80,123}));
  connect(nEC_CableModel2.pin_n, Desk_PS3.hPin_P) annotation (Line(points={{30,28},
          {40,28},{40,22.6},{46,22.6}},     color={117,80,123}));
  connect(nEC_CableModel.pin_n, Desk_PS1.hPin_P) annotation (Line(points={{36,90},
          {36,82},{52,82},{52,82.8}},             color={117,80,123}));
  connect(nEC_CableModel9.pin_n, Driver_4.hPin_P)
    annotation (Line(points={{-56,-12},{-80,-12},{-80,-15.4}},
                                                          color={117,80,123}));
  connect(Driver_6.hPin_P, nEC_CableModel11.pin_n) annotation (Line(points={{-82,
          -87.4},{-74,-87.4},{-74,-86},{-56,-86}},     color={92,53,102}));
  connect(Driver_1.hPin_P, nEC_CableModel6.pin_n) annotation (Line(points={{-80,
          82.6},{-74,82.6},{-74,84},{-58,84}}, color={92,53,102}));
  connect(Driver_2.hPin_P, nEC_CableModel7.pin_n) annotation (Line(points={{-84,
          50.6},{-74,50.6},{-74,50},{-54,50},{-54,56}}, color={92,53,102}));
  connect(Driver_3.hPin_P, nEC_CableModel8.pin_n) annotation (Line(points={{-84,
          24.4},{-76,24.4},{-76,24},{-54,24},{-54,26}}, color={92,53,102}));
  connect(Driver_5.hPin_P, nEC_CableModel10.pin_n) annotation (Line(points={{-80,
          -51.4},{-72,-51.4},{-72,-52},{-56,-52}},               color={92,53,
          102}));
  connect(Light_Driver_Loss.y, Plenum.u3) annotation (Line(points={{-265,-102.7},
          {-265,-118.6},{-264.6,-118.6}}, color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(Light_Driver_loss2.y, Light_Driver_Loss.u1) annotation (Line(points={{-257,
          -74.7},{-257,-86.6},{-260.8,-86.6}},       color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(Light_Driver_loss1.y, Light_Driver_Loss.u2) annotation (Line(points={{-281,
          -66.7},{-281,-74.35},{-269.2,-74.35},{-269.2,-86.6}},     color={0,0,127},

      pattern=LinePattern.DashDot));
  connect(Driver_1.PLoss, Light_Driver_loss1.u3) annotation (Line(points={{-88,
          84.7},{-88,90},{-286.6,90},{-286.6,-50.6}},             color={0,0,127},

      pattern=LinePattern.Dot));
  connect(Driver_4.PLoss, Light_Driver_loss2.u3) annotation (Line(points={{-89,
          -13.3},{-89,-6},{-266,-6},{-266,-58.6},{-262.6,-58.6}},
                                             color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Driver_5.PLoss, Light_Driver_loss2.u2) annotation (Line(points={{-88,
          -49.3},{-88,-40},{-257,-40},{-257,-58.6}},               color={0,0,127},

      pattern=LinePattern.Dot));
  connect(Driver_6.PLoss, Light_Driver_loss2.u1) annotation (Line(points={{-90,
          -85.3},{-90,-76},{-244,-76},{-244,-58.6},{-251.4,-58.6}},
                                                            color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Driver_3.PLoss, Light_Driver_loss1.u1) annotation (Line(points={{-92,
          26.8},{-168,26.8},{-168,38},{-275.4,38},{-275.4,-50.6}},color={0,0,127},

      pattern=LinePattern.Dot));
  connect(Driver_2.PLoss, Light_Driver_loss1.u2) annotation (Line(points={{-92,
          52.7},{-110,52.7},{-110,64},{-281,64},{-281,-50.6}},color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Light_cbl_loss1.y, Plenum.u1) annotation (Line(points={{-217,-108.7},
          {-217,-118.6},{-253.4,-118.6}}, color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(Light_cbl_loss3.y, Plenum.u2) annotation (Line(points={{-235,-60.7},{
          -234,-60.7},{-234,-106},{-259,-106},{-259,-118.6}},
                                      color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(nEC_CableModel11.PLoss, Light_cbl_loss1.u1) annotation (Line(points={{-46,
          -81.8},{-46,-72},{-211.4,-72},{-211.4,-92.6}},                  color={0,0,127},

      pattern=LinePattern.Dot));
  connect(nEC_CableModel10.PLoss, Light_cbl_loss1.u2) annotation (Line(points={{-46,
          -47.8},{-46,-36},{-217,-36},{-217,-92.6}},                    color={0,0,127},

      pattern=LinePattern.Dot));
  connect(nEC_CableModel9.PLoss, Light_cbl_loss1.u3) annotation (Line(points={{-46,
          -7.8},{-46,2},{-222.6,2},{-222.6,-92.6}},              color={0,0,127},

      pattern=LinePattern.Dot));
  connect(nEC_CableModel8.PLoss, Light_cbl_loss3.u1) annotation (Line(points={{-44,
          30.2},{-228,30.2},{-228,30},{-229.4,30},{-229.4,-44.6}},     color={0,0,127},

      pattern=LinePattern.Dot));
  connect(nEC_CableModel7.PLoss, Light_cbl_loss3.u2) annotation (Line(points={{-44,
          60.2},{-94,60.2},{-94,60},{-235,60},{-235,-44.6}},     color={0,0,127},

      pattern=LinePattern.Dot));
  connect(nEC_CableModel6.PLoss, Light_cbl_loss3.u3) annotation (Line(points={{-48,
          88.2},{-48,94},{-240.6,94},{-240.6,-44.6}},                  color={0,0,127},

      pattern=LinePattern.Dot));
  connect(PS_cable_loss1.y, Cond_Space.u3) annotation (Line(points={{191,-84.7},
          {191,-106.6},{225.4,-106.6}},
                                      color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(Desk_PS6.hPin_P, nEC_CableModel4.pin_n) annotation (Line(points={{50,
          -83.4},{42,-83.4},{42,-50},{34,-50},{34,-42}}, color={92,53,102}));
  connect(Desk_PS4.hPin_P, nEC_CableModel2.pin_n) annotation (Line(points={{48,-9.6},
          {42,-9.6},{42,-10},{30,-10},{30,28}},       color={92,53,102}));
  connect(Desk_PS2.hPin_P, nEC_CableModel.pin_n) annotation (Line(points={{48,56.6},
          {44,56.6},{44,56},{36,56},{36,90}},       color={92,53,102}));
  connect(PS_loss3.y, Cond_Space.u2) annotation (Line(points={{231,-74.7},{231,
          -106.6}},            color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(PS_loss1.y, Cond_Space.u1) annotation (Line(points={{251,-32.7},{251,
          -82},{236.6,-82},{236.6,-106.6}},color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(Desk_PS1.PLoss, PS_loss1.u3) annotation (Line(points={{60,84.6},{60,
          100},{245.4,100},{245.4,-16.6}},          color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Desk_PS2.PLoss, PS_loss1.u2) annotation (Line(points={{56,58.7},{56,
          62.7},{251,62.7},{251,-16.6}},       color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Desk_PS3.PLoss, PS_loss1.u1) annotation (Line(points={{55,24.7},{
          256.6,24.7},{256.6,-16.6}},color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Desk_PS4.PLoss, PS_loss3.u3) annotation (Line(points={{56,-7.2},{56,
          -2},{225.4,-2},{225.4,-58.6}},            color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Desk_PS5.PLoss, PS_loss3.u2) annotation (Line(points={{60,-45.2},{60,
          -40},{231,-40},{231,-58.6}},         color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Desk_PS6.PLoss, PS_loss3.u1) annotation (Line(points={{58,-81.3},{58,
          -72},{170,-72},{170,-46},{236.6,-46},{236.6,-58.6}},
                                                       color={0,0,127},
      pattern=LinePattern.Dot));
  connect(nEC_CableModel4.PLoss, PS_cable_loss1.u3) annotation (Line(points={{24,
          -37.8},{24,-34},{185.4,-34},{185.4,-68.6}},               color={0,0,127},

      pattern=LinePattern.Dot));
  connect(nEC_CableModel2.PLoss, PS_cable_loss1.u2) annotation (Line(points={{20,32.2},
          {20,36},{191,36},{191,-68.6}},                    color={0,0,127},
      pattern=LinePattern.Dot));
  connect(nEC_CableModel.PLoss, PS_cable_loss1.u1) annotation (Line(points={{26,94.2},
          {26,104},{196.6,104},{196.6,-68.6}},                 color={0,0,127},

      pattern=LinePattern.Dot));
  connect(Vin.pin_p, nEC_CableModel11.pin_p)
    annotation (Line(points={{4,130},{4,-86},{-36,-86}}, color={92,53,102}));
  connect(nEC_CableModel4.pin_p, nEC_CableModel11.pin_p) annotation (Line(
        points={{14,-42},{4,-42},{4,-86},{-36,-86}}, color={92,53,102}));
  connect(nEC_CableModel10.pin_p, nEC_CableModel11.pin_p) annotation (Line(
        points={{-36,-52},{4,-52},{4,-86},{-36,-86}}, color={92,53,102}));
  connect(nEC_CableModel9.pin_p, nEC_CableModel11.pin_p) annotation (Line(
        points={{-36,-12},{-16,-12},{-16,-14},{4,-14},{4,-86},{-36,-86}}, color
        ={92,53,102}));
  connect(nEC_CableModel8.pin_p, nEC_CableModel11.pin_p) annotation (Line(
        points={{-34,26},{-16,26},{-16,28},{4,28},{4,-86},{-36,-86}}, color={92,
          53,102}));
  connect(nEC_CableModel2.pin_p, nEC_CableModel11.pin_p) annotation (Line(
        points={{10,28},{4,28},{4,-86},{-36,-86}}, color={92,53,102}));
  connect(nEC_CableModel7.pin_p, nEC_CableModel11.pin_p) annotation (Line(
        points={{-34,56},{-16,56},{-16,48},{4,48},{4,-86},{-36,-86}}, color={92,
          53,102}));
  connect(nEC_CableModel.pin_p, nEC_CableModel11.pin_p) annotation (Line(points
        ={{16,90},{4,90},{4,-86},{-36,-86}}, color={92,53,102}));
  connect(nEC_CableModel6.pin_p, nEC_CableModel11.pin_p) annotation (Line(
        points={{-38,84},{4,84},{4,-86},{-36,-86}}, color={92,53,102}));
  annotation (
    uses(HPF(version="0.1.0-beta"), Modelica(version="3.2.3")),
    experiment(
      StartTime=27216000,
      StopTime=27734400,
      Interval=900,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=900,
      __Dymola_Algorithm="Euler"),
    __OpenModelica_simulationFlags(
      lv="LOG_STATS",
      nls="newton",
      outputFormat="mat",
      s="dassl"),
    Diagram(coordinateSystem(extent={{-300,-200},{300,200}}), graphics={
        Text(
          origin={-284,-116},
          rotation=90,
          extent={{-37,-5},{37,5}},
          textString="Heat Gain To E+ (Plenum)"),
        Text(
          origin={273,-53},
          rotation=90,
          extent={{-42,-10},{42,10}},
          textString="Heat Gain To E+ (Cond Space)",
          lineColor={0,0,0},
          pattern=LinePattern.DashDot,
          fontSize=0),
        Text(
          origin={-110,-114},
          extent={{-64,-10},{64,10}},
          textString="Individual Lights will have Power In from E+"),
        Text(
          origin={72,-110},
          extent={{-64,-10},{64,10}},
          textString="Individual Prog DC Load will have Power in from E+"),
        Text(
          origin={186,180},
          extent={{-64,-10},{64,10}},
          lineColor={0,0,0},
          textString="Power - Solid Lines
Input Value - Dashed Line
Output Value - Dotted Line")}),
    Icon(coordinateSystem(extent={{-200,-100},{200,100}})),
    version="");
end flexlab_ac_Cable;
