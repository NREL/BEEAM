within HPF.Machines.Transformers_iPh;
model Test_DY
  outer SystemDef systemDef;
  HPF.Utilities.ComponentProperties properties(ComponentType = "MultiPhaseTransformer");
  parameter Integer N = 1 "Turns ration";
  HPF.SinglePhase.Components.IdealTransformer idealTransformer1(N = N)  annotation (
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer2(N = N)  annotation (
    Placement(visible = true, transformation(origin={0,10},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer3(N = N)  annotation (
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_A(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-86, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={-100, 100},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_B(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-86, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={-100,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_C(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-86, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={-100, -100},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_A(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin={80,60},    extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={100,100},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_B(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin={80,20},    extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={100, 0},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinSec_C(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin={80,-20},    extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={100, -100},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_N hPin_N(h = systemDef.numHrm) annotation (Placement(visible = true,transformation(
          extent = {{70, -72}, {82, -60}}, rotation = 0), iconTransformation(extent = {{-10, -160}, {10, -140}}, rotation = 0)));
equation
  connect(pinPrim_A, idealTransformer1.pinP_Prim) annotation (
    Line(points={{-86,60},{-10,60},{-10,60},{-10,60}}));
  connect(pinPrim_C, idealTransformer3.pinP_Prim) annotation (
    Line(points = {{-86, -20}, {-10, -20}, {-10, -20}, {-10, -20}, {-10, -20}}));
  connect(pinPrim_B, idealTransformer2.pinP_Prim) annotation (
    Line(points={{-86,20},{-10,20}}));
  connect(idealTransformer2.pinN_Prim, idealTransformer1.pinP_Prim) annotation (
    Line(points={{-10,0.2},{-20,0.2},{-20,60},{-10,60}},                 color = {117, 80, 123}));
  connect(idealTransformer3.pinN_Prim, idealTransformer2.pinP_Prim) annotation (
    Line(points={{-10,-39.8},{-28,-39.8},{-28,20},{-10,20}},                 color = {117, 80, 123}));
  connect(idealTransformer1.pinN_Prim, idealTransformer3.pinP_Prim) annotation (
    Line(points={{-10,40.2},{-40,40.2},{-40,-20},{-10,-20},{-10,-20}},        color = {117, 80, 123}));

  connect(hPin_N, idealTransformer1.pinN_Sec) annotation (Line(points={{76, -66}, {28, -66}, {28, 40.2}, {10, 40.2}}, color={117,80,123}));
  connect(idealTransformer2.pinN_Sec, idealTransformer1.pinN_Sec) annotation (
      Line(points={{10,0.2},{20,0.2},{20,0},{28,0},{28,40.2},{10,40.2}}, color=
          {117,80,123}));
  connect(idealTransformer3.pinN_Sec, idealTransformer1.pinN_Sec) annotation (
      Line(points={{10,-39.8},{20,-39.8},{20,-40},{28,-40},{28,40.2},{10,40.2}},
        color={117,80,123}));

  connect(idealTransformer1.pinP_Sec, pinSec_A)
    annotation (Line(points={{10,60},{80,60}}, color={0,0,0}));
  connect(idealTransformer2.pinP_Sec, pinSec_B)
    annotation (Line(points={{10,20},{80,20}}, color={0,0,0}));
  connect(idealTransformer3.pinP_Sec, pinSec_C)
    annotation (Line(points={{10,-20},{80,-20}}, color={0,0,0}));
annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={Rectangle(origin = {10, 40}, extent = {{-100, 100}, {80, -180}}), Line(origin = {-1.36062, -25.1715}, points = {{-74, -26}, {-44, 42}, {-16, -26}, {-74, -26}}, color = {28, 108, 200}), Line(origin = {-1.36062, -25.1715}, points = {{42, 36}, {60, 0}, {78, 36}}, color = {28, 108, 200}), Line(origin = {-1.36062, -25.1715}, points = {{60, 0}, {60, -30}}, color = {28, 108, 200}), Text(origin = {0, -40}, lineColor = {28, 108, 200}, extent = {{-60, -26}, {-34, -50}}, textString = "D11"), Text(origin = {-4, -34}, lineColor = {28, 108, 200}, extent = {{50, -28}, {76, -52}}, textString = "Y"), Ellipse(origin = {-13, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Ellipse(origin = {17, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Line(origin = {-48.5497, 78.1482}, points = {{11, 0}, {-11, 0}}), Line(origin = {53.2923, 79.9842}, points = {{11, 0}, {-11, 0}})}),
    Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Text(origin = {0, 78}, extent = {{-16, 4}, {16, -4}}, textString = "Delta-Y")}));
end Test_DY;
