within Example2.MonitoringAndRedesign.Analysis.Study01.ParametrizedRedisgnedControllers;
model TestCase0
  extends Modelica.Icons.Example;
  Case0 case0 annotation (Placement(transformation(extent={{-20,-38},{60,42}})));
  Modelica.Blocks.Sources.Constant     const(k=0)
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}})));
equation
  connect(const.y, case0.uPm) annotation (Line(points={{-65,0},{-42,0},{-42,34},
          {-29.6,34}}, color={0,0,127}));
  connect(case0.uPSS, case0.uPm) annotation (Line(points={{-28,18},{-36,18},{-36,
          0},{-42,0},{-42,34},{-29.6,34}}, color={0,0,127}));
  connect(case0.uVsAVR, case0.uPm) annotation (Line(points={{-28,2},{-42,2},{-42,
          34},{-29.6,34}}, color={0,0,127}));
  connect(case0.uLoadB7, case0.uPm) annotation (Line(points={{-28,-14},{-42,-14},
          {-42,34},{-29.6,34}}, color={0,0,127}));
  connect(case0.uLoadB9, case0.uPm) annotation (Line(points={{-27.2,-30},{-34,-30},
          {-34,-34},{-42,-34},{-42,34},{-29.6,34}}, color={0,0,127}));
  annotation (experiment(
      StopTime=1320,
      __Dymola_NumberOfIntervals=50000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"));
end TestCase0;
