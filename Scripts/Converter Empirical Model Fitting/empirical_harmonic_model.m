% Function: Generate normalized AC/DC converter empirical harmonic model 
% ------------------------------------------------------------------------------
% TO DO: Document...
% ------------------------------------------------------------------------------

function [hh, PP, magnitude, phase] = ...
  empirical_harmonic_model(Imeas, h, P1, Inom, Pnom)
  
  % Unique, ordered values for harmonics and fundamental powers
  hVect = sort(unique(h));
  PVect = sort(unique(P1)) ./ Pnom;
  
  % Normalized reference power
  P1_pu = P1 ./ Pnom;
  
  % Normalized current
  I_pu = Imeas ./ Inom;
  
  % Grid for interpolation surface / model
  [hh, PP] = meshgrid(hVect, PVect);
  
  % Populate complex interpolation table using griddata (interpolates gaps!)
  I_complex = griddata(h, P1_pu, I_pu, hh, PP);
  
  % Split into magnitude, phase
  magnitude = abs(I_complex);
  phase     = arg(I_complex);
  
  % Unwrap phase angle along the harmonic axis
  phase = unwrap(phase, pi, 2);
  
endfunction
