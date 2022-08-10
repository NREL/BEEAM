within HPF;
model flexlab_dc_1
  inner HPF.SystemDef systemDef(fFund = 60, fs = 5000, hrms = {1, 3, 5, 7, 9}, numPh = 1)  annotation (
    Placement(visible = true, transformation(origin={-182,86.5714},    extent = {{-16, -16}, {16, 11.4286}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource Vin(start_v_re = {120, 0, 0, 0, 0}, vArg = {0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0})  annotation (
    Placement(visible = true, transformation(origin={-58,88},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground GndAC annotation (
    Placement(visible = true, transformation(origin={-102,76},   extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Nextek_Hub(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Nextek_208V_1600W.mat", nomP = 1600, nomV = 120) "P/N ??" annotation (
    Placement(visible = true, transformation(origin={-44,50},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.Variable_DC_Load Light_1 annotation (
    Placement(visible = true, transformation(origin = {-86, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Ground GndDC annotation (
    Placement(visible = true, transformation(origin = {-176, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_1 annotation (
    Placement(visible = true, transformation(origin={20,32},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Light_2 annotation (
    Placement(visible = true, transformation(origin = {-110, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_3 annotation (
    Placement(visible = true, transformation(origin = {-136, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_4 annotation (
    Placement(visible = true, transformation(origin = {-154, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_5 annotation (
    Placement(visible = true, transformation(origin = {-128, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_6 annotation (
    Placement(visible = true, transformation(origin={-114,-64},   extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_2 annotation (
    Placement(visible = true, transformation(origin={32,14},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_3 annotation (
    Placement(visible = true, transformation(origin = {44, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_4 annotation (
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_5 annotation (
    Placement(visible = true, transformation(origin = {44, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_6 annotation (
    Placement(visible = true, transformation(origin={24,-56},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation (
    Placement(visible = true, transformation(origin = {124, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation (
    Placement(visible = true, transformation(origin = {-168, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant No_Loads(k = 6) annotation (
    Placement(visible = true, transformation(origin = {166, 30}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  'in_fmu' 'in_fmu1'(
    fmi_StartTime=27648000,
    fmi_StopTime=28944000,
    fmi_NumberOfSteps=1440)
    annotation (Placement(transformation(extent={{88,-120},{108,-100}})));
  Modelica.Blocks.Math.Add3 Light_cbl_loss1 annotation (Placement(visible=true,
        transformation(
        origin={-221,-57},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add3 Light_cbl_loss3 annotation (Placement(visible=true,
        transformation(
        origin={-239,-29},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add Light_Driver_Loss annotation (Placement(visible=true,
        transformation(
        origin={-93,-133},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add3 PS_cable_loss1 annotation (Placement(
        transformation(
        origin={163,-27},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add3 PS_cable_loss2 annotation (Placement(
        transformation(
        origin={133,-29},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add Light_Driver_Loss1
                                             annotation (Placement(visible=true,
        transformation(
        origin={139,-87},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-45,15},   extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC1(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-69,-1},   extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC2(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-85,-15},  extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC3(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-103,-33}, extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC4(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-55,-41},  extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC5(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-85,-63},  extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC6(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-14,32},   extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC7(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-6,14},    extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC8(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={6,-2},     extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC9(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={24,-20},   extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC10(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={16,-38},   extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC11(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-10,-56},  extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  Modelica.Blocks.Sources.Constant Plenum_heat_Gain(k=0) annotation (Placement(
        visible=true, transformation(
        origin={-127,-101},
        extent={{-9,-9},{9,9}},
        rotation=0)));
  Modelica.Blocks.Math.Add Light_Driver_Loss2
                                             annotation (Placement(visible=true,
        transformation(
        origin={157,-65},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
  Modelica.Blocks.Math.Add Light_Driver_Loss3
                                             annotation (Placement(visible=true,
        transformation(
        origin={-229,-99},
        extent={{-7,-7},{7,7}},
        rotation=-90)));
equation
  connect(Vin.pin_n, GndAC.pin) annotation (
    Line(points={{-68,88},{-102,88},{-102,84}},      color = {117, 80, 123}));
  connect(Nextek_Hub.hPin_N, Vin.pin_n) annotation (
    Line(points={{-52,60},{-80,60},{-80,88},{-68,88}},          color = {117, 80, 123}));
  connect(Vin.pin_p, Nextek_Hub.hPin_P) annotation (
    Line(points={{-48,88},{-48,87},{-36,87},{-36,60}},          color = {92, 53, 102}));
  connect(GndDC.p, Nextek_Hub.pin_n) annotation (
    Line(points={{-176,-82},{-176,27},{-52,27},{-52,40}},          color = {0, 0, 255}));
  connect(Light_1.n, GndDC.p) annotation (
    Line(points = {{-96, 14}, {-176, 14}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_2.n, GndDC.p) annotation (
    Line(points = {{-120, -2}, {-176, -2}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_3.n, GndDC.p) annotation (
    Line(points = {{-146, -18}, {-176, -18}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_4.n, GndDC.p) annotation (
    Line(points = {{-164, -36}, {-176, -36}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_5.n, GndDC.p) annotation (
    Line(points = {{-138, -48}, {-176, -48}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_6.n, GndDC.p) annotation (
    Line(points={{-124,-64},{-176,-64},{-176,-82}},        color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.n, GndDC.p) annotation (
    Line(points={{34,-56},{100,-56},{100,-82},{-176,-82}},          color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.n, GndDC.p) annotation (
    Line(points = {{54, -38}, {100, -38}, {100, -82}, {-176, -82}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_1.n, GndDC.p) annotation (
    Line(points={{30,32},{100,32},{100,-82},{-176,-82}},          color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.n, GndDC.p) annotation (
    Line(points = {{80, -20}, {100, -20}, {100, -82}, {-176, -82}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.n, GndDC.p) annotation (
    Line(points = {{54, -2}, {100, -2}, {100, -82}, {-176, -82}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.n, GndDC.p) annotation (
    Line(points={{42,14},{100,14},{100,-82},{-176,-82}},          color = {0, 0, 255}));
  connect(No_Loads.y, division.u2) annotation (
    Line(points={{157.2,30},{136,30},{136,44}},      color = {0, 0, 127}));
  connect(division1.u2, No_Loads.y) annotation (
    Line(points={{-156,42},{157.2,42},{157.2,30}},    color = {0, 0, 127}));
  connect(division.y, Prog_DC_Ld_4.u) annotation (
    Line(points={{113,50},{70.2,50},{70.2,-15}},    color = {0, 0, 127}));
  connect(Prog_DC_Ld_3.u, division.y) annotation (
    Line(points={{44.2,3},{113,3},{113,50}},      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(Prog_DC_Ld_2.u, division.y) annotation (
    Line(points={{32.2,19},{113,19},{113,50}},      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(Prog_DC_Ld_1.u, division.y) annotation (
    Line(points={{20.2,37},{113,37},{113,50}},     color={0,0,127},
      pattern=LinePattern.Dash));
  connect(Prog_DC_Ld_5.u, division.y) annotation (
    Line(points={{44.2,-33},{113,-33},{113,50}},      color={0,0,127},
      pattern=LinePattern.Dash));
  connect(Prog_DC_Ld_6.u, division.y) annotation (
    Line(points={{24.2,-51},{113,-51},{113,50}},     color={0,0,127},
      pattern=LinePattern.Dash));
  connect(division1.y, Light_6.u) annotation (
    Line(points={{-179,48},{-190,48},{-190,-69},{-114.2,-69}},       color={0,0,127},
      pattern=LinePattern.Dash));

  connect(Light_1.u, division1.y) annotation (
    Line(points={{-86.2,9},{-190,9},{-190,48},{-179,48}},          color={0,0,127},
      pattern=LinePattern.Dash));

  connect(Light_2.u, division1.y) annotation (
    Line(points={{-110.2,-7},{-190,-7},{-190,48},{-179,48}},        color={0,0,127},
      pattern=LinePattern.Dash));

  connect(Light_3.u, division1.y) annotation (
    Line(points={{-136.2,-23},{-190,-23},{-190,48},{-179,48}},        color={0,0,127},
      pattern=LinePattern.Dash));

  connect(Light_4.u, division1.y) annotation (
    Line(points={{-154.2,-41},{-190,-41},{-190,48},{-179,48}},        color={0,0,127},
      pattern=LinePattern.Dash));

  connect(Light_5.u, division1.y) annotation (
    Line(points={{-128.2,-53},{-190,-53},{-190,48},{-179,48}},        color={0,0,127},
      pattern=LinePattern.Dash));

  connect(Light_4.u, division1.y) annotation (
    Line(points={{-154.2,-41},{-190,-41},{-190,48},{-179,48}},        color={0,0,127},
      pattern=LinePattern.Dash));

  connect('in_fmu1'.ZoneB_light_heating_rate, division1.u1) annotation (Line(
        points={{108,-110},{180,-110},{180,-84},{190,-84},{190,66},{-148,66},{
          -148,54},{-156,54}}, color={0,0,127}));
  connect('in_fmu1'.ZoneB_plugs_heating_rate, division.u1) annotation (Line(
        points={{108,-110},{176,-110},{176,56},{136,56}},
                                                        color={0,0,127}));
  connect(Light_Driver_Loss.y, 'in_fmu1'.PlnmBLightsDriver) annotation (Line(
      points={{-93,-140.7},{-78.5,-140.7},{-78.5,-105},{87.6,-105}},
      color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(PS_cable_loss2.y, Light_Driver_Loss1.u2) annotation (Line(
      points={{133,-36.7},{133,-55.35},{134.8,-55.35},{134.8,-78.6}},
      color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(Light_Driver_Loss1.y, 'in_fmu1'.ZoneBPlugsConverters) annotation (
      Line(
      points={{139,-94.7},{74,-94.7},{74,-110},{87.6,-110}},
      color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(nEC_CableModelDC.n, Light_1.p) annotation (Line(points={{-54,15},{-64,
          15},{-64,14},{-76,14}}, color={0,0,255}));
  connect(nEC_CableModelDC1.p, nEC_CableModelDC.n) annotation (Line(points={{-60,-1},
          {-58,-1},{-58,6},{-54,6},{-54,15}},         color={0,0,255}));
  connect(nEC_CableModelDC1.n, Light_2.p) annotation (Line(points={{-78,-1},{
          -86,-1},{-86,0},{-100,0},{-100,-2}}, color={0,0,255}));
  connect(nEC_CableModelDC2.n, Light_3.p) annotation (Line(points={{-94,-15},{
          -126,-15},{-126,-18}}, color={0,0,255}));
  connect(nEC_CableModelDC3.n, Light_4.p) annotation (Line(points={{-112,-33},{
          -126,-33},{-126,-36},{-144,-36}}, color={0,0,255}));
  connect(nEC_CableModelDC2.n, nEC_CableModelDC3.p) annotation (Line(points={{
          -94,-15},{-92,-15},{-92,-33},{-94,-33}}, color={0,0,255}));
  connect(nEC_CableModelDC4.n, Light_5.p) annotation (Line(points={{-64,-41},{
          -86,-41},{-86,-46},{-118,-46},{-118,-48}}, color={0,0,255}));
  connect(nEC_CableModelDC5.n, Light_6.p) annotation (Line(points={{-94,-63},{
          -94,-67},{-104,-67},{-104,-64}},
                                         color={0,0,255}));
  connect(nEC_CableModelDC4.n, nEC_CableModelDC5.p)
    annotation (Line(points={{-64,-41},{-64,-63},{-76,-63}}, color={0,0,255}));
  connect(nEC_CableModelDC4.p, Nextek_Hub.pin_p) annotation (Line(points={{-46,
          -41},{-32,-41},{-32,40},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC2.p, Nextek_Hub.pin_p) annotation (Line(points={{-76,
          -15},{-58,-15},{-58,-10},{-32,-10},{-32,40},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC.p, Nextek_Hub.pin_p) annotation (Line(points={{-36,
          15},{-34,15},{-34,14},{-32,14},{-32,40},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC6.n, Prog_DC_Ld_1.p) annotation (Line(points={{-4,32},
          {2,32},{2,34},{10,34},{10,32}}, color={0,0,255}));
  connect(nEC_CableModelDC7.n, Prog_DC_Ld_2.p) annotation (Line(points={{4,14},
          {14,14},{14,14},{22,14}}, color={0,0,255}));
  connect(nEC_CableModelDC8.n, Prog_DC_Ld_3.p)
    annotation (Line(points={{16,-2},{34,-2}}, color={0,0,255}));
  connect(nEC_CableModelDC9.n, Prog_DC_Ld_4.p) annotation (Line(points={{34,-20},
          {46,-20},{46,-20},{60,-20}}, color={0,0,255}));
  connect(nEC_CableModelDC10.n, Prog_DC_Ld_5.p)
    annotation (Line(points={{26,-38},{34,-38}}, color={0,0,255}));
  connect(nEC_CableModelDC11.n, Prog_DC_Ld_6.p)
    annotation (Line(points={{0,-56},{14,-56}}, color={0,0,255}));
  connect(nEC_CableModelDC11.p, Nextek_Hub.pin_p) annotation (Line(points={{-20,
          -56},{-30,-56},{-30,-54},{-32,-54},{-32,40},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC10.p, Nextek_Hub.pin_p) annotation (Line(points={{6,
          -38},{-10,-38},{-10,-32},{-32,-32},{-32,40},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC9.p, Nextek_Hub.pin_p) annotation (Line(points={{14,
          -20},{-6,-20},{-6,-22},{-32,-22},{-32,40},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC8.p, Nextek_Hub.pin_p) annotation (Line(points={{-4,
          -2},{-32,-2},{-32,40},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC7.p, Nextek_Hub.pin_p) annotation (Line(points={{-16,
          14},{-32,14},{-32,40},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC6.p, Nextek_Hub.pin_p) annotation (Line(points={{-24,
          32},{-26,32},{-26,30},{-32,30},{-32,40},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC5.PLoss, Light_cbl_loss1.u1) annotation (Line(points={{-85,
          -59.22},{-215.4,-59.22},{-215.4,-48.6}},       color={0,0,127},
      pattern=LinePattern.Dot));
  connect(nEC_CableModelDC4.PLoss, Light_cbl_loss1.u2) annotation (Line(points={{-55,
          -37.22},{-223.5,-37.22},{-223.5,-48.6},{-221,-48.6}},       color={0,0,127},
      pattern=LinePattern.Dot));

  connect(nEC_CableModelDC3.PLoss, Light_cbl_loss1.u3) annotation (Line(points={{-103,
          -29.22},{-228.5,-29.22},{-228.5,-48.6},{-226.6,-48.6}},        color={0,0,127},
      pattern=LinePattern.Dot));

  connect(nEC_CableModelDC2.PLoss, Light_cbl_loss3.u1) annotation (Line(points=
          {{-85,-11.22},{-159.5,-11.22},{-159.5,-20.6},{-233.4,-20.6}}, color={0,0,127},
      pattern=LinePattern.Dot));

  connect(nEC_CableModelDC1.PLoss, Light_cbl_loss3.u2) annotation (Line(points={{-69,
          2.78},{-239,2.78},{-239,-20.6}},         color={0,0,127},
      pattern=LinePattern.Dot));
  connect(nEC_CableModelDC.PLoss, Light_cbl_loss3.u3) annotation (Line(points={
          {-45,18.78},{-244.6,18.78},{-244.6,-20.6}}, color={0,0,127},
      pattern=LinePattern.Dot));
  connect(nEC_CableModelDC6.PLoss, PS_cable_loss2.u1) annotation (Line(points={
          {-14,36.2},{138,36.2},{138,-20.6},{138.6,-20.6}}, color={0,0,127},
      pattern=LinePattern.Dot));
  connect(nEC_CableModelDC7.PLoss, PS_cable_loss2.u2) annotation (Line(points={
          {-6,18.2},{132,18.2},{132,-20.6},{133,-20.6}}, color={0,0,127},
      pattern=LinePattern.Dot));
  connect(nEC_CableModelDC8.PLoss, PS_cable_loss2.u3) annotation (Line(points={{6,2.2},
          {128,2.2},{128,-20.6},{127.4,-20.6}},       color={0,0,127},
      pattern=LinePattern.Dot));
  connect(nEC_CableModelDC11.PLoss, PS_cable_loss1.u3) annotation (Line(points={{-10,
          -51.8},{152,-51.8},{152,-18.6},{157.4,-18.6}},     color={0,0,127},
      pattern=LinePattern.Dot));
  connect(nEC_CableModelDC10.PLoss, PS_cable_loss1.u2) annotation (Line(points={{16,
          -33.8},{158,-33.8},{158,-18.6},{163,-18.6}},    color={0,0,127},
      pattern=LinePattern.Dot));
  connect(nEC_CableModelDC9.PLoss, PS_cable_loss1.u1) annotation (Line(points={{24,
          -15.8},{162,-15.8},{162,-18.6},{168.6,-18.6}},   color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Nextek_Hub.PLoss, 'in_fmu1'.PlnmBDCHub) annotation (Line(points={{-33,50},
          {60,50},{60,-115},{87.6,-115}},     color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Plenum_heat_Gain.y, Light_Driver_Loss.u1) annotation (Line(
      points={{-117.1,-101},{-89.55,-101},{-89.55,-124.6},{-88.8,-124.6}},
      color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(Light_Driver_Loss.u2, Plenum_heat_Gain.y) annotation (Line(
      points={{-97.2,-124.6},{-97.2,-112.3},{-117.1,-112.3},{-117.1,-101}},
      color={0,0,127},
      pattern=LinePattern.DashDot));
  connect(Light_Driver_Loss2.y, Light_Driver_Loss1.u1) annotation (Line(points=
          {{157,-72.7},{150.5,-72.7},{150.5,-78.6},{143.2,-78.6}}, color={0,0,
          127}));
  connect(Light_cbl_loss3.y, Light_Driver_Loss3.u2) annotation (Line(
      points={{-239,-36.7},{-239,-63.35},{-233.2,-63.35},{-233.2,-90.6}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Light_cbl_loss1.y, Light_Driver_Loss3.u1) annotation (Line(
      points={{-221,-64.7},{-221,-78.35},{-224.8,-78.35},{-224.8,-90.6}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  connect(Light_Driver_Loss3.y, Light_Driver_Loss2.u1) annotation (Line(
      points={{-229,-106.7},{-230,-106.7},{-230,-148},{198,-148},{198,-56.6},{
          161.2,-56.6}},
      color={28,108,200},
      pattern=LinePattern.DashDot));
  connect(PS_cable_loss1.y, Light_Driver_Loss2.u2) annotation (Line(
      points={{163,-34.7},{163,-46.35},{152.8,-46.35},{152.8,-56.6}},
      color={0,0,127},
      pattern=LinePattern.Dot));
  annotation (
    experiment(
      StartTime=27648000,
      StopTime=28944000,
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
          origin={-100,-76},
          extent={{-64,-10},{64,10}},
          textString="Individual Lights will have Power In from E+"),
        Text(
          origin={66,-72},
          extent={{-64,-10},{64,10}},
          textString="Individual Prog DC Load will have Power in from E+"),
        Text(
          origin={12,58},
          extent={{-43,-5},{43,5}},
          textString="Heat Gain - Plenum (Nextex Hub)"),
        Text(
          origin={186,110},
          extent={{-64,-10},{64,10}},
          lineColor={0,0,0},
          textString="Power - Solid Lines
Input Value - Dashed Line
Output Value - Dotted Line"),
        Text(
          origin={-259.5,-51.5},
          rotation=90,
          extent={{-75.5,-2.5},{75.5,2.5}},
          textString="Heat Gain To E+ (Plenum)"),
        Text(
          origin={209.5,-69.5},
          rotation=90,
          extent={{-43.5,-5.5},{43.5,5.5}},
          textString="Heat Gain To E+ (Cond Space)",
          lineColor={0,0,0},
          pattern=LinePattern.DashDot,
          fontSize=0)}),
    Icon(coordinateSystem(extent={{-200,-100},{200,100}})));
end flexlab_dc_1;
