within Example1.Base.Systems;
model testGridIOasBlock "Test the gridIO model"
  extends Modelica.Icons.Example;
  gridIO grid annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Pulse    pulse(
    amplitude=0.01,
    width=50,
    period=0.1,
    nperiod=1,
    startTime=5)
    annotation (Placement(transformation(extent={{-58,-18},{-38,2}})));
  Modelica.Blocks.Sources.RealExpression zero
    annotation (Placement(transformation(extent={{-58,6},{-38,26}})));
equation
  connect(pulse.y, grid.uPload)
    annotation (Line(points={{-37,-8},{-36,-6},{-22,-6}}, color={0,0,127}));
  connect(zero.y, grid.uPSS)
    annotation (Line(points={{-37,16},{-36,18},{-22,18}}, color={0,0,127}));
  connect(grid.uPm, zero.y) annotation (Line(points={{-22.2,6},{-32,6},{-32,18},
          {-37,16}}, color={0,0,127}));
  connect(grid.uvs, zero.y) annotation (Line(points={{-22,-18},{-32,-18},{-32,
          18},{-37,16}}, color={0,0,127}));
  annotation (experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end testGridIOasBlock;
