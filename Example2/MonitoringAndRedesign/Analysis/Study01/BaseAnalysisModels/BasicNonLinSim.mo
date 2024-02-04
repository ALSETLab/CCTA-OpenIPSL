within Example2.MonitoringAndRedesign.Analysis.Study01.BaseAnalysisModels;
model BasicNonLinSim
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant change_Zero(k=0)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Base.Systems.Study01.PlantTripIO plantTripIO annotation (Placement(transformation(extent={{4,-10},{24,10}})));
equation
  connect(plantTripIO.uPm, change_Zero.y) annotation (Line(points={{-15.8,12},{
          -14,12},{-14,18},{-52,18},{-52,0},{-59,0}}, color={0,0,127}));
  connect(plantTripIO.uPSS, change_Zero.y) annotation (Line(points={{-16,6},{
          -34,6},{-34,0},{-59,0}}, color={0,0,127}));
  connect(plantTripIO.uAVRin, change_Zero.y)
    annotation (Line(points={{-16,0},{-59,0}}, color={0,0,127}));
  connect(plantTripIO.uLoad7, change_Zero.y) annotation (Line(points={{-16,-6},
          {-28,-6},{-28,0},{-59,0}}, color={0,0,127}));
  connect(plantTripIO.uLoad9, change_Zero.y) annotation (Line(points={{-16,-12},
          {-34,-12},{-34,0},{-59,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=1320,
      Interval=0.01,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end BasicNonLinSim;
