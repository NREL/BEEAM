within HPF;

model FlexLab_AC1
  inner HPF.SystemDef systemDef(fFund = 60, fs = 5000, hrms = {1, 3, 5, 7, 9}, numPh = 1)  annotation (
    Placement(visible = true, transformation(origin={-182,86.5714},    extent = {{-16, -16}, {16, 11.4286}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource Vin(start_v_re = {120, 0, 0, 0, 0}, theta(displayUnit = "rad", fixed = true), vArg = {0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0})  annotation (
    Placement(visible = true, transformation(origin={2,90},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground GndAC annotation (
    Placement(visible = true, transformation(origin={-40,90},    extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  HPF.DC.Variable_DC_Load Light_1 annotation(
    Placement(visible = true, transformation(origin = {-88, 78}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Analog.Basic.Ground GndDC annotation(
    Placement(visible = true, transformation(origin = {136, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_1 annotation(
    Placement(visible = true, transformation(origin = {91, 83}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Light_2 annotation(
    Placement(visible = true, transformation(origin = {-90, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_3 annotation(
    Placement(visible = true, transformation(origin = {-92, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_4 annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_5 annotation(
    Placement(visible = true, transformation(origin = {-86, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Light_6 annotation(
    Placement(visible = true, transformation(origin = {-86, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_2 annotation(
    Placement(visible = true, transformation(origin = {91, 51}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_3 annotation(
    Placement(visible = true, transformation(origin = {93, 21}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_4 annotation(
    Placement(visible = true, transformation(origin = {96, -16}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_5 annotation(
    Placement(visible = true, transformation(origin = {95, -47}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  HPF.DC.Variable_DC_Load Prog_DC_Ld_6 annotation(
    Placement(visible = true, transformation(origin = {100, -76}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Load_const(k = 375)  annotation(
    Placement(visible = true, transformation(origin = {186, 78}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant Light_Constant(k = 210)  annotation(
    Placement(visible = true, transformation(origin = {-64, 92}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS1(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {54, 80}, extent = {{-8, -6}, {8, 6}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS3(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {57, 19}, extent = {{-9, -7}, {9, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS2(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {56, 51}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS5(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {58, -46}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS6(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {60, -77}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Desk_PS4(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 12, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Seasonic_SSR-550PX__300W.mat", nomP = 350, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {56, -16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_1(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-50, 73}, extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_2(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-52, 47}, extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_3(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-52, 20}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_4(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-51, -7}, extent = {{9, -7}, {-9, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_5(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-52, -35}, extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  HPF.PowerConverters.SinglePhase.ACDC_EmpMdl Driver_6(P1(start = 1), P_DCmin = 0.2, Q1(start = 0), V_Rect = 24, modelFileName = "HPF/Data/ConverterModels/SinglePhase/ACDC/Osram_OTi48_LED_Driver.mat", nomP = 60, nomV = 120) annotation(
    Placement(visible = true, transformation(origin = {-52, -65}, extent = {{8, -7}, {-8, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {-169, 5}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-162, -40}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Blocks.Math.Add add2 annotation(
    Placement(visible = true, transformation(origin = {-173, 49}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add3 Plenum annotation(
    Placement(visible = true, transformation(origin = {-187, -51}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add add4 annotation(
    Placement(visible = true, transformation(origin = {145, 45}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add add5 annotation(
    Placement(visible = true, transformation(origin = {155, 1}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add add6 annotation(
    Placement(visible = true, transformation(origin = {151, -57}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Math.Add3 Cond_Space annotation(
    Placement(visible = true, transformation(origin = {187, -77}, extent = {{-7, -7}, {7, 7}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant No_Loads(k = 6) annotation(
    Placement(visible = true, transformation(origin = {186, 48}, extent = {{8, -8}, {-8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Division division annotation(
    Placement(visible = true, transformation(origin = {150, 76}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {-119, 89}, extent = {{7, -7}, {-7, 7}}, rotation = 0)));
equation
  connect(Vin.pin_n, GndAC.pin) annotation(
    Line(points = {{-8, 90}, {-32, 90}}, color = {117, 80, 123}));
  connect(Desk_PS1.pin_p, Prog_DC_Ld_1.p) annotation(
    Line(points = {{62, 84}, {71, 84}, {71, 83}, {80, 83}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.p, Desk_PS2.pin_p) annotation(
    Line(points = {{80, 51}, {79, 51}, {79, 55}, {64, 55}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.p, Desk_PS4.pin_p) annotation(
    Line(points = {{84, -16}, {73, -16}, {73, -11}, {64, -11}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.p, Desk_PS5.pin_p) annotation(
    Line(points = {{84, -47}, {84, -41}, {66, -41}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.p, Desk_PS6.pin_p) annotation(
    Line(points = {{88, -76}, {78, -76}, {78, -73}, {68, -73}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.p, Desk_PS3.pin_p) annotation(
    Line(points = {{82, 21}, {83, 21}, {83, 23}, {66, 23}}, color = {0, 0, 255}));
  connect(Light_1.p, Driver_1.pin_p) annotation(
    Line(points = {{-78, 78}, {-69, 78}, {-69, 77}, {-58, 77}}, color = {0, 0, 255}));
  connect(Driver_2.pin_p, Light_2.p) annotation(
    Line(points = {{-60, 51}, {-70, 51}, {-70, 52}, {-80, 52}}, color = {0, 0, 255}));
  connect(Light_3.p, Driver_3.pin_p) annotation(
    Line(points = {{-82, 28}, {-72, 28}, {-72, 25}, {-60, 25}}, color = {0, 0, 255}));
  connect(Light_4.p, Driver_4.pin_p) annotation(
    Line(points = {{-80, 0}, {-70, 0}, {-70, -3}, {-60, -3}}, color = {0, 0, 255}));
  connect(Light_5.p, Driver_5.pin_p) annotation(
    Line(points = {{-76, -30}, {-67, -30}, {-67, -31}, {-60, -31}}, color = {0, 0, 255}));
  connect(Light_6.p, Driver_6.pin_p) annotation(
    Line(points = {{-76, -60}, {-68, -60}, {-68, -61}, {-60, -61}}, color = {0, 0, 255}));
  connect(Desk_PS6.hPin_P, Vin.pin_p) annotation(
    Line(points = {{52, -73}, {12, -73}, {12, 90}}, color = {92, 53, 102}));
  connect(Desk_PS1.hPin_P, Vin.pin_p) annotation(
    Line(points = {{46, 84}, {12, 84}, {12, 90}}, color = {92, 53, 102}));
  connect(Desk_PS2.hPin_P, Vin.pin_p) annotation(
    Line(points = {{48, 55}, {12, 55}, {12, 90}}, color = {92, 53, 102}));
  connect(Desk_PS3.hPin_P, Vin.pin_p) annotation(
    Line(points = {{48, 23}, {12, 23}, {12, 90}}, color = {92, 53, 102}));
  connect(Desk_PS4.hPin_P, Vin.pin_p) annotation(
    Line(points = {{48, -11}, {12, -11}, {12, 90}}, color = {92, 53, 102}));
  connect(Desk_PS5.hPin_P, Vin.pin_p) annotation(
    Line(points = {{50, -41}, {12, -41}, {12, 90}}, color = {92, 53, 102}));
  connect(Driver_1.hPin_P, Vin.pin_p) annotation(
    Line(points = {{-42, 77}, {12, 77}, {12, 90}}, color = {92, 53, 102}));
  connect(Driver_2.hPin_P, Vin.pin_p) annotation(
    Line(points = {{-44, 51}, {12, 51}, {12, 90}}, color = {92, 53, 102}));
  connect(Driver_3.hPin_P, Vin.pin_p) annotation(
    Line(points = {{-44, 25}, {12, 25}, {12, 90}}, color = {92, 53, 102}));
  connect(Driver_4.hPin_P, Vin.pin_p) annotation(
    Line(points = {{-42, -3}, {12, -3}, {12, 90}}, color = {92, 53, 102}));
  connect(Driver_5.hPin_P, Vin.pin_p) annotation(
    Line(points = {{-44, -31}, {12, -31}, {12, 90}}, color = {92, 53, 102}));
  connect(Driver_6.hPin_P, Vin.pin_p) annotation(
    Line(points = {{-44, -61}, {12, -61}, {12, 90}}, color = {92, 53, 102}));
  connect(Desk_PS6.hPin_N, Vin.pin_n) annotation(
    Line(points = {{52, -81}, {-8, -81}, {-8, 90}}, color = {117, 80, 123}));
  connect(Driver_1.hPin_N, Vin.pin_n) annotation(
    Line(points = {{-42, 69}, {-8, 69}, {-8, 90}}, color = {117, 80, 123}));
  connect(Driver_2.hPin_N, Vin.pin_n) annotation(
    Line(points = {{-44, 43}, {-8, 43}, {-8, 90}}, color = {117, 80, 123}));
  connect(Driver_3.hPin_N, Vin.pin_n) annotation(
    Line(points = {{-44, 15}, {-8, 15}, {-8, 90}}, color = {117, 80, 123}));
  connect(Driver_4.hPin_N, Vin.pin_n) annotation(
    Line(points = {{-42, -11}, {-8, -11}, {-8, 90}}, color = {117, 80, 123}));
  connect(Driver_5.hPin_N, Vin.pin_n) annotation(
    Line(points = {{-44, -39}, {-8, -39}, {-8, 90}}, color = {117, 80, 123}));
  connect(Driver_6.hPin_N, Vin.pin_n) annotation(
    Line(points = {{-44, -69}, {-8, -69}, {-8, 90}}, color = {117, 80, 123}));
  connect(Light_1.n, GndDC.p) annotation(
    Line(points = {{-98, 78}, {-134, 78}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.n, GndDC.p) annotation(
    Line(points = {{112, -76}, {117, -76}, {117, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.n, GndDC.p) annotation(
    Line(points = {{106, -46}, {126, -46}, {126, -90}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.n, GndDC.p) annotation(
    Line(points = {{104, 22}, {126, 22}, {126, -90}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.n, GndDC.p) annotation(
    Line(points = {{102, 52}, {126, 52}, {126, -90}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.n, GndDC.p) annotation(
    Line(points = {{108, -16}, {126, -16}, {126, -90}}, color = {0, 0, 255}));
  connect(Prog_DC_Ld_1.n, GndDC.p) annotation(
    Line(points = {{102, 84}, {126, 84}, {126, -90}}, color = {0, 0, 255}));
  connect(Desk_PS6.pin_n, GndDC.p) annotation(
    Line(points = {{68, -81}, {80, -81}, {80, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Desk_PS5.pin_n, GndDC.p) annotation(
    Line(points = {{66, -51}, {76, -51}, {76, -60}, {126, -60}, {126, -90}}, color = {0, 0, 255}));
  connect(Desk_PS4.pin_n, GndDC.p) annotation(
    Line(points = {{64, -21}, {74, -21}, {74, -34}, {126, -34}, {126, -90}}, color = {0, 0, 255}));
  connect(Desk_PS1.hPin_N, Vin.pin_n) annotation(
    Line(points = {{46, 76}, {-8, 76}, {-8, 90}}, color = {117, 80, 123}));
  connect(Desk_PS2.hPin_N, Vin.pin_n) annotation(
    Line(points = {{48, 47}, {-8, 47}, {-8, 90}}, color = {117, 80, 123}));
  connect(Desk_PS3.hPin_N, Vin.pin_n) annotation(
    Line(points = {{48, 15}, {-8, 15}, {-8, 90}}, color = {117, 80, 123}));
  connect(Desk_PS4.hPin_N, Vin.pin_n) annotation(
    Line(points = {{48, -21}, {-8, -21}, {-8, 90}}, color = {117, 80, 123}));
  connect(Desk_PS5.hPin_N, Vin.pin_n) annotation(
    Line(points = {{50, -51}, {-8, -51}, {-8, 90}}, color = {117, 80, 123}));
  connect(Light_6.n, GndDC.p) annotation(
    Line(points = {{-96, -60}, {-134, -60}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Light_2.n, GndDC.p) annotation(
    Line(points = {{-100, 52}, {-134, 52}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Light_5.n, GndDC.p) annotation(
    Line(points = {{-96, -30}, {-134, -30}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Light_4.n, GndDC.p) annotation(
    Line(points = {{-100, 0}, {-134, 0}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Light_3.n, GndDC.p) annotation(
    Line(points = {{-102, 28}, {-134, 28}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Driver_1.pin_n, GndDC.p) annotation(
    Line(points = {{-58, 69}, {-134, 69}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Driver_3.pin_n, GndDC.p) annotation(
    Line(points = {{-60, 15}, {-134, 15}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Driver_2.pin_n, GndDC.p) annotation(
    Line(points = {{-60, 43}, {-134, 43}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Driver_4.pin_n, GndDC.p) annotation(
    Line(points = {{-60, -11}, {-134, -11}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Driver_5.pin_n, GndDC.p) annotation(
    Line(points = {{-60, -39}, {-134, -39}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Driver_6.pin_n, GndDC.p) annotation(
    Line(points = {{-60, -69}, {-134, -69}, {-134, -90}, {126, -90}}, color = {0, 0, 255}));
  connect(Desk_PS3.pin_n, GndDC.p) annotation(
    Line(points = {{66, 14}, {126, 14}, {126, -90}}, color = {0, 0, 255}));
  connect(Desk_PS2.pin_n, GndDC.p) annotation(
    Line(points = {{64, 46}, {126, 46}, {126, -90}}, color = {0, 0, 255}));
  connect(Desk_PS1.pin_n, GndDC.p) annotation(
    Line(points = {{62, 76}, {126, 76}, {126, -90}}, color = {0, 0, 255}));
  connect(Driver_3.PLoss, add.u2) annotation(
    Line(points = {{-52, 28}, {-173, 28}, {-173, 13}}, color = {0, 0, 127}));
  connect(Driver_4.PLoss, add.u1) annotation(
    Line(points = {{-50, 0}, {-165, 0}, {-165, 13}}, color = {0, 0, 127}));
  connect(Driver_5.PLoss, add1.u2) annotation(
    Line(points = {{-52, -28}, {-166, -28}, {-166, -33}}, color = {0, 0, 127}));
  connect(Driver_6.PLoss, add1.u1) annotation(
    Line(points = {{-52, -58}, {-158, -58}, {-158, -33}}, color = {0, 0, 127}));
  connect(Driver_1.PLoss, add2.u2) annotation(
    Line(points = {{-50, 80}, {-178, 80}, {-178, 58}}, color = {0, 0, 127}));
  connect(Driver_2.PLoss, add2.u1) annotation(
    Line(points = {{-52, 54}, {-168, 54}, {-168, 58}}, color = {0, 0, 127}));
  connect(add2.y, Plenum.u3) annotation(
    Line(points = {{-172, 42}, {-192, 42}, {-192, -42}}, color = {0, 0, 127}));
  connect(add.y, Plenum.u2) annotation(
    Line(points = {{-168, -2}, {-186, -2}, {-186, -42}}, color = {0, 0, 127}));
  connect(add1.y, Plenum.u1) annotation(
    Line(points = {{-162, -46}, {-182, -46}, {-182, -42}}, color = {0, 0, 127}));
  connect(add6.y, Cond_Space.u1) annotation(
    Line(points = {{151, -65}, {192, -65}, {192, -68}}, color = {0, 0, 127}));
  connect(add5.y, Cond_Space.u2) annotation(
    Line(points = {{155, -7}, {188, -7}, {188, -68}}, color = {0, 0, 127}));
  connect(add4.y, Cond_Space.u3) annotation(
    Line(points = {{146, 38}, {182, 38}, {182, -68}}, color = {0, 0, 127}));
  connect(Desk_PS6.PLoss, add6.u2) annotation(
    Line(points = {{60, -70}, {146, -70}, {146, -48}}, color = {0, 0, 127}));
  connect(Desk_PS5.PLoss, add6.u1) annotation(
    Line(points = {{58, -38}, {156, -38}, {156, -48}}, color = {0, 0, 127}));
  connect(Desk_PS4.PLoss, add5.u2) annotation(
    Line(points = {{56, -8}, {150, -8}, {150, 10}}, color = {0, 0, 127}));
  connect(Desk_PS3.PLoss, add5.u1) annotation(
    Line(points = {{58, 26}, {160, 26}, {160, 10}}, color = {0, 0, 127}));
  connect(Desk_PS2.PLoss, add4.u2) annotation(
    Line(points = {{56, 58}, {140, 58}, {140, 54}}, color = {0, 0, 127}));
  connect(Desk_PS1.PLoss, add4.u1) annotation(
    Line(points = {{54, 86}, {150, 86}, {150, 54}}, color = {0, 0, 127}));
  connect(Load_const.y, division.u1) annotation(
    Line(points = {{176, 78}, {162, 78}, {162, 82}}, color = {0, 0, 127}));
  connect(No_Loads.y, division.u2) annotation(
    Line(points = {{178, 48}, {162, 48}, {162, 70}}, color = {0, 0, 127}));
  connect(division.y, Prog_DC_Ld_1.u) annotation(
    Line(points = {{140, 76}, {92, 76}, {92, 88}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_2.u, division.y) annotation(
    Line(points = {{92, 56}, {140, 56}, {140, 76}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_3.u, division.y) annotation(
    Line(points = {{94, 26}, {140, 26}, {140, 76}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_4.u, division.y) annotation(
    Line(points = {{96, -10}, {140, -10}, {140, 76}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_3.u, division.y) annotation(
    Line(points = {{94, 26}, {140, 26}, {140, 76}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_5.u, division.y) annotation(
    Line(points = {{96, -42}, {140, -42}, {140, 76}}, color = {0, 0, 127}));
  connect(Prog_DC_Ld_6.u, division.y) annotation(
    Line(points = {{100, -70}, {140, -70}, {140, 76}}, color = {0, 0, 127}));
  connect(Light_Constant.y, division1.u1) annotation(
    Line(points = {{-70, 92}, {-110, 92}, {-110, 94}}, color = {0, 0, 127}));
  connect(division1.u2, No_Loads.y) annotation(
    Line(points = {{-110, 84}, {178, 84}, {178, 48}}, color = {0, 0, 127}));
  connect(division1.y, Light_6.u) annotation(
    Line(points = {{-126, 90}, {-150, 90}, {-150, -64}, {-86, -64}}, color = {0, 0, 127}));
  connect(Light_5.u, division1.y) annotation(
    Line(points = {{-86, -34}, {-150, -34}, {-150, 90}, {-126, 90}}, color = {0, 0, 127}));
  connect(Light_4.u, division1.y) annotation(
    Line(points = {{-90, -4}, {-150, -4}, {-150, 90}, {-126, 90}}, color = {0, 0, 127}));
  connect(Light_3.u, division1.y) annotation(
    Line(points = {{-92, 24}, {-150, 24}, {-150, 90}, {-126, 90}}, color = {0, 0, 127}));
  connect(Light_2.u, division1.y) annotation(
    Line(points = {{-90, 48}, {-150, 48}, {-150, 90}, {-126, 90}}, color = {0, 0, 127}));
  connect(Light_1.u, division1.y) annotation(
    Line(points = {{-88, 74}, {-150, 74}, {-150, 90}, {-126, 90}}, color = {0, 0, 127}));
  annotation (
    uses(HPF(version = "0.1.0-beta"), Modelica(version = "3.2.3")),
    experiment(StartTime = 0, StopTime = 129600, Tolerance = 1e-6, Interval = 60),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics = {Text(origin = {-196, -54}, rotation = 90, extent = {{-37, -5}, {37, 5}}, textString = "Heat Gain To E+ (Plenum)"), Text(origin = {173, -55}, rotation = 90, extent = {{-42, -10}, {42, 10}}, textString = "Heat Gain To E+ (Cond Space)"), Text(origin = {-74, -84}, extent = {{-64, -10}, {64, 10}}, textString = "Individual Lights will have Power In from E+"), Text(origin = {94, 94}, extent = {{-64, -10}, {64, 10}}, textString = "Individual Prog DC Load will have Power in from E+")}),
  Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  version = "");
end FlexLab_AC1;
