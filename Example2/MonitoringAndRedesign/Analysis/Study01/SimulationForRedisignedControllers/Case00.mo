within Example2.MonitoringAndRedesign.Analysis.Study01.SimulationForRedisignedControllers;
model Case00
  extends BaseInputs(redeclare ParametrizedRedisgnedControllers.Case0
      nonlinModel(t1=0.1));
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-116,-184},{-96,-164}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
                   preferredView="diagram");
end Case00;
