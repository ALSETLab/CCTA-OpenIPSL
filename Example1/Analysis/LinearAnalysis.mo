within Example1.Analysis;
package LinearAnalysis
  "Shows how to linearize the model, simulate the obtained linear model and compare it against the nonlinear model's response."

  package CustomFunctions
    "Custom functions for automated analysis, including linearization and simulation, and their comparison"
    extends Modelica.Icons.FunctionsPackage;
    function LinearizeSimple
      "Linearize the model at any point in time tlin"
      // Import things needed for the calculations
      import Modelica_LinearSystems2.StateSpace; // to create and manipulate state space objects
      // Declare outputs to display
      output Real A[:,:] "A-matrix";
      output Real B[:,:] "B-matrix";
      output Real C[:,:] "C-matrix";
      output Real D[:,:] "D-matrix";
      output String inputNames[:] "Modelica names of inputs";
      output String outputNames[:] "Modelica names of outputs";
      output String stateNames[:] "Modelica names of states";
      // Declare reconfigurable inputs
      input Modelica.Units.SI.Time tlin=40 "t for model linearization";
      input Modelica.Units.SI.Time tsim=40 "Simulation time";
      input String pathToNonlinearPlantModel = "Example1.Analysis.LinearAnalysis.NonlinModel_for_Linearization" "Nonlinear model for linearization";
      input String pathToNonlinearExperiment = "Example1.Analysis.LinearAnalysis.NonlinModel_for_NonlinExperiment" "Nonlinear Model for simulation";
    algorithm
      // Make sure DAE mode is off!
      Advanced.Define.DAEsolver := false;
      Modelica.Utilities.Streams.print("DAE Mode is turned off.");
      Advanced.Define.GlobalOptimizations :=0;
      Modelica.Utilities.Streams.print("Global optimization is disabled.");
      Advanced.SparseActivate :=false;
      Advanced.Translation.SparseActivateIntegrator :=false;
      Advanced.Translation.SparseActivateSystems :=false;
      Modelica.Utilities.Streams.print("Sparse options disabled.");
      OutputCPUtime :=false; // disable cpu time output so it doesn't scre up the sizes of the outputs
      // Start the linearization process
      Modelica.Utilities.Streams.print("Linearization and Nonlinear Model Comparison is starting...");
      // Compute and display the ABCD matrices, etc
      Modelica.Utilities.Streams.print("Linearized Model");
      (A,B,C,D,inputNames,outputNames,stateNames) :=
        Modelica_LinearSystems2.Utilities.Import.linearize(
        pathToNonlinearPlantModel,tlin);
      nx := size(A, 1); //number of states
      Modelica.Utilities.Streams.print("Number of states: " + String(nx));
      // Now we want to extract the initial value of the outputs to use it in our
      // linear model response
      Modelica.Utilities.Streams.print("Simulating nonlinear model");
      simulateModel(
        pathToNonlinearExperiment,
        stopTime=tsim,
        numberOfIntervals=1000, tolerance = 1e-6,
        resultFile="res_nl");
       ylen :=DymolaCommands.Trajectories.readTrajectorySize("res_nl.mat");
       ny := size(C, 1);
       y0 := DymolaCommands.Trajectories.readTrajectory(
         "res_nl.mat",
         {outputNames[i] for i in 1:ny},
         DymolaCommands.Trajectories.readTrajectorySize("res_nl.mat"));
       DataFiles.writeMATmatrix(
         "MyData.mat",
         "y0",
         [y0[1:ny,ylen]],
         append=true);
      // Print y0's last values which is needed for the linear response model
      y0out := y0[:,ylen]; // we only want the last few elements
      Modelica.Utilities.Streams.print("y0 = ");
      Modelica.Math.Vectors.toString(y0out,name="y0 = ",significantDigits=24);
      annotation(__Dymola_interactive=true, Documentation(info="<html>
<p>This function linearizes the non-linear model at any point in time specified by the user. </p>
<p>The results are displayed in the Commands Window.</p>
<p>The obtained linear model can be used in any other environment. The linear model is available in the file, <span style=\"font-family: Courier New;\">dslin.mat</span>, that will appear under your Dymola working directory. It can be loaded in MATLAB using the Dymola function:</p>
<p><span style=\"font-family: Courier New;\">[A,B,C,D,xName,uName,yName] = tloadlin(&apos;dslin.mat&apos;)</span></p>
<p>Add to the MATLAB workspace the directory and sub-directories under: <span style=\"font-family: Courier New;\">C:\\Program Files\\Dymola 2024x\\Mfiles</span></p>
<p>In addition, the file <span style=\"font-family: Courier New;\">MyData.mat</span> contains the <span style=\"font-family: Courier New;\">y0</span> vector, which corresponds to the output vector at the point in time where linearization is performed. </p>
<p><i><b><span style=\"font-family: Arial;\">Usage</span></b></i></p>
<ol>
<li><span style=\"font-family: Arial;\">In the Package Browser, right click on the function and select &quot;Call function...&quot;. This will open the function&apos;s window.</span></li>
<p><img src=\"modelica://Example1/Resources/Images/linsimple (Small).png\"/></p>
<li><span style=\"font-family: Arial;\">Leave the default parameters on first use. Alternatively, modify the tlin and tsim parameters, note that tsim should be greater or equal to tlin.</span></li>
<li><span style=\"font-family: Arial;\">Go to the bottom of the window and click on &quot;Execute&quot;, if successful, messages/results are displayed in the command window.</span></li>
<li><span style=\"font-family: Arial;\">Go back to the function&apos;s own window and click on &quot;Close&quot;.</span> </li>
</ol>
<p><br><i><b>Sample Output</b></i></p>
<p>Executing the function gives the following results in the &quot;Commands&quot; window.</p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Example1.Analysis.LinearAnalysis.CustomFunctions.LinearizeSimple();</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">DAE&nbsp;Mode&nbsp;is&nbsp;turned&nbsp;off.</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Global&nbsp;optimization&nbsp;is&nbsp;disabled.</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Sparse&nbsp;options&nbsp;disabled.</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Linearization&nbsp;and&nbsp;Nonlinear&nbsp;Model&nbsp;Comparison&nbsp;is&nbsp;starting...</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Linearized&nbsp;Model</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Number&nbsp;of&nbsp;states:&nbsp;12</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Simulating&nbsp;nonlinear&nbsp;model</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;true</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Redeclaring&nbsp;variable:&nbsp;Real&nbsp;y0&nbsp;[7,&nbsp;1012];</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;true</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Declaring&nbsp;variable:&nbsp;Real&nbsp;y0out&nbsp;[7];</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">y0&nbsp;=&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;&quot;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">y0&nbsp;=&nbsp;&nbsp;=&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.000024318695068359375&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.196186602115631103515625&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.900009691715240478515625&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.28431034088134765625&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.50904435006304993294179e-07&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.120034694671630859375&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&quot;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">[0.0,&nbsp;376.9911183891212,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">-0.17610876763748942,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;-0.19586150145880193,&nbsp;0.05515410219837237,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">-0.25587785362300375,&nbsp;0.0,&nbsp;-0.12499999997574654,&nbsp;0.0,&nbsp;-0.2667630481888344,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-0.001159492170868593,&nbsp;0.0,&nbsp;0.0,&nbsp;0.12499999999488744,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.4265899899207167,&nbsp;0.0,&nbsp;0.0,&nbsp;-1.0000000000939857,&nbsp;0.007883244407403102,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-1.4901043751184482,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">-3.3690289136967633,&nbsp;0.0,&nbsp;33.3333333351218,&nbsp;0.0,&nbsp;-36.84568272027127,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-0.015266513308270566,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">2.4254614215865864,&nbsp;0.0,&nbsp;0.0,&nbsp;14.285714287056937,&nbsp;0.04482173884230768,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-22.75799624545071,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">-8.934890956417721,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;29.303251383490004,&nbsp;33.12307890942945,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-66.66666667217629,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;-1.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;18999999.999786172,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;-2000000.0001652886,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;10000.00082740371,&nbsp;-9999.999999590995,&nbsp;0.0,&nbsp;0.0,&nbsp;-18999999.99980534;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.009499999999893087,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;-0.001,&nbsp;0.0,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-0.009499999999902671;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.009499999999893087,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;-0.001,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-0.009499999999902671;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.7092198580776662,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-0.7092198581570424],&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">[0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.14285715467719584,&nbsp;-0.03160725649463204,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;-0.04042882695287631,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.10093337277083947,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;-0.532308225276168,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.5738762639698587,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;-1.0247506547026812,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">19000001.57206705,&nbsp;0.0,&nbsp;0.0,&nbsp;2000000.1654807418;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.009500000786033523,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.009500000786033523,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.7092199168371426,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0],&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">[-0.13402336434626583,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.43954877075235005,&nbsp;0.4968461836414418,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.3043068141629995,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;1.4537261850177308,&nbsp;0.7665888604391177,&nbsp;0.0,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">1.2253264601006595,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;1.3643245623264468,&nbsp;-0.38254244268485077,&nbsp;0.0,</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.9999999998895094,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">1.0000000001010991,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;9.499999999893086,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-9.49999999990267;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.9999999999590995,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0],&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">[0.0,&nbsp;0.0,&nbsp;-0.015371259820540216,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.02120334463562301,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.21999579935538804,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">9.500000786033524,&nbsp;0.0,&nbsp;0.0,&nbsp;1.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0],&nbsp;{&quot;uPSS&quot;,&nbsp;&quot;uPm&quot;,&nbsp;&quot;uPload&quot;,&nbsp;&quot;uvsAVR&quot;},&nbsp;{&quot;Vt&quot;,&nbsp;&quot;Q&quot;,&nbsp;&quot;P&quot;,&nbsp;&quot;w&quot;,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&quot;delta&quot;,&nbsp;&quot;AVRin&quot;,&nbsp;&quot;AVRout&quot;},&nbsp;{&quot;Plant.G1.machine.delta&quot;,&nbsp;&quot;Plant.G1.machine.w&quot;,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&quot;Plant.G1.machine.e1q&quot;,&nbsp;&quot;Plant.G1.machine.e1d&quot;,&nbsp;&quot;Plant.G1.machine.e2q&quot;,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&quot;Plant.G1.machine.e2d&quot;,&nbsp;&quot;Plant.G1.avr.vm&quot;,&nbsp;&quot;Plant.G1.avr.vr&quot;,&nbsp;&quot;Plant.G1.avr.vf1&quot;,</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&quot;Plant.G1.pss.imLeadLag.TF.x_scaled[1]&quot;,&nbsp;&quot;Plant.G1.pss.imLeadLag1.TF.x_scaled[1]&quot;,</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&quot;Plant.G1.pss.derivativeLag.TF.x_scaled[1]&quot;}</span></p>
</html>"),    preferredView = "info");
    end LinearizeSimple;

    function LinearizeAndCompare
      "Linearize the model, simulate the linear model obtained and compare with the nonlinear model response."
      // See the Documentation for an explanation of the goals.
      // IMPORTING FUNCTIONS
      // Import things needed for the calculations
      import Modelica_LinearSystems2.StateSpace; // to create and manipulate state space objects
      // OUTPUTS OF THEFUNCTION - FOR DISPLAY
      // Declare outputs to display
      output Real A[:,:] "A-matrix";
      output Real B[:,:] "B-matrix";
      output Real C[:,:] "C-matrix";
      output Real D[:,:] "D-matrix";
      output String inputNames[:] "Modelica names of inputs";
      output String outputNames[:] "Modelica names of outputs";
      output String stateNames[:] "Modelica names of states";
      output Real y0out[:] "Initial value of the output variables";
      // INPUTS TO THE FUNCTION
      // Declare reconfigurable simulation parameters
      input Modelica.Units.SI.Time tlin=30.5 "t for model linearization";
      input Modelica.Units.SI.Time tsim=40 "Simulation time";
      input Real numberOfIntervalsin=10000 "No. of intervals";
      input String methodin = "DASSL" "Solver";
      input Real fixedstepsizein= 1e-6 "Time step - needed only for fixed time step solvers";
      //
      // DEFINING THE NONLINEAR PLANT, NONLINEAR EXPERIMENT, AND LINEAR EXPERIMENT MODELS
      //
      // 1) NONLINEAR PLANT:
      // This is the model that will be linearized, i.e. the nonlinear plant model
       input String pathToNonlinearPlantModel = "Example1.Analysis.LinearAnalysis.NonlinModel_for_Linearization" "Nonlinear plant model";
      //
      //
      // 2) NONLINEAR EXPERIMENT: this is a model which applies a change to the input of the nonlinear model.
      // It must match the nonlinar plant above.
      // This model will be simulated, and the simulation results will be compared to the simulation of the corresponding linearized model.
      input String pathToNonlinearExperiment= "Example1.Analysis.LinearAnalysis.NonlinModel_for_NonlinExperiment" "Nonlinear experiment model";
      //
      //
      // 3) LINEAR EXPERIMENT: this is a template that can be used for all three cases, so it is not necessary to create other cases here
      input String pathToLinearExperiment = "Example1.Analysis.LinearAnalysis.LinearModelGeneral" "Linear model for simulation";

    algorithm
      // Make sure DAE mode is off!
      Advanced.Define.DAEsolver := false;
      Modelica.Utilities.Streams.print("DAE Mode is turned off.");
      Advanced.Define.GlobalOptimizations :=0;
      Modelica.Utilities.Streams.print("Global optimization is disabled.");
      Advanced.SparseActivate :=false;
      Advanced.Translation.SparseActivateIntegrator :=false;
      Advanced.Translation.SparseActivateSystems :=false;
      Modelica.Utilities.Streams.print("Sparse options disabled.");
      OutputCPUtime :=false; // disable cpu time output so it doesn't scre up the sizes of the outputs
      // Start the linearization process
      Modelica.Utilities.Streams.print("Linearization and Nonlinear Model Comparison is starting...");
      // Compute and display the ABCD matrices, etc
      (A,B,C,D,inputNames,outputNames,stateNames) :=
        Modelica_LinearSystems2.Utilities.Import.linearize(
        pathToNonlinearPlantModel,tlin);
      // LINEARIZE plant model at t_lin
      // This is the same as above, however, it stores it in a StateSpace object
      ss := Modelica_LinearSystems2.ModelAnalysis.Linearize(
        pathToNonlinearPlantModel, simulationSetup=
        Modelica_LinearSystems2.Records.SimulationOptionsForLinearization(
        linearizeAtInitial=false, t_linearize=tlin));
      // SAVE the data in a mat file
      DataFiles.writeMATmatrix(
        "MyData.mat",
        "ABCD",
        [ss.A, ss.B; ss.C, ss.D],
        append=false);
      nx := size(ss.A, 1);
      DataFiles.writeMATmatrix(
        "MyData.mat",
        "nx",
        [nx],
        append=true);
      Modelica.Utilities.Streams.print("Simulating nonlinear model");
      simulateModel(
        pathToNonlinearExperiment,
        stopTime=tsim,
        numberOfIntervals=numberOfIntervalsin, method = methodin, fixedstepsize=fixedstepsizein,
        resultFile="res_nl");

       simulateModel(
         pathToNonlinearExperiment,
         stopTime=tlin,
         numberOfIntervals=numberOfIntervalsin, method = methodin, fixedstepsize=fixedstepsizein,
         resultFile="res_nl_beforedist");
        ny := size(ss.C, 1);
        ylen :=DymolaCommands.Trajectories.readTrajectorySize("res_nl_beforedist.mat");
        y0 := DymolaCommands.Trajectories.readTrajectory(
          "res_nl_beforedist.mat",
          {ss.yNames[i] for i in 1:ny},
          DymolaCommands.Trajectories.readTrajectorySize("res_nl_beforedist.mat"));
        DataFiles.writeMATmatrix(
          "MyData.mat",
          "y0_beforedist",
          [y0[1:ny,ylen-100]],
          append=true);

      // Print y0's first values which is needed for the linear response model
      y0out := y0[1:ny,ylen]; // we only want the elements at ylen
      Modelica.Utilities.Streams.print("y0 before disturbance =");
      Modelica.Math.Vectors.toString(y0out);
      //
      // We now simulate the linear model, which requires y0
      Modelica.Utilities.Streams.print("Simulating linear model");
      simulateModel(
        pathToLinearExperiment,
        stopTime=tsim,
        numberOfIntervals=numberOfIntervalsin, method = methodin, fixedstepsize=fixedstepsizein,
        resultFile="res_lin");
        // Plot
    removePlots(true);
    createPlot(id=1, position={-2, 1, 584, 782}, y={"Vt"}, range={0.0, 20.0, 0.998, 1.002}, grid=true, filename="res_nl.mat", colors={{28,108,200}}, displayUnits={"1"});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"Q"}, range={0.0, 20.0, 0.18, 0.21}, grid=true, subPlot=102, colors={{28,108,200}}, displayUnits={"1"});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"P"}, range={0.0, 20.0, 0.86, 0.94}, grid=true, subPlot=103, colors={{28,108,200}}, displayUnits={"1"});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"w"}, range={0.0, 20.0, 0.9996, 1.0004}, grid=true, subPlot=104, colors={{28,108,200}}, displayUnits={"1"});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"delta"}, range={0.0, 20.0, 1.27, 1.3}, grid=true, subPlot=105, colors={{28,108,200}}, displayUnits={"rad"});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"Vt"}, range={0.0, 20.0, 0.998, 1.002}, erase=false, grid=true, filename="res_lin.mat", colors={{238,46,47}});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"Q"}, range={0.0, 20.0, 0.18, 0.21}, erase=false, grid=true, subPlot=102, colors={{238,46,47}});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"P"}, range={0.0, 20.0, 0.86, 0.94}, erase=false, grid=true, subPlot=103, colors={{238,46,47}});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"w"}, range={0.0, 20.0, 0.9996, 1.0004}, erase=false, grid=true, subPlot=104, colors={{238,46,47}});
    createPlot(id=1, position={-2, 1, 584, 782}, y={"delta"}, range={0.0, 20.0, 1.27, 1.3}, erase=false, grid=true, subPlot=105, colors={{238,46,47}});

      annotation(__Dymola_interactive=true, Documentation(info="<html>
<p>This function can linearize the model at initialization or at a user provided point in time. Once the model is linearized, linear model and the nonlinear models are simulated.</p>
<p>The response of both models is then plotted/compared to check the quality of the linear model.</p>
<p>The function uses the following models:</p>
<ul>
<li>Non-linear model for linearization: <span style=\"font-family: Courier New;\">Example1.Analysis.LinearAnalysis.NonlinModel_for_Linearization</span></li>
<li>Non-linear model for simulation: <span style=\"font-family: Courier New;\">Example1.Analysis.LinearAnalysis.NonlinModel_for_NonlinExperiment</span></li>
<li>Linear model for simualtion: <span style=\"font-family: Courier New;\">Example1.Analysis.LinearAnalysis.LinearModelGeneral</span></li>
</ul>
<p>After executing the function the results are displayed in the command window. </p>
<p><br>For post-processing, the follwing <span style=\"font-family: Courier New;\">.mat</span> files are generated with time simulation responses are produced:</p>
<ul>
<li><span style=\"font-family: Courier New;\">res_lin.mat</span>, containing the time response of the linear model obtained by linearizing the linear model for simulation.</li>
<li><span style=\"font-family: Courier New;\">res_nl.mat</span>, containing the time response of the non-linear model.</li>
<li><span style=\"font-family: Courier New;\">res_nl_beforedist.mat</span>, containing the time response of the non-linear model up to the poin in time where the model is linearized. This is used to extract the <span style=\"font-family: Courier New;\">y0</span> output vector that is used in the linear model for simulation.</li>
<li>These files can be opened in MATLAB using the <span style=\"font-family: Courier New;\">dymbrowse</span> tool. Add to the MATLAB workspace the directory and sub-directories under: <span style=\"font-family: Courier New;\">C:\\Program Files\\Dymola 2024x\\Mfiles</span>, and in the command window of MATLAB enter: <span style=\"font-family: Courier New;\">dymbrowse</span> and selected the data to plot.</li>
</ul>
<p><br>The linearized model is contained in the following .mat files:</p>
<ul>
<li><span style=\"font-family: Courier New;\">MyData.mat</span> contains the <span style=\"font-family: Courier New;\">y0</span> vector, which corresponds to the output vector at the point in time where linearization is performed.</li>
<li><span style=\"font-family: Courier New;\">dslin.mat</span> contains the linear model obtained at the specified point for lineariation.</li>
<li>The obtained linear model can be used in any other environment. The linear model is available in the file, <span style=\"font-family: Courier New;\">dslin.mat</span>. It can be loaded in MATLAB using the Dymola function <span style=\"font-family: Courier New;\">[A,B,C,D,xName,uName,yName] = tloadlin(&apos;dslin.mat&apos;)</span></li>
</ul>
<p><i><b><span style=\"font-family: Arial;\">Usage</span></b></i></p>
<ol>
<li><span style=\"font-family: Arial;\">In the Package Browser, right click on the function and select &quot;Call function...&quot;. This will open the function&apos;s window.</span></li>
<p><img src=\"modelica://Example1/Resources/Images/lincompare (Small).png\"/></p>
<li><span style=\"font-family: Arial;\">Leave the default parameters on first use. Alternatively, modify the tlin and tsim parameters, note that tsim should be greater or equal to tlin.</span></li>
<li><span style=\"font-family: Arial;\">Go to the bottom of the window and click on &quot;Execute&quot;, if successful, messages/results are displayed in the command window.</span></li>
<li><span style=\"font-family: Arial;\">Go back to the function&apos;s own window and click on &quot;Close&quot;.</span> </li>
</ol>
<p><br><i><b>Sample Output</b></i></p>
<p>Executing the function gives the following plot is produced in the &quot;Simulation&quot; window and the following results in the &quot;Commands&quot; window.</p>
<p><img src=\"modelica://Example1/Resources/Images/LinearizeAndCompare.png\"/></p>
<p style=\"margin-left: 30px;\"><br><span style=\"font-family: Courier New; font-size: 10pt;\">Example1.Analysis.LinearAnalysis.CustomFunctions.LinearizeAndCompare();</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">DAE&nbsp;Mode&nbsp;is&nbsp;turned&nbsp;off.</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Global&nbsp;optimization&nbsp;is&nbsp;disabled.</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Sparse&nbsp;options&nbsp;disabled.</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Linearization&nbsp;and&nbsp;Nonlinear&nbsp;Model&nbsp;Comparison&nbsp;is&nbsp;starting...</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;true</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;true</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Simulating&nbsp;nonlinear&nbsp;model</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;true</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;true</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;true</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">y0&nbsp;before&nbsp;disturbance&nbsp;=</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;&quot;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.998271&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.203063&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.921617&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.29897&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-3.55698e-11&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.12495&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&quot;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">Simulating&nbsp;linear&nbsp;model</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;true</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;true</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;1</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;1</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;1</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;1</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;1</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;1</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;1</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;1</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;1</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;1</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;=&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">[0.0,&nbsp;376.99111838906373,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">-0.17610876767279915,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;-0.19586150142483613,&nbsp;0.05515410219997556,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">-0.25587785359503384,&nbsp;0.0,&nbsp;-0.12500000002903436,&nbsp;0.0,&nbsp;-0.2667630481021101,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-0.001159492170902296,&nbsp;0.0,&nbsp;0.0,&nbsp;0.12500000001466172,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.42658999050935953,&nbsp;0.0,&nbsp;0.0,&nbsp;-0.9999999998908723,&nbsp;0.007883244274318683,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-1.4901043751617613,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">-3.369028913176898,&nbsp;0.0,&nbsp;33.33333333281978,&nbsp;0.0,&nbsp;-36.84568271688989,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-0.015266512953637873,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">2.425461424825778,&nbsp;0.0,&nbsp;0.0,&nbsp;14.285714284155317,&nbsp;0.0448217383657263,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-22.75799624611222,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">-8.934890939628422,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;29.303251372407868,&nbsp;33.1230788990298,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-66.66666667021094,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;-1.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;18999999.999783278,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;-2000000.0001063284,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;10000.00082740371,&nbsp;-10000.000001172937,&nbsp;0.0,&nbsp;0.0,&nbsp;-18999999.996308953;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.00949999999989164,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;-0.001,&nbsp;0.0,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-0.009499999998154478;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.00949999999989164,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;-0.001,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-0.009499999998154478;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.7092198580775582,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-0.7092198580803518],&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">[0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.14285715467719584,&nbsp;-0.03160719305331635,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;-0.040428715930573844,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.10093331725968824,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;-0.5323070687938507,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.5738766604780818,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;-1.024765457676343,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">19000001.57206705,&nbsp;0.0,&nbsp;0.0,&nbsp;2000000.1654807418;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.009500000786033523,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.009500000786033523,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.7092199168371426,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0],&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">[-0.1340233640944263,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.43954877058611797,&nbsp;0.496846183485447,&nbsp;0.0,</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.3043068137697762,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;1.4537261847736198,&nbsp;0.7665888603335728,&nbsp;0.0,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">1.2253264605206322,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;1.364324561691764,&nbsp;-0.38254244286640693,&nbsp;0.0,</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.9999999998893571,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">1.0000000001610603,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;9.499999999891639,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-9.499999998154477;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;1.0000000001172937,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0],&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">[0.0,&nbsp;0.0,&nbsp;-0.01537148186514514,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.02120284503526193,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.21999546628848066,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">9.500000786033524,&nbsp;0.0,&nbsp;0.0,&nbsp;1.0;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">0.0,&nbsp;0.0,&nbsp;0.0,&nbsp;0.0],&nbsp;{&quot;uPSS&quot;,&nbsp;&quot;uPm&quot;,&nbsp;&quot;uPload&quot;,&nbsp;&quot;uvsAVR&quot;},&nbsp;{&quot;Vt&quot;,&nbsp;&quot;Q&quot;,&nbsp;&quot;P&quot;,&nbsp;&quot;w&quot;,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&quot;delta&quot;,&nbsp;&quot;AVRin&quot;,&nbsp;&quot;AVRout&quot;},&nbsp;{&quot;Plant.G1.machine.delta&quot;,&nbsp;&quot;Plant.G1.machine.w&quot;,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&quot;Plant.G1.machine.e1q&quot;,&nbsp;&quot;Plant.G1.machine.e1d&quot;,&nbsp;&quot;Plant.G1.machine.e2q&quot;,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&quot;Plant.G1.machine.e2d&quot;,&nbsp;&quot;Plant.G1.avr.vm&quot;,&nbsp;&quot;Plant.G1.avr.vr&quot;,&nbsp;&quot;Plant.G1.avr.vf1&quot;,</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&quot;Plant.G1.pss.imLeadLag.TF.x_scaled[1]&quot;,&nbsp;&quot;Plant.G1.pss.imLeadLag1.TF.x_scaled[1]&quot;,</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;&nbsp;&quot;Plant.G1.pss.derivativeLag.TF.x_scaled[1]&quot;},&nbsp;{0.9982708096504211,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;0.20306333899497986,&nbsp;0.9216165542602539,&nbsp;1.0,&nbsp;1.2989709377288818,&nbsp;</span></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; font-size: 10pt;\">&nbsp;&nbsp;-3.5569769352150615E-11,&nbsp;2.124945878982544}</span></p>
</html>"),    preferredView="info");
    end LinearizeAndCompare;

    annotation (Documentation(info="<html>
<p>This package contains two functions for automated analysis:</p>
<ul>
<li>Simple linearization workflow: <span style=\"font-family: Courier New;\">Example1.Analysis.LinearAnalysis.CustomFunctions.LinearizeSimple</span></li>
<li>Extended linearization workflow: <span style=\"font-family: Courier New;\">Example1.Analysis.LinearAnalysis.CustomFunctions.LinearizeAndCompare</span></li>
</ul>
</html>"),  preferredView = "info");
  end CustomFunctions;

  model NonlinModel_for_Linearization "Non-linear model for linearization"
    extends Example1.Utilities.Icons.ModelForLinearization;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealInput uPSS
      annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
    Modelica.Blocks.Interfaces.RealInput uPm
      annotation (Placement(transformation(extent={{-140,2},{-100,42}}),
          iconTransformation(extent={{-140,2},{-100,42}})));
    Modelica.Blocks.Interfaces.RealInput uPload annotation (Placement(
          transformation(extent={{-140,-52},{-100,-12}}), iconTransformation(
            extent={{-140,-52},{-100,-12}})));
    Example1.Base.Systems.gridIO Plant(t1=0.5, opening=2)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));

    Modelica.Blocks.Interfaces.RealInput uvsAVR annotation (Placement(
          transformation(extent={{-140,-100},{-100,-60}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
  equation
    connect(Plant.Vt, Vt) annotation (Line(points={{42,32},{72.4286,32},{
            72.4286,80},{110,80}},  color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42,24},{86,24},{86,40},{110,
            40}},      color={0,0,127}));
    connect(Q, Plant.Q) annotation (Line(points={{110,0},{76,0},{76,16},{42,16}},
                         color={0,0,127}));
    connect(w, Plant.w) annotation (Line(points={{110,-40},{80,-40},{80,-10},{
            62,-10},{62,0},{42,0}},
                          color={0,0,127}));
    connect(delta, Plant.delta) annotation (Line(points={{110,-80},{68,-80},{68,
            -16},{42,-16}},         color={0,0,127}));
    connect(Plant.uvs, uvsAVR) annotation (Line(points={{-44,-36},{-77.5714,-36},
            {-77.5714,-80},{-120,-80}},               color={0,0,127}));
    connect(Plant.uPload, uPload) annotation (Line(points={{-44,-12},{-78.8572,
            -12},{-78.8572,-32},{-120,-32}},          color={0,0,127}));
    connect(Plant.uPm, uPm) annotation (Line(points={{-44.4,12},{-77.8572,12},{
            -77.8572,22},{-120,22}},      color={0,0,127}));
    connect(Plant.uPSS, uPSS) annotation (Line(points={{-44,36},{-76.8572,36},{
            -76.8572,80},{-120,80}},               color={0,0,127}));
    connect(Plant.AVRin, AVRin) annotation (Line(points={{42,-24},{62,-24},{62,
            -100},{110,-100}},          color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{50,-120},
            {50,-32},{42,-32}},                color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}})),                                  Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{100,
              100}}), graphics={Text(
            extent={{-100,-120},{100,-140}},
            textColor={238,46,47},
            horizontalAlignment=TextAlignment.Left,
            textString="Note: 
Click on \"Documentation\" to see the intended usage of this block.")}),
      Documentation(info="<html>
<p>This is a model is used to perform linearization using the inputs and outputs defined in the top layer.</p>
<p>In <i><b>automated analysis</b></i>, it is used by the following functions:</p>
<ul>
<li>Simple linearization workflow: <span style=\"font-family: Courier New;\">Example1.Analysis.LinearAnalysis.CustomFunctions.LinearizeSimple</span></li>
<li>Extended linearization workflow: <span style=\"font-family: Courier New;\">Example1.Analysis.LinearAnalysis.CustomFunctions.LinearizeAndCompare</span></li>
</ul>
<h4>Individual Usage:</h4>
<p>To use this model on its own to perform linearization, enter the following command in the &quot;Commands&quot; window:</p>
<p><span style=\"font-family: Courier New;\">Modelica_LinearSystems2.ModelAnalysis.Linearize(&quot;Example1.Analysis.LinearAnalysis.NonlinModel_for_Linearization&quot;);</span></p>
<p>Alternatively, right click on the model and select &quot;Simulation Model&quot;. Then go to Tools &gt; Linear Analysis &gt; Linearize and select &quot;OK&quot;.</p>
<p><br>To obtain linearizations at different power flow conditions, go to the &quot;Plant&quot; component within the model, click on the &quot;Power Flow Scenario&quot; and select the data for a different scneario.</p>
<p><br>After running the command, the results should be obtained using default settings:</p>
<p><span style=\"font-family: Courier New;\">ss.A&nbsp;=&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;376.991118389&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;-0.176108793576&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.195861482328&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0551541639775&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;-0.255877828569&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.125000000027&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.266763048065&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.0011594921127&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.125000000002&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;0.426590454939&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.99999999994&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.00788324318104&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-1.49010437572&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;-3.36902858341&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;33.3333333324&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-36.845682718&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.0152665123009&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;2.42546406571&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14.2857142849&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0448217322083&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-22.7579962497&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;-8.93488653992&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;29.3032553076&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;33.1230756059&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-66.6666666672&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;18999999.9962&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-2000000.00001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;10000.0008274&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-10000.0000002&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-18999999.9962&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.00949999999812&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.00949999999812&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.00949999999812&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.001&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.00949999999812&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.709219858078&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.709219858078&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">ss.B&nbsp;=&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uPSS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uPm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uPload&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uvsAVR</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.142857154677&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.0316071454723&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.0404287159306&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.100932817659&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.532307068794&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.573873488412&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-1.02476545768&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;18999998.0194&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2000000.16548&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps&nbsp;&nbsp;0.00949999900968&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps&nbsp;&nbsp;0.00949999900968&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps&nbsp;&nbsp;0.709219916837&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">ss.C&nbsp;=&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ma&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.av&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Plant.G1.ps</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vt&nbsp;-0.134023298099&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.439548829614&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.496846134088&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&nbsp;&nbsp;0.304306680099&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.45372599861&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.766588787789&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;P&nbsp;&nbsp;1.22532664533&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.36432443251&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.382542875478&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;w&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.99999999989&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;delta&nbsp;&nbsp;0.999999999938&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AVRin&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9.49999999812&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-9.49999999812&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AVRout&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.00000000002&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">ss.D&nbsp;=&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uPSS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uPm&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uPload&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;uvsAVR</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vt&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-0.0153714818651&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.0212035111691&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;P&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0.219995022199&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;w&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;delta&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AVRin&nbsp;&nbsp;9.49999900968&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p><span style=\"font-family: Courier New;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;AVRout&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
</html>"),  preferredView="diagram");
  end NonlinModel_for_Linearization;

  model NonlinModel_for_NonlinExperiment "Non-linear model for simulation"
    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Modelica.Blocks.Sources.Step     Ploadchange(
      height=0.1,
      offset=0,
      startTime=30.5)                                 annotation (Placement(
          transformation(extent={{-100,-26},{-80,-6}})));
    Example1.Base.Systems.gridIO Plant(t1=0.5, opening=1,
      redeclare record Bus = Example1.PFData.Data.BusData.PF_Bus_0,
      redeclare record Loads = Example1.PFData.Data.LoadData.PF_Loads_0,
      redeclare record Trafos = Example1.PFData.Data.TrafoData.PF_Trafos_0,
      redeclare record Machines =
          Example1.PFData.Data.MachineData.PF_Machines_0)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    Modelica.Blocks.Sources.Constant AVRchange(k=0)
      annotation (Placement(transformation(extent={{-100,-64},{-80,-44}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-44,36},{
            -62.8572,36},{-62.8572,46},{-79,46}}, color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-44.4,12},{-62,12},
            {-62,16},{-79,16}},         color={0,0,127}));
    connect(Plant.uPload, Ploadchange.y) annotation (Line(points={{-44,-12},{
            -62.8572,-12},{-62.8572,-16},{-79,-16}},       color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42,32},{72.4286,32},{
            72.4286,80},{110,80}},  color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42,24},{73.4286,24},{73.4286,
            40},{110,40}},         color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42,16},{76,16},{76,0},{110,0}},
                     color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42,0},{73.4286,0},{73.4286,
            -40},{110,-40}},         color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42,-16},{72.4286,-16},
            {72.4286,-80},{110,-80}},              color={0,0,127}));
    connect(AVRchange.y, Plant.uvs) annotation (Line(points={{-79,-54},{-64,-54},
            {-64,-36},{-44,-36}},           color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{62,-100},{
            62,-24},{42,-24}},       color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},
            {52,-32},{42,-32}},                color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},
              {100,100}}), graphics={Text(
            extent={{-100,-120},{100,-140}},
            textColor={238,46,47},
            horizontalAlignment=TextAlignment.Left,
            textString="Note: 
Click on \"Documentation\" to see the intended usage of this block.")}),
      experiment(
        StopTime=40),
      Documentation(info="<html>
<p>This is a model is used to perform nonlinear time-simulations by specifying a change in the inputs through sources. The default simulation is a load change modeled with a step source called <span style=\"font-family: Courier New;\">Ploadchange</span>.</p>
<p>In automated analysis, it is used by the following function: <span style=\"font-family: Courier New;\">Example1.Analysis.LinearAnalysis.CustomFunctions.LinearizeAndCompare. </span>The function will use this model and the<span style=\"font-family: Courier New;\"> Example1.Analysis.LinearAnalysis.NonlinModel_for_Linearization </span>model to automatically perform linearization, simulation and comparison of the linear and non-linear models.</p>
<p><i><b>Individual Usage:</b></i></p>
<p>To use this model on its own to perform a simulation, right click on the model and select &quot;Simulation Model&quot;. Then go to the Simulation tab and click on &quot;Simulate&quot;.</p>
</html>"),  preferredView="diagram");
  end NonlinModel_for_NonlinExperiment;

  model LinearModelGeneral
    "Generic linear model for simulation, is simulated by running the function \"LinearizeAndCompare\"."
    extends Example1.Utilities.Icons.FunctionDependentExample;
    extends Example1.Interfaces.OutputsInterfaceWEfdAndAVRout;
    // The following definitions are very important to couple the linear model
    // to the linearization of the nonlinear model and the simulation
    parameter Real[:] y0=vector(DataFiles.readMATmatrix("MyData.mat", "y0_beforedist")) annotation (Evaluate=false);
    // The following has to be imported in order to be able to interpret and manipulate the StateSpace types
    import Modelica_LinearSystems2.StateSpace;
    parameter StateSpace ss=StateSpace.Import.fromFile("MyData.mat", "ABCD");
    parameter Integer ny=size(ss.C, 1);
    inner Modelica_LinearSystems2.Controllers.SampleClock sampleClock
      annotation (Placement(transformation(extent={{60,60},{80,80}})));
    Modelica.Blocks.Routing.Multiplex4 multiplex4_2(n1=1, n2=1)
      annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
    Example1.CustomComponents.DeMultiplex7 demultiplex2_2
      annotation (Placement(transformation(extent={{48,-20},{88,20}})));
    Modelica.Blocks.Math.Add addy[ny]
      annotation (Placement(transformation(extent={{6,-10},{26,10}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-120,-10},{-100,10}})));
    Modelica.Blocks.Sources.Constant y0_initial[ny](k=y0)      annotation (
        Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=90,
          origin={0,-32})));
    Modelica_LinearSystems2.Controllers.StateSpace stateSpace(system=ss)
      annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-120,20},{-100,40}})));
    Modelica.Blocks.Sources.Step     Ploadchange(
      height=0.1,
      offset=0,
      startTime=30.5)                                 annotation (Placement(
          transformation(extent={{-120,-40},{-100,-20}})));
    Modelica.Blocks.Sources.Constant AVRchange(k=0) annotation (Placement(
          transformation(extent={{-120,-70},{-100,-50}})));
  equation
    connect(addy.y, demultiplex2_2.u)
      annotation (Line(points={{27,0},{44,0}},                 color={0,0,127}));
    connect(Pmchange.y,multiplex4_2. u2[1]) annotation (Line(points={{-99,0},
            {-92,0},{-92,3},{-78,3}},color={0,0,127}));
    connect(y0_initial.y, addy.u2)
      annotation (Line(points={{0,-21},{0,-6},{4,-6}},   color={0,0,127}));
    connect(multiplex4_2.y, stateSpace.u)
      annotation (Line(points={{-55,0},{-42,0}}, color={0,0,127}));
    connect(stateSpace.y, addy.u1)
      annotation (Line(points={{-19,0},{-8,0},{-8,6},{4,6}},
                                               color={0,0,127}));
    connect(PSSchange.y,multiplex4_2. u1[1]) annotation (Line(points={{-99,30},
            {-92,30},{-92,9},{-78,9}},         color={0,0,127}));
    connect(Ploadchange.y,multiplex4_2. u3[1]) annotation (Line(points={{-99,-30},
            {-94,-30},{-94,-3},{-78,-3}},          color={0,0,127}));
    connect(AVRchange.y, multiplex4_2.u4[1]) annotation (Line(points={{
            -99,-60},{-90,-60},{-90,-9},{-78,-9}}, color={0,0,127}));
    connect(demultiplex2_2.y1[1], Vt) annotation (Line(points={{90,18},{98,18},
            {98,160},{210,160}},
                               color={0,0,127}));
    connect(demultiplex2_2.y2[1], Q) annotation (Line(points={{90,10.8},{132,
            10.8},{132,80},{210,80}},
                                    color={0,0,127}));
    connect(P, demultiplex2_2.y3[1]) annotation (Line(points={{210,120},{120,
            120},{120,3.6},{90,3.6}},color={0,0,127}));
    connect(w, demultiplex2_2.y4[1]) annotation (Line(points={{210,0},{130,0},{
            130,-3.6},{90,-3.6}},       color={0,0,127}));
    connect(delta, demultiplex2_2.y5[1]) annotation (Line(points={{210,-80},{
            118,-80},{118,-10.8},{90,-10.8}}, color={0,0,127}));
    connect(AVRin, demultiplex2_2.y6[1]) annotation (Line(points={{210,-120},{
            106,-120},{106,-18},{90,-18}},  color={0,0,127}));
    connect(AVRout, demultiplex2_2.y7[1]) annotation (Line(points={{210,-160},{
            98,-160},{98,-23.6},{90,-23.6}},  color={0,0,127}));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,
              200}})),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-160},{200,
              160}}),                                      graphics={
          Text(
            extent={{-58,34},{-44,14}},
            lineColor={238,46,47},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={255,0,0},
            textString="du",
            fontSize=24),
          Text(
            extent={{-12,20},{-2,4}},
            lineColor={238,46,47},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={255,0,0},
            textString="dy",
            fontSize=24),
          Text(
            extent={{-38,-18},{-22,-38}},
            lineColor={238,46,47},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={255,0,0},
            textString="y0",
            fontSize=24),
          Text(
            extent={{30,20},{40,4}},
            lineColor={238,46,47},
            fillPattern=FillPattern.VerticalCylinder,
            fillColor={255,0,0},
            fontSize=24,
            textString="y"),
          Text(
            extent={{-92,90},{-12,70}},
            lineColor={85,170,255},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={28,108,200},
            horizontalAlignment=TextAlignment.Left,
            textString="Note: the addy[] and y0_initial[] blocks 
are defined with ny, where ny is 
an integer of the size of the output matrix. 
This is visible in the Text layer only."),
          Text(
            extent={{-82,-52},{78,-72}},
            lineColor={85,170,255},
            fillPattern=FillPattern.HorizontalCylinder,
            fillColor={28,108,200},
            horizontalAlignment=TextAlignment.Left,
            textString="Notice the change in the order of the outputs w.r.t. the nonlinear model.
They have to be rearranged based on the order provided by the linearization function."),
          Line(
            points={{-4,68},{24,48},{18,18}},
            color={0,0,255},
            thickness=0.5,
            arrow={Arrow.None,Arrow.Filled},
            smooth=Smooth.Bezier),   Text(
            extent={{-120,-120},{80,-140}},
            textColor={238,46,47},
            horizontalAlignment=TextAlignment.Left,
            textString="Note: 
Click on \"Documentation\" to see the intended usage of this block.
This model can only be run by excecuting the function \"LinearizeAndCompare\".")}),
      experiment(
        StopTime=15),
      Documentation(info="<html>
<p>This is a generic linear model who&apos;s </p>
<p>DO NOT try to run this model on it&apos;s own! </p>
<p>Models with this icon will not simulate on their own, instead they work together with a function that populates certain parameters in the model and perform other operations.</p>
<p><br>See the associated function to run: &quot;LinearizeAndCompare&quot;.</p>
</html>"),  preferredView="diagram");
  end LinearModelGeneral;

  package Figures
    "These models are not to be used for any purpose other than presenting figures in documentation."
    extends Modelica.Icons.InternalPackage;
    model LinearModelGeneral
      "These models are not to be used for any purpose other than presenting figures in documentation."
      extends Example1.Utilities.Icons.FunctionDependentExample;
    //  extends Example1.Interfaces.OutputsInterfaceWEfdAndAVRout;
      // The following definitions are very important to couple the linear model
      // to the linearization of the nonlinear model and the simulation
      parameter Real[:] y0=vector(DataFiles.readMATmatrix("MyData.mat", "y0_beforedist")) annotation (Evaluate=false);
      // The following has to be imported in order to be able to interpret and manipulate the StateSpace types
      import Modelica_LinearSystems2.StateSpace;
      parameter StateSpace ss=StateSpace.Import.fromFile("MyData.mat", "ABCD");
      parameter Integer ny=size(ss.C, 1);
      inner Modelica_LinearSystems2.Controllers.SampleClock sampleClock
        annotation (Placement(transformation(extent={{-40,-24},{-20,-12}})));
      Modelica.Blocks.Routing.Multiplex4 multiplex4_2(n1=1, n2=1)
        annotation (Placement(transformation(extent={{-76,-8},{-56,12}})));
      Example1.CustomComponents.DeMultiplex7 demultiplex2_7
        annotation (Placement(transformation(extent={{30,-24},{70,16}})));
      Modelica.Blocks.Math.Add addy[ny]
        annotation (Placement(transformation(extent={{-4,-14},{16,6}})));
      Modelica.Blocks.Sources.Constant y0_initial[ny](k=y0)      annotation (
          Placement(transformation(
            extent={{-5,-5},{5,5}},
            rotation=90,
            origin={-9,-29})));
      Modelica_LinearSystems2.Controllers.StateSpace stateSpace(system=ss)
        annotation (Placement(transformation(extent={{-40,-8},{-20,12}})));
      Modelica.Blocks.Sources.RealExpression
                                       PSSchange
        annotation (Placement(transformation(extent={{-120,6},{-100,26}})));
      Modelica.Blocks.Sources.RealExpression
                                       Pmchange
        annotation (Placement(transformation(extent={{-120,-8},{-100,12}})));
      Modelica.Blocks.Sources.Step     Ploadchange(
        height=0.1,
        offset=0,
        startTime=30.5)                                 annotation (Placement(
            transformation(extent={{-120,-28},{-100,-8}})));
      Modelica.Blocks.Sources.RealExpression
                                       AVRchange      annotation (Placement(
            transformation(extent={{-120,-54},{-100,-34}})));
    equation
      connect(addy.y,demultiplex2_7. u)
        annotation (Line(points={{17,-4},{26,-4}},               color={0,0,127}));
      connect(Pmchange.y,multiplex4_2. u2[1]) annotation (Line(points={{-99,2},
              {-92,2},{-92,5},{-78,5}},color={0,0,127}));
      connect(y0_initial.y, addy.u2)
        annotation (Line(points={{-9,-23.5},{-9,-10},{-6,-10}},
                                                           color={0,0,127}));
      connect(multiplex4_2.y, stateSpace.u)
        annotation (Line(points={{-55,2},{-42,2}}, color={0,0,127}));
      connect(stateSpace.y, addy.u1)
        annotation (Line(points={{-19,2},{-6,2}},color={0,0,127}));
      connect(PSSchange.y,multiplex4_2. u1[1]) annotation (Line(points={{-99,16},
              {-86,16},{-86,11},{-78,11}},       color={0,0,127}));
      connect(Ploadchange.y,multiplex4_2. u3[1]) annotation (Line(points={{-99,-18},
              {-94,-18},{-94,-1},{-78,-1}},          color={0,0,127}));
      connect(AVRchange.y, multiplex4_2.u4[1]) annotation (Line(points={{-99,-44},
              {-90,-44},{-90,-7},{-78,-7}},          color={0,0,127}));
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,200}})),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-125,-50},
                {100,30}}),                                  graphics={
            Text(
              extent={{-60,22},{-40,2}},
              lineColor={238,46,47},
              fillPattern=FillPattern.VerticalCylinder,
              fillColor={255,0,0},
              fontSize=24,
              textString="du"),
            Text(
              extent={{-20,22},{0,2}},
              lineColor={238,46,47},
              fillPattern=FillPattern.VerticalCylinder,
              fillColor={255,0,0},
              textString="dy",
              fontSize=24),
            Text(
              extent={{-18,-26},{-2,-46}},
              lineColor={238,46,47},
              fillPattern=FillPattern.VerticalCylinder,
              fillColor={255,0,0},
              textString="y0",
              fontSize=24),
            Text(
              extent={{12,22},{32,2}},
              lineColor={238,46,47},
              fillPattern=FillPattern.VerticalCylinder,
              fillColor={255,0,0},
              fontSize=24,
              textString="y"),
            Text(
              extent={{76,18},{96,10}},
              textColor={0,0,127},
              textString="Vt",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{76,10},{96,2}},
              textColor={0,0,127},
              textString="Q",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{76,2},{96,-6}},
              textColor={0,0,127},
              textString="P",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{76,-4},{96,-12}},
              textColor={0,0,127},
              textString="w",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{76,-10},{96,-18}},
              textColor={0,0,127},
              textString="delta",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{76,-18},{96,-26}},
              textColor={0,0,127},
              textString="AVRin",
              horizontalAlignment=TextAlignment.Left),
            Text(
              extent={{76,-24},{96,-32}},
              textColor={0,0,127},
              textString="AVRout",
              horizontalAlignment=TextAlignment.Left)}),
        Documentation(info="<html>
<p>Contains models whose visual appearance has been modified for documentation or publications.</p>
<p>Do not use for simulation purposes.</p>
</html>"),    preferredView="info");
    end LinearModelGeneral;
    annotation (Documentation(info="<html>
<p><span style=\"font-family: Arial;\">Contains models whose visual appearance has been modified for documentation or publications.</span></p>
<p><span style=\"font-family: Arial;\">Do not use for simulation purposes.</span></p>
</html>"),  preferredView="info");
  end Figures;
  annotation(preferredView = "info", Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,140,72},
          lineThickness=1,
          fillColor={213,255,170},
          fillPattern=FillPattern.Solid,
          radius=25),
        Text(
          lineColor={0,140,72},
          extent={{-100,-48},{100,52}},
          textString="Lin")}),
    Documentation(info="<html>
<p>To perform automated analysis the following function is provided: <span style=\"font-family: Courier New;\"><a href=\"Example1.Analysis.LinearAnalysis.CustomFunctions.LinearizeAndCompare\">LinearizeAndCompare </a></span></p>
</html>"));
end LinearAnalysis;
