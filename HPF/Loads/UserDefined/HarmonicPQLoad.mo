within HPF.Loads.UserDefined;
model HarmonicPQLoad "PQ load at harmonic frequencies"
  outer SystemDef systemDef;
  parameter Real P[:] = {0} "Real power";
  parameter Real Q[:] = {0} "Imaginary power";
  HPF.SinglePhase.Interface.LoadBase loadBase annotation (
    Placement(visible = true, transformation(origin = {2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Interface.HPin_P hPin_P(h = systemDef.numHrm) annotation (
    Placement(visible = true, transformation(origin = {-68, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HPF.SinglePhase.Components.Ground ground annotation (
    Placement(visible = true, transformation(origin = {72, -8}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));

  //Real P_padded[:] = {0.0 for 1:systemDef.numHrm}
equation
/*
     In complex notation,
    S = P + jQ = V*conj(I)
      = (Vre*Ire + Vim*Iim) + j(Vim*Ire - Vre*Iim)

    //Complex(P, Q) = loadBase.v[1] * Modelica.ComplexMath.conj(loadBase.i[1]);
    P = (loadBase.v[1].re * loadBase.i[1].re) + (loadBase.v[1].im * loadBase.i[1].im);
    Q = (loadBase.v[1].im * loadBase.i[1].re) - (loadBase.v[1].re * loadBase.i[1].im);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
  */
  for i in 1:systemDef.numHrm loop
    if i <= size(P, 1) then
      P[i] = loadBase.v[i].re * loadBase.i[i].re + loadBase.v[i].im * loadBase.i[i].im;
      Q[i] = loadBase.v[i].im * loadBase.i[i].re - loadBase.v[i].re * loadBase.i[i].im;
    else
    /*
      0.0 = loadBase.v[i].re * loadBase.i[i].re + loadBase.v[i].im * loadBase.i[i].im;
      0.0 = loadBase.v[i].im * loadBase.i[i].re - loadBase.v[i].re * loadBase.i[i].im;
      
    */
    loadBase.i[i] = Complex(0.0);
    end if;
  end for;

  connect(loadBase.pin_n, ground.pin) annotation (
    Line(points={{12,0},{72,0},{72,0}},        color = {117, 80, 123}));
  connect(hPin_P, loadBase.pin_p) annotation (
    Line(points = {{-68, 0}, {-8, 0}, {-8, 0}, {-8, 0}}));
  annotation (
    Documentation(info = "<html><head></head><body><br><div>User can set the PQ load for the available harmonics.</div><div><br></div><div>For the purpose of flexible system design, the passed vector can be of different size than the available harmonics.</div><div><br></div><div>Pass the real (P) and imaginary power (P) as a Modelica vector.</div><div><br></div><div>Example:</div><div>Power at harmonics 1 and 3</div><div><br></div><div><font face=\"courier\">P = {100, 0.1}</font></div><div><font face=\"courier\">Q = {0.5, 0.0}</font></div><div><br></div></body></html>"),
    Icon(graphics={  Rectangle(origin = {-10, 20}, extent = {{-50, 40}, {70, -80}}), Line(origin = {-75, 0}, points = {{-35, 0}, {15, 0}}), Line(origin = {-4.33047, -53.025}, rotation = -90, points = {{0, 36}, {0, -24}}), Line(origin = {13.9705, -29.0355}, points = {{0, -6}, {0, -24}}), Line(origin = {-12.3267, -28.8257}, points = {{0, 14}, {0, -24}}), Line(origin = {-4.54761, -28.6862}, points = {{0, 4}, {0, -24}}), Line(origin = {22.3559, -28.7654}, points = {{0, -10}, {0, -24}}), Line(origin = {4.49386, -29.2575}, points = {{0, -2}, {0, -24}}), Line(origin = {-23.0982, -28.881}, points = {{0, 24}, {0, -24}}), Ellipse(origin = {14, 26},                    extent = {{-10, 16}, {10, -16}}, endAngle = 360,
          lineColor={0,0,0}),                                                                                                                                                                                                      Line(
          origin={19.98,10.35},
          points={{-3,4},{3,-4}},
          color={0,0,0}),                                                                                                                                                                                                      Line(
          origin={-11,34},
          points={{-9,8},{3,8},{7,6},{9,2},{9,-2},{7,-6},{3,-8},{-9,-8}},
          smooth=Smooth.Bezier,
          color={0,0,0}),                                                                                                                                                                                                        Line(
          origin={-20,26},
          points={{0,16},{0,-16}},
          color={0,0,0}),                                                                                                                                                                                                      Text(lineColor = {92, 53, 102}, extent = {{-200, 60}, {200, 100}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end HarmonicPQLoad;
