within HPF;
class SystemDef
  parameter Integer hrms[:] = {1} "Harmonics to simulate";

  /*
    INFO: Type variability
    Dymola is throwing an error for the type variability.
    'constant' or no type prefix has a lower type variability than 'parameter'.
    Also, numHrm cannot be initialized as Real.
  */
  parameter Integer numHrm = size(hrms, 1) "Number of harmonics. (Automatically generated from hrms. Do not alter)";

  parameter Integer numPh = 3 "Number of phases";

  parameter Real fFund = 60 "Fundamental frequency";

  /*
    selects the mode of operation, used by nonlinear harmonic loads 
    Modes definition: (selecting boolean as the modes would have only 2 states)
    true = mode: power sink / source
    false = mode: constant current source
  */
  Boolean modeSelect(start = false);
  
  /*
    Data read write events.
  */
  Boolean eventWriteData(start = false);
  Boolean eventReadData(start = false);


initial algorithm
  //modeSelect := false;
  
equation

algorithm
    /*
              ____________
      ________|
      0       0.5
      
      System switches from power flow to current sources
    */
    when time > 0.5 then
      modeSelect := true;  
    end when;

    /*
      Additional time events for saving and reading node voltages
    */
    when time > 0.25 then
      eventWriteData := true;
    end when;

    when time > 0.4 then
      eventReadData := true;
    end when;
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
  Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}), Line(origin = {0, 60}, points = {{-100, 0}, {100, 0}}), Text(origin = {-48, 35}, extent = {{-34, 13}, {94, -9}}, textString = "Harmonics=%hrms"), Text(origin = {-48, 7}, extent = {{-34, 13}, {126, -33}}, textString = "Fundamental=%fFund Hz"), Text(origin = {-56, 81}, fillColor = {92, 53, 102}, extent = {{-34, 13}, {150, -15}}, textString = "System Setup", textStyle = {TextStyle.Bold})}));
end SystemDef;