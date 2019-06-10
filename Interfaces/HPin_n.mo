within HPF.Interfaces;
// negative pin
connector HPin_n "Harmonic Pin, Negative terminal"
  extends HPin;
  Types.Reference reference "Reference";
  annotation(
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(lineColor = {117, 80, 123},fillColor = {117, 80, 123}, extent = {{-100, 100}, {100, -100}})}),
    Diagram(coordinateSystem(grid = {0, 0})),
    __OpenModelica_commandLineOptions = "");
end HPin_n;