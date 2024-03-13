within Example2.Analysis.PFVariants.AutomationFunctions;
function simulate_and_plot_inputs
  "Simulates and plots the \"RampingRandomLoadAndInput\" model to reproduce the results in Fig. 4 of [2]."
  extends Modelica.Icons.Function;
  input Integer corenum = 12 "Number of processor cores to use";
algorithm
  // turn on flags to speed up the simulation
  Example2.Utilities.SetupSolverSettings.On(corenum);
  // run the simulation
  simulateModel(
    "Example2.Analysis.PFVariants.RampingRandomLoadAndInput_pf",
    stopTime=4050,
    numberOfIntervals=5000,
    tolerance=1e-06,
    resultFile="RampingRandomLoadAndInput");
  // plot
  removePlots(false);
  Advanced.FilenameInLegend :=true;
  Advanced.FilesToKeep :=10;
  createPlot(id=2, position={158, 148, 744, 455}, y={"plant.P"}, range={0.0, 70.0, 6.800000000000001, 8.4}, grid=true, filename="RampingRandomLoadAndInput.mat", colors={{28,108,200}}, timeUnit="min", displayUnits={"1"});

  annotation (Documentation(info="<html>
<p><i><b>Usage:</b></i></p>
<ol>
<li>In the Package Browser, right click on the function and select &quot;Call function...&quot;. This will open the function&apos;s window. </li>
<p><img src=\"modelica://Example2/Resources/corenum.png\"/></p>
<li>Enter the desired number of cores to use in &quot;corenum&quot;. The number of cores to use depends on your computer&apos;s resources. , if your computer has more than 12 cores, you can enter the desired number of cores to use in the function&apos;s main window. Note that it will take some trial an error to find a trade off on the number of cores to use in your system as per <a href=\"https://en.wikipedia.org/wiki/Amdahl%27s_law\">Amdahl&apos;s law</a>. See the note below the sample output for more details.</li>
<li>In the new function window, click on &quot;Execute&quot;, if successful, messages/results are displayed in the command window and plots will appear in Simulation tab.</li>
<li>Go back to the function&apos;s own window and click on &quot;Close&quot;. </li>
</ol>
<p><br><i><b>Sample output:</b></i></p>
<p>Running the function will result in the following plot.</p>
<p><img src=\"modelica://Example2/Resources/simulate_and_plot_inputs.png\"/></p>
<p><i><b>Note:</b></i></p>
<p>Please observe that running this function involves simulating the <a href=\"modelica://Example2.Analysis.RampingRandomLoadAndInput\">Example2.Analysis.RampingRandomLoadAndInput</a> model, which takes subtantially more time compared to example&nbsp;<a href=\"modelica://Example2.Analysis.Ramping\">Example2.Analysis.Ramping</a>, the reason is that both random load and probing signals are added to the model which results in an additional computation burden.</p>
<p>This function calls the <a href=\"modelica://Example2.Utilities.SetupSolverSettings.On\">Example2.Utilities.SetupSolverSettings.On</a> function that configures several flags to improve simulation speed, however, even by enabling these features, the simulation is time consuming. </p>
<p>For example, running the model using a computer with an 13th Gen Intel(R) Core(TM) i9-13900K, 3.00 GHz, processor and 128 GB DDR4 RAM, setup to use 12 cores, gave the following metrics:</p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Integration terminated successfully at T = 4050</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">CPU-time for integration : 1.14e+03 seconds</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">CPU-time for one grid interval : 227 milliseconds</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">CPU-time for initialization : 0.004 seconds</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number of result points : 961436</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number of grid points : 5001</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number of accepted steps : 9072834</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number of f-evaluations (dynamics) : 18084763</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number of crossing function evaluations : 9575493</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number of Jacobian-evaluations : 3918760</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number of model time events : 476996</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number of input time events : 0</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number of state events : 3815</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number of step events : 0</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Minimum integration stepsize : 2.78e-10</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Maximum integration stepsize : 0.00922</span></p>
<p style=\"margin-left: 90px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Maximum integration order : 5</span></p>
<p>Looking at the first two lines of the metrics shows that running the model for 67.5 min (4050 sec.) took 19 min (1.14e+03 sec.). </p>
<p>Naturally, using a computer with a weaker processor and lower memory will lead to longer run times.</p>
<p>Recall that the purpose of this simulation is to use it as input for system identification purposes as explained in [2]. If this is not necessary for your purposes, it is recommended that you run instead the function <a href=\"modelica://Example2.Analysis.AutomationFunctions.simulate_and_plot_ramping\">Example2.Analysis.AutomationFunctions.simulate_and_plot_ramping</a>, which takes substantially less time to execute.</p>
</html>"),preferredView="info");
end simulate_and_plot_inputs;
