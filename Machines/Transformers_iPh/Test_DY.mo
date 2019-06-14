within HPF.Machines.Transformers_iPh;
model Test_DY
  outer SystemDef systemDef;
  HPF.SinglePhase.Components.IdealTransformer idealTransformer1 annotation (
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer2 annotation (
    Placement(visible = true, transformation(origin={0,10},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.IdealTransformer idealTransformer3 annotation (
    Placement(visible = true, transformation(origin = {0, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_A(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-86, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={-100, 60},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_B(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-86, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={-100,0},      extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P pinPrim_C(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-86, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={-102, -60},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P1(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {74, 60}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={100, 80},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P2(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {74, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={100, 40},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P3(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {74, -20}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin={100, 0},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SinglePhase.Interface.HPin_N hPin_N(h = systemDef.numHrm) annotation (Placement(transformation(
          extent={{52,-90},{64,-78}}), iconTransformation(extent={{90,-70},{110,
            -50}})));
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
  connect(hPin_P1, idealTransformer1.pinP_Sec) annotation (
    Line(points={{74,60},{10,60},{10,60},{10,60}}));

  connect(idealTransformer2.pinP_Sec, hPin_P2)
    annotation (Line(points={{10,20},{74,20}}, color={0,0,0}));
  connect(idealTransformer3.pinP_Sec, hPin_P3)
    annotation (Line(points={{10,-20},{74,-20}}, color={0,0,0}));
  connect(hPin_N, idealTransformer1.pinN_Sec) annotation (Line(points={{58,-84},
          {28,-84},{28,40.2},{10,40.2}}, color={117,80,123}));
  connect(idealTransformer2.pinN_Sec, idealTransformer1.pinN_Sec) annotation (
      Line(points={{10,0.2},{20,0.2},{20,0},{28,0},{28,40.2},{10,40.2}}, color=
          {117,80,123}));
  connect(idealTransformer3.pinN_Sec, idealTransformer1.pinN_Sec) annotation (
      Line(points={{10,-39.8},{20,-39.8},{20,-40},{28,-40},{28,40.2},{10,40.2}},
        color={117,80,123}));
  
annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={Rectangle(extent = {{-100, 100}, {100, -100}}), Line(points = {{-74, -26}, {-44, 42}, {-16, -26}, {-74, -26}}, color = {28, 108, 200}), Line(points = {{42, 36}, {60, 0}, {78, 36}}, color = {28, 108, 200}), Line(points = {{60, 0}, {60, -30}}, color = {28, 108, 200}), Text(origin = {2, -14},lineColor = {28, 108, 200}, extent = {{-60, -26}, {-34, -50}}, textString = "D11"), Text(origin = {-2, -8},lineColor = {28, 108, 200}, extent = {{50, -28}, {76, -52}}, textString = "Y")}),
    Diagram(coordinateSystem(grid = {0, 0})));
end Test_DY;