within HPF.HarmonicSources;
model NonlinearHarmonicLoad
extends HPF.Interfaces.TwoPinBase;
  Complex j = Modelica.ComplexMath.j;

  parameter Complex sFund(re(start=1), im(start=0)) "Apparent Power at fundamental S=P+jQ";
  parameter Real iHrmsRe[:] = {1} "Harmonic currents (Real part, improve implementation!)";
  parameter Real iHrmsIm[:] = {0};

  parameter Real funcVI = 1 "TMP: scaling factor relating voltage (fundamental) and harmonic current";

  /*
    use 'previous keyword'
  */
  //Complex vTermFund(re(start = 0), im(start = 0));
  //Complex dummyZ(re(start = 1), im(start = 1));
  //Real tmp(start = 1);
equation
  /*
    TODO: replace modelSelect numbers with enumeration
  */

  /*
    power sink at fundamental
  */
  if systemDef.modeSelect == true then


    sFund = v[1] .* Modelica.ComplexMath.conj(i[1]);

    /* 
      system must still be defined for the rest of the harmoncis.
      Setting power at h > 1 to zero.
    */
    v[2:end] .* Modelica.ComplexMath.conj(i[2:end]) = {Complex(0.0) for i in 1:(systemDef.numHrm - 1)};


  /*
    Harmonic current source.
    * Get voltage at the terminal
    * For this test system, just implement a scaling function 
      for the current injection spectrum.
      */
    
  else
    
    Modelica.ComplexMath.real(i) = - iHrmsRe;//-Complex( iHrmsRe[1], iHrmsIm[1]);
    Modelica.ComplexMath.imag(i) = - iHrmsIm;

  end if;
  
annotation (
    Icon(coordinateSystem(extent = {{-130, -100}, {100, 100}}, grid = {0, 0})),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0})));
end NonlinearHarmonicLoad;
