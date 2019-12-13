within HPF.Test;
model g_h
  /*
    input data from one of the iterations in the 
    matlab implementation.
  
  */
  parameter Real alpha = 3e-2;
  parameter Real beta = 3e-4;
  parameter Real gamma = 2e-2;
  parameter Real nu = 20;
  parameter Real h[3] = {1, 3, 5};
  parameter Real i1 = 3;
  parameter Real v1 = 100;
  Real i[3];
algorithm
  i := nu .* exp(-gamma .* i1 .* h) .+ (alpha .* v1) .+ (beta .* v1^2);
annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end g_h;
