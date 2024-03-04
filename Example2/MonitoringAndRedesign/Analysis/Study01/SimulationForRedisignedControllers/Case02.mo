within Example2.MonitoringAndRedesign.Analysis.Study01.SimulationForRedisignedControllers;
model Case02
  extends Base(      redeclare ParametrizedRedisgnedControllers.Case2
      nonlinModel(t1=0.1));
    extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-116,-184},{-96,-164}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
           preferredView="diagram");
end Case02;
