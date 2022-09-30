% Function: Generate normalized AC/DC converter empirical harmonic model 
% ------------------------------------------------------------------------------
% Generates interpolation tables for the response surface of harmonic current
% with respect to (i) harmonic order and (ii) fundamental frequency real power.
% Separate tables are provided for current magnitude and current phase.
%
% Tables are normalized: input fundamental frequency real power is normalized
% with respect to nominal (rated) power 'Pnom'; output current magnitude is
% normalized with respect to nominal (rated) current 'Inom'.
%
% Inputs:
%   Imeas: Measured complex harmonic current (vector)
%   h:     Associated harmonic order (vector)
%   P1:    Associated fundamental frequency real power (vector)
%   Inom:  Nominal (rated) current (scalar)
%   Pnom:  Nominal (rated) power (scalar)
%
% Imeas, h, and P1 represent three columns in a table of observations to be used
% for response surface fitting. Therefore, they must be column vectors of the
% same length. 
%
% Outputs:
%   hh:        Matrix of harmonics for interpolation table
%   PP:        Matrix of fundamental frequency real power values for
%              interpolation table (normalized)
%   magnitude: Interpolation table for harmonic current magnitude (normalized)
%   phase:     Interpolation table for harmonic current phase angle (unwrapped)
%
% Stephen Frank, Stephen.Frank@nrel.gov
% 
% Based On: 'generate_harmonic_load_model.m' originally written by Avpreet
% Othee, avpreetsingh@hotmail.com
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
