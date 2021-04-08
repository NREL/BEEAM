within HPF;

model FlexLab_DC
  inner HPF.SystemDef systemDef(fFund = 60, fs = 5000, hrms = {1, 3, 5, 7, 9}, numPh = 1)  annotation (
    Placement(visible = true, transformation(origin={-182,86.5714},    extent = {{-16, -16}, {16, 11.4286}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource Vin(start_v_re = {120, 0, 0, 0, 0}, theta(displayUnit = "rad", fixed = true), vArg = {0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0})  annotation (
    Placement(visible = true, transformation(origin={-58,88},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground GndAC annotation (
    Placement(visible = true, transformation(origin={-96,56},    extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Nextek_Hub(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Nextek_208V_1600W.mat", nomP = 1600, nomV = 120) "P/N ??" annotation (
    Placement(visible = true, transformation(origin={-44,50},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.DC.Variable_DC_Load Light_1 annotation(
    Placement(visible = true, transformation(origin = {-86, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Ground GndDC annotation(
    Placement(visible = true, transformation(origin = {-176, -92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_1 annotation(
    Placement(visible = true, transformation(origin = {0, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Light_2 annotation(
    Placement(visible = true, transformation(origin = {-110, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_3 annotation(
    Placement(visible = true, transformation(origin = {-136, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_4 annotation(
    Placement(visible = true, transformation(origin = {-154, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_5 annotation(
    Placement(visible = true, transformation(origin = {-128, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_6 annotation(
    Placement(visible = true, transformation(origin = {-94, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_2 annotation(
    Placement(visible = true, transformation(origin = {20, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_3 annotation(
    Placement(visible = true, transformation(origin = {44, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_4 annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_5 annotation(
    Placement(visible = true, transformation(origin = {44, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_6 annotation(
    Placement(visible = true, transformation(origin = {4, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Load_const(k = 375)  annotation(
    Placement(visible = true, transformation(origin = {164, 66}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Light_Constant(k = 210)  annotation(
    Placement(visible = true, transformation(origin = {-122, 62}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation(
    Placement(visible = true, transformation(origin = {124, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {-168, 48}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant No_Loads(k = 6) annotation(
    Placement(visible = true, transformation(origin = {166, 30}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
equation
  connect(Vin.pin_n, GndAC.pin) annotation(
    Line(points = {{-68, 88}, {-96, 88}, {-96, 64}}, color = {117, 80, 123}));
  connect(Nextek_Hub.hPin_N, Vin.pin_n) annotation(
    Line(points = {{-50, 60}, {-80, 60}, {-80, 88}, {-68, 88}}, color = {117, 80, 123}));
  connect(Vin.pin_p, Nextek_Hub.hPin_P) annotation(
    Line(points = {{-48, 88}, {-48, 87}, {-38, 87}, {-38, 60}}, color = {92, 53, 102}));
  connect(Light_1.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{-76, 14}, {-38, 14}, {-38, 40}}, color = {0, 0, 255}));
  connect(GndDC.p, Nextek_Hub.pin_n) annotation(
    Line(points = {{-176, -82}, {-176, 27}, {-50, 27}, {-50, 40}}, color = {0, 0, 255}));
  connect(Light_2.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{-100, -2}, {-38, -2}, {-38, 40}}, color = {0, 0, 255}));
  connect(Light_3.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{-126, -18}, {-38, -18}, {-38, 40}}, color = {0, 0, 255}));
  connect(Light_5.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{-118, -48}, {-118, -48.25}, {-38, -48.25}, {-38, 40}}, color = {0, 0, 255}));
  connect(Light_6.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{-84, -66}, {-38, -66}, {-38, 40}}, color = {0, 0, 255}));
  connect(Light_4.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{-144, -36}, {-38, -36}, {-38, 40}}, color = {0, 0, 255}));
  connect(Light_1.n, GndDC.p) annotation(
    Line(points = {{-96, 14}, {-176, 14}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_2.n, GndDC.p) annotation(
    Line(points = {{-120, -2}, {-176, -2}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_3.n, GndDC.p) annotation(
    Line(points = {{-146, -18}, {-176, -18}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_4.n, GndDC.p) annotation(
    Line(points = {{-164, -36}, {-176, -36}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_5.n, GndDC.p) annotation(
    Line(points = {{-138, -48}, {-176, -48}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_6.n, GndDC.p) annotation(
    Line(points = {{-104, -66}, {-176, -66}, {-176, -82}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_1.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{-10, 34}, {-20, 34}, {-20, 35}, {-38, 35}, {-38, 40}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{-6, -56}, {-38, -56}, {-38, 40}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{34, -38}, {-38, -38}, {-38, 40}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{60, -20}, {-38, -20}, {-38, 40}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{34, -2}, {-38, -2}, {-38, 40}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.p, Nextek_Hub.pin_p) annotation(
    Line(points = {{10, 14}, {-38, 14}, {-38, 40}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.n, GndDC.p) annotation(
    Line(points = {{14, -56}, {100, -56}, {100, -82}, {-176, -82}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.n, GndDC.p) annotation(
    Line(points = {{54, -38}, {100, -38}, {100, -82}, {-176, -82}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_1.n, GndDC.p) annotation(
    Line(points = {{10, 34}, {100, 34}, {100, -82}, {-176, -82}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.n, GndDC.p) annotation(
    Line(points = {{80, -20}, {100, -20}, {100, -82}, {-176, -82}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.n, GndDC.p) annotation(
    Line(points = {{54, -2}, {100, -2}, {100, -82}, {-176, -82}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.n, GndDC.p) annotation(
    Line(points = {{30, 14}, {100, 14}, {100, -82}, {-176, -82}}, color = {0, 0, 255}));
  connect(Light_Constant.y, division1.u1) annotation(
    Line(points = {{-132, 62}, {-156, 62}, {-156, 54}}, color = {0, 0, 127}));
  connect(Load_const.y, division.u1) annotation(
    Line(points = {{154, 66}, {136, 66}, {136, 56}}, color = {0, 0, 127}));
  connect(No_Loads.y, division.u2) annotation(
    Line(points = {{158, 30}, {136, 30}, {136, 44}}, color = {0, 0, 127}));
  connect(division1.u2, No_Loads.y) annotation(
    Line(points = {{-156, 42}, {158, 42}, {158, 30}}, color = {0, 0, 127}));
  connect(division.y, Prog_DC_Ld_4.u) annotation(
    Line(points = {{114, 50}, {70, 50}, {70, -14}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_3.u, division.y) annotation(
    Line(points = {{44, 4}, {114, 4}, {114, 50}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_2.u, division.y) annotation(
    Line(points = {{20, 20}, {114, 20}, {114, 50}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_1.u, division.y) annotation(
    Line(points = {{0, 40}, {114, 40}, {114, 50}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_5.u, division.y) annotation(
    Line(points = {{44, -32}, {114, -32}, {114, 50}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_6.u, division.y) annotation(
    Line(points = {{4, -50}, {114, -50}, {114, 50}}, color = {0, 0, 127}));
  connect(division1.y, Light_6.u) annotation(
    Line(points = {{-178, 48}, {-190, 48}, {-190, -70}, {-94, -70}}, color = {0, 0, 127}));
  connect(Light_1.u, division1.y) annotation(
    Line(points = {{-86, 10}, {-190, 10}, {-190, 48}, {-178, 48}}, color = {0, 0, 127}));
  connect(Light_2.u, division1.y) annotation(
    Line(points = {{-110, -6}, {-190, -6}, {-190, 48}, {-178, 48}}, color = {0, 0, 127}));
  connect(Light_3.u, division1.y) annotation(
    Line(points = {{-136, -22}, {-190, -22}, {-190, 48}, {-178, 48}}, color = {0, 0, 127}));
  connect(Light_4.u, division1.y) annotation(
    Line(points = {{-154, -40}, {-190, -40}, {-190, 48}, {-178, 48}}, color = {0, 0, 127}));
  connect(Light_5.u, division1.y) annotation(
    Line(points = {{-128, -52}, {-190, -52}, {-190, 48}, {-178, 48}}, color = {0, 0, 127}));
  connect(Light_4.u, division1.y) annotation(
    Line(points = {{-154, -40}, {-190, -40}, {-190, 48}, {-178, 48}}, color = {0, 0, 127}));
  annotation (
    uses(HPF(version = "0.1.0-beta"), Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 129600, Tolerance = 1e-6, Interval = 60),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics = {Text(origin = {-100, -76}, extent = {{-64, -10}, {64, 10}}, textString = "Individual Lights will have Power In from E+"), Text(origin = {66, -72}, extent = {{-64, -10}, {64, 10}}, textString = "Individual Prog DC Load will have Power in from E+"), Text(origin = {12, 58}, extent = {{-43, -5}, {43, 5}}, textString = "Heat Gain - Plenum (Nextex Hub)")}),
  Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  version = "");
end FlexLab_DC;
