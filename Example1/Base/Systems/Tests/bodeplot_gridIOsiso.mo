within Example1.Base.Systems.Tests;
function bodeplot_gridIOsiso
  "Produces the Bode plot for the \"grdIOsiso\" model"
  extends Modelica.Icons.Function;
  input Modelica.Units.SI.Time tlin = 30;
algorithm

  // turn off flags to avoid issues in the generated linear model
  Modelica.Utilities.Streams.print("Setting up things...");
  Example2.Utilities.SetupSolverSettings.Off();
  Advanced.SparseActivate :=false;
  Advanced.Translation.SparseActivateIntegrator :=false;
  Advanced.Translation.SparseActivateSystems :=false;
  OutputCPUtime :=false; // disable cpu time output so it doesn't screw up the sizes of the outputs

  // linearize and plot
  Modelica_LinearSystems2.ModelAnalysis.TransferFunctions(
  "Example1.Base.Systems.gridIOsiso", simulationSetup=
  Modelica_LinearSystems2.Records.SimulationOptionsForLinearization(
  linearizeAtInitial=false,
  t_linearize=tlin));
end bodeplot_gridIOsiso;
