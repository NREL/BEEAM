within HPF.Utilities;
function ifft_fromMagPhase "Get IFFT from magnitudes and phase"
  extends Modelica.Icons.Function;
  input Real mag[:] "Magnitude data of the harmonics";
  input Real arg[:] "Phase data of the harmonics";
  input Integer N "Size of the FFT";
  output Real y[N];
  /*
            Using the symmetric property of an fft.
          */
protected
  Real y_fftRe[N](each start = 0);
  Real y_fftIm[N](each start = 0);
algorithm
/*
      reconstruct FFT complex data.
    */
  (y_fftRe, y_fftIm) := fft_fromMagPhase(mag, arg, N);
/*
      Run an IFFT and return time domain waveform. 
    */
  y := ifft(y_fftRe, y_fftIm);
  annotation (
    Documentation(info = "<html><head></head><body>This function returns a time domain waveform from magnitude and phase information. Inputs are magnitude, phase and the sampling frequency.&nbsp;<div><br></div><div>The workflow is as follows:</div><div><br></div><div><b>1) </b>Reconstruct FFT complex representation from magnitude and phase information.</div><div><b>2)</b>&nbsp;Run an IFFT on the the data from step 1.</div><div><b>3)</b>&nbsp;Return only the real part, or the time domain waveform.</div><div><br></div><div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">The input data is of the form,</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\"><br></div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">Harmonic number&nbsp;<span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>| Input vector index</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">0 (DC, 0th harmonic)<span class=\"Apple-tab-span\" style=\"white-space: pre;\">	</span>| 1</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">1 (fundamental)<span class=\"Apple-tab-span\" style=\"white-space: pre;\">		</span>| 2</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">2<span class=\"Apple-tab-span\" style=\"white-space: pre;\">			</span>| 3</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">.</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">..</div><div style=\"font-family: 'DejaVu Sans Mono'; font-size: 12px;\">...</div></div><div><br></div><div>(Modelica implementation of the function from matlab (Avpreet Othee, Colorado State University)</div><div>)</div></body></html>"));
end ifft_fromMagPhase;
