within HPF.SinglePhase.NonlinearLoads;
model Test_Load
  extends HPF.SinglePhase.Interface.TwoPinBase;
  import Modelica.ComplexMath.j;
  /*
  
  
  */
  outer SystemDef systemDef;

  parameter Real sReal(start = 0) = 1 "IMPORTANT: set real power to -ve";
  parameter Real sImag(start = 0) = 0;
  parameter Real iReal[:] = {1};
  parameter Real iImag[:] = {0};

  //parameter Complex sVectH[systemDef.numrm];//(each re(start = 0, nominal = 1),each im(start = 0, nominal = 1));
  parameter Real sVectRe[systemDef.numHrm](each start = 0);
  parameter Real sVectIm[systemDef.numHrm](each start = 0);

  /*
  Nonlinear harmonic load workflow and implementation details:
  The workflow is as follows:
  1)  Run fundamental power flow and get voltage across the device (for h=1)
  2)  Use the voltage determined in step 1 and get a current harmonic injection spectrum
  3)  Using the harmonic spectrum, run a harmonic power flow and get losses in the system

  In the first step, the simulation is run only for the 1st harmonic. The user 
  would define the power consumed by the device only at the fundamental. The system 
  should automatically set the power of the higher harmonics to zero. Thus, when a 
  power flow analysis is run, one would only get results for the fundamental (system
  would get zero currents for higher harmonics).
  */


  //parameter Complex test_1(re(start = 0), im(start = 0));
  //Complex testZeros[systemDef.numHigherHrm] = {Complex(0.0) for i in 1:(systemDef.numHigherHrm)};

  parameter Complex testVect[systemDef.numHrm](each re(start = 0, nominal = 1),each im(start = 0, nominal = 1)) = cat(1, {Complex(sReal, sImag)}, {Complex(0.0) for i in 1:systemDef.numHrm-1});


  Complex vPre(re( start = 0), im( start = 0));// =   Modelica.ComplexMath.real(v[1]);

equation

  // power sink
  if systemDef.modeSelect == false then
  /*
    sVectRe[:] = v[:].re .* i[:].re;
    sVectIm[:] = v[:].im .* (-i[:].im);
  */

    testVect[:].re = v[:].re .* i[:].re;
    testVect[:].im = v[:].im .* (-i[:].im);

  else  // nonlinear current soure
    i[:].re =  iReal .*  HPF.Test_components.Test_VoltageCurrentScale(vPre.re);
    i[:].im =  iImag .*  HPF.Test_components.Test_VoltageCurrentScale(vPre.im);
  end if;

algorithm
  when change(systemDef.event1) then
    // write data
     HPF.SinglePhase.NonlinearLoads.DataIO.writeNodeVoltage(v[1], "testLoad");
  end when;

  when change(systemDef.event2) then
  //read data
    vPre := HPF.SinglePhase.NonlinearLoads.DataIO.readNodeVoltage("testLoad");
  end when;

annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Test_Load;
