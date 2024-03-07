within Example2.CustomComponents.TestCustomComponents;
model TestTimedInputAandB
  "Tests the \"TimedInputInjection\" block"
  extends Modelica.Icons.Example;
  TimedInputInjectionA timedInputInjectionA
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  TimedInputInjectionB timedInputInjectionB
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Blocks.Interfaces.RealOutput yA "Connector of Real output signal"
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Blocks.Interfaces.RealOutput yB "Connector of Real output signal"
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
equation
  connect(timedInputInjectionA.y, yA)
    annotation (Line(points={{1,10},{30,10}}, color={0,0,127}));
  connect(timedInputInjectionB.y, yB)
    annotation (Line(points={{1,-30},{30,-30}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)),
      Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=1320),preferredView="diagram");
end TestTimedInputAandB;
