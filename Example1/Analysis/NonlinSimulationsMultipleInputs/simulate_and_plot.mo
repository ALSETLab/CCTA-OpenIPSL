within Example1.Analysis.NonlinSimulationsMultipleInputs;
function simulate_and_plot
  "Run and plot the simulation used for identification and controller verification."
  extends Modelica.Icons.Function;
  input String modelname = "Example1.Analysis.NonlinSimulationsMultipleInputs.A_randomload_and_lowimpactmultisine" "Model to simulate.";
//  input String modelname = "Example1.Analysis.NonlinSimulationsMultipleInputs.B_randomload_and_loaddisturbance" "Model to simulate.";

algorithm
  // Using DAE mode for model "A_" will result in the simulation halting, therefore is disabled with the function above in case it has been activated by the user.
  Example1.Utilities.DAEMode.DAEModeOff();
  // Simulate the model
  simulateModel(
  modelname,
  stopTime=1260,
  tolerance = 1e-3,
  fixedstepsize=1e-4,
  numberOfIntervals=10000,
  resultFile="res_nonlinmultipleinputs");
  // Plot
  removePlots(false);
  Advanced.FilenameInLegend :=true;
  Advanced.FilesToKeep :=10;
  createPlot(id=1, position={26, 14, 959, 831}, y={"Vt"}, range={0.0, 1300.0, 0.92, 1.04}, autoscale=false, grid=true, filename="res_nonlinmultipleinputs.mat", subPlot=101, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
  createPlot(id=1, position={26, 14, 959, 831}, y={"Vt"}, range={0.0, 45.0, 0.98, 1.02}, autoscale=false, grid=true, subPlot=102, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
  createPlot(id=2, position={685, 280, 962, 847}, y={"w"}, range={0.0, 1300.0, 0.996, 1.006}, autoscale=false, grid=true, subPlot=101, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
  createPlot(id=2, position={685, 280, 962, 847}, y={"w"}, range={0.0, 45.0, 0.997, 1.003}, autoscale=false, grid=true, subPlot=102, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
  annotation (Documentation(info="<html>
<p><i><b><span style=\"font-family: Arial;\">Usage</span></b></i></p>
<ol>
<li><span style=\"font-family: Arial;\">In the Package Browser, right click on the function and select &quot;Call function...&quot;. This will open the function&apos;s window.</span></li>
<li><span style=\"font-family: Arial;\">Modify the input string &quot;modelname&quot; by entering any of the other model names within quotes, for example, to simulate the second model in this package, insert the string:&nbsp;</span><span style=\"font-family: Courier New;\">&quot;Example1.Analysis.NonlinSimulationsMultipleInputs.B_randomload_and_loaddisturbance&quot;</span><span style=\"font-family: Arial;\">, note that the quotes have to be included. Leave the default parameters on first use.</span></li>
<li><span style=\"font-family: Arial;\">Go to the bottom of the window and click on &quot;Execute&quot;, if successful, messages/results are displayed in the command window.</span></li>
<li><span style=\"font-family: Arial;\">Go back to the function&apos;s own window and click on &quot;Close&quot;.</span></li>
</ol>
</html>"));
end simulate_and_plot;
