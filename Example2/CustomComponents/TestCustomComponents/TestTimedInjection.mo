within Example2.CustomComponents.TestCustomComponents;
model TestTimedInjection
  "Tests the \"TimedInjection\" block"
  extends Modelica.Icons.Example;
  TimedInjection                  timedInjection(timedinjection_threshold=60)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Sine sine(amplitude=1, f=1) annotation (Placement(transformation(extent={{-60,-10},
            {-40,10}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(sine.y, timedInjection.u)
    annotation (Line(points={{-39,0},{-22.8,0}}, color={0,0,127}));
  connect(timedInjection.y, y)
    annotation (Line(points={{23.2,0},{50,0}}, color={0,0,127}));
annotation(preferredView="diagram",experiment(StopTime=120));
end TestTimedInjection;
