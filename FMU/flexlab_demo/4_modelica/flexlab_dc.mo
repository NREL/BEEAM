within HPF;
model flexlab_dc_cables
  inner HPF.SystemDef systemDef(fFund = 60, fs = 5000, hrms = {1, 3, 5, 7, 9}, numPh = 1)  annotation (
    Placement(visible = true, transformation(origin={-182,86.5714},    extent = {{-16, -16}, {16, 11.4286}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource Vin(start_v_re = {120, 0, 0, 0, 0}, vArg = {0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0})  annotation (
    Placement(visible = true, transformation(origin={-58,88},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground GndAC annotation (
    Placement(visible = true, transformation(origin={-96,56},    extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Nextek_Hub(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Nextek_208V_1600W.mat", nomP = 1600, nomV = 120) "P/N ??" annotation (
    Placement(visible = true, transformation(origin={-44,50},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.Variable_DC_Load Light_1 annotation (
    Placement(visible = true, transformation(origin = {-86, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Ground GndDC annotation (
    Placement(visible = true, transformation(origin = {-176, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_1 annotation (
    Placement(visible = true, transformation(origin={30,32},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Light_2 annotation (
    Placement(visible = true, transformation(origin = {-110, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_3 annotation (
    Placement(visible = true, transformation(origin = {-136, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_4 annotation (
    Placement(visible = true, transformation(origin = {-154, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_5 annotation (
    Placement(visible = true, transformation(origin = {-128, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_6 annotation (
    Placement(visible = true, transformation(origin = {-94, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_2 annotation (
    Placement(visible = true, transformation(origin={38,14},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_3 annotation (
    Placement(visible = true, transformation(origin={58,-2},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_4 annotation (
    Placement(visible = true, transformation(origin={80,-20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_5 annotation (
    Placement(visible = true, transformation(origin={60,-38},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_6 annotation (
    Placement(visible = true, transformation(origin={16,-56},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation (
    Placement(visible = true, transformation(origin = {124, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation (
    Placement(visible = true, transformation(origin = {-168, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant No_Loads(k = 6) annotation (
    Placement(visible = true, transformation(origin = {166, 30}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k=600)
    annotation (Placement(transformation(extent={{148,68},{168,88}})));
  Modelica.Blocks.Sources.Constant const1(k=210)
    annotation (Placement(transformation(extent={{-138,72},{-118,92}})));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-57,13},   extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC1(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-77,-3},   extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC2(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-105,-19}, extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC3(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-105,-33}, extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC4(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-85,-47},  extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC5(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-63,-67},  extent={{9,-9},{
            -9,9}},                                                                              rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC6(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-2,32},    extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC7(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={6,14},     extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC8(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={18,-2},    extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC9(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={36,-20},   extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC10(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={28,-38},   extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  HPF.Cables.NEC_CableModelDC
                          nEC_CableModelDC11(wireGaugeDC=HPF.Types.WireGaugeDC.gauge_12,
      length=15.24)                                                                      annotation (
    Placement(visible = true, transformation(origin={-12,-56},  extent={{-10,-10},
            {10,10}},                                                                            rotation = 0)));
  Modelica.Blocks.Math.MultiSum Total_Cable_Loss(nu=12)
    annotation (Placement(transformation(extent={{88,82},{100,94}})));
  Cables.NEC_CableModel nEC_CableModel(wireGaugeAC=HPF.Types.WireGaugeAC.gauge_12,
      length=15.24)                                  annotation (
    Placement(visible = true, transformation(origin={-26,88},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Vin.pin_n, GndAC.pin) annotation (
    Line(points = {{-68, 88}, {-96, 88}, {-96, 64}}, color = {117, 80, 123}));
  connect(Nextek_Hub.hPin_N, Vin.pin_n) annotation (
    Line(points={{-52,60},{-80,60},{-80,88},{-68,88}},          color = {117, 80, 123}));
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
    Line(points = {{-104, -66}, {-176, -66}, {-176, -82}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.n, GndDC.p) annotation (
    Line(points={{26,-56},{100,-56},{100,-82},{-176,-82}},          color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.n, GndDC.p) annotation (
    Line(points={{70,-38},{100,-38},{100,-82},{-176,-82}},          color = {0, 0, 255}));
  connect(Prog_DC_Ld_1.n, GndDC.p) annotation (
    Line(points={{40,32},{100,32},{100,-82},{-176,-82}},          color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.n, GndDC.p) annotation (
    Line(points={{90,-20},{100,-20},{100,-82},{-176,-82}},          color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.n, GndDC.p) annotation (
    Line(points={{68,-2},{100,-2},{100,-82},{-176,-82}},          color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.n, GndDC.p) annotation (
    Line(points={{48,14},{100,14},{100,-82},{-176,-82}},          color = {0, 0, 255}));
  connect(No_Loads.y, division.u2) annotation (
    Line(points={{157.2,30},{136,30},{136,44}},      color = {0, 0, 127}));
  connect(division1.u2, No_Loads.y) annotation (
    Line(points={{-156,42},{157.2,42},{157.2,30}},    color = {0, 0, 127}));
  connect(division.y, Prog_DC_Ld_4.u) annotation (
    Line(points={{113,50},{80.2,50},{80.2,-15}},    color = {0, 0, 127}));
  connect(Prog_DC_Ld_3.u, division.y) annotation (
    Line(points={{58.2,3},{113,3},{113,50}},      color = {0, 0, 127}));
  connect(Prog_DC_Ld_2.u, division.y) annotation (
    Line(points={{38.2,19},{113,19},{113,50}},      color = {0, 0, 127}));
  connect(Prog_DC_Ld_1.u, division.y) annotation (
    Line(points={{30.2,37},{113,37},{113,50}},     color = {0, 0, 127}));
  connect(Prog_DC_Ld_5.u, division.y) annotation (
    Line(points={{60.2,-33},{113,-33},{113,50}},      color = {0, 0, 127}));
  connect(Prog_DC_Ld_6.u, division.y) annotation (
    Line(points={{16.2,-51},{113,-51},{113,50}},     color = {0, 0, 127}));
  connect(division1.y, Light_6.u) annotation (
    Line(points={{-179,48},{-190,48},{-190,-71},{-94.2,-71}},        color = {0, 0, 127}));
  connect(Light_1.u, division1.y) annotation (
    Line(points={{-86.2,9},{-190,9},{-190,48},{-179,48}},          color = {0, 0, 127}));
  connect(Light_2.u, division1.y) annotation (
    Line(points={{-110.2,-7},{-190,-7},{-190,48},{-179,48}},        color = {0, 0, 127}));
  connect(Light_3.u, division1.y) annotation (
    Line(points={{-136.2,-23},{-190,-23},{-190,48},{-179,48}},        color = {0, 0, 127}));
  connect(Light_4.u, division1.y) annotation (
    Line(points={{-154.2,-41},{-190,-41},{-190,48},{-179,48}},        color = {0, 0, 127}));
  connect(Light_5.u, division1.y) annotation (
    Line(points={{-128.2,-53},{-190,-53},{-190,48},{-179,48}},        color = {0, 0, 127}));
  connect(Light_4.u, division1.y) annotation (
    Line(points={{-154.2,-41},{-190,-41},{-190,48},{-179,48}},        color = {0, 0, 127}));
  connect(Light_1.p, nEC_CableModelDC.n) annotation (Line(points={{-76,14},{-72,
          14},{-72,13},{-66,13}}, color={0,0,255}));
  connect(Light_2.p, nEC_CableModelDC1.n)
    annotation (Line(points={{-100,-2},{-86,-2},{-86,-3}}, color={0,0,255}));
  connect(Light_3.p, nEC_CableModelDC2.n) annotation (Line(points={{-126,-18},{
          -120,-18},{-120,-19},{-114,-19}}, color={0,0,255}));
  connect(Light_4.p, nEC_CableModelDC3.n) annotation (Line(points={{-144,-36},{
          -114,-36},{-114,-33}}, color={0,0,255}));
  connect(Light_5.p, nEC_CableModelDC4.n) annotation (Line(points={{-118,-48},{
          -106,-48},{-106,-47},{-94,-47}}, color={0,0,255}));
  connect(Light_6.p, nEC_CableModelDC5.n) annotation (Line(points={{-84,-66},{
          -78,-66},{-78,-67},{-72,-67}}, color={0,0,255}));
  connect(Prog_DC_Ld_1.p, nEC_CableModelDC6.n) annotation (Line(points={{20,32},
          {16,32},{16,32},{8,32}}, color={0,0,255}));
  connect(Prog_DC_Ld_2.p, nEC_CableModelDC7.n)
    annotation (Line(points={{28,14},{16,14}}, color={0,0,255}));
  connect(Prog_DC_Ld_3.p, nEC_CableModelDC8.n)
    annotation (Line(points={{48,-2},{28,-2}}, color={0,0,255}));
  connect(Prog_DC_Ld_4.p, nEC_CableModelDC9.n)
    annotation (Line(points={{70,-20},{46,-20}}, color={0,0,255}));
  connect(Prog_DC_Ld_5.p, nEC_CableModelDC10.n) annotation (Line(points={{50,
          -38},{46,-38},{46,-38},{38,-38}}, color={0,0,255}));
  connect(Prog_DC_Ld_6.p, nEC_CableModelDC11.n)
    annotation (Line(points={{6,-56},{-2,-56}}, color={0,0,255}));
  connect(nEC_CableModelDC5.p, Nextek_Hub.pin_p) annotation (Line(points={{-54,
          -67},{-44,-67},{-44,-46},{-36,-46},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC11.p, Nextek_Hub.pin_p) annotation (Line(points={{-22,
          -56},{-30,-56},{-30,-24},{-36,-24},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC10.p, Nextek_Hub.pin_p) annotation (Line(points={{18,
          -38},{12,-38},{12,-36},{-36,-36},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC9.p, Nextek_Hub.pin_p) annotation (Line(points={{26,
          -20},{4,-20},{4,-6},{-36,-6},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC8.p, Nextek_Hub.pin_p) annotation (Line(points={{8,-2},
          {-16,-2},{-16,36},{-36,36},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC7.p, Nextek_Hub.pin_p) annotation (Line(points={{-4,
          14},{-20,14},{-20,34},{-36,34},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC6.p, Nextek_Hub.pin_p) annotation (Line(points={{-12,
          32},{-24,32},{-24,36},{-36,36},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC.p, Nextek_Hub.pin_p) annotation (Line(points={{-48,
          13},{-44,13},{-44,18},{-36,18},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC1.p, Nextek_Hub.pin_p) annotation (Line(points={{-68,
          -3},{-56,-3},{-56,6},{-36,6},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC2.p, Nextek_Hub.pin_p) annotation (Line(points={{-96,
          -19},{-74,-19},{-74,-14},{-36,-14},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC3.p, Nextek_Hub.pin_p) annotation (Line(points={{-96,
          -33},{-80,-33},{-80,-28},{-36,-28},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC4.p, Nextek_Hub.pin_p) annotation (Line(points={{-76,
          -47},{-56,-47},{-56,-24},{-36,-24},{-36,40}}, color={0,0,255}));
  connect(nEC_CableModelDC6.PLoss, Total_Cable_Loss.u[1]) annotation (Line(
        points={{-2,36.2},{2,36.2},{2,68},{66,68},{66,91.85},{88,91.85}}, color
        ={0,0,127}));
  connect(nEC_CableModelDC7.PLoss, Total_Cable_Loss.u[2]) annotation (Line(
        points={{6,18.2},{32,18.2},{32,80},{68,80},{68,91.15},{88,91.15}},
        color={0,0,127}));
  connect(nEC_CableModelDC8.PLoss, Total_Cable_Loss.u[3]) annotation (Line(
        points={{18,2.2},{44,2.2},{44,78},{74,78},{74,90.45},{88,90.45}}, color
        ={0,0,127}));
  connect(nEC_CableModelDC9.PLoss, Total_Cable_Loss.u[4]) annotation (Line(
        points={{36,-15.8},{52,-15.8},{52,84},{66,84},{66,89.75},{88,89.75}},
        color={0,0,127}));
  connect(nEC_CableModelDC10.PLoss, Total_Cable_Loss.u[5]) annotation (Line(
        points={{28,-33.8},{44,-33.8},{44,89.05},{88,89.05}}, color={0,0,127}));
  connect(nEC_CableModelDC11.PLoss, Total_Cable_Loss.u[6]) annotation (Line(
        points={{-12,-51.8},{36,-51.8},{36,88.35},{88,88.35}}, color={0,0,127}));
  connect(nEC_CableModelDC.PLoss, Total_Cable_Loss.u[7]) annotation (Line(
        points={{-57,16.78},{66,16.78},{66,87.65},{88,87.65}}, color={0,0,127}));
  connect(nEC_CableModelDC1.PLoss, Total_Cable_Loss.u[8]) annotation (Line(
        points={{-77,0.78},{68,0.78},{68,86.95},{88,86.95}}, color={0,0,127}));
  connect(nEC_CableModelDC2.PLoss, Total_Cable_Loss.u[9]) annotation (Line(
        points={{-105,-15.22},{32,-15.22},{32,16.78},{66,16.78},{66,85.375},{88,
          85.375},{88,86.25}}, color={0,0,127}));
  connect(nEC_CableModelDC3.PLoss, Total_Cable_Loss.u[10]) annotation (Line(
        points={{-105,-29.22},{74,-29.22},{74,85.55},{88,85.55}}, color={0,0,
          127}));
  connect(nEC_CableModelDC4.PLoss, Total_Cable_Loss.u[11]) annotation (Line(
        points={{-85,-43.22},{88,-43.22},{88,84.85}}, color={0,0,127}));
  connect(nEC_CableModelDC5.PLoss, Total_Cable_Loss.u[12]) annotation (Line(
        points={{-63,-63.22},{94,-63.22},{94,84.15},{88,84.15}}, color={0,0,127}));
  connect(nEC_CableModel.pin_n, Nextek_Hub.hPin_P) annotation (Line(points={{
          -16,88},{-16,74},{-36,74},{-36,60}}, color={117,80,123}));
  connect(nEC_CableModel.pin_p, Vin.pin_p)
    annotation (Line(points={{-36,88},{-48,88}}, color={92,53,102}));
  connect(const1.y, division1.u1) annotation (Line(points={{-117,82},{-118,82},
          {-118,62},{-156,62},{-156,54}}, color={0,0,127}));
  connect(const.y, division.u1) annotation (Line(points={{169,78},{158,78},{158,
          44},{136,44},{136,56}}, color={0,0,127}));
  annotation (
    experiment(
      StartTime=27648000,
      StopTime=28944000,
      Interval=900,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=900,
      __Dymola_Algorithm="Euler"),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics={  Text(origin = {-100, -76}, extent = {{-64, -10}, {64, 10}}, textString = "Individual Lights will have Power In from E+"), Text(origin = {66, -72}, extent = {{-64, -10}, {64, 10}}, textString = "Individual Prog DC Load will have Power in from E+"), Text(origin = {12, 58}, extent = {{-43, -5}, {43, 5}}, textString = "Heat Gain - Plenum (Nextex Hub)")}),
  Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})));
end flexlab_dc_cables;
