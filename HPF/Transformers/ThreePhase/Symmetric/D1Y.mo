within HPF.Transformers.ThreePhase.Symmetric;
model D1Y
  outer SystemDef systemDef;
  parameter Real VPrimRated = 480 "Rated primary voltage (ph-ph)";
  parameter Real VSecRated = 208 "Rated secondary voltage (ph-ph)";
  parameter Modelica.Units.SI.Resistance Rp = 1 "Primary winding resistance (at fundamental)";
  parameter Modelica.Units.SI.Reactance Xp = 1 "Primary winding reactance";
  parameter Modelica.Units.SI.Resistance Rs = 1 "Secondary winding resistance";
  parameter Modelica.Units.SI.Reactance Xs = 1 "Secondary winding reactance";
  parameter Modelica.Units.SI.Resistance Rc = 1 "Core resistance";
  parameter Modelica.Units.SI.Reactance Xm = 1 "Magnetizing reactance";
  HPF.SinglePhase.Interface.HPin_P pinPrim_A(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-102, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_B(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_C(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_A(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_B(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_C(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N pinSec_N(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Transformers.SinglePhase.TModel T1(
    Rc=Rc,
    Rp=Rp,
    Rs=Rs,
    Xm=Xm,
    Xp=Xp,
    Xs=Xs,
    nomV_prim=VPrimRated,
    nomV_sec=VSecRated/sqrt(3),
    phi_prim=0,
    phi_sec=0) annotation (Placement(visible=true, transformation(
        origin={4,70},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  HPF.Transformers.SinglePhase.TModel T2(
    Rc=Rc,
    Rp=Rp,
    Rs=Rs,
    Xm=Xm,
    Xp=Xp,
    Xs=Xs,
    nomV_prim=VPrimRated,
    nomV_sec=VSecRated/sqrt(3),
    phi_prim=-2.0944,
    phi_sec=-2.0944) annotation (Placement(visible=true, transformation(
        origin={4,-10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  HPF.Transformers.SinglePhase.TModel T3(
    Rc=Rc,
    Rp=Rp,
    Rs=Rs,
    Xm=Xm,
    Xp=Xp,
    Xs=Xs,
    nomV_prim=VPrimRated,
    nomV_sec=VSecRated/sqrt(3),
    phi_prim=2.0944,
    phi_sec=2.0944) annotation (Placement(visible=true, transformation(
        origin={2,-110},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  /* Measurements
      * Total power loss
      * Core losses
      * Winding losses etc
    */
  // private
  /*
        Transformer ratio N:1 is defined for volatges at the input and output 
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
    Line(points = {{100, -40}, {56, -40}, {56, -100}, {12, -100}, {12, -100}}));
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
    Line(points = {{100, -120}, {12, -120}, {12, -119.8}, {12, -119.8}}));
  connect(pinSec_N, T1.pinN_sec) annotation (
    Line(points = {{100, -120}, {36, -120}, {36, 60}, {14, 60}, {14, 60.2}}));
  connect(pinSec_N, T2.pinN_sec) annotation (
    Line(points = {{100, -120}, {36, -120}, {36, -20}, {14, -20}, {14, -19.8}}));
  connect(pinSec_A, pinSec_A) annotation (
    Line(points = {{100, 120}, {104, 120}, {104, 120}, {100, 120}}, color = {92, 53, 102}));
  annotation (
    Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, initialScale = 0.1)),
    Icon(coordinateSystem(initialScale = 0.1), graphics={  Rectangle(origin = {10, 40}, extent = {{-100, 100}, {80, -180}}), Line(origin = {-1.36, -25.17}, points = {{-74, -26}, {-44, 42}, {-16, -26}, {-74, -26}}, color = {92, 53, 102}), Line(origin = {-0.204807, -24.3999}, points = {{42, 36}, {60, 0}, {78, 36}}, color = {92, 53, 102}), Line(origin = {-0.208107, -24.0148}, points = {{60, 0}, {60, -30}}, color = {92, 53, 102}), Text(origin = {28, -50}, lineColor = {92, 53, 102}, extent = {{-88, -20}, {32, -50}}, textString = "D1Y"), Ellipse(origin = {-15, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Ellipse(origin = {17, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Line(origin = {-50.5497, 80.1482}, points = {{11, 0}, {-11, 0}}), Line(origin = {53.2923, 79.9842}, points = {{11, 0}, {-11, 0}}), Text(origin = {-6.01881, 156}, lineColor = {92, 53, 102}, extent = {{-323.981, 14}, {326.019, -16}}, textString = "%name")}),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end D1Y;
