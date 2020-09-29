within HPF.SinglePhase.Sources;
model CurrentSource
  extends HPF.SinglePhase.Interface.TwoPinBase;
  parameter Real iMag[:] = {1} "Current magnitude vector (A rms)";
  parameter Real iArg[:] = {0} "Current phase angle vector (rad)";
equation
  i[:].re = iMag[1:systemDef.numHrm] .* cos(iArg[1:systemDef.numHrm]);
  i[:].im = iMag[1:systemDef.numHrm] .* sin(iArg[1:systemDef.numHrm]);
  annotation (
    Icon(graphics={  Ellipse(fillColor = {255, 255, 255}, extent = {{-50, 50}, {50, -50}}, endAngle = 360), Line(origin = {-70, 0}, points = {{-20, 0}, {20, 0}}), Line(origin = {70.3279, -0.0819672}, points = {{-20, 0}, {20, 0}}), Polygon(origin = {27, -2},
            fillPattern =                                                                                                                                                                                                        FillPattern.Solid, points = {{-15, 10}, {-15, -6}, {9, 2}, {-15, 10}}), Line(origin = {-8.85246, 0}, points = {{20, 0}, {-20, 0}}), Text(extent = {{-180, 100}, {180, 60}},
          textString="%name",
          lineColor={102,44,145})}));
end CurrentSource;
