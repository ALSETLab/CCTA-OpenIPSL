within Example1.Base.Systems.Tests;
model testGridIOsiso "Test the gridIOsiso model"
  extends Modelica.Icons.Example;
  gridIOsiso
         grid
    annotation (Placement(transformation(extent={{-20,-18},{20,22}})));
  Modelica.Blocks.Sources.Pulse    pulse(
    amplitude=1,
    width=50,
    period=0.1,
    nperiod=1,
    startTime=20)
    annotation (Placement(transformation(extent={{-58,-16},{-38,4}})));
equation
  connect(pulse.y, grid.uvs) annotation (Line(points={{-37,-6},{-30,-6},{-30,
          -1.6},{-24,-1.6}}, color={0,0,127}));
  annotation (experiment(StopTime=30, __Dymola_Algorithm="Dassl"));
end testGridIOsiso;
