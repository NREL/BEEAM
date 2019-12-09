within HPF.Interfaces;
connector HPin
/*
  Specialized connector for the harmonic power flow. 
  HPin, where H is for harmonics. The name signifies the special nature of the connector and its intended usage.

  h_max specifies the maximum harmonics to be simulated. The default value 
  (What should be a nominal value?) is used when user does not explicitly specify. 
  */
  
  
  //inner outer SystemDef systemDef;
  
  // potential variables

  parameter Integer h(start=1);
  Complex v[h] "Complex potential at the node";
 // Complex v[systemDef.numHrm] "Complex potential at the node";
  //flow variables
  flow Real iIm[h];   // flow variable, imaginary part
  flow Real iRe[h]; // Real part
  annotation(
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(origin = {0, -1}, extent = {{-100, 101}, {100, -99}})}),
    Diagram(coordinateSystem(grid = {0, 0})),
    __OpenModelica_commandLineOptions = "");
end HPin;