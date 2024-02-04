within Example2.MonitoringAndRedesign.Analysis.Study01.SimulationForRedisignedControllers;
model Case00
  extends BaseInputs(redeclare Study01.LinearizationForRedisgnedControllers.Case0 nonlinModel(t1=0.1));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-116,-184},{-96,-164}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Case00;
