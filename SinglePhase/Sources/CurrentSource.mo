within HPF.SinglePhase.Sources;
model CurrentSource
  extends HPF.SinglePhase.Interface.TwoPinBase;

  parameter Real iReal[:] = {1};
  parameter Real iImag[:] = {0};


equation
  i[:].re = iReal[:];
  i[:].im = iImag[:];


annotation (
    Icon(coordinateSystem(grid = {0, 0}), graphics={
        Line(points={{-50,0},{0,20},{0,-20},{-2,-20},{-50,0},{50,0}}, color={28,
              108,200}),
        Ellipse(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
        Line(points={{-60,0},{-90,0}}, color={28,108,200}),
        Line(points={{60,0},{90,0}}, color={28,108,200})}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end CurrentSource;
