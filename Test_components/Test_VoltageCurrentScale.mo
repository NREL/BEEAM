within HPF.Test_components;
function Test_VoltageCurrentScale
  input Real v;
  output Real res;
algorithm
 res := v / 2;
end Test_VoltageCurrentScale;
