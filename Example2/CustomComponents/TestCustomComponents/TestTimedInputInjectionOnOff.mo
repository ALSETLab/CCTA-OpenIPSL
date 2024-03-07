within Example2.CustomComponents.TestCustomComponents;
model TestTimedInputInjectionOnOff
  "Tests the \"TimedInputInjectionOnOff\" block"
  extends Modelica.Icons.Example;
  TimedInputInjectionOnOff timedInputInjectionOnOff(
    k=2,
    t_start=30,
    t_stop=60)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine sine(amplitude=1, f=1) annotation (Placement(transformation(extent={{-40,-10},
            {-20,10}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{18,-10},{38,10}})));
equation
  connect(timedInputInjectionOnOff.u, sine.y)
    annotation (Line(points={{-12,0},{-19,0}}, color={0,0,127}));
  connect(timedInputInjectionOnOff.y, y)
    annotation (Line(points={{11,0},{28,0}}, color={0,0,127}));
  annotation (experiment(StopTime=90),preferredView="diagram");
end TestTimedInputInjectionOnOff;
