within Example2.CustomComponents;
model TimedNoiseInjection
  extends Modelica.Blocks.Interfaces.SO;
  Modelica.Blocks.Noise.NormalNoise normalNoise(
    samplePeriod=samplePeriod,
    mu=mu,
    sigma=sigma)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Blocks.Sources.ContinuousClock clock
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold
                                           greaterEqualThreshold1(threshold=
        threshold)
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Logical.Switch noiseon
    annotation (Placement(transformation(extent={{-26,-10},{-6,10}})));
  parameter Modelica.Units.SI.Period samplePeriod=1/60
    "Period for sampling the raw random numbers"
    annotation (Dialog(group="Noise"));
  parameter Real mu=0 "Expectation (mean) value of the normal distribution"
    annotation (Dialog(group="Noise"));
  parameter Real sigma=0.0577 "Standard deviation of the normal distribution"
    annotation (Dialog(group="Noise"));
  parameter Real threshold=0.1 "Comparison with respect to threshold"
    annotation (Dialog(group="Time of Noise Injection"));
equation
  connect(clock.y, greaterEqualThreshold1.u)
    annotation (Line(points={{-79,0},{-72,0}},   color={0,0,127}));
  connect(greaterEqualThreshold1.y, noiseon.u2) annotation (Line(
        points={{-49,0},{-28,0}},   color={255,0,255}));
  connect(normalNoise.y,noiseon. u1) annotation (Line(points={{-39,30},
          {-36,30},{-36,8},{-28,8}},
                                color={0,0,127}));
  connect(const.y,noiseon. u3) annotation (Line(points={{-39,-30},{
          -34,-30},{-34,-8},{-28,-8}},
                                color={0,0,127}));
  connect(noiseon.y, y)
    annotation (Line(points={{-5,0},{110,0}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-80},{100,80}})),   Icon(
                                                        graphics={
        Line(points={{-4,80},{-4,60}},
                                     color={160,160,164}),
        Line(points={{76,0},{56,0}}, color={160,160,164}),
        Line(points={{-84,0},{-64,0}}, color={160,160,164}),
        Line(points={{33,70},{22,50}}, color={160,160,164}),
        Line(points={{66,38},{45,26}}, color={160,160,164}),
        Line(points={{-75,37},{-58,28}}, color={160,160,164}),
        Line(points={{-42,70},{-32,51}}, color={160,160,164}),
        Line(
          points={{-4,0},{-54,50}},
          thickness=0.5),
        Line(
          points={{-4,0},{36,0}},
          thickness=0.5),
        Line(
           points={{-74,-61},{-60,-61},{-60,-45},{-52,-45},{-52,-93},{-44,-93},
              {-44,-71},{-36,-71},{-36,-18},{-28,-18},{-28,-19},{-28,-19},{-28,
              -79},{-18,-79},{-18,-61},{-8,-61},{-8,-89},{2,-89},{2,-7},{8,-7},
              {8,-26},{14,-26},{14,-49},{24,-49},{24,-37},{30,-37},{30,-67},{40,
              -67},{40,-20},{50,-20},{50,-29},{58,-29},{58,-95},{68,-95}},
          color={28,108,200},
          thickness=0.5)}),
    experiment(
      StopTime=1320,
      Interval=60,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.01,
      __Dymola_Algorithm="Dassl"));
end TimedNoiseInjection;