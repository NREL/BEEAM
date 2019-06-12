within HPF.SinglePhase.Components;

model Impedance
/*
  Impedance is defined at the fundamental.
  At hth harmonic, the impedance is z_h = h*z
*/

extends HPF.SinglePhase.Interface.TwoPinBase;
  import Modelica.ComplexMath.j;
  parameter Complex z(re(start = 1), im(start = 0)) "Impedance, R + jX"; 
  //parameter Integer h[2] = {1, 2}"Specify harmonics (array)";
  
 // Integer hTmp[2] = {1, 2, 3};
equation
  /*
    hrms is a user defined vector specified in systemDef.
    
  */
  v = (z.*systemDef.hrms).* i;
  
annotation(
  defaultComponentName = "z",
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Line(origin = {21.0955, 10}, points = {{-10, -10}, {-10, -6}, {-8, 2}, {-6, 6}, {-4, 8}, {-2, 10}, {2, 10}, {6, 6}, {8, 2}, {10, -4}, {10, -10}, {10, -10}}, thickness = 0.5, smooth = Smooth.Bezier), Line(origin = {41.0686, 10.401}, points = {{-10, -10}, {-10, -6}, {-8, 2}, {-6, 6}, {-4, 8}, {-2, 10}, {2, 10}, {6, 6}, {8, 2}, {10, -4}, {10, -10}, {10, -10}}, thickness = 0.5, smooth = Smooth.Bezier), Line(origin = {61.1663, 10.4279}, points = {{-10, -10}, {-10, -6}, {-8, 2}, {-6, 6}, {-4, 8}, {-2, 10}, {2, 10}, {6, 6}, {8, 2}, {10, -4}, {10, -10}, {10, -10}}, thickness = 0.5, smooth = Smooth.Bezier), Line(origin = {-5.15345, -0.0899996}, points = {{-5, 0}, {17, 0}}, thickness = 0.5), Line(origin = {85.9338, 0.0417182}, points = {{-15, 0}, {5, 0}}, thickness = 0.5), Line(origin = {-50.83, 0}, points = {{-41.1708, 0}, {-29.1708, 0}, {-19.1708, 20}, {-9.17082, -20}, {0.82918, 20}, {10.8292, -20}, {20.8292, 20}, {30.8292, -20}, {40.8292, 0}}, thickness = 0.5), Text(origin = {33, 45}, extent = {{-111, 37}, {47, -15}}, textString = "%name"), Text(origin = {15, -55}, lineColor = {117, 80, 123}, extent = {{-79, 29}, {47, -15}}, textString = "z=%z")}),
    Diagram(coordinateSystem(grid = {0, 0})),
    __OpenModelica_commandLineOptions = "");
      
end Impedance;