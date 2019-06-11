within HPF.Components;

model IdealTransformer
  /*
      There are two ways of implementing a transformer.
      1)  define all the pin objects in here and define all the potential
          and KCL relations in here.
      2)  Defining two objects of the TwoPinBase and then use the TwoPinBase 
          voltage and current relations to define the primary and secondary.
          There is an issue.
    */
  
equation
/*
  pin_p1.i + pin_n1.i = Complex(0, 0);
  pin_p2.i + pin_n2.i = Complex(0, 0);
  // Transformation ratios
  v1 = Complex(+n, 0)*v2;
  i2 = Complex(-n, 0)*i1;
  Connections.branch(pin_p1.reference, pin_n1.reference);
  pin_p1.reference.gamma = pin_n1.reference.gamma;
  Connections.branch(pin_n1.reference, pin_n2.reference);
  pin_p2.reference.gamma = pin_n2.reference.gamma;
  Connections.branch(pin_p1.reference, pin_p2.reference);
  pin_p1.reference.gamma = pin_p2.reference.gamma;
*/
  annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end IdealTransformer;