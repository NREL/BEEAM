within HPF.Interfaces;
partial model TwoPinBase
  
  outer SystemDef systemDef;  // instantiate systemDef as outer for global scope
  Complex v[systemDef.numHrm] "Complex voltage";
  Complex i[systemDef.numHrm] "Complex current";
  
  /*
    Defining omega for the overconstrained system workaround.
    omega would the derivative of alpha. ( additional constraint,
    as defined in pin.reference.theta)
  */
  Real omega;
  
  /* pin objects for the two pins
      number of harmonics to be simulated is passed as a parameter.
  */
  HPF.Interfaces.HPin_p pin_p(h = systemDef.numHrm) "Positive pin" annotation (Placement(visible = true, transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0), iconTransformation(extent = {{-112, -10}, {-92, 10}}, rotation = 0)));
  HPF.Interfaces.HPin_n pin_n(h = systemDef.numHrm) "Negative pin" annotation (Placement(visible = true, transformation(extent = {{90, -10}, {110, 10}}, rotation = 0), iconTransformation(extent = {{90, -10}, {110, 10}}, rotation = 0)));
  
equation
  /*
    Nonbreakable branch for the overterdetermined variable.
  */
  Connections.branch(pin_p.reference, pin_n.reference);
  pin_p.reference.theta = pin_n.reference.theta;
  omega = der(pin_p.reference.theta);
  
  /*
    voltage potential
  */
  v = pin_p.v - pin_n.v;  

  i.re = pin_p.iRe;
  i.im = pin_p.iIm;
  /*
    Conservation of charge (KCL).
  */
  pin_p.iRe + pin_n.iRe = {0.0 for i in 1:systemDef.numHrm};  
  pin_p.iIm + pin_n.iIm = {0.0 for i in 1:systemDef.numHrm};
  
annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(grid = {0, 0})),
    __OpenModelica_commandLineOptions = "");
end TwoPinBase;
