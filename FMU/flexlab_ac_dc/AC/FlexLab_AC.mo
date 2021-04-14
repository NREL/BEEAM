within ;

model FlexLab_AC1
  inner HPF.SystemDef systemDef(fFund = 60, fs = 5000, hrms = {1, 3, 5, 7, 9}, numPh = 1)  annotation (
    Placement(visible = true, transformation(origin={-182,86.5714},    extent = {{-16, -16}, {16, 11.4286}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource Vin(start_v_re = {120, 0, 0, 0, 0}, theta(displayUnit = "rad", fixed = true), vArg = {0, 0, 0, 0, 0}, vMag = {120, 0, 0, 0, 0})  annotation (
    Placement(visible = true, transformation(origin={2,90},    extent = {{10, -10}, {-10, 10}}, rotation = 0)));
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
    fmi_StartTime=26265000,
    fmi_StopTime=29029800,
    fmi_NumberOfSteps=3072)
    annotation (Placement(transformation(extent={{-8,-126},{12,-106}})));
  Modelica.Blocks.Sources.Constant DCHUB(k=0)
    annotation (Placement(transformation(extent={{-76,-138},{-56,-118}})));
equation
  connect(Vin.pin_n, GndAC.pin) annotation (
    Line(points = {{-8, 90}, {-32, 90}}, color = {117, 80, 123}));
  connect(Desk_PS1.pin_p, Prog_DC_Ld_1.p) annotation (
    Line(points={{62,83.6},{71,83.6},{71,83},{80,83}},      color = {0, 0, 255}));
  connect(Prog_DC_Ld_2.p, Desk_PS2.pin_p) annotation (
    Line(points={{80,51},{79,51},{79,55.2},{64,55.2}},      color = {0, 0, 255}));
  connect(Prog_DC_Ld_4.p, Desk_PS4.pin_p) annotation (
    Line(points={{84,-16},{73,-16},{73,-11.2},{64,-11.2}},      color = {0, 0, 255}));
  connect(Prog_DC_Ld_5.p, Desk_PS5.pin_p) annotation (
    Line(points={{84,-47},{84,-41.2},{66,-41.2}},    color = {0, 0, 255}));
  connect(Prog_DC_Ld_6.p, Desk_PS6.pin_p) annotation (
    Line(points={{88,-76},{78,-76},{78,-72.8},{68,-72.8}},      color = {0, 0, 255}));
  connect(Prog_DC_Ld_3.p, Desk_PS3.pin_p) annotation (
    Line(points={{82,21},{83,21},{83,23.2},{66,23.2}},      color = {0, 0, 255}));
  connect(Light_1.p, Driver_1.pin_p) annotation (
    Line(points={{-78,78},{-69,78},{-69,77.2},{-58,77.2}},      color = {0, 0, 255}));
  connect(Driver_2.pin_p, Light_2.p) annotation (
    Line(points={{-60,51.2},{-70,51.2},{-70,52},{-80,52}},      color = {0, 0, 255}));
  connect(Light_3.p, Driver_3.pin_p) annotation (
    Line(points={{-82,28},{-72,28},{-72,24.8},{-60,24.8}},      color = {0, 0, 255}));
  connect(Light_4.p, Driver_4.pin_p) annotation (
    Line(points={{-80,0},{-70,0},{-70,-2.8},{-60,-2.8}},      color = {0, 0, 255}));
  connect(Light_5.p, Driver_5.pin_p) annotation (
    Line(points={{-76,-30},{-67,-30},{-67,-30.8},{-60,-30.8}},      color = {0, 0, 255}));
  connect(Light_6.p, Driver_6.pin_p) annotation (
    Line(points={{-76,-60},{-68,-60},{-68,-60.8},{-60,-60.8}},      color = {0, 0, 255}));
  connect(Desk_PS6.hPin_P, Vin.pin_p) annotation (
    Line(points={{52,-72.8},{12,-72.8},{12,90}},    color = {92, 53, 102}));
  connect(Desk_PS1.hPin_P, Vin.pin_p) annotation (
    Line(points={{46,83.6},{12,83.6},{12,90}},    color = {92, 53, 102}));
  connect(Desk_PS2.hPin_P, Vin.pin_p) annotation (
    Line(points={{48,55.2},{12,55.2},{12,90}},    color = {92, 53, 102}));
  connect(Desk_PS3.hPin_P, Vin.pin_p) annotation (
    Line(points={{48,23.2},{12,23.2},{12,90}},    color = {92, 53, 102}));
  connect(Desk_PS4.hPin_P, Vin.pin_p) annotation (
    Line(points={{48,-11.2},{12,-11.2},{12,90}},    color = {92, 53, 102}));
  connect(Desk_PS5.hPin_P, Vin.pin_p) annotation (
    Line(points={{50,-41.2},{12,-41.2},{12,90}},    color = {92, 53, 102}));
  connect(Driver_1.hPin_P, Vin.pin_p) annotation (
    Line(points={{-42,77.2},{12,77.2},{12,90}},    color = {92, 53, 102}));
  connect(Driver_2.hPin_P, Vin.pin_p) annotation (
    Line(points={{-44,51.2},{12,51.2},{12,90}},    color = {92, 53, 102}));
  connect(Driver_3.hPin_P, Vin.pin_p) annotation (
    Line(points={{-44,24.8},{12,24.8},{12,90}},    color = {92, 53, 102}));
  connect(Driver_4.hPin_P, Vin.pin_p) annotation (
    Line(points={{-42,-2.8},{12,-2.8},{12,90}},    color = {92, 53, 102}));
  connect(Driver_5.hPin_P, Vin.pin_p) annotation (
    Line(points={{-44,-30.8},{12,-30.8},{12,90}},    color = {92, 53, 102}));
  connect(Driver_6.hPin_P, Vin.pin_p) annotation (
    Line(points={{-44,-60.8},{12,-60.8},{12,90}},    color = {92, 53, 102}));
  connect(Desk_PS6.hPin_N, Vin.pin_n) annotation (
    Line(points={{52,-81.2},{-8,-81.2},{-8,90}},    color = {117, 80, 123}));
  connect(Driver_1.hPin_N, Vin.pin_n) annotation (
    Line(points={{-42,68.8},{-8,68.8},{-8,90}},    color = {117, 80, 123}));
  connect(Driver_2.hPin_N, Vin.pin_n) annotation (
    Line(points={{-44,42.8},{-8,42.8},{-8,90}},    color = {117, 80, 123}));
  connect(Driver_3.hPin_N, Vin.pin_n) annotation (
    Line(points={{-44,15.2},{-8,15.2},{-8,90}},    color = {117, 80, 123}));
  connect(Driver_4.hPin_N, Vin.pin_n) annotation (
    Line(points={{-42,-11.2},{-8,-11.2},{-8,90}},    color = {117, 80, 123}));
  connect(Driver_5.hPin_N, Vin.pin_n) annotation (
    Line(points={{-44,-39.2},{-8,-39.2},{-8,90}},    color = {117, 80, 123}));
  connect(Driver_6.hPin_N, Vin.pin_n) annotation (
    Line(points={{-44,-69.2},{-8,-69.2},{-8,90}},    color = {117, 80, 123}));
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
    Line(points={{68,-81.2},{80,-81.2},{80,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Desk_PS5.pin_n, GndDC.p) annotation (
    Line(points={{66,-50.8},{76,-50.8},{76,-60},{126,-60},{126,-90}},        color = {0, 0, 255}));
  connect(Desk_PS4.pin_n, GndDC.p) annotation (
    Line(points={{64,-20.8},{74,-20.8},{74,-34},{126,-34},{126,-90}},        color = {0, 0, 255}));
  connect(Desk_PS1.hPin_N, Vin.pin_n) annotation (
    Line(points={{46,76.4},{-8,76.4},{-8,90}},    color = {117, 80, 123}));
  connect(Desk_PS2.hPin_N, Vin.pin_n) annotation (
    Line(points={{48,46.8},{-8,46.8},{-8,90}},    color = {117, 80, 123}));
  connect(Desk_PS3.hPin_N, Vin.pin_n) annotation (
    Line(points={{48,14.8},{-8,14.8},{-8,90}},    color = {117, 80, 123}));
  connect(Desk_PS4.hPin_N, Vin.pin_n) annotation (
    Line(points={{48,-20.8},{-8,-20.8},{-8,90}},    color = {117, 80, 123}));
  connect(Desk_PS5.hPin_N, Vin.pin_n) annotation (
    Line(points={{50,-50.8},{-8,-50.8},{-8,90}},    color = {117, 80, 123}));
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
    Line(points={{-58,68.8},{-134,68.8},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Driver_3.pin_n, GndDC.p) annotation (
    Line(points={{-60,15.2},{-134,15.2},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Driver_2.pin_n, GndDC.p) annotation (
    Line(points={{-60,42.8},{-134,42.8},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Driver_4.pin_n, GndDC.p) annotation (
    Line(points={{-60,-11.2},{-134,-11.2},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Driver_5.pin_n, GndDC.p) annotation (
    Line(points={{-60,-39.2},{-134,-39.2},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Driver_6.pin_n, GndDC.p) annotation (
    Line(points={{-60,-69.2},{-134,-69.2},{-134,-90},{126,-90}},      color = {0, 0, 255}));
  connect(Desk_PS3.pin_n, GndDC.p) annotation (
    Line(points={{66,14.8},{126,14.8},{126,-90}},    color = {0, 0, 255}));
  connect(Desk_PS2.pin_n, GndDC.p) annotation (
    Line(points={{64,46.8},{126,46.8},{126,-90}},    color = {0, 0, 255}));
  connect(Desk_PS1.pin_n, GndDC.p) annotation (
    Line(points={{62,76.4},{126,76.4},{126,-90}},    color = {0, 0, 255}));
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
  connect('in_fmu1'.ZoneB_lights_heating_rate, division1.u1) annotation (Line(
        points={{12,-116},{24,-116},{24,93.2},{-110.6,93.2}}, color={0,0,127}));
  connect('in_fmu1'.ZoneB_electric_heating_rate, division.u1) annotation (Line(
        points={{12,-116},{110,-116},{110,-118},{204,-118},{204,82},{162,82}},
        color={0,0,127}));
  connect(Plenum.y, 'in_fmu1'.PlnmBLightsDriver) annotation (Line(points={{-187,
          -58.7},{-187,-111},{-8.4,-111}}, color={0,0,127}));
  connect(Cond_Space.y, 'in_fmu1'.ZoneBPlugsConverters) annotation (Line(points
        ={{187,-84.7},{187,-100},{-18,-100},{-18,-116},{-8.4,-116}}, color={0,0,
          127}));
  connect(DCHUB.y, 'in_fmu1'.PlnmBDCHub) annotation (Line(points={{-55,-128},{
          -32,-128},{-32,-121},{-8.4,-121}}, color={0,0,127}));
  annotation (
    uses(HPF(version = "0.1.0-beta"), Modelica(version = "3.2.3")),
    experiment(
      StartTime=26265000,
      StopTime=29029800,
      Interval=900,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=900,
      __Dymola_Algorithm="Euler"),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", nls = "newton", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-200, -100}, {200, 100}}), graphics={  Text(origin = {-196, -54}, rotation = 90, extent = {{-37, -5}, {37, 5}}, textString = "Heat Gain To E+ (Plenum)"), Text(origin = {173, -55}, rotation = 90, extent = {{-42, -10}, {42, 10}}, textString = "Heat Gain To E+ (Cond Space)"), Text(origin = {-74, -84}, extent = {{-64, -10}, {64, 10}}, textString = "Individual Lights will have Power In from E+"), Text(origin = {94, 94}, extent = {{-64, -10}, {64, 10}}, textString = "Individual Prog DC Load will have Power in from E+")}),
  Icon(coordinateSystem(extent = {{-200, -100}, {200, 100}})),
  version = "");
end FlexLab_AC1;
