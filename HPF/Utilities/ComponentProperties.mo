within HPF.Utilities;
record ComponentProperties
  extends Modelica.Icons.Record;
  /*
                                            Modelica record for assigning property values to classes.
                                            
                                            This can be used to identify components during the post processing.
                                          */
  String ComponentType "Type of the component";
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
    Documentation(info = "<html><head></head><body>Types of components:<div><br></div><div>* Impedance</div><div>* Resistance</div><div>* Voltage Source</div><div>* Nonlinear load</div><div>...</div><div><br></div><div>(This doc is incomplete)</div></body></html>"));
end ComponentProperties;
