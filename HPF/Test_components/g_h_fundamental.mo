within HPF.Test_components;
model g_h_fundamental
  extends Modelica.Electrical.Analog.Interfaces.OnePort;

  parameter Real P = 1000;
  parameter Real alpha = 3e-2;
  parameter Real beta = 3e-4;
  parameter Real gamma = 2e-2;

initial algorithm

algorithm
  when initial() then
      //v := 5;
  end when;
equation
  //i = -5;
  P = v* (-i);// - alpha * v^2 - beta * v^3;
end g_h_fundamental;
