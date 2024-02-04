within Example2.MonitoringAndRedesign.Analysis.Study01.LinearizationForRedisgnedControllers;
function lint_after_trip
//input String path = "PSSMonitoringRedesignCaseB.MonitoringAndRedesign.Analysis.LinearizationForRedisgnedControllers.BaseCase" "Nonlinear plant model";
input String modelpath = "PSSMonitoringRedesignCaseB.MonitoringAndRedesign.Analysis.LinearizationForRedisgnedControllers.Case2" "Nonlinear plant model";
algorithm
ssc0:=Modelica_LinearSystems2.Utilities.Import.linearize2(modelpath,
    simulationSetup=
    Modelica_LinearSystems2.Records.SimulationOptionsForLinearization(
    linearizeAtInitial=false,
    t_start=0.0,
    t_linearize=1320.0,
    method="Dassl",
    tolerance=1e-12,
    fixedStepSize=1e-12));
end lint_after_trip;
