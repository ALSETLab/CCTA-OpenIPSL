within Example2.MonitoringAndRedesign.Analysis.Study02.Scenarios.TestRamps;
model NoNoise_BasicRampsDetuned
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant PSSchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,48})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Base.Systems.Study02.SystemIODetunedPSS plant annotation (Placement(transformation(extent={{46,-14},{74,14}})));
  Modelica.Blocks.Sources.Constant AVRchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,30})));
  Modelica.Blocks.Sources.Constant uL7_zero(k=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-68,-40})));
  Modelica.Blocks.Sources.Ramp rampPm_and_uL9(
    height=0.025,
    duration=2.5*60,
    startTime=60) annotation (Placement(transformation(extent={{-174,60},{-154,80}})));
  Modelica.Blocks.Discrete.FirstOrderHold firstOrderHold(samplePeriod=5) annotation (Placement(transformation(extent={{-56,60},{-36,80}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod=0.1) annotation (Placement(transformation(extent={{-86,60},{-66,80}})));

  Modelica.Blocks.Sources.Ramp rampPm_and_uL1(
    height=0.025,
    duration=2.5*60,
    startTime=600)
                  annotation (Placement(transformation(extent={{-176,16},{-156,36}})));
  Modelica.Blocks.Sources.Ramp rampPm_and_uL2(
    height=-0.035,
    duration=5*60,
    startTime=1200)
                  annotation (Placement(transformation(extent={{-178,-20},{-158,0}})));
  Modelica.Blocks.Math.Sum sum1(nin=3) annotation (Placement(transformation(extent={{-134,14},{-114,34}})));
equation
  connect(uL7_zero.y, plant.uLoad7) annotation (Line(points={{-57,-40},{-12,-40},{-12,-8.4},{37.32,-8.4}}, color={0,0,127}));
  connect(sampler.y, firstOrderHold.u) annotation (Line(points={{-65,70},{-58,70}}, color={0,0,127}));
  connect(firstOrderHold.y, plant.uLoad9) annotation (Line(points={{-35,70},{-28,70},{-28,-16.8},{37.32,-16.8}}, color={0,0,127}));
  connect(PSSchange.y, plant.uPSS) annotation (Line(points={{0,37},{2,37},{2,8.4},{37.32,8.4}}, color={0,0,127}));
  connect(plant.uPm, plant.uLoad9) annotation (Line(points={{37.6,16.8},{-28,16},{-28,-16.8},{37.32,-16.8}}, color={0,0,127}));
  connect(sum1.y, sampler.u) annotation (Line(points={{-113,24},{-96,24},{-96,70},{-88,70}}, color={0,0,127}));
  connect(rampPm_and_uL9.y, sum1.u[1]) annotation (Line(points={{-153,70},{-146,70},{-146,23.3333},{-136,23.3333}}, color={0,0,127}));
  connect(rampPm_and_uL1.y, sum1.u[2]) annotation (Line(points={{-155,26},{-155,24},{-136,24}}, color={0,0,127}));
  connect(rampPm_and_uL2.y, sum1.u[3]) annotation (Line(points={{-157,-10},{-150,-10},{-150,24.6667},{-136,24.6667}}, color={0,0,127}));
  connect(plant.uAVRin, AVRchange.y) annotation (Line(points={{37.32,0},{-80,0},{-80,19}}, color={0,0,127}));
  annotation (
        experiment(
      StopTime=788.5,
      Interval=0.01,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-200,-100},{100,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end NoNoise_BasicRampsDetuned;
