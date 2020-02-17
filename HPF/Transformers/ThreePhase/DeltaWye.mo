within HPF.Transformers.ThreePhase;
model DeltaWye
  outer SystemDef systemDef;

  parameter Real VPrimRated = 480 "Rated primary voltage (ph-ph)";
  parameter Real VSecRated = 208 "Rated secondary voltage (ph-ph)";
  parameter Modelica.SIunits.Resistance Rp = 1 "Primary winding resistance (at fundamental)";
  parameter Modelica.SIunits.Reactance Xp = 1 "Primary winding reactance";
  parameter Modelica.SIunits.Resistance Rs = 1 "Secondary winding resistance";
  parameter Modelica.SIunits.Reactance Xs = 1 "Secondary winding reactance";
  parameter Modelica.SIunits.Resistance Rc = 1 "Core resistance";
  parameter Modelica.SIunits.Reactance Xm = 1 "Magnetizing reactance";
  parameter Real fW = 0 "Resistive losses";
  parameter Real fEC = 0 "Eddy current losses";
  parameter Real fOSL = 0 "Other stray losses";

  HPF.SinglePhase.Interface.HPin_P pinPrim_A(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin={-102,100},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin={-100,100},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_B(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_C(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_A(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_B(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_C(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N pinSec_N(h = systemDef.numHrm)  annotation (
    Placement(visible = true, transformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.SinglePhase.Simplified T1(N = N, Rc = Rc, Rp = Rp, Rs = Rs, Xm = Xm, Xp = Xp, Xs = Xs, fEC = fEC, fOSL = fOSL, fW = fW)  annotation (
    Placement(visible = true, transformation(origin = {4, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.SinglePhase.Simplified T2(N = N, Rc = Rc, Rp = Rp, Rs = Rs, Xm = Xm, Xp = Xp, Xs = Xs, fEC = fEC, fOSL = fOSL, fW = fW)  annotation (
    Placement(visible = true, transformation(origin = {4, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.SinglePhase.Simplified T3(N = N, Rc = Rc, Rp = Rp, Rs = Rs, Xm = Xm, Xp = Xp, Xs = Xs, fEC = fEC, fOSL = fOSL, fW = fW)  annotation (
    Placement(visible = true, transformation(origin = {2, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

/* Measurements
  * Total power loss
  * Core losses
  * Winding losses etc
*/

// private
  /*
    Transformer ration N:1 is defined for volatges at the input and output 
    port. 
    For a delta-Y transformer, the input voltage is phase 2 phase.
    The output voltage is phase to ground. For consistency, the parameters
    are defined phase-phase. 
    Performing appropriate conversion for the secondary. 
  */
  final parameter Real N = VPrimRated / (VSecRated / sqrt(3)) "Turns ratio N:1";
equation
  connect(pinSec_A, T1.pinP_sec) annotation (
    Line(points = {{100, 120}, {14, 120}, {14, 80}, {14, 80}}));
  connect(pinSec_B, T2.pinP_sec) annotation (
    Line(points = {{100, 40}, {14, 40}, {14, 0}, {14, 0}}));
  connect(pinSec_C, T3.pinP_sec) annotation (
    Line(points = {{100, -38}, {56, -38}, {56, -100}, {12, -100}, {12, -100}}));
  connect(T1.pinP_prim, pinPrim_A) annotation (
    Line(points = {{-6, 80}, {-98, 80}, {-98, 100}, {-102, 100}}, color = {92, 53, 102}));
  connect(T2.pinP_prim, pinPrim_B) annotation (
    Line(points = {{-6, 0}, {-98, 0}, {-98, 0}, {-100, 0}}, color = {92, 53, 102}));
  connect(T3.pinP_prim, pinPrim_C) annotation (
    Line(points = {{-8, -100}, {-98, -100}, {-98, -100}, {-100, -100}}, color = {92, 53, 102}));
  connect(T1.pinP_prim, T2.pinN_prim) annotation (
    Line(points = {{-6, 80}, {-34, 80}, {-34, -20}, {-6, -20}, {-6, -20}}, color = {92, 53, 102}));
  connect(T2.pinP_prim, T3.pinN_prim) annotation (
    Line(points = {{-6, 0}, {-48, 0}, {-48, -120}, {-8, -120}, {-8, -120}}, color = {92, 53, 102}));
  connect(T1.pinN_prim, T3.pinP_prim) annotation (
    Line(points = {{-6, 60}, {-40, 60}, {-40, -100}, {-8, -100}, {-8, -100}}, color = {117, 80, 123}));
  connect(pinSec_N, T3.pinN_sec) annotation (
    Line(points={{100,-120},{12,-120},{12,-119.8},{12,-119.8}}));
  connect(pinSec_N, T1.pinN_sec) annotation (
    Line(points={{100,-120},{36,-120},{36,60},{14,60},{14,60.2}}));
  connect(pinSec_N, T2.pinN_sec) annotation (
    Line(points={{100,-120},{36,-120},{36,-20},{14,-20},{14,-19.8}}));
  annotation (
    Diagram(coordinateSystem(extent = {{-160, -160}, {160, 160}})),
    Icon(coordinateSystem(extent = {{-160, -160}, {160, 160}}, initialScale = 0.1), graphics={  Rectangle(origin = {10, 40}, extent = {{-100, 100}, {80, -180}}), Line(origin = {-1.36, -25.17}, points = {{-74, -26}, {-44, 42}, {-16, -26}, {-74, -26}}, color = {92, 53, 102}), Line(origin = {-0.204807, -24.3999}, points = {{42, 36}, {60, 0}, {78, 36}}, color = {92, 53, 102}), Line(origin = {-0.208107, -24.0148}, points = {{60, 0}, {60, -30}}, color = {92, 53, 102}), Text(origin = {28, -50}, lineColor = {92, 53, 102}, extent = {{-88, -20}, {32, -50}}, textString = "D11Y"), Ellipse(origin = {-15, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360,
          lineColor={0,0,0}),                                                                                                                                                                                                        Ellipse(origin = {17, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360,
          lineColor={0,0,0}),                                                                                                                                                                                                        Line(origin = {-50.5497, 80.1482}, points = {{11, 0}, {-11, 0}}), Line(origin = {53.2923, 79.9842}, points = {{11, 0}, {-11, 0}}), Text(origin = {0, 172}, lineColor = {92, 53, 102}, extent = {{-318, 28}, {320, -32}}, textString = "%name")}));
end DeltaWye;
