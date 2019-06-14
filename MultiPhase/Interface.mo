within HPF.MultiPhase;
package Interface
  extends Modelica.Icons.InterfacesPackage;
  connector MultiPhasePin

    parameter Integer numPhase(start = 3) "Number of phases";
    HPF.SinglePhase.Interface.HPin pin[numPhase];

    annotation (
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Line(points = {{20, 100}, {0, 100}, {-18, 98}, {-40, 92}, {-58, 82}, {-76, 66}, {-90, 44}, {-98, 24}, {-100, 10}, {-100, -8}, {-96, -28}, {-90, -46}, {-80, -60}, {-66, -76}, {-44, -90}, {-28, -96}, {-8, -100}, {20, -100}}, smooth = Smooth.Bezier), Line(origin = {59, 0}, points = {{-39, 100}, {41, 100}, {41, -100}, {-41, -100}})}),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end MultiPhasePin;

  connector MultiPhasePin_P "Positive Multi Phase Harmonic Pin"

    extends MultiPhasePin;
    HPF.Types.Reference reference "Reference";

    annotation (
      Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Ellipse(origin = {-18, 31}, fillColor = {92, 53, 102}, fillPattern = FillPattern.Solid, extent = {{-82, 69}, {118, -131}}, endAngle = 360), Rectangle(origin = {50, 0}, lineColor = {92, 53, 102}, fillColor = {92, 53, 102}, fillPattern = FillPattern.Solid, extent = {{50, 100}, {-50, -100}})}),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end MultiPhasePin_P;

  connector MultiPhasePin_N "Negative Multi Phase Harmonic Pin"

    extends MultiPhasePin;
    HPF.Types.Reference reference "Reference";
    annotation (
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end MultiPhasePin_N;

  partial model Source
  equation

    annotation(
      Icon(coordinateSystem(grid = {0, 0})),
      Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
  end Source;
  annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Interface;