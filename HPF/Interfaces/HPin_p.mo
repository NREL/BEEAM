within HPF.Interfaces;
/* positive pin
    Redefinition of HPin.
    This explicity defines the pin as a positive pin
    making it easier for defining polarity sensitive 
    components and devices.
*/
connector HPin_p
  
  extends HPin;
  Types.Reference reference "Reference";
  annotation(
    Icon(coordinateSystem(grid = {0, 0}), graphics = {Rectangle(lineColor = {117, 80, 123},fillColor = {117, 80, 123}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-100, 100}, {100, -100}})}),
    Diagram(coordinateSystem(grid = {0, 0})),
    __OpenModelica_commandLineOptions = "");
end HPin_p;