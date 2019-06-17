within HPF.Test;
model SinglePhase_HarmonicLoad
  import Modelica.ComplexMath.j;
  inner HPF.SystemDef systemDef(hrms = {1})  annotation (
    Placement(visible = true, transformation(origin = {-70, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.Impedance z(z = 5 + 2 * j)  annotation (
    Placement(visible = true, transformation(origin={-12, -10},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Sources.VoltageSource v(theta(fixed = true),vArg = {0}, vMag = {100})  annotation (
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.SinglePhase.Components.Ground ground1 annotation (
    Placement(visible = true, transformation(origin={-60, -60},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.NonlinearLoads.Test_Load test_Load1(iImag = {3}, iReal = {5}, sImag = 33, sReal = 150)  annotation (
    Placement(visible = true, transformation(origin={70, -62},    extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HPF.Components.Impedance     z1(z=5 + 2*j)     annotation (
    Placement(visible = true, transformation(origin={-12, -32},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.Components.Impedance     z2(z=2 + 2*j)     annotation (
    Placement(visible = true, transformation(origin={26, -54},    extent = {{-10, -10}, {10, 10}}, rotation=270)));
equation
  connect(v.pin_p, z.pin_p) annotation (
    Line(points={{-40,40},{-30,40},{-30,54},{-20.2,54}}));
  connect(z.pin_n, test_Load1.pin_p) annotation (
    Line(points={{0,54},{68,54},{68,20}},                  color = {117, 80, 123}));
  connect(test_Load1.pin_n, ground1.pin) annotation (
    Line(points={{68,-3.55271e-15},{20,-3.55271e-15},{20,0},{-40,0},{-40,-4}},
                                                                   color = {117, 80, 123}));

  connect(z1.pin_p, z.pin_p) annotation (Line(
      points={{-20.2,32},{-20.2,32},{-20.2,54}},
      color={117,80,123},
      thickness=2));
  connect(z1.pin_n, test_Load1.pin_p) annotation (Line(points={{0,32},{2,32},{2,
          54},{68,54},{68,20}}, color={117,80,123}));
  connect(z2.pin_p, test_Load1.pin_p) annotation (Line(
      points={{24,26.2},{24,54},{68,54},{68,20}},
      color={117,80,123},
      thickness=2));
  connect(z2.pin_n, ground1.pin) annotation (Line(points={{24,6},{24,
          -3.55271e-15},{20,-3.55271e-15},{20,0},{-40,0},{-40,-4}}, color={117,
          80,123}));
  connect(ground1.pin, v.pin_n) annotation(
    Line(points = {{-60, -60}, {-60, -60}, {-60, -40}, {-60, -40}}));

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0}), graphics = {Text(origin = {-81, 78}, extent = {{-17, 6}, {149, -46}}, textString = "OpenModelica: Simulation fails with default solver settings.\nSet the nonlinear solver to 'Newton' and linear\nsolver to 'totalpivot'", horizontalAlignment = TextAlignment.Left)}));
end SinglePhase_HarmonicLoad;