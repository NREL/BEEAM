within HPF.Transformers.ThreePhase;
model DeltaWye_tmp
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
  HPF.SinglePhase.Components.Impedance z annotation (
    Placement(visible = true, transformation(origin = {-46, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z1 annotation (
    Placement(visible = true, transformation(origin = {-44, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z2 annotation (
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z3 annotation (
    Placement(visible = true, transformation(origin = {36, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z4 annotation (
    Placement(visible = true, transformation(origin = {36, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z5 annotation (
    Placement(visible = true, transformation(origin = {38, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(z.pin_n, idealTransformer1.pinP_Prim) annotation (
    Line(points = {{-36, 60}, {-10, 60}, {-10, 60}, {-10, 60}}, color = {117, 80, 123}));

annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={Rectangle(origin = {10, 40}, extent = {{-100, 100}, {80, -180}}), Line(origin = {-1.36062, -25.1715}, points = {{-74, -26}, {-44, 42}, {-16, -26}, {-74, -26}}, color = {28, 108, 200}), Line(origin = {-1.36062, -25.1715}, points = {{42, 36}, {60, 0}, {78, 36}}, color = {28, 108, 200}), Line(origin = {-1.36062, -25.1715}, points = {{60, 0}, {60, -30}}, color = {28, 108, 200}), Text(origin = {0, -40}, lineColor = {28, 108, 200}, extent = {{-60, -26}, {-34, -50}}, textString = "D11"), Text(origin = {-4, -34}, lineColor = {28, 108, 200}, extent = {{50, -28}, {76, -52}}, textString = "Y"), Ellipse(origin = {-13, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Ellipse(origin = {17, 79}, extent = {{-25, 27}, {25, -27}}, endAngle = 360), Line(origin = {-49.0398, 80.1085}, points = {{11, 0}, {-11, 0}}), Line(origin = {53.2923, 79.9842}, points = {{11, 0}, {-11, 0}})}),
    Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Text(origin = {0, 78}, extent = {{-16, 4}, {16, -4}}, textString = "Delta-Y")}));
end DeltaWye_tmp;