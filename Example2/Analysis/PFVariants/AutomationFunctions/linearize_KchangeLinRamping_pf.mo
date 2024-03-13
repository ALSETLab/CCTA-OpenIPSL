within Example2.Analysis.PFVariants.AutomationFunctions;
function linearize_KchangeLinRamping_pf
  "Function to linearize the model \"KchangeLinRamping_pf\" at any point in time."
  extends Modelica.Icons.Function;
  input Real tlin = 600 "[s], time for linearization.";
  input String pathToNonlinearPlantModel = "Example2.Analysis.PFVariants.KchangeLinRamping_pf";
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
<p><img src=\"modelica://Example2/Resources/linfun_pf_kchange.png\"/></p>
<li>Enter the time for linearization, <a href=\"
Example2.Analysis.PFVariants.KchangeLinRamping_pf\">Example2.Analysis.PFVariants.KchangeLinRamping_pf</a> will be simulated until that point in time and linearized.</li>
<li>In the new function window, click on &quot;Execute&quot;, if successful, messages/results are displayed in the command window and plots will appear in Simulation tab.</li>
<li>Go back to the function&apos;s own window and click on &quot;Close&quot;. </li>
</ol>
<p><br><i><b>Sample Output:</b></i></p>
<p>Executing the function will produce the following output in the &quot;Commands&quot; window.</p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\"></p><p>Example2.Analysis.PFVariants.AutomationFunctions.linearize_KchangeLinRamping_pf();</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">Setting&nbsp;up&nbsp;things...</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">DAE&nbsp;Mode&nbsp;is&nbsp;turned&nbsp;off.</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">Global&nbsp;optimization&nbsp;is&nbsp;disabled.</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">Sparse&nbsp;options&nbsp;disabled.</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">Number&nbsp;of&nbsp;cores&nbsp;reset&nbsp;to&nbsp;default:1</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">Starting&nbsp;simulation&nbsp;and&nbsp;linearization...</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">Declaring&nbsp;Modelica_LinearSystems2.StateSpace&nbsp;ss&nbsp;</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">System&nbsp;not&nbsp;printed&nbsp;since&nbsp;too&nbsp;large&nbsp;(only&nbsp;dimensions):</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;ss.A[52,52]</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;ss.B[52,2]</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;ss.C[1,52]</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;ss.D[1,2]</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">The&nbsp;linear&nbsp;model&nbsp;is&nbsp;in&nbsp;your&nbsp;working&nbsp;directory.</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">Open&nbsp;the&nbsp;dslin.mat&nbsp;file&nbsp;following&nbsp;the&nbsp;instructions&nbsp;in&nbsp;the&nbsp;documentation.</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">You&nbsp;can&nbsp;also&nbsp;analyze&nbsp;the&nbsp;linear&nbsp;model&nbsp;using&nbsp;Dymola,&nbsp;for&nbsp;example&nbsp;typing&nbsp;in&nbsp;the&nbsp;commands&nbsp;window</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;Modelica_LinearSystems2.StateSpace.Plot.polesAndZeros(ss,&nbsp;zeros=false,&nbsp;print=true);</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;will&nbsp;give&nbsp;you&nbsp;the&nbsp;polte&nbsp;plot&nbsp;shown&nbsp;in&nbsp;the&nbsp;Simulation&nbsp;tab&nbsp;and&nbsp;printed&nbsp;below.</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">Must&nbsp;translate&nbsp;function&nbsp;Modelica_LinearSystems2.Math.Matrices.LAPACK.dgeevx_eigenValues.</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">Compilation&nbsp;of&nbsp;function&nbsp;Modelica_LinearSystems2.Math.Matrices.LAPACK.dgeevx_eigenValues&nbsp;successful.</span></p>
<p><span style=\"font-family: Courier New; font-size: 10pt;\">Finished&nbsp;</span></p>
<p style=\"margin-left: 20px;\"><br><span style=\"font-family: Arial; font-size: 10pt;\">Eigenvalues</span></p>
<table cellspacing=\"1\" cellpadding=\"3\" border=\"0\"><tr>
<td style=\"background-color: #e6e6e6\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #e6e6e6;\">number </span></p></td>
<td style=\"background-color: #e6e6e6\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #e6e6e6;\">eigenvalue</span></p></td>
<td style=\"background-color: #e6e6e6\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #e6e6e6;\">time constant [s] </span></p></td>
<td style=\"background-color: #e6e6e6\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #e6e6e6;\">freq. [Hz] </span></p></td>
<td style=\"background-color: #e6e6e6\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #e6e6e6;\">damping </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -9.6242e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0104 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 2 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.6655e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0273 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 3 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.5047e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0285 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 4 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.1561e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0317 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 5 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.0650e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0326 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 6 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.7641e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0362 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 7 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6939e+01 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0371 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 8 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -8.3670e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.1195 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 9 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.9564e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3383 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 10 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6309e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3801 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 11 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6309e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3801 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 12 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6309e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3801 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 13 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6309e+00 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3801 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 14 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.6253e-01 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 3.8090 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 15 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.0230e-01 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 4.9432 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 16 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0029e-01 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 9.9714 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 17 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 18 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 19 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 20 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 21 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 22 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 23 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 24 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 25 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 26 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 27 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.0000e-03 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1000.0000 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 28 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -2.0208e-11 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 49484936402.3992 </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 29/30 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -5.6534e-01 &plusmn; 6.0529e-01j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.1318 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.6826 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 31/32 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -7.8941e-01 &plusmn; 6.8557e-01j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.1664 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.7550 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 33/34 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.1437e+00 &plusmn; 8.2408e-01j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.2243 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.8113 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 35/36 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -6.0262e+00 &plusmn; 8.5651e-01j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.9687 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.9900 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 37/38 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -3.5830e+01 &plusmn; 1.5444e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 5.7079 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.9991 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 39/40 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -7.7495e+00 &plusmn; 2.2560e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1.2846 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.9601 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 41/42 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -9.0151e-01 &plusmn; 2.2664e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3882 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.3696 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 43/44 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.9111e+00 &plusmn; 3.2618e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.6017 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.5055 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 45/46 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -6.1276e-01 &plusmn; 4.2935e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.6903 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.1413 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 47/48 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -5.2430e-01 &plusmn; 7.7021e+00j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1.2287 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0679 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 49/50 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -4.4286e-01 &plusmn; 1.2244e+01j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 1.9500 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.0361 </span></p></td>
</tr>
<tr>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 51/52 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; -1.9317e+01 &plusmn; 1.5323e+01j </span></p></td>
<td style=\"background-color: #ffffff\"><p align=\"center\"><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; --- </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 3.9242 </span></p></td>
<td style=\"background-color: #ffffff\"><p><span style=\"font-family: Arial; font-size: 10pt; background-color: #ffffff;\">&nbsp; 0.7834 </span></p></td>
</tr>
</table>
<p><br><br>The following pole plot is generated in the Simulation tab:</p>
<p> <img src=\"modelica://Example2/Resources/linearize_KchangeLinRamping_pf.png\"/></p>
<p><b>Post-processing in MATLAB:</b> </p>
<p>The obtained linear model can be used in any other environment. The linear model is available in the file, <span style=\"font-family: Courier New;\">dslin.mat</span>, that will appear under your Dymola working directory. It can be loaded in MATLAB using the function:</p>
<p><span style=\"font-family: Courier New;\">[A,B,C,D,xName,uName,yName] = tloadlin(&apos;dslin.mat&apos;)</span></p>
<p>To use this function, add to the MATLAB workspace the directory and sub-directories under: <span style=\"font-family: Courier New;\">C:\\Program Files\\Dymola 2024x\\Mfiles</span> </p>
</html>"));
end linearize_KchangeLinRamping_pf;
