within HPF.Utilities;
function ifft_fromMagPhaseOddHrms "Get IFFT from magnitudes and phase for only odd harmonics"
  extends Modelica.Icons.Function;
  input Real magOdd[:] "Magnitude data (odd harmonics)";
  input Real argOdd[:] "Phase data (odd harmonics)";
  input Integer N "Size of the FFT";
  output Real y[N];
protected
  Real y_fftRe[N];
  Real y_fftIm[N];
algorithm
/*
      reconstruct FFT complex data.
    */
  (y_fftRe, y_fftIm) := fft_fromMagPhaseOddHrms(magOdd, argOdd, N);
/*
      Run an IFFT and return time domain waveform. 
    */
  y := ifft(y_fftRe, y_fftIm);
  annotation (
    Documentation(info = "<html><head></head><body>Wrapper function for ifft_fromMagPhaseOddHrms. Input is magnitude and phase for only odd harmonics. The function zero pads all the even harmonics and then run call the function, ifft_fromMagPhase.<div><br></div><div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The input data is of the form,</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br></div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Harmonic number&nbsp;<span class=\"Apple-tab-span\" style=\"white-space: pre;\">        </span>| Input vector index</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">1 (fundamental)<span class=\"Apple-tab-span\" style=\"white-space: pre;\">                </span>| 1</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">3<span class=\"Apple-tab-span\" style=\"white-space: pre;\">                        </span>| 2</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">5<span class=\"Apple-tab-span\" style=\"white-space:pre\">                        </span>| 3</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">.</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">..</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">...</div></div></body></html>"));
end ifft_fromMagPhaseOddHrms;
