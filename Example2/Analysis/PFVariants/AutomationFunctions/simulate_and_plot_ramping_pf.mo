within Example2.Analysis.PFVariants.AutomationFunctions;
function simulate_and_plot_ramping_pf
  "Simulates and plots the \"Ramping_pf\" model"
  extends Modelica.Icons.Function;
  input Integer numcores = 12 "Number of cores used for the simulation";
algorithm
  // turn on flags to speed up the simulation
  Example2.Utilities.SetupSolverSettings.On(numcores);
  // run the simulation
  simulateModel(
    "Example2.Analysis.PFVariants.Ramping_pf",
    stopTime=4050,
    numberOfIntervals=5000,
    tolerance=1e-06,
    resultFile="Ramping");
  // plot
  removePlots(false);
  Advanced.FilenameInLegend :=true;
  Advanced.FilesToKeep :=10;
  createPlot(id=2, position={158, 148, 744, 455}, y={"plant.P"}, range={0.0, 70.0, 6.800000000000001, 8.4}, grid=true, filename="Ramping.mat", colors={{28,108,200}}, timeUnit="min", displayUnits={"1"});

  annotation (Documentation(info="<html>
<p><i><b>Usage:</b></i></p>
<ol>
<li>In the Package Browser, right click on the function and select &quot;Call function...&quot;. This will open the function&apos;s window.</li>
<p><img src=\"modelica://Example2/Resources/simulate_and_plot_fun_pf.png\"/></p>
<li>In the new function window, click on &quot;Execute&quot;, if successful, messages/results are displayed in the command window and plots will appear in Simulation tab.</li>
<li>Go back to the function&apos;s own window and click on &quot;Close&quot;. </li>
</ol>
<p><br><i><b>Sample Output:</b></i></p>
<p>Running the function will result in the following plot.</p>
<p><img src=\"modelica://Example2/Resources/simulate_and_plot_ramping_pf.png\"/></p>
</html>"),preferredView="info");
end simulate_and_plot_ramping_pf;
