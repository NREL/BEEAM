within HPF.SinglePhase.NonlinearLoads;
model Test_Load_bkp
  extends HPF.SinglePhase.Interface.TwoPinBase;
  import Modelica.ComplexMath.j;
  /*
  
  
  */
  outer SystemDef systemDef;

  //parameter Real sReal(start = 0) = 1;
  //parameter Real sImag(start = 0) = 0;
  parameter Real iReal[:] = {1};
  parameter Real iImag[:] = {0};

  //parameter Complex sVect[systemDef.numHrm];//(each re(start = 0, nominal = 1),each im(start = 0, nominal = 1));
  parameter Real sVectRe( start = 0) = 1;
  parameter Real sVectIm( start = 0) = 0;

  Complex vPre(re( start = 0), im( start = 0));// =   Modelica.ComplexMath.real(v[1]);
/*
initial equation 
  sReal = Modelica.ComplexMath.real(v[1]) .* Modelica.ComplexMath.real(i[1]);
    sImag = Modelica.ComplexMath.imag(v[1]) .* Modelica.ComplexMath.imag(-i[1]);
*/
equation

  // power sink
  if systemDef.modeSelect == false then
    /*
      When simulating multiple harmonics, the initial poiwer flow
      is run only for the fundamental. One must set the power for 
      higher harmonics to zero.
      Adding an if block to set the values for single harmonic or
      multiple harmonics.
      */
      /*
    if systemDef.numHrm == 1 then
      sReal = Modelica.ComplexMath.real(v[1]) .* Modelica.ComplexMath.real(i[1]);
      sImag = Modelica.ComplexMath.imag(v[1]) .* Modelica.ComplexMath.imag(-i[1]);
    else
      // fundamental 
      sReal = Modelica.ComplexMath.real(v[1]) .* Modelica.ComplexMath.real(i[1]);
      sImag = Modelica.ComplexMath.imag(v[1]) .* Modelica.ComplexMath.imag(-i[1]);
      // higher harmonics
      zeros(systemDef.numHrm - 1) = Modelica.ComplexMath.real(v[2:end]) .* Modelica.ComplexMath.real(i[2:end]);
      zeros(systemDef.numHrm - 1) = Modelica.ComplexMath.imag(v[2:end]) .* Modelica.ComplexMath.imag(-i[2:end]);
    end if;
    */

    sVectRe = Modelica.ComplexMath.real(v[1]) .* Modelica.ComplexMath.real(i[1]);
    // TODO: p = v * conjugate(i)
    //sVect[:].im = Modelica.ComplexMath.imag(v) .* Modelica.ComplexMath.imag(i);
    sVectIm = Modelica.ComplexMath.imag(v[1]) .* ( i[1].im);

  else  // nonlinear current soure

    Modelica.ComplexMath.real(i) = - iReal .*  HPF.Test_components.Test_VoltageCurrentScale(vPre.re);
    Modelica.ComplexMath.imag(i) = - iImag .*  HPF.Test_components.Test_VoltageCurrentScale(vPre.im);

    //der(vPre) = 0;
  end if;

initial algorithm
  //sVect[1].re :=sReal;
  //sVect[1].im :=sImag;
  /*
  if systemDef.numHrm > 1 then
    sVect[2:end].re := zeros(systemDef.numHrm - 1);
    sVect[2:end].re := zeros(systemDef.numHrm - 1);
    end if;
    */
//equation
/*
  using the MSL write to file functions from Modelica.Utilities
  using if or when ?
  if might result in too many write operations
  */
  /*
  if systemDef.modeSelect == false then
 // when time == 0.3 then

   // HPF.SinglePhase.NonlinearLoads.DataIO.writeNodeVoltage(Modelica.ComplexMath.real(v[1]) + Modelica.ComplexMath.imag(v[1])*j, "testLoad");
     HPF.SinglePhase.NonlinearLoads.DataIO.writeNodeVoltage(v[1], "testLoad");
  else
    //when change(systemDef.modeSelect) then
      vPre := HPF.SinglePhase.NonlinearLoads.DataIO.readNodeVoltage("testLoad");
   // end when;
  end if;
  */

algorithm
  when change(systemDef.event1) then
    // write data
     HPF.SinglePhase.NonlinearLoads.DataIO.writeNodeVoltage(v[1], "testLoad");
  end when;

  when change(systemDef.event2) then
  //read data
    vPre := HPF.SinglePhase.NonlinearLoads.DataIO.readNodeVoltage("testLoad");
  end when;

  // event
  /*
    when change(systemDef.modeSelect) then
  HPF.SinglePhase.NonlinearLoads.DataIO.writeNodeVoltage(v[1], "testLoad");
    //vPre := HPF.SinglePhase.NonlinearLoads.DataIO.readNodeVoltage("testLoad");
    //vPre := 10 + 2*j;

  //elsewhen time == 0.3 then 
  vPre := HPF.SinglePhase.NonlinearLoads.DataIO.readNodeVoltage("testLoad");
    end when;
  */
  /*
  when time < 0.5 then
    sReal = Modelica.ComplexMath.real(v[1]) .* Modelica.ComplexMath.real(i[1]);
    sImag = Modelica.ComplexMath.imag(v[1]) .* Modelica.ComplexMath.imag(-i[1]);
    //vPre =  Modelica.ComplexMath.real(v[1]);

  elsewhen time >= 0.5 then

    Modelica.ComplexMath.real(i) = - iReal;// .* Test_VoltageCurrentScale(pre(vPre));
    Modelica.ComplexMath.imag(i) = - iImag;
    end when;
    */
annotation (
    Icon(coordinateSystem(grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end Test_Load_bkp;
