within HPF.SinglePhase.NonlinearLoads;
model Test_Load
  extends HPF.SinglePhase.Interface.TwoPinBase;
  /*
  
  
  */
  outer SystemDef systemDef;

  parameter Real sReal = 1;
  parameter Real sImag = 0;
  parameter Real iReal[:] = {1};
  parameter Real iImag[:] = {0};

  Real vPre( start = 0);// =   Modelica.ComplexMath.real(v[1]);

equation

  // power sink
  if systemDef.modeSelect == false then
    sReal = Modelica.ComplexMath.real(v[1]) .* Modelica.ComplexMath.real(i[1]);
    sImag = Modelica.ComplexMath.imag(v[1]) .* Modelica.ComplexMath.imag(-i[1]);



  else  // nonlinear current soure

    //vPre = 0;
    Modelica.ComplexMath.real(i) = - iReal .*  HPF.Test_components.Test_VoltageCurrentScale(vPre);
    Modelica.ComplexMath.imag(i) = - iImag;
  end if;

algorithm
  if systemDef.modeSelect == false then
    vPre :=    Modelica.ComplexMath.real(v[1]);
  else

  end if;


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
