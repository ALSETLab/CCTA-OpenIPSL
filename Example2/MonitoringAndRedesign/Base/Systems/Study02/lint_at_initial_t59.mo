within Example2.MonitoringAndRedesign.Base.Systems.Study02;
function lint_at_initial_t59

algorithm

  Advanced.Define.DAEsolver :=false;

Modelica_LinearSystems2.ModelAnalysis.Linearize(
  "PSSPerfMonitorRobustDesign.MonitoringAndRedesign.Base.Systems.Study02.TestSystemIODetunedPSSLin",
  simulationSetup=Modelica_LinearSystems2.Records.SimulationOptionsForLinearization(
  linearizeAtInitial=false,
  t_linearize=59.0,
  tolerance=1e-12));

end lint_at_initial_t59;
