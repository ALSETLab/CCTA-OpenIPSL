within Example2.CustomComponents.TestCustomComponents;
model TestTimedInputInjectionOnOffTableData
  "Tests the \"TimedInputInjectionOnOffTableData\" block"
  extends Modelica.Icons.Example;
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{18,-10},{38,10}})));
  TimedInjectionOnOffTableData timedInjectionOnOffTableData
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
equation
  connect(timedInjectionOnOffTableData.y, y)
    annotation (Line(points={{1.6,0},{28,0}}, color={0,0,127}));
  annotation (experiment(StopTime=90),preferredView="diagram");
end TestTimedInputInjectionOnOffTableData;
