within HPF;
class SystemDef "System Definition block"
  import Modelica.ComplexMath.j;
  parameter Integer hrms[:] = {1} "Harmonics to simulate";
  /*
        INFO: Type variability
        Dymola is throwing an error for the type variability.
        'constant' or no type prefix has a lower type variability than 'parameter'.
        Also, numHrm cannot be initialized as Real.
      */
  final parameter Integer numHrm = size(hrms, 1) "Number of harmonics. (Automatically generated from hrms.)";
  parameter Modelica.SIunits.Frequency fFund = 60 "Fundamental frequency (Hz)";
  parameter Modelica.SIunits.Frequency fs = 5e3 "Sampling frequency (Hz)";
  final parameter Integer N = integer(floor(fs / fFund)) "Size of FFT";
  parameter Integer numPh = 3 "Number of phases";
initial algorithm

equation

algorithm
/*
      solver overview and system structure with room for future improvements.
      The library components are independent of the solver. If the component
      does not require an iterative back and forth solver, user can choose
      to omit implementing it.
      
      A component that does require an iterative solver technique, would 
      have the solver section (derived from a component template that implements
      a solver section. This would ensure that the library and components are
      consistent.) and user would implement the required algorithm in that section.
    */
/*
      Annotation:
      This sets the default name for the model when used in a simulation. There can
      only be one component by this name. (name refers to instance of the class 'SystemDef'). 
      The default name is used across the simulation model specifying the system-wide parameters; 
      example: max harmonics simulated in the system. To ensure that the block 
      is not redefined, the block prefix is set to 'inner' defined in the 'defaultComponentPrefixes'. 
      This ensures no other instance of SystemDef class is created. 
      Can be any of these values: "info", "diagram", "text" 
      */
  annotation (
    preferredView = "info",
    defaultComponentName = "systemDef",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "No \"systemDef\" component is defined.
    Drag SystemDef into the top level of your model.",
    Icon(coordinateSystem(extent = {{-140, -140}, {140, 100}}, initialScale = 0.1), graphics={  Rectangle(origin = {-40, 0}, lineColor = {92, 53, 102}, extent = {{-100, 100}, {180, -140}}), Line(origin = {-41.812, 59.8666}, points = {{-98, 0}, {182, 0}}, color = {92, 53, 102}), Text(origin = {-88, 25}, extent = {{-46, 25}, {418, -5}}, textString = "Harmonics=",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left), Text(origin = {-96, -53}, extent = {{-38, 23}, {426, -7}}, textString = "Fundamental=%fFund",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left), Text(origin = {-210, 87}, lineColor = {92, 53, 102}, fillColor = {92, 53, 102}, extent = {{-40, 13}, {458, -27}}, textString = "System Setup", textStyle = {TextStyle.Bold}), Text(origin = {-52, -13}, extent = {{-42, 25}, {444, -7}}, textString = "%hrms",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left), Text(origin = {-96, -93}, extent = {{-38, 23}, {476, -7}}, textString = "Sampling Freq=%fs",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left)}),
    Documentation(info="<html>
<p><br><span style=\"font-family: Courier New;\">SystemDef </span>is the top level block in an HPF model. The block has parameter fields for defining system-wide options and simulation settings. In a typical harmonics analysis simulation, main simulation parameters are:</p>
<p>Parameter fields available in the block are:</p>
<ul>
<li>Harmonics: This sets the number of harmonics in the simulation.</li>
<li>Fundamental frequency (60hz default)</li>
<li>Sampling frequency</li>
</ul>
<p><br>Modelica determines the total number of harmonics from the harmonics vector. A simulation with a large number of harmonics results in increased accuracy with the tradeoff of increased simulation time and system complexity.</p>
<h4>Note:</h4>
<p>A model without a SystemDef block would through an error on compilation. A model can only have a single instance of the <span style=\"font-family: Courier New;\">SystemDef</span> class. Including a <span style=\"font-family: Courier New;\">SystemDef</span> block automatically generates the correct class instance <span style=\"font-family: Courier New;\">systemDef</span>. </p>
<p><br><u>Example </u></p>
<p>hrms is a vector. User specifies all the harmonics to be simulated as a c/c++ style single dimensional array.absoluteValue = </p>
<p>Example: For simulating the first three odd harmonics, </p>
<p><span style=\"font-family: Courier New;\">hrms = {1, 3, 5}</span> </p>
<p>One can automate entry by specifying a range. Example: odd harmonics upto 15,</p>
<p><span style=\"font-family: Courier New;\">hrms = {1:2:15}</span></p>
</html>"),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-140, -140}, {140, 100}})));
end SystemDef;
