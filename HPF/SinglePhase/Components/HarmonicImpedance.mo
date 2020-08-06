within HPF.SinglePhase.Components;
model HarmonicImpedance "Pass impedance as harmonic dependent vector, Z = R + jX"
  extends HPF.SinglePhase.Interface.TwoPinBase;
  import Modelica.ComplexMath.j;
  parameter Real Rh[:] = {1} "Resistance";
  parameter Real Xh[:] = {0} "Reactance";
equation
/*
    vRe + j*vIm = (zRe*iRe - zIm*iIm) + j*(zRe*iIm + zIm*iRe);
    */
  v[:].re = Rh[:] .* i[:].re - Xh[:] .* i[:].im;
  v[:].im = Rh[:] .* i[:].im + Xh[:] .* i[:].re;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false), graphics={  Rectangle(lineColor = {92, 53, 102}, fillColor = {255, 255, 255},
            fillPattern =                                                                                                                           FillPattern.Solid, extent = {{-70, 30}, {70, -30}}), Text(origin = {-40.4, 3.2}, lineColor = {92, 53, 102}, extent = {{-27.6, 8.8}, {110.4, -13.2}}, textString = "Z(h)=R(h)+jX(h)"), Line(origin = {-85.07, -0.21}, points = {{-15, 0}, {15, 0}}, color = {92, 53, 102}), Line(origin = {85.0205, -0.21}, points = {{-15, 0}, {15, 0}}, color = {92, 53, 102}), Text(origin = {-24, -20}, lineColor = {92, 53, 102}, extent = {{-156, 60}, {204, 100}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false)),
    Documentation(info="<html>
<p>HarmonicImpedance is a generic impedance component. User would pass the impedance value as a vector. The vector must have the same number of elements as the total number of harmonics being simulated (as defined in top level parameter systemDef.numHrm).</p>
<p>Example:</p>
<p><br>(This component is necessitated in models requiring an impedance in which the resistance and the reactance are a function of harmonics. This component is different than the &apos;<a href=\"modelica://HPF.SinglePhase.Components.Impedance\">Impedance</a>&apos; component in way that the impedance is specified at the fundamental and the component internally computes the impedance at each harmonic.)</p>
</html>"));
end HarmonicImpedance;
