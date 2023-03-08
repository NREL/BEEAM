within HPF.Test_components;
model Load_QuasiLib
  import Modelica.ComplexMath.j;
  extends Modelica.Electrical.QuasiStatic.SinglePhase.Interfaces.OnePort;

  //parameter Complex S1(re(start = 1), im(start = 1)) = 1 + 0*j;
  parameter Real P1 = 1000;
  parameter Real arg_S = 1.3;

  Real Q1(start = 1);

  Real mag_S(start = 1);
equation

  P1= mag_S * cos(arg_S);
  Q1 = mag_S * sin(arg_S);
  /*
  S = P + jQ = V*conj(I)
      = (Vre*Ire + Vim*Iim) + j(Vim*Ire - Vre*Iim)
  */
  P1 = v.re*i.re + v.im*i.im;
  Q1 = v.im*i.re - v.re*i.im;
end Load_QuasiLib;
