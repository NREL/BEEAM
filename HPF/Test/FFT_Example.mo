within HPF.Test;
model FFT_Example
  "Example demonstrating the use of an FFT calculation during simulation (and storing both amplitudes and phases on file)"
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Frequency f_max = 4
    "Maximum frequency of interest";
  parameter Modelica.SIunits.Frequency f_resolution = 0.2
    "Frequency resolution";
  parameter Modelica.SIunits.Frequency f1 = 2 "Frequency of sine";
  parameter Modelica.SIunits.Frequency f2 = 3 "Frequency of cosine";
  parameter String FFT_resultFileName = "RealFFT1_resultFFT.mat"
    "File where FFT will be stored as [f,A,Phi], with f in {Hz] and A the amplitudes and Phi the phases in [rad]";
  final parameter Integer nfi = max(1,min(integer(ceil(f_max/f_resolution))+1,nf))
    "Number of frequency points of the interested frequency range (only up to f_max)";
  final parameter Modelica.SIunits.Frequency fi[nfi](each fixed=false)
    "FFT frequencies of interested frequency points";
  Real y(final start=0, final fixed=true)
    "Signal from which FFT is computed";
  final output Real Ai[nfi](each start=0, each fixed=true)
    "FFT amplitudes of interested frequency points";
  final output Real Phii[nfi](each start=0, each fixed=true)
    "FFT phases of interested frequency points";
  output Integer info(final start=0, final fixed=true)
    "Information flag from FFT computation; = 0: FFT successfully computed";

//protected
  parameter Integer ns = Modelica.Math.FastFourierTransform.realFFTsamplePoints(f_max, f_resolution, f_max_factor=5);
  parameter Modelica.SIunits.Frequency f_max_FFT = f_resolution*div(ns, 2)
    "Maximum frequency used by FFT";
  parameter Integer nf = div(ns,2) + 1 "Number of frequency points";
  parameter Modelica.SIunits.Time Ts = 1/(2*f_max_FFT) "Sample period";
  parameter Modelica.SIunits.Time T = (ns - 1)*Ts
    "Simulation time for one FFT calculation";

  Integer iTick(start=0, fixed=true);
  Real y_buf[ns](each start=0, each fixed=true);

  Integer k(start = 0);
initial equation
  for i in 1:nfi loop
     fi[i] = (i-1)*f_resolution;
  end for;

algorithm
  when sample(0,Ts) then
     iTick :=pre(iTick) + 1;
     y := 5 + 3*sin(2*pi*f1*time) + 1.5*cos(2*pi*f2*time);
     if iTick >= 1 and iTick <= ns then
        y_buf[iTick] := y;
     end if;

     if iTick == ns then
       k := k + 1;
       (info,Ai,Phii) :=  Modelica.Math.FastFourierTransform.realFFT(y_buf, nfi);
       Modelica.Math.FastFourierTransform.realFFTwriteToFile(time,FFT_resultFileName,f_max,Ai,Phii);
     end if;
  end when;
end FFT_Example;
