within Example2.MonitoringAndRedesign.Analysis.Study02.BaseAnalysisModels;
function Sims

algorithm

  Advanced.Define.DAEsolver :=true;
simulateModel(
  "PSSPerfMonitorRobustDesign.MonitoringAndRedesign.Analysis.Study02.BaseAnalysisModels.LoadNoise",
  stopTime=1320,
  numberOfIntervals=0,
  outputInterval=0.01,
  tolerance=1e-06,
  resultFile="LoadNoise");

simulateModel(
  "PSSPerfMonitorRobustDesign.MonitoringAndRedesign.Analysis.Study02.BaseAnalysisModels.LoadAndInputSignalSimulation",
  stopTime=1320,
  numberOfIntervals=0,
  outputInterval=0.01,
  tolerance=1e-06,
  resultFile="LoadAndInputSignalSimulation");

end Sims;
