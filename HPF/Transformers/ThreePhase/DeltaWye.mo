within HPF.Transformers.ThreePhase;

model DeltaWye
  outer SystemDef systemDef;
  HPF.SinglePhase.Components.IdealTransformer IdealT_A annotation(
    Placement(visible = true, transformation(origin = {20, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_A(h = systemDef.numHrm)  annotation(
    Placement(visible = true, transformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real VPrimRated = 480 "Rated primary voltage (ph-ph)";
  parameter Real VSecRated = 208 "Rated secondary voltage (ph-ph)";
  parameter Real Rc = 1 "Core resistance";
  parameter Real Xm = 1 "Magnetizing reactance";
  parameter Real Rp = 1 "Primary winding series resistance";
  parameter Real Xp = 1 "Primary winding series reactance";
  parameter Real Rs = 1 "Secondary winding series resistance";
  parameter Real Xs = 1 "Secondary winding series reactance";
  parameter Real misc = 1 "Misc parameters (see notes)";
  // private
  Real N = VPrimRated / VSecRated "Turns ratio N:1";
  HPF.SinglePhase.Interface.HPin_P pinPrim_B(h = systemDef.numHrm)  annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_C(h = systemDef.numHrm)  annotation(
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_A(h = systemDef.numHrm)  annotation(
    Placement(visible = true, transformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_B(h = systemDef.numHrm)  annotation(
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_C(h = systemDef.numHrm)  annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N pinSec_N(h = systemDef.numHrm)  annotation(
    Placement(visible = true, transformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor Lp_A annotation(
    Placement(visible = true, transformation(origin = {-38, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor Rp_A annotation(
    Placement(visible = true, transformation(origin = {-66, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor Ls_A annotation(
    Placement(visible = true, transformation(origin = {84, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor Rs_A annotation(
    Placement(visible = true, transformation(origin = {56, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor Lm_A annotation(
    Placement(visible = true, transformation(origin = {-6, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor Rc_A annotation(
    Placement(visible = true, transformation(origin = {-26, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.IdealTransformer IdealT_B annotation(
    Placement(visible = true, transformation(origin = {20, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor Lp_B annotation(
    Placement(visible = true, transformation(origin = {-32, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor Rp_B annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor Ls_B annotation(
    Placement(visible = true, transformation(origin = {80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor Rs_B annotation(
    Placement(visible = true, transformation(origin = {54, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Components.Inductor Lm_B annotation(
    Placement(visible = true, transformation(origin = {-6, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  SinglePhase.Components.Resistor Rc_B annotation(
    Placement(visible = true, transformation(origin = {-26, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.IdealTransformer IdealT_C annotation(
    Placement(visible = true, transformation(origin = {26, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor Lp_C annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor Rp_C annotation(
    Placement(visible = true, transformation(origin = {-58, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor Ls_C annotation(
    Placement(visible = true, transformation(origin = {76, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Resistor Rs_C annotation(
    Placement(visible = true, transformation(origin = {52, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Inductor Lm_C annotation(
    Placement(visible = true, transformation(origin = {2, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Resistor Rc_C annotation(
    Placement(visible = true, transformation(origin = {-18, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(Rc_A.pin_p, Lm_A.pin_p) annotation(
    Line(points = {{-26, 56}, {-6, 56}}));
  connect(Lp_A.pin_n, Lm_A.pin_p) annotation(
    Line(points = {{-28, 66}, {-16, 66}, {-16, 56}, {-6, 56}}, color = {117, 80, 123}));
  connect(IdealT_A.pinP_Prim, Lm_A.pin_p) annotation(
    Line(points = {{10, 56}, {8, 56}, {8, 66}, {-16, 66}, {-16, 56}, {-6, 56}}, color = {0, 0, 0}));
  connect(Rp_A.pin_n, Lp_A.pin_p) annotation(
    Line(points = {{-56, 66}, {-48, 66}}, color = {117, 80, 123}));
  connect(IdealT_A.pinP_Sec, Rs_A.pin_p) annotation(
    Line(points = {{30, 56}, {30, 66}, {46, 66}}, color = {0, 0, 0}));
  connect(Rs_A.pin_n, Ls_A.pin_p) annotation(
    Line(points = {{66, 66}, {74, 66}}, color = {117, 80, 123}));
  connect(Rc_B.pin_p, Lm_B.pin_p) annotation(
    Line(points = {{-26, 0}, {-6, 0}}));
  connect(Rc_B.pin_n, Lm_B.pin_n) annotation(
    Line(points = {{-26, -20}, {-6, -20}}, color = {117, 80, 123}));
  connect(Lp_B.pin_n, Lm_B.pin_p) annotation(
    Line(points = {{-22, 10}, {-16, 10}, {-16, 0}, {-6, 0}}, color = {117, 80, 123}));
  connect(IdealT_B.pinP_Prim, Lm_B.pin_p) annotation(
    Line(points = {{10, 0}, {8, 0}, {8, 10}, {-16, 10}, {-16, 0}, {-6, 0}}));
  connect(Rp_B.pin_n, Lp_B.pin_p) annotation(
    Line(points = {{-50, 10}, {-42, 10}}, color = {117, 80, 123}));
  connect(IdealT_B.pinP_Sec, Rs_B.pin_p) annotation(
    Line(points = {{30, 0}, {30, 10}, {44, 10}}));
  connect(Rs_B.pin_n, Ls_B.pin_p) annotation(
    Line(points = {{64, 10}, {70, 10}}, color = {117, 80, 123}));
  connect(Rc_C.pin_p, Lm_C.pin_p) annotation(
    Line(points = {{-18, -60}, {2, -60}}));
  connect(Lp_C.pin_n, Lm_C.pin_p) annotation(
    Line(points = {{-20, -50}, {-8, -50}, {-8, -60}, {2, -60}}, color = {117, 80, 123}));
  connect(IdealT_C.pinP_Prim, Lm_C.pin_p) annotation(
    Line(points = {{16, -60}, {16, -50}, {-8, -50}, {-8, -60}, {2, -60}}));
  connect(Rp_C.pin_n, Lp_C.pin_p) annotation(
    Line(points = {{-48, -50}, {-40, -50}}, color = {117, 80, 123}));
  connect(IdealT_C.pinP_Sec, Rs_C.pin_p) annotation(
    Line(points = {{36, -60}, {36, -50}, {42, -50}}));
  connect(Rs_C.pin_n, Ls_C.pin_p) annotation(
    Line(points = {{62, -50}, {66, -50}}, color = {117, 80, 123}));
  connect(pinPrim_A, Rp_A.pin_p) annotation(
    Line(points = {{-100, 100}, {-86, 100}, {-86, 66}, {-76, 66}}));
  connect(pinPrim_B, Rp_B.pin_p) annotation(
    Line(points = {{-100, 0}, {-88, 0}, {-88, 10}, {-70, 10}}));
  connect(pinPrim_C, Rp_C.pin_p) annotation(
    Line(points = {{-100, -100}, {-80, -100}, {-80, -50}, {-68, -50}}));
  connect(Ls_C.pin_n, pinSec_C) annotation(
    Line(points = {{86, -50}, {86, -40}, {100, -40}}, color = {117, 80, 123}));
  connect(IdealT_C.pinN_Sec, IdealT_B.pinN_Sec) annotation(
    Line(points = {{36, -80}, {40, -80}, {40, -20}, {30, -20}, {30, -19.8}}, color = {117, 80, 123}));
  connect(pinSec_N, IdealT_B.pinN_Sec) annotation(
    Line(points = {{100, -120}, {40, -120}, {40, -20}, {30, -20}, {30, -19.8}}, color = {117, 80, 123}));
  connect(Rc_A.pin_n, Lm_A.pin_n) annotation(
    Line(points = {{-26, 36}, {-6, 36}}, color = {117, 80, 123}));
  connect(IdealT_A.pinN_Sec, IdealT_B.pinN_Sec) annotation(
    Line(points = {{30, 36.2}, {34, 36.2}, {34, 36}, {40, 36}, {40, -20}, {30, -20}, {30, -19.8}}, color = {117, 80, 123}));
  connect(pinSec_C, pinSec_C) annotation(
    Line(points = {{100, -40}, {100, -40}}, color = {0, 0, 0}));
  connect(Ls_B.pin_n, pinSec_B) annotation(
    Line(points = {{90, 10}, {100, 10}, {100, 40}}, color = {117, 80, 123}));
  connect(Ls_A.pin_n, pinSec_A) annotation(
    Line(points = {{94, 66}, {100, 66}, {100, 120}}, color = {117, 80, 123}));
  connect(IdealT_A.pinN_Prim, Rp_C.pin_p) annotation(
    Line(points = {{10, 36}, {10, 22}, {-80, 22}, {-80, -50}, {-68, -50}}, color = {117, 80, 123}));
  connect(Lm_A.pin_n, IdealT_A.pinN_Prim) annotation(
    Line(points = {{-6, 36}, {-16, 36}, {-16, 22}, {10, 22}, {10, 36}, {10, 36}}, color = {117, 80, 123}));
  connect(IdealT_C.pinN_Prim, Rp_B.pin_p) annotation(
    Line(points = {{16, -80}, {16, -90}, {-74, -90}, {-74, 10}, {-70, 10}}, color = {117, 80, 123}));
  connect(Rc_C.pin_n, Lm_C.pin_n) annotation(
    Line(points = {{-18, -80}, {2, -80}}, color = {117, 80, 123}));
  connect(Lm_C.pin_n, IdealT_C.pinN_Prim) annotation(
    Line(points = {{2, -80}, {-8, -80}, {-8, -90}, {16, -90}, {16, -80}}, color = {117, 80, 123}));
  connect(IdealT_B.pinN_Prim, Rp_A.pin_p) annotation(
    Line(points = {{10, -20}, {8, -20}, {8, -30}, {-86, -30}, {-86, 66}, {-76, 66}}, color = {117, 80, 123}));
  connect(Lm_B.pin_n, IdealT_B.pinN_Prim) annotation(
    Line(points = {{-6, -20}, {-16, -20}, {-16, -30}, {8, -30}, {8, -20}, {10, -20}, {10, -20}}, color = {117, 80, 123}));
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -160}, {160, 160}})),
    Icon(coordinateSystem(extent = {{-160, -160}, {160, 160}}, initialScale = 0.1), graphics = {Rectangle(origin = {10, 40}, extent = {{-100, 100}, {80, -180}}), Line(origin = {-1.36, -25.17}, points = {{-74, -26}, {-44, 42}, {-16, -26}, {-74, -26}}, color = {92, 53, 102}), Line(origin = {-1.36, -25.17}, points = {{42, 36}, {60, 0}, {78, 36}}, color = {92, 53, 102}), Line(origin = {-1.3633, -25.17}, points = {{60, 0}, {60, -30}}, color = {92, 53, 102}), Text(origin = {-30, -30}, lineColor = {92, 53, 102}, extent = {{-60, -26}, {30, -52}}, textString = "D11"), Text(origin = {-2, -28}, lineColor = {92, 53, 102}, extent = {{46, -28}, {76, -52}}, textString = "Y"), Ellipse(origin = {-15, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Ellipse(origin = {17, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Line(origin = {-50.5497, 80.1482}, points = {{11, 0}, {-11, 0}}), Line(origin = {53.2923, 79.9842}, points = {{11, 0}, {-11, 0}}), Text(origin = {0, 180}, extent = {{-316, 24}, {316, -24}}, textString = "%name")}));
end DeltaWye;