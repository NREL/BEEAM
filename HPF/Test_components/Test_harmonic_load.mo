within HPF.Test_components;
model Test_harmonic_load
  outer SystemDef systemDef;
  import Modelica.ComplexMath.j;

  HPF.Utilities.ComponentProperties properties(ComponentType = "NonlinearLoad");

  extends HPF.SinglePhase.Interface.TwoPinBase;

  parameter Complex inputPwrS = -1 + 0*j;

  Real pReal = sum(v[:].re .* i[:].re - v[:].im .* i[:].im);
  Real pImag = sum(v[:].im .* i[:].re - v[:].re .* i[:].im);
  Real pHrmReal[systemDef.numHrm] = v[:].re .* i[:].re - v[:].im .* i[:].im;
  Real pHrmImag[systemDef.numHrm] = v[:].im .* i[:].re - v[:].re .* i[:].im;
  /*
    fixed current injection spectrum 
  */
  parameter Real iSpect_Mag[systemDef.numHrm];
  parameter Real iSpect_Arg[systemDef.numHrm];
  //Complex iSpect[systemDef.numHrm];
  //iSpect[:].re = iSpect_Mag[:].*cos(iSpect_Arg[:]);
  //iSpect[:].im = iSpect_Mag[:].*sin(iSpect_Arg[:]);
  Real scaleFact = 1 "Scale factor";

initial equation
  //i[:].re = {4, 1.99001};
  //i[:].im = {1e-6, 0.199667};
equation
  /*
    the device has a fixed AC power.
    The injection spectrum is fixed but can be scaled
    
  */
  // First, let us just inject the fixed injection spectrum. = DONE

  //i[:].re = scaleFact*(iSpect_Mag[:].*cos(iSpect_Arg[:]));
  //i[:].im = scaleFact*(iSpect_Mag[:].*sin(iSpect_Arg[:]));

  {590, 0.6} = v[:].re .* i[:].re - v[:].im .* i[:].im;
  {-33, -14.1455} = v[:].im .* i[:].re - v[:].re .* i[:].im;

  /*
    There can be another technique.
    Run an injection spectrum and then get all the powers for harmonics.
    Then, run a power flow with an additional constraint that the powers are equal
    
  */
  annotation (
    Icon(coordinateSystem(grid = {0, 0}, initialScale = 0.1), graphics = {Rectangle(origin = {-1, 0}, extent = {{-79, 60}, {81, -60}}), Line(origin = {-19.9954, 4.96454}, points = {{0, 24}, {0, -24}}), Line(origin = {-9.22393, 5.01984}, points = {{0, 14}, {0, -24}}), Line(origin = {0.00458531, 5.15934}, points = {{0, 4}, {0, -24}}), Line(origin = {29.0461, 5.31774}, points = {{0, -12}, {0, -24}}), Line(origin = {19.7105, 5.28514}, points = {{0, -4}, {0, -24}}), Line(origin = {9.04607, 4.58804}, points = {{0, 2}, {0, -24}}), Line(origin = {-1.22772, -19.1795}, rotation = -90, points = {{0, 36}, {0, -24}}), Text(origin = {-29, 171}, extent = {{-51, 33}, {97, -43}}, textString = "%name"), Line(origin = {-85, 1}, points = {{-5, -1}, {5, -1}, {5, 1}}), Line(origin = {85, 0}, points = {{-5, 0}, {5, 0}, {5, 0}})}),
    Diagram(coordinateSystem(extent = {{-200, -200}, {200, 200}}, grid = {0, 0}, initialScale = 0.1)),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian -d=initialization",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Test_harmonic_load;
