within HPF.Loads.SinglePhase;

model HarmonicPQLoad "PQ load at harmonic frequencies"
  import Modelica.ComplexMath.j;
  outer SystemDef systemDef;
  parameter Real P[:] = {0} "Real power {.}";
  parameter Real Q[:] = {0} "Imaginary power {.}";
  parameter Real nomV = 120 "Nominal operating voltage";
  parameter Modelica.SIunits.Angle vAngle = 0.0 "Voltage angle for initialization";
  HPF.SinglePhase.Interface.LoadBase loadBase(start_v_re = cat(1, {nomV * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_v_im = cat(1, {nomV * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {P[1] / nomV * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_im = cat(1, {P[1] / nomV * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1})) annotation(
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P(h = systemDef.numHrm) annotation(
    Placement(visible = true, transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation(
    Placement(visible = true, transformation(origin = {70, -16}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  HPF.SinglePhase.Components.Impedance z(start_i_im = cat(1, {P[1] / nomV * sin(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), start_i_re = cat(1, {P[1] / nomV * cos(vAngle)}, {0.0 for i in 1:systemDef.numHrm - 1}), z = 1e-6 - 0.0 * j) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  final parameter Real P_padded[systemDef.numHrm] = cat(1, P[:], {0.0 for i in size(P, 1)+1:systemDef.numHrm}); // zero padding Power harmonic vector
  final parameter Real Q_padded[systemDef.numHrm] = cat(1, Q[:], {0.0 for i in size(P, 1)+1:systemDef.numHrm});
equation

  loadBase.i[:].re = (P_padded[:] .* loadBase.v[:].re + Q_padded[:] .* loadBase.v[:].im) ./ (loadBase.v[:].re .^ 2 + loadBase.v[:].im .^ 2); // concatenating the vectors and assigning higher harmonics to zero
  loadBase.i[:].im = (P_padded[:] .* loadBase.v[:].im - Q_padded[:] .* loadBase.v[:].re) ./ (loadBase.v[:].re .^ 2 + loadBase.v[:].im .^ 2);
   
  connect(z.pin_n, loadBase.pin_p) annotation(
    Line(points = {{-20, 0}, {-8, 0}, {-8, 0}, {-8, 0}}, color = {117, 80, 123}));
  connect(z.pin_p, hPin_P) annotation(
    Line(points = {{-40, 0}, {-68, 0}, {-68, 0}, {-68, 0}}, color = {92, 53, 102}));
  connect(loadBase.pin_n, ground.pin) annotation(
    Line(points = {{12, 0}, {70, 0}, {70, -8}, {70, -8}}, color = {117, 80, 123}));
  annotation(
    Documentation(info = "<html><head></head><body><br><div>User can set the PQ load for the available harmonics.</div><div><br></div><div>For the purpose of flexible system design, the passed vector can be of different size than the available harmonics.</div><div><br></div><div>Pass the real (P) and imaginary power (P) as a Modelica vector.</div><div><br></div><div>Example:</div><div>Power at harmonics 1 and 3</div><div><br></div><div><font face=\"courier\">P = {100, 0.1}</font></div><div><font face=\"courier\">Q = {0.5, 0.0}</font></div><div><br></div></body></html>"),
    Icon(graphics = {Rectangle(origin = {-10, 20}, extent = {{-50, 40}, {70, -80}}), Line(origin = {-75, 0}, points = {{-35, 0}, {15, 0}}), Line(origin = {-4.33047, -53.025}, rotation = -90, points = {{0, 36}, {0, -24}}), Line(origin = {13.9705, -29.0355}, points = {{0, -6}, {0, -24}}), Line(origin = {-12.3267, -28.8257}, points = {{0, 14}, {0, -24}}), Line(origin = {-4.54761, -28.6862}, points = {{0, 4}, {0, -24}}), Line(origin = {22.3559, -28.7654}, points = {{0, -10}, {0, -24}}), Line(origin = {4.49386, -29.2575}, points = {{0, -2}, {0, -24}}), Line(origin = {-23.0982, -28.881}, points = {{0, 24}, {0, -24}}), Ellipse(origin = {14, 26}, extent = {{-10, 16}, {10, -16}}, endAngle = 360), Line(origin = {19.98, 10.35}, points = {{-3, 4}, {3, -4}}), Line(origin = {-11, 34}, points = {{-9, 8}, {3, 8}, {7, 6}, {9, 2}, {9, -2}, {7, -6}, {3, -8}, {-9, -8}}, smooth = Smooth.Bezier), Line(origin = {-20, 26}, points = {{0, 16}, {0, -16}}), Text(lineColor = {92, 53, 102}, extent = {{-200, 60}, {200, 100}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end HarmonicPQLoad;
