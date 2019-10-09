within HPF.SinglePhase.Sources;
model CurrentSource
  extends HPF.SinglePhase.Interface.TwoPinBase;

  parameter Real iReal[:] = {1};
  parameter Real iImag[:] = {0};


equation
  i[:].re = iReal[:];
  i[:].im = iImag[:];


annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={Line(origin = {0, -0.25}, points = {{-50, 0}, {0, 20}, {0, -20}, {-2, -20}, {-50, 0}, {50, 0}}), Ellipse( extent = {{-60, 60}, {60, -60}}, endAngle = 360), Line(points = {{-60, 0}, {-90, 0}}), Line(points = {{60, 0}, {90, 0}})}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end CurrentSource;
