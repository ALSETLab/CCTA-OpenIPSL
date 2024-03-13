within Example2.Analysis.PFVariants.AutomationFunctions;
function linearize_KchangeLinRamping
  "Function to linearize the model KchangeLinRamping at any point in time."
  extends Modelica.Icons.Function;
  input Real tlin = 600 "[s], time for linearization.";
  input String pathToNonlinearPlantModel = "Example2.Analysis.KchangeLinRamping";
algorithm
  // turn off flags to avoid issues in the generated linear model
  Modelica.Utilities.Streams.print("Setting up things...");
  Example2.Utilities.SetupSolverSettings.Off();
  Advanced.SparseActivate :=false;
  Advanced.Translation.SparseActivateIntegrator :=false;
  Advanced.Translation.SparseActivateSystems :=false;
  OutputCPUtime :=false; // disable cpu time output so it doesn't screw up the sizes of the outputs

  // linearize
  Modelica.Utilities.Streams.print("Starting simulation and linearization...");

ss := Modelica_LinearSystems2.ModelAnalysis.Linearize(
  pathToNonlinearPlantModel, simulationSetup=
  Modelica_LinearSystems2.Records.SimulationOptionsForLinearization(
  linearizeAtInitial=false,
  t_linearize=tlin));

  // print the results
  Modelica.Utilities.Streams.print(String(ss));
  Modelica.Utilities.Streams.print("The linear model is in your working directory.");
  Modelica.Utilities.Streams.print("Open the dslin.mat file following the instructions in the documentation.");

   // plot the poles
  Modelica.Utilities.Streams.print("You can also analyze the linear model using Dymola, for example typing in the commands window
  Modelica_LinearSystems2.StateSpace.Plot.polesAndZeros(ss, zeros=false, print=true);
  will give you the polte plot shown in the Simulation tab and printed below.");

  Modelica_LinearSystems2.StateSpace.Plot.polesAndZeros(ss, zeros=false, print=true);
//annotate(preferredView="text");
  annotation (Documentation(info="<html>
<p><i><b>Usage:</b></i></p>
<ol>
<li>In the Package Browser, right click on the function and select &quot;Call function...&quot;. This will open the function&apos;s window. </li>
<p><img src=\"modelica://Example2/Resources/linfun.png\"/></p>
<li>Enter the time for linearization, <span style=\"font-family: Courier New;\"><a href=\"Example2.Analysis.KchangeLinRamping\">Example2.Analysis.KchangeLinRamping</a></span> will be simulated until that point in time and linearized.</li>
<li>In the new function window, click on &quot;Execute&quot;, if successful, messages/results are displayed in the command window and plots will appear in Simulation tab.</li>
<li>Go back to the function&apos;s own window and click on &quot;Close&quot;. </li>
</ol>
<p><br><i><b>Sample Output:</b></i></p>
<p>Executing the function will produce the following output in the &quot;Commands&quot; window.</p>
<p><br><span style=\"font-family: Courier New; font-size: 10pt;\">Example2.Analysis.AutomationFunctions.linearize_KchangeLinRamping();</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Setting&nbsp;up&nbsp;things...</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">DAE&nbsp;Mode&nbsp;is&nbsp;turned&nbsp;off.</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Global&nbsp;optimization&nbsp;is&nbsp;disabled.</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Sparse&nbsp;options&nbsp;disabled.</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number&nbsp;of&nbsp;cores&nbsp;reset&nbsp;to&nbsp;default:1</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Starting&nbsp;simulation&nbsp;and&nbsp;linearization...</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Declaring&nbsp;Modelica_LinearSystems2.StateSpace&nbsp;ss&nbsp;</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">System&nbsp;not&nbsp;printed&nbsp;since&nbsp;too&nbsp;large&nbsp;(only&nbsp;dimensions):</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;ss.A[52,52]</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;ss.B[52,2]</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;ss.C[1,52]</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;ss.D[1,2]</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">The&nbsp;linear&nbsp;model&nbsp;is&nbsp;in&nbsp;your&nbsp;working&nbsp;directory.</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Open&nbsp;the&nbsp;dslin.mat&nbsp;file&nbsp;following&nbsp;the&nbsp;instructions&nbsp;in&nbsp;the&nbsp;documentation.</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">You&nbsp;can&nbsp;also&nbsp;analyze&nbsp;the&nbsp;linear&nbsp;model&nbsp;using&nbsp;Dymola,&nbsp;for&nbsp;example&nbsp;typing&nbsp;in&nbsp;the&nbsp;commands&nbsp;window</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;Modelica_LinearSystems2.StateSpace.Plot.polesAndZeros(ss,&nbsp;zeros=false,&nbsp;print=true);</span></p>
<p style=\"margin-left: 60px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;will&nbsp;give&nbsp;you&nbsp;the&nbsp;polte&nbsp;plot&nbsp;shown&nbsp;in&nbsp;the&nbsp;Simulation&nbsp;tab&nbsp;and&nbsp;printed&nbsp;below.</span></p>
<p style=\"margin-left: 60px;\"><br><span style=\"font-family: Arial; font-size: 10pt;\">Eigenvalues</span></p>
<table cellspacing=\"1\" cellpadding=\"3\" border=\"0\"><tr>
<td style=\"background-color: #e6e6e6\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #e6e6e6;\">number </span></p></td>
<td style=\"background-color: #e6e6e6\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #e6e6e6;\">eigenvalue</span></p></td>
<td style=\"background-color: #e6e6e6\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #e6e6e6;\">time constant [s] </span></p></td>
<td style=\"background-color: #e6e6e6\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #e6e6e6;\">freq. [Hz] </span></p></td>
<td style=\"background-color: #e6e6e6\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #e6e6e6;\">damping </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -9.6302e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0104 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 2 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.6638e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0273 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 3 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.5158e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0284 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 4 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.2041e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0312 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 5 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.0284e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0330 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 6 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -8.8114e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.1135 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 7 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.9847e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3350 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 8 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6309e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3801 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 9 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6309e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3801 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 10 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6309e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3801 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 11 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6309e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3801 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 12 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6845e-01 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 3.7251 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 13 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.0210e-01 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 4.9480 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 14 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0045e-01 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 9.9550 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 15 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 16 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 17 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 18 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 19 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 20 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 21 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 22 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 23 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 24 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 25 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 26 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.3147e-11 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 43201899570.2696 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 27/28 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -5.4079e-01 &plusmn; 5.7943e-01j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.1261 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.6823 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 29/30 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -8.0667e-01 &plusmn; 6.7953e-01j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.1679 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.7648 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 31/32 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0771e+00 &plusmn; 7.9290e-01j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.2129 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.8053 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 33/34 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -6.1592e+00 &plusmn; 1.3658e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1.0041 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.9763 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 35/36 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.5516e+01 &plusmn; 1.7019e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 5.6591 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.9989 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 37/38 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.7143e+01 &plusmn; 1.7900e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 4.3294 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.9978 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 39/40 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -7.7748e+00 &plusmn; 2.2977e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1.2903 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.9590 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 41/42 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -8.9136e-01 &plusmn; 2.3424e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3989 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3556 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 43/44 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.0278e+00 &plusmn; 3.2527e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.6100 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.5290 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 45/46 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -5.9884e-01 &plusmn; 4.3219e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.6944 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.1372 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 47/48 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -4.5810e-01 &plusmn; 7.7372e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1.2336 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0591 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 49/50 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.2689e-01 &plusmn; 1.2572e+01j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 2.0016 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0260 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 51/52 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.9334e+01 &plusmn; 1.5400e+01j </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 3.9339 </span></p></td>
<td style=\"background-color: #ffffff\"><p style=\"margin-left: 60px;\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.7822 </span></p></td>
</tr>
</table>
<p><br>The following pole plot is generated in the Simulation tab:</p>
<p><img src=\"modelica://Example2/Resources/linearize_KchangeLinRamping.png\"/> </p><p><b>Post-processing in MATLAB:</b> </p>
<p>The obtained linear model can be used in any other environment. The linear model is available in the file, <span style=\"font-family: Courier New;\">dslin.mat</span>, that will appear under your Dymola working directory. It can be loaded in MATLAB using the function:</p>
<p><span style=\"font-family: Courier New;\">[A,B,C,D,xName,uName,yName] = tloadlin(&apos;dslin.mat&apos;)</span></p>
<p>To use this function, add to the MATLAB workspace the directory and sub-directories under: <span style=\"font-family: Courier New;\">C:\\Program Files\\Dymola 2024x\\Mfiles</span> </p>
</html>"));
end linearize_KchangeLinRamping;
