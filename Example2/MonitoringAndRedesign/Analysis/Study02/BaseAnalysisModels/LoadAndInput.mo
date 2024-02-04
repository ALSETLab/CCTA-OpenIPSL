within Example2.MonitoringAndRedesign.Analysis.Study02.BaseAnalysisModels;
model LoadAndInput
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant PSSchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-2,48})));
  Modelica.Blocks.Sources.Constant Pmchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-42,48})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Base.Systems.Study02.SystemIODetunedPSS
                                   systemIODetunedPSS
                                               annotation (Placement(transformation(extent={{42,-14},{70,14}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-228,-180},{-208,-160}})));
  CustomComponents.TimedNoiseInjection uL7(
    samplePeriod=0.01,
    sigma=0.1,
    threshold=0.1) annotation (Placement(transformation(extent={{-92,-30},{-72,-14}})));
  CustomComponents.TimedNoiseInjection uL9(
    samplePeriod=0.01,
    sigma=0.1,
    threshold=0.1) annotation (Placement(transformation(extent={{-92,-60},{-72,-44}})));
  CustomComponents.TimedInputInjection_CaseB
                                       timedInputInjection_CaseB(
                                                           k=1/20)
    annotation (Placement(transformation(extent={{-92,8},{-72,28}})));
equation
  connect(PSSchange.y, systemIODetunedPSS.uPm) annotation (Line(
      points={{-2,37},{-2,22},{33.6,22},{33.6,16.8}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(Pmchange.y, systemIODetunedPSS.uPSS) annotation (Line(
      points={{-42,37},{-42,8.4},{33.32,8.4}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uL7.y, systemIODetunedPSS.uLoad7) annotation (Line(
      points={{-71,-22},{-58,-22},{-32,-22},{-32,-8},{0,-8},{0,-8.4},{33.32,-8.4}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(timedInputInjection_CaseB.y, systemIODetunedPSS.uAVRin) annotation (Line(
      points={{-71,18},{-44,18},{-44,0},{33.32,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uL9.y, systemIODetunedPSS.uLoad9) annotation (Line(
      points={{-71,-52},{-40,-52},{-40,-18},{-8,-18},{33.32,-18},{33.32,-16.8}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
              experiment(
      StopTime=1320,
      Interval=0.01,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end LoadAndInput;
