within HPF.Examples.DC_Testbed;
model Configuration_DC
  extends Modelica.Icons.Package;
equation

annotation (
    Icon(coordinateSystem(grid = {0, 0}), graphics={
        Line(
          points={{-40,30},{40,30},{42,30}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(
          points={{-40,-12},{-28,-12}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(
          points={{-20,-12},{0,-12}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(
          points={{8,-12},{28,-12}},
          color={28,108,200},
          smooth=Smooth.Bezier),
        Line(
          points={{34,-12},{40,-12}},
          color={28,108,200},
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(grid = {0, 0})));
end Configuration_DC;
