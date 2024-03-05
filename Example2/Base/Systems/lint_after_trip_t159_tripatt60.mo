within Example2.Base.Systems;
function lint_after_trip_t159_tripatt60

algorithm

    Advanced.Define.DAEsolver :=false;

Modelica_LinearSystems2.ModelAnalysis.Linearize(
  "PSSPerfMonitorRobustDesign.MonitoringAndRedesign.Base.Systems.Study02.TestSystemIODetunedPSSLin",
  simulationSetup=Modelica_LinearSystems2.Records.SimulationOptionsForLinearization(
  linearizeAtInitial=false,
  t_linearize=159.0,
  tolerance=1e-12));

end lint_after_trip_t159_tripatt60;
