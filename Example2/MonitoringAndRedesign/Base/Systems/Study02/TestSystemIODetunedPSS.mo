within Example2.MonitoringAndRedesign.Base.Systems.Study02;
model TestSystemIODetunedPSS
  extends Modelica.Icons.Example;
  SystemIODetunedPSS plantTripIODetunedPSS(t1=60) annotation (Placement(transformation(extent={{6,-16},{38,16}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-88,-6},{-76,6}})));
equation
  connect(const.y, plantTripIODetunedPSS.uAVRin) annotation (Line(points={{-75.4,0},{-3.92,0}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.uPSS, const.y) annotation (Line(points={{-3.92,9.6},{-44,9.6},{-44,0},{-75.4,0}},   color={0,0,127}));
  connect(plantTripIODetunedPSS.uPm, const.y) annotation (Line(points={{-3.6,19.2},{-58,19.2},{-58,0},{-75.4,0}},     color={0,0,127}));
  connect(plantTripIODetunedPSS.uLoad7, const.y) annotation (Line(points={{-3.92,-9.6},{-44,-9.6},{-44,0},{-75.4,0}},
                                                                                                                    color={0,0,127}));
  connect(plantTripIODetunedPSS.uLoad9, const.y) annotation (Line(points={{-3.92,-19.2},{-58,-19.2},{-58,0},{-75.4,0}},
                                                                                                                      color={0,0,127}));
  annotation (experiment(
      StopTime=360,
      __Dymola_NumberOfIntervals=10000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"));
end TestSystemIODetunedPSS;
