within Example2.MonitoringAndRedesign.Analysis.Study01.SimulationForRedisignedControllers;
function simulate_and_compare
  "Runs and compares different control designs."
  extends Modelica.Icons.Function;
algorithm
  Example2.Utilities.SetupSolverSettings.On();

  simulateModel(
  "Example2.MonitoringAndRedesign.Analysis.Study01.SimulationForRedisignedControllers.Case00",
  stopTime=120,
  numberOfIntervals=5000,
  tolerance=0.001,
  resultFile="Case00");

  simulateModel(
  "Example2.MonitoringAndRedesign.Analysis.Study01.SimulationForRedisignedControllers.Case01",
  stopTime=120,
  numberOfIntervals=5000,
  tolerance=0.001,
  resultFile="Case01");

  simulateModel(
  "Example2.MonitoringAndRedesign.Analysis.Study01.SimulationForRedisignedControllers.Case02",
  stopTime=120,
  numberOfIntervals=5000,
  tolerance=0.001,
  resultFile="Case02");

  simulateModel(
  "Example2.MonitoringAndRedesign.Analysis.Study01.SimulationForRedisignedControllers.Case03",
  stopTime=120,
  numberOfIntervals=5000,
  tolerance=0.001,
  resultFile="Case03");

  // Plot
  removePlots(false);
Advanced.FilenameInLegend :=true;
Advanced.FilesToKeep :=10;
createPlot(id=1, position={90, 90, 1301, 731}, y={"nonlinModel.Vt"}, range={55.0, 75.0, 1.0, 1.06}, autoscale=false, grid=true, filename="Case00.mat", subPlot=101, colors={{28,108,200}}, range2={-0.2, 1.0000000000000002}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={90, 90, 1301, 731}, y={"nonlinModel.w"}, range={55.0, 75.0, -0.0002, 0.0004000000000000001}, grid=true, subPlot=102, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={90, 90, 1301, 731}, y={"nonlinModel.Vt"}, range={55.0, 75.0, 1.0, 1.06}, erase=false, autoscale=false, grid=true, filename="Case01.mat", subPlot=101, colors={{238,46,47}}, range2={-0.2, 1.0000000000000002}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={90, 90, 1301, 731}, y={"nonlinModel.w"}, range={55.0, 75.0, -0.0002, 0.0004000000000000001}, erase=false, grid=true, subPlot=102, colors={{238,46,47}}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={90, 90, 1301, 731}, y={"nonlinModel.Vt"}, range={55.0, 75.0, 1.0, 1.06}, erase=false, autoscale=false, grid=true, filename="Case02.mat", subPlot=101, colors={{0,140,72}}, range2={-0.2, 1.0000000000000002}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={90, 90, 1301, 731}, y={"nonlinModel.w"}, range={55.0, 75.0, -0.0002, 0.0004000000000000001}, erase=false, grid=true, subPlot=102, colors={{0,140,72}}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={90, 90, 1301, 731}, y={"nonlinModel.Vt"}, range={55.0, 75.0, 1.0, 1.06}, erase=false, autoscale=false, grid=true, filename="Case03.mat", subPlot=101, colors={{217,67,180}}, range2={-0.2, 1.0000000000000002}, timeUnit="s", displayUnits={"1"});
createPlot(id=1, position={90, 90, 1301, 731}, y={"nonlinModel.w"}, range={55.0, 75.0, -0.0002, 0.0004000000000000001}, erase=false, grid=true, subPlot=102, colors={{217,67,180}}, timeUnit="s", displayUnits={"1"});




end simulate_and_compare;
