within Example2.MonitoringAndRedesign.Analysis.CustomComponents;
function storeforinitial
  extends Modelica.Icons.Function;
  input String dsName="dsin.txt" "file name to assign to dsName in exportInitial";
  input String scriptName="scriptInitial.mo" "script name to assgine to scriptName in exportInitial";
algorithm
    Modelica.Utilities.Streams.print("Saving file for initialization at given snapshot.");
    DymolaCommands.SimulatorAPI.exportInitial(dsName,scriptName);
end storeforinitial;
