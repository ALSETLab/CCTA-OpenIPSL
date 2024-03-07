within Example2.Analysis.AutomationFunctions;
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

end linearize_KchangeLinRamping;
