within Example2.CustomComponents.TestCustomComponents;
model TestInputDataAandB
  "Tests the input data blocks \"InputDataA\" and \"InputDataB\""
  extends Modelica.Icons.Example;
  InputDataA inputDataA
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  InputDataB inputDataB
    annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
  Modelica.Blocks.Interfaces.RealOutput yA[1]
    "Connector of Real output signals"
    annotation (Placement(transformation(extent={{10,20},{30,40}})));
  Modelica.Blocks.Interfaces.RealOutput yB[1]
    "Connector of Real output signals"
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
equation
  connect(inputDataA.y, yA)
    annotation (Line(points={{-19,30},{20,30}}, color={0,0,127}));
  connect(inputDataB.y, yB)
    annotation (Line(points={{-19,-30},{30,-30}}, color={0,0,127}));
annotation(experiment(
      StopTime=1320),preferredView="diagram");
end TestInputDataAandB;
