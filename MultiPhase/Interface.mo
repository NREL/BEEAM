within HPF.MultiPhase;
package Interface
  extends Modelica.Icons.InterfacesPackage;
  connector MultiPhasePin

    parameter Integer numPhase(start = 3) "Number of phases";
    HPF.SinglePhase.Interface.HPin pin[numPhase];

    annotation (
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics={  Ellipse(origin = {4, -8}, extent = {{-104, 108}, {96, -92}}, endAngle = 360)}),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end MultiPhasePin;

  connector MultiPhasePin_P

    extends MultiPhasePin;


    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end MultiPhasePin_P;

  connector MultiPhasePin_N

    extends MultiPhasePin;

    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end MultiPhasePin_N;

  model PhaseSelect

    parameter Integer p = 1;
    HPF.MultiPhase.Interface.MultiPhasePin multiPhasePin1 annotation (
      Placement(visible = true, transformation(origin = {-82, 16}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    HPF.SinglePhase.Interface.HPin hPin1 annotation (
      Placement(visible = true, transformation(origin = {62, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation



    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end PhaseSelect;
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Interface;
