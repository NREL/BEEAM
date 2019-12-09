within HPF.MultiPhase;
package Transformers
  model DeltaWye
  HPF.SinglePhase.Components.IdealTransformer idealTransformer1 annotation (
      Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer2 annotation (
      Placement(visible = true, transformation(origin = {0,10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer3 annotation (
      Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P1 annotation (
      Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin = {-80, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P2 annotation (
      Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-4, -4}, {4, 4}}, rotation = 0), iconTransformation(origin = {-80, 20}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P3 annotation (
      Placement(visible = true, transformation(origin = {-83, -21}, extent = {{-5, -5}, {5, 5}}, rotation = 0), iconTransformation(origin = {-83, -21}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P4 annotation (
      Placement(visible = true, transformation(origin = {60, 60}, extent = {{-4, -4}, {4, 4}}, rotation = 0), iconTransformation(origin = {60, 60}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P5 annotation (
      Placement(visible = true, transformation(origin = {60, 20}, extent = {{-4, -4}, {4, 4}}, rotation = 0), iconTransformation(origin = {60, 20}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P6 annotation (
      Placement(visible = true, transformation(origin = {60, -20}, extent = {{-4, -4}, {4, 4}}, rotation = 0), iconTransformation(origin = {60, -20}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P7 annotation (
      Placement(visible = true, transformation(origin = {42, -58}, extent = {{-4, -4}, {4, 4}}, rotation = 0), iconTransformation(origin = {42, -58}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  equation
    connect(idealTransformer1.pinN_Prim, idealTransformer2.pinP_Prim) annotation (
      Line(points = {{-10, 40}, {-20, 40}, {-20, 20}, {-10, 20}, {-10, 20}}, color = {117, 80, 123}));
  connect(idealTransformer2.pinN_Prim, idealTransformer3.pinP_Prim) annotation (
      Line(points = {{-10, 0}, {-20, 0}, {-20, -20}, {-10, -20}, {-10, -20}}, color = {117, 80, 123}));
  connect(hPin_P1, idealTransformer1.pinP_Prim) annotation (
      Line(points = {{-80, 60}, {-10, 60}}));
  connect(idealTransformer3.pinN_Prim, idealTransformer1.pinP_Prim) annotation (
      Line(points = {{-10, -40}, {-30, -40}, {-30, 60}, {-10, 60}, {-10, 60}}, color = {117, 80, 123}));
  connect(hPin_P2, idealTransformer2.pinP_Prim) annotation (
      Line(points = {{-80, 20}, {-10, 20}}));
  connect(hPin_P3, idealTransformer3.pinP_Prim) annotation (
      Line(points = {{-80, -16}, {-10, -16}, {-10, -20}, {-10, -20}}));
  connect(idealTransformer1.pinP_Sec, hPin_P4) annotation (
      Line(points = {{10, 60}, {58, 60}, {58, 60}, {60, 60}}));
  connect(idealTransformer1.pinN_Sec, hPin_P7) annotation (
      Line(points = {{10, 40}, {42, 40}, {42, -58}}, color = {117, 80, 123}));
  connect(idealTransformer2.pinP_Sec, hPin_P5) annotation (
      Line(points = {{10, 20}, {56, 20}, {56, 20}, {58, 20}}));
  connect(idealTransformer3.pinP_Sec, hPin_P6) annotation (
      Line(points = {{10, -20}, {62, -20}, {62, -20}, {60, -20}}));
  connect(idealTransformer2.pinN_Sec, hPin_P7) annotation (
      Line(points = {{10, 0}, {42, 0}, {42, -58}}, color = {117, 80, 123}));
  connect(idealTransformer3.pinN_Sec, hPin_P7) annotation (
      Line(points = {{10, -40}, {42, -40}, {42, -58}}, color = {117, 80, 123}));
    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Text(origin = {-53, 82}, extent = {{-17, 6}, {17, -6}}, textString = "DRAFT!!")}));
  end DeltaWye;
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Transformers;
