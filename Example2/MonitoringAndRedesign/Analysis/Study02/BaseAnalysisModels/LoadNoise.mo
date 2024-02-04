within Example2.MonitoringAndRedesign.Analysis.Study02.BaseAnalysisModels;
model LoadNoise
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant PSSchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,48})));
  Modelica.Blocks.Sources.Constant Pmchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,48})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Base.Systems.Study02.SystemIODetunedPSS
                                   systemIODetunedPSS
                                               annotation (Placement(transformation(extent={{46,-14},{74,14}})));
  Modelica.Blocks.Sources.Constant AVRchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,48})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-228,-180},{-208,-160}})));
  CustomComponents.TimedNoiseInjection uL7(
    samplePeriod=0.01,
    sigma=0.1,
    threshold=0.1) annotation (Placement(transformation(extent={{-90,-30},{-70,-14}})));
  CustomComponents.TimedNoiseInjection uL9(
    samplePeriod=0.01,
    sigma=0.1,
    threshold=0.1) annotation (Placement(transformation(extent={{-90,-60},{-70,-44}})));
equation
  connect(PSSchange.y, systemIODetunedPSS.uPm) annotation (Line(
      points={{0,37},{0,22},{37.6,22},{37.6,16.8}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(Pmchange.y, systemIODetunedPSS.uPSS) annotation (Line(
      points={{-40,37},{-40,8.4},{37.32,8.4}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(AVRchange.y, systemIODetunedPSS.uAVRin) annotation (Line(
      points={{-80,37},{-80,0},{37.32,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uL9.y, systemIODetunedPSS.uLoad9) annotation (Line(
      points={{-69,-52},{-40,-52},{-14,-52},{-14,-16},{37.32,-16},{37.32,-16.8}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uL7.y, systemIODetunedPSS.uLoad7) annotation (Line(
      points={{-69,-22},{-56,-22},{-30,-22},{-30,-8},{2,-8},{2,-8.4},{37.32,-8.4}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (
        experiment(
      StopTime=1320,
      Interval=0.01,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end LoadNoise;
