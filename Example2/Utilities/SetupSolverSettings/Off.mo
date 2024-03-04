within Example2.Utilities.SetupSolverSettings;
function Off "Turns off DAE Mode"
  extends Modelica.Icons.Function;
algorithm
  Advanced.Define.DAEsolver := false;
  Modelica.Utilities.Streams.print("DAE Mode is turned off.");
  Advanced.Define.GlobalOptimizations :=0;
  Modelica.Utilities.Streams.print("Global optimization is disabled.");
  Advanced.SparseActivate :=false;
  Advanced.Translation.SparseActivateIntegrator :=false;
  Advanced.Translation.SparseActivateSystems :=false;
  Modelica.Utilities.Streams.print("Sparse options disabled.");
end Off;
