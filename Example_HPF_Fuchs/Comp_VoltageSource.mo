within HPF.Example_HPF_Fuchs;

model Comp_VoltageSource
/*
  The voltage source is a swing bus (constant voltage at fundmental).
  For the fundamental frequency, the source acts as a swing bus with a fixed 
  voltage magnitude.
  
  For the 5th harmonic, the source acts as an impedance.
  
     ----------
     |
     Z1
     |
     E_an
     |
     ----------
  
  E_an is the synchronous machine and Z1 is the subtransient harmonic.
  At fundamental frequency, the voltage source exists by itself. (on page 640
  it is mentioned that the admittance matrix at the fundamental is similar to
  fundamental power flow example, thus Z1(@h=1) = 0).
  For the 5th harmonic, the synchronous machine is repaced by a short circuit and
  Z1 is replaced by a subtransient harmonic.
  
*/

extends Interfaces.Source;
import Modelica.ComplexMath.j;
  parameter Real vMag_h1 = 1 "Voltage at fundamental"; // swing bus
  parameter Complex z1(re(start=0), im(start=0.01)) "Impedance at h = 5";
equation
  /*
    * in the first iteration, running fundamental power flow.
      The voltage source is a swing bus at the fundamental. Setting harmonic
      voltage to zero.
    * In the second iteration, the nonlinear source would be converted to 
      current source, injecting currents at the fundamental and the harmonics.
  */
  if systemDef.modeSelect == true then // voltage source
     // h = 1
    vMag_h1 = Modelica.ComplexMath.'abs'(v[1]);
    // h = 5
    v[2] = Complex(0.0) * i[2];
  else  
     // h = 1
    vMag_h1 = Modelica.ComplexMath.'abs'(v[1]);
    // h = 5
    v[2] = i[2] * z1;
  end if;
  
  

annotation(
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));end Comp_VoltageSource;