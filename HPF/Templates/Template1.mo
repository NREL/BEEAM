within HPF.Templates;
model Template1
  inner HPF.SystemDef systemDef annotation (
    Placement(visible = true, transformation(origin = {-48, 54}, extent = {{-14, -14}, {14, 10}}, rotation = 0)));
equation

annotation (
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst -d=initialization ",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl", nls = "newton", iim = "none"));
end Template1;
