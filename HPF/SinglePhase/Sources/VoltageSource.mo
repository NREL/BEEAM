within HPF.SinglePhase.Sources;
model VoltageSource "Voltage Source"
  /*
      Constant voltage source.
     
    */
  extends HPF.SinglePhase.Interface.Source;
  HPF.Utilities.ComponentProperties properties(ComponentType = "VoltageSource");
  import Modelica.ComplexMath.j;
  parameter Real vMag[:] = {1} "Voltage Magnitude (Volts rms)";
  parameter Real vArg[:] = {0} "Voltage angle (rad)";
  /*
        Measurable quantities 
        S = V * conj(i) = (v.re + jv.im) * (i.re - ji.im)
          = v.re * i.re - j(v.re * i.im) + j(v.im * i.re) + v.im * i.im
          = (v.re*i.re + v.im*i.im) + j(v.im*i.re - v.re*i.im) 
      */
  Real P = v[:].re * i[:].re + v[:].im * i[:].im "Real Power";
  Real iMag[systemDef.numHrm] = Modelica.ComplexMath.'abs'(i[:]);
  Real iArg[systemDef.numHrm] = Modelica.ComplexMath.arg(i[:]);
equation
/*
    extra constraint definition for loop breaking.
  */
  omega = 2 * Modelica.Constants.pi * systemDef.fFund;
/*
   Observation: 
   Dymola is throwing error when performing arithematic operations on complex
   arrays.
   Erros of the type:
   - No match for constructor.
   - No match for overloaded binary operator '+'.
   Workaround:
   - assign values separately to the real and imaginary parts
   
   Error Type 1
   */
  v[:].re = vMag[1:systemDef.numHrm] .* cos(vArg[1:systemDef.numHrm]);
  v[:].im = vMag[1:systemDef.numHrm] .* sin(vArg[1:systemDef.numHrm]);
  annotation (
    defaultComponentName = "v",
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Ellipse(extent = {{-48, 50}, {48, -50}}, endAngle = 360), Line(origin = {-69, 0}, points = {{-21, 0}, {21, 0}}), Line(origin = {69, 0}, points = {{-21, 0}, {21, 0}}),                                                                                                                     Text(extent = {{-180, 100}, {180, 60}},
          textString="%name",
          lineColor={102,44,145}),
        Line(
          points={{11,-18},{3,-16},{-3,-14},{-8,-9},{-12,-1},{-10,7},{-4,13},{4,
              17},{11,18}},
          color={0,0,0},
          origin={-11,-18},
          rotation=360,
          smooth=Smooth.Bezier),
        Line(
          points={{11,-18},{3,-16},{-3,-14},{-8,-9},{-12,-1},{-10,7},{-4,13},{4,
              17},{11,18}},
          color={0,0,0},
          origin={11,18},
          rotation=180,
          smooth=Smooth.Bezier)}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
    Documentation(info = "<html><head></head><body>Harmonic voltage source.<div><br></div><div>Inputs are voltage magnitude and phase at the harmonics specified in the systemDef block.</div><div><br></div><div>The inputs are a 1-D Modelica vector of the form, {entry1, entry2, .... , entryN}</div><div><br></div><div><br><div><br></div></div></body></html>"));
end VoltageSource;
