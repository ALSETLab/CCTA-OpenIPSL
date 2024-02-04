within Example2.MonitoringAndRedesign.Base.Systems.Study01;
model TestPlantTripIO
  extends Modelica.Icons.Example;
  Study01.PlantTripIO plantTripIO annotation (Placement(transformation(extent={{4,0},{36,32}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-90,10},{-78,22}})));
equation
  connect(const.y, plantTripIO.uAVRin) annotation (Line(points={{-77.4,16},{-28,16}}, color={0,0,127}));
  connect(plantTripIO.uPSS, const.y) annotation (Line(points={{-28,25.6},{-46,25.6},{-46,16},{-77.4,16}}, color={0,0,127}));
  connect(plantTripIO.uPm, const.y) annotation (Line(points={{-27.68,35.2},{-60,35.2},{-60,16},{-77.4,16}}, color={0,0,127}));
  connect(plantTripIO.uLoad7, const.y) annotation (Line(points={{-28,6.4},{-46,6.4},{-46,16},{-77.4,16}}, color={0,0,127}));
  connect(plantTripIO.uLoad9, const.y) annotation (Line(points={{-28,-3.2},{-60,-3.2},{-60,16},{-77.4,16}}, color={0,0,127}));
  annotation (experiment(
      StopTime=360,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestPlantTripIO;
