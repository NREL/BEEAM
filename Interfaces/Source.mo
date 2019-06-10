within HPF.Interfaces;

partial model Source
  extends TwoPinBase;
  // defining reference to prevent overconstrained system
  Modelica.SIunits.Angle theta(start = 0) = pin_p.reference.theta;
  
equation
  /*
    Defining root for the graph, root node in a virtual connection graph.
  */
  Connections.root(pin_p.reference);
  
annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));end Source;