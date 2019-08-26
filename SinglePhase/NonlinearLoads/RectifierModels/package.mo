within HPF.SinglePhase.NonlinearLoads;
package RectifierModels
  extends Modelica.Icons.RecordsPackage;


  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})),
  Documentation(info = "<html><head></head><body>This is a collection of harmonic models for rectifiers.<div><br></div><div>Each class refers to a rectifier model that has a unique harmonic signature (resulting from different underlying converter topologies). User would drag the class record into the model and pass the name of the record in the rectifier parameters.</div><div><br></div><div><br></div></body></html>"));
end RectifierModels;
