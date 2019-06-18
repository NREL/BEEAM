within HPF.Test_components;
model Test_Load
extends HPF.SinglePhase.Interface.TwoPinBase;
import Modelica.ComplexMath.j;

  parameter Complex S(re(start = 0), im(start = 0)) = 0 + 0*j;
equation
  if systemDef.numHrm > 1 then
    S = v[1] .* Modelica.ComplexMath.conj(i[1]);
    zeros(systemDef.numHrm - 1) = v[2:end].re .* i[2:end].re;
    zeros(systemDef.numHrm - 1) = v[2:end].re .*( - i[2:end].im);
  else
    S = v[1] .* Modelica.ComplexMath.conj(i[1]);
  end if;

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Test_Load;
