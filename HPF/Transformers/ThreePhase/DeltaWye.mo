within HPF.Transformers.ThreePhase;
model DeltaWye
  outer SystemDef systemDef;
  HPF.SinglePhase.Interface.HPin_P pinPrim_A(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin={-102,100},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-102,100},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  HPF.SinglePhase.Interface.HPin_P pinPrim_B(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_C(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_A(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_B(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_C(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N pinSec_N(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.SinglePhase.Simplified T1 annotation (
    Placement(visible = true, transformation(origin = {4, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground
    annotation (Placement(visible = true, transformation(extent = {{18, -156}, {38, -136}}, rotation = 0)));
  HPF.Transformers.SinglePhase.Simplified T2 annotation(
    Placement(visible = true, transformation(origin = {4, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.SinglePhase.Simplified T3 annotation(
    Placement(visible = true, transformation(origin = {2, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pinSec_C, pinSec_C) annotation(
    Line(points = {{100, -40}, {100, -40}}, color = {0, 0, 0}));
  connect(T1.pinP_prim, pinPrim_A) annotation(
    Line(points = {{-6, 80}, {-14, 80}, {-14, 100}, {-102, 100}}));
  connect(T1.pinP_sec, pinSec_A) annotation(
    Line(points = {{14, 80}, {20, 80}, {20, 120}, {100, 120}}));
  connect(T1.pinN_prim, pinPrim_C) annotation(
    Line(points = {{-6, 60}, {-24, 60}, {-24, -40}, {-60, -40}, {-60, -100}, {-100, -100}}, color = {117, 80, 123}));
  connect(pinPrim_B, T2.pinP_prim) annotation(
    Line(points = {{-100, 0}, {-6, 0}}));
  connect(T3.pinP_prim, pinPrim_C) annotation(
    Line(points = {{-8, -100}, {-100, -100}, {-100, -100}, {-100, -100}}));
  connect(T3.pinN_prim, pinPrim_B) annotation(
    Line(points = {{-8, -120}, {-70, -120}, {-70, 0}, {-100, 0}, {-100, 0}}, color = {117, 80, 123}));
  connect(T1.pinN_sec, ground.pin) annotation(
    Line(points = {{14, 60}, {28, 60}, {28, -146}}, color = {117, 80, 123}));
  connect(T2.pinN_sec, ground.pin) annotation(
    Line(points = {{14, -20}, {28, -20}, {28, -146}}, color = {117, 80, 123}));
  connect(T3.pinN_sec, ground.pin) annotation(
    Line(points = {{12, -120}, {28, -120}, {28, -146}}, color = {117, 80, 123}));
  connect(T2.pinP_sec, pinSec_B) annotation(
    Line(points = {{14, 0}, {60, 0}, {60, 40}, {100, 40}, {100, 40}}));
  connect(pinSec_C.pinSec_C, T3.pinP_sec) annotation(
    Line(points = {{100, -40}, {60, -40}, {60, -100}, {12, -100}, {12, -100}, {12, -100}}));
  connect(T3.pinN_sec, pinSec_N.pinSec_N) annotation(
    Line(points = {{12, -120}, {100, -120}, {100, -120}, {100, -120}}, color = {117, 80, 123}));
  annotation (
    Diagram(coordinateSystem(extent = {{-160, -160}, {160, 160}})),
    Icon(coordinateSystem(extent = {{-160, -160}, {160, 160}}, initialScale = 0.1), graphics={  Rectangle(origin = {10, 40}, extent = {{-100, 100}, {80, -180}}), Line(origin = {-1.36, -25.17}, points = {{-74, -26}, {-44, 42}, {-16, -26}, {-74, -26}}, color = {92, 53, 102}), Line(origin = {-0.204807, -24.3999}, points = {{42, 36}, {60, 0}, {78, 36}}, color = {92, 53, 102}), Line(origin = {-0.208107, -24.0148}, points = {{60, 0}, {60, -30}}, color = {92, 53, 102}), Text(origin = {-30, -30}, lineColor = {92, 53, 102}, extent = {{-50, -24}, {30, -50}}, textString = "D11"), Ellipse(origin = {-15, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Ellipse(origin = {17, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Line(origin = {-50.5497, 80.1482}, points = {{11, 0}, {-11, 0}}), Line(origin = {53.2923, 79.9842}, points = {{11, 0}, {-11, 0}}), Text(origin = {0, 172}, lineColor = {92, 53, 102}, extent = {{-318, 28}, {320, -32}}, textString = "%name"), Text(origin = {70, -30}, lineColor = {92, 53, 102}, extent = {{-50, -24}, {30, -50}}, textString = "Y")}));
end DeltaWye;