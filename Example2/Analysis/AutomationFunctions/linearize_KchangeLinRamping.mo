within Example2.Analysis.AutomationFunctions;
function linearize_KchangeLinRamping
  "Function to linearize the model KchangeLinRamping at any point in time."
  extends Modelica.Icons.Function;
algorithm
  // turn on flags to speed up the simulation
  Example2.Utilities.SetupSolverSettings.On();
  // run the simulation
  simulateModel(
    "Example2.Analysis.Ramping",
    stopTime=4050,
    numberOfIntervals=5000,
    tolerance=1e-06,
    resultFile="Ramping");
  // plot
  removePlots(false);
  Advanced.FilenameInLegend :=true;
  Advanced.FilesToKeep :=10;
  createPlot(id=2, position={158, 148, 744, 455}, y={"plant.P"}, range={0.0, 70.0, 6.800000000000001, 8.4}, grid=true, filename="Ramping.mat", colors={{28,108,200}}, timeUnit="min", displayUnits={"1"});

end linearize_KchangeLinRamping;
