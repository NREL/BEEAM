within HPF.SinglePhase.NonlinearLoads;
model Test_Load
  extends HPF.SinglePhase.Interface.TwoPinBase;
  import Modelica.ComplexMath.j;
  /*
  
  
  */
  outer SystemDef systemDef;

  parameter Real sReal(start = 0) = 1;
  parameter Real sImag(start = 0) = 0;
  parameter Real iReal[:] = {1};
  parameter Real iImag[:] = {0};

  Complex vPre(re( start = 0), im( start = 0));// =   Modelica.ComplexMath.real(v[1]);
/*
initial equation 
  sReal = Modelica.ComplexMath.real(v[1]) .* Modelica.ComplexMath.real(i[1]);
    sImag = Modelica.ComplexMath.imag(v[1]) .* Modelica.ComplexMath.imag(-i[1]);
*/
equation

  // power sink
  if systemDef.modeSelect == false then
    sReal = Modelica.ComplexMath.real(v[1]) .* Modelica.ComplexMath.real(i[1]);
    sImag = Modelica.ComplexMath.imag(v[1]) .* Modelica.ComplexMath.imag(-i[1]);
    //vPre = Modelica.ComplexMath.real(v[1]);

  else  // nonlinear current soure

    Modelica.ComplexMath.real(i) = - iReal .*  HPF.Test_components.Test_VoltageCurrentScale(vPre.re);
    Modelica.ComplexMath.imag(i) = - iImag .*  HPF.Test_components.Test_VoltageCurrentScale(vPre.im);

    //der(vPre) = 0;
  end if;

algorithm
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
end Test_Load;
