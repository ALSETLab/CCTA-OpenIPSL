within Example2.MonitoringAndRedesign.Analysis.CustomComponents;
model TestTimedInput
  extends Modelica.Icons.Example;
  Example2.MonitoringAndRedesign.Analysis.CustomComponents.TimedInputInjection timedInputInjection
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
      Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=1320,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestTimedInput;
