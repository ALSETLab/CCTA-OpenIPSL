within Example2.Utilities.SetupSolverSettings;
function On "Turns on DAE Mode"
  extends Modelica.Icons.Function;
algorithm
  Advanced.Define.DAEsolver := true;
  Modelica.Utilities.Streams.print("DAE Mode is turned on.");
  Advanced.Define.GlobalOptimizations :=2;
  Modelica.Utilities.Streams.print("Global optimization is enabled.");
  Advanced.SparseActivate :=true;
  Advanced.Translation.SparseActivateIntegrator :=true;
  Advanced.Translation.SparseActivateSystems :=true;
  Advanced.SparseMaximumDensity := 25;
  Advanced.SparseMinimumStates := 50;
  Modelica.Utilities.Streams.print("Sparse options enabled.");
  Advanced.NumberOfCores := 12;
end On;
