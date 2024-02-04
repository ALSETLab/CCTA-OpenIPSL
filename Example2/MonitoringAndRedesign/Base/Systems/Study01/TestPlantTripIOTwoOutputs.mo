within Example2.MonitoringAndRedesign.Base.Systems.Study01;
model TestPlantTripIOTwoOutputs
  extends Modelica.Icons.Example;
  Study01.PlantTripIOTwoOutputs plantTripIOTwoOutputs annotation (Placement(transformation(extent={{-18,-16},{14,16}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-94,-6},{-82,6}})));
equation
  connect(const.y, plantTripIOTwoOutputs.uAVRin) annotation (Line(points={{-81.4,0},{-50,0}}, color={0,0,127}));
  connect(plantTripIOTwoOutputs.uPSS, const.y) annotation (Line(points={{-50,9.6},{-62,9.6},{-62,0},{-81.4,0}}, color={0,0,127}));
  connect(plantTripIOTwoOutputs.uLoad7, const.y) annotation (Line(points={{-50,-9.6},{-62,-9.6},{-62,0},{-81.4,0}}, color={0,0,127}));
  connect(plantTripIOTwoOutputs.uPm, const.y) annotation (Line(points={{-49.68,19.2},{-72,19.2},{-72,0},{-81.4,0}}, color={0,0,127}));
  connect(plantTripIOTwoOutputs.uLoad9, const.y) annotation (Line(points={{-50,-19.2},{-72,-19.2},{-72,0},{-81.4,0}}, color={0,0,127}));
end TestPlantTripIOTwoOutputs;
