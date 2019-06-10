within HPF;
class SystemDef
                // changing from model to a class

  parameter Integer hrms[:] = {1} "Harmonics to simulate";

  /*
  INFO: Type variability
  Dymola is throwing an error for the type variability.
  'constant' has a lower variability than parameter.
  */
  parameter Integer numHrm = size(hrms, 1) "Number of harmonics. (Automatically generated from hrms. Do not alter)";
   /*
      selects the mode of operation, used by nonlinear harmonic loads 
      Modes definition: (selecting boolean as the modes would have only 2 states)
        true = mode: power sink / source
        false = mode: constant current source
    */
  discrete Boolean modeSelect;

  discrete Boolean modeSelPrev(start = false);
  // defining clock variables used to implement the iterative solver
  Clock clk;
  parameter Modelica.SIunits.Time interval = 0.25;

  parameter Real fFund = 60 "Fundamental frequency";

equation
  clk = Clock(interval);
    when clk then
      modeSelPrev = previous(modeSelect);
      if modeSelPrev == false then
        modeSelect = true;  // Power flow
      else
        modeSelect = false; // Harmonic solver
      end if;
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
    Drag Solver.SystemDef into the top level of your model.",
  Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}), Line(origin = {0, 60}, points = {{-100, 0}, {100, 0}}), Text(origin = {-48, 35}, extent = {{-34, 13}, {94, -9}}, textString = "Harmonics=%hrms"), Text(origin = {-48, 7}, extent = {{-34, 13}, {126, -33}}, textString = "Fundamental=%fFund Hz")}));
end SystemDef;
