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
    Icon(coordinateSystem(grid = {0, 0}, extent = {{-140, -140}, {140, 100}}, initialScale = 0.1), graphics={  Rectangle(origin = {-40, 0}, lineColor = {92, 53, 102}, extent = {{-100, 100}, {180, -140}}), Line(origin = {-41.812, 59.8666}, points = {{-98, 0}, {182, 0}}, color = {92, 53, 102}), Text(origin = {-88, 25}, extent = {{-46, 25}, {418, -5}}, textString = "Harmonics=",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left), Text(origin = {-96, -53}, extent = {{-38, 23}, {426, -7}}, textString = "Fundamental=%fFund Hz",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left), Text(origin = {-210, 87}, lineColor = {92, 53, 102}, fillColor = {92, 53, 102}, extent = {{-40, 13}, {458, -27}}, textString = "System Setup", textStyle = {TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold, TextStyle.Bold}),  Text(origin = {-52, -13}, extent = {{-42, 25}, {444, -7}}, textString = "%hrms",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left),Text(origin = {-96, -93}, extent = {{-38, 23}, {476, -7}}, textString = "Sampling Freq=%fs Hz",
            horizontalAlignment =                                                                                                                                                                                                        TextAlignment.Left)}),
    Documentation(info = "<html><head></head><body>
  <div><br></div>
  <div><u> Example </u></div>
  hrms is a vector. User specifies all the harmonics to be simulated as a c/c++ style single dimensional array.absoluteValue = 
  <br>
  Example: For simulating the first three odd harmonics, <br> 
  hrms = {1, 3, 5}
  
  <div><br></div><br></body></html>"),
    Diagram(coordinateSystem(grid = {0, 0}, extent = {{-140, -140}, {140, 100}})));
end SystemDef;
