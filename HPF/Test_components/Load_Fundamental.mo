within HPF.Test_components;
model Load_Fundamental
extends HPF.SinglePhase.Interface.TwoPinBase;
  parameter Complex PQ(re(start=1), im(start=0)) "Power at fundamental";
equation
  PQ = v[1] * Modelica.ComplexMath.conj(i[1]);

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Load_Fundamental;
