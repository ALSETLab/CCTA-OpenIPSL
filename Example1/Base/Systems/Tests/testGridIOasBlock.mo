within Example1.Base.Systems.Tests;
model testGridIOasBlock "Test the gridIO model"
  extends Modelica.Icons.Example;
  gridIO grid(
    t1=7.5,
    t2=Modelica.Constants.inf,
    t1fault=0.5,
    t2fault=0.57)
    annotation (Placement(transformation(extent={{-20,-18},{20,22}})));
  Modelica.Blocks.Sources.Pulse    pulse(
    amplitude=1,
    width=50,
    period=0.1,
    nperiod=1,
    startTime=20)
    annotation (Placement(transformation(extent={{-58,-16},{-38,4}})));
  Modelica.Blocks.Sources.RealExpression zero
    annotation (Placement(transformation(extent={{-58,8},{-38,28}})));
equation
  connect(pulse.y, grid.uPload) annotation (Line(points={{-37,-6},{-30,-6},{-30,
          -4},{-22,-4}}, color={0,0,127}));
  connect(zero.y, grid.uPSS) annotation (Line(points={{-37,18},{-30,18},{-30,20},
          {-22,20}}, color={0,0,127}));
  connect(grid.uPm, zero.y) annotation (Line(points={{-22.2,8},{-32,8},{-32,18},
          {-37,18}}, color={0,0,127}));
  connect(grid.uvs, zero.y) annotation (Line(points={{-22,-16},{-32,-16},{-32,
          18},{-37,18}}, color={0,0,127}));
  annotation (experiment(StopTime=30, __Dymola_Algorithm="Dassl"));
end testGridIOasBlock;
