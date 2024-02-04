within Example2.MonitoringAndRedesign.Analysis.Study02.Scenarios.TestRamps;
model NoNoise_BasicRampsWithTG_DemandFollow
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant PSSchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,30})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Base.Systems.Study02.SystemIODetunedPSSwithTG plant(g1(Rdroop=0.025)) annotation (Placement(transformation(extent={{40,-20},{82,22}})));
  Modelica.Blocks.Sources.Constant AVRchange(k=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant uL7_zero(k=0) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-50,-30})));

  Modelica.Blocks.Sources.RealExpression PLoad9_meas(y=plant.Load9.P) annotation (Placement(transformation(extent={{-312,48},{-262,92}})));
  Modelica.Blocks.Sources.RealExpression PLoad0(y=plant.Load9.P_0/100e6) annotation (Placement(transformation(extent={{-312,14},{-262,58}})));
  Modelica.Blocks.Math.Feedback DPL annotation (Placement(transformation(extent={{-252,60},{-232,80}})));
  Modelica.Blocks.Sources.Ramp rampPa(
    height=0.025,
    duration=2.5*60,
    startTime=60) annotation (Placement(transformation(extent={{-300,-40},{-280,-20}})));
  Modelica.Blocks.Discrete.FirstOrderHold foh(samplePeriod=5) annotation (Placement(transformation(extent={{-164,-80},{-144,-60}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod=0.1) annotation (Placement(transformation(extent={{-194,-80},{-174,-60}})));
  Modelica.Blocks.Sources.Ramp rampPb(
    height=0.025,
    duration=2.5*60,
    startTime=600) annotation (Placement(transformation(extent={{-300,-80},{-280,-60}})));
  Modelica.Blocks.Sources.Ramp rampPc(
    height=-0.035,
    duration=5*60,
    startTime=1200) annotation (Placement(transformation(extent={{-300,-120},{-280,-100}})));
  Modelica.Blocks.Math.Sum DP(nin=3) annotation (Placement(transformation(extent={{-252,-80},{-232,-60}})));
  Modelica.Blocks.Math.Gain gain(k=1/100) annotation (Placement(transformation(extent={{-224,60},{-204,80}})));
  Modelica.Blocks.Discrete.Sampler sampler1(samplePeriod=0.1)
                                                             annotation (Placement(transformation(extent={{-140,60},{-120,80}})));
  Modelica.Blocks.Discrete.FirstOrderHold foh1(samplePeriod=5) annotation (Placement(transformation(extent={{-108,60},{-88,80}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-178,60},{-158,80}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-88,-152},{-68,-132}})));
  Modelica.Blocks.Sources.ContinuousClock clock
    annotation (Placement(transformation(extent={{-128,-122},{-108,-102}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold
                                           greaterEqualThreshold1(threshold=60)
    annotation (Placement(transformation(extent={{-98,-122},{-78,-102}})));
  Modelica.Blocks.Logical.Switch noiseon
    annotation (Placement(transformation(extent={{-54,-122},{-34,-102}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-30,88},{-10,108}})));
  Modelica.Blocks.Sources.ContinuousClock clock1
    annotation (Placement(transformation(extent={{-70,118},{-50,138}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold
                                           greaterEqualThreshold2(threshold=60)
    annotation (Placement(transformation(extent={{-40,118},{-20,138}})));
  Modelica.Blocks.Logical.Switch noiseon1
    annotation (Placement(transformation(extent={{4,118},{24,138}})));
equation
  connect(uL7_zero.y, plant.uLoad7) annotation (Line(points={{-39,-30},{-20,-30},{-20,-11.6},{26.98,-11.6}}, color={0,0,127}));
  connect(PSSchange.y, plant.uPSS) annotation (Line(points={{-39,30},{-20,30},{-20,13.6},{26.98,13.6}}, color={0,0,127}));
  connect(PLoad0.y, DPL.u2) annotation (Line(points={{-259.5,36},{-242,36},{-242,62}}, color={0,0,127}));
  connect(DPL.u1, PLoad9_meas.y) annotation (Line(points={{-250,70},{-259.5,70}}, color={0,0,127}));
  connect(sampler.y, foh.u) annotation (Line(points={{-173,-70},{-166,-70}}, color={0,0,127}));
  connect(DP.y, sampler.u) annotation (Line(points={{-231,-70},{-196,-70}}, color={0,0,127}));
  connect(rampPa.y, DP.u[1]) annotation (Line(points={{-279,-30},{-268,-30},{
          -268,-70.6667},{-254,-70.6667}},                                                                    color={0,0,127}));
  connect(rampPb.y, DP.u[2]) annotation (Line(points={{-279,-70},{-254,-70}}, color={0,0,127}));
  connect(rampPc.y, DP.u[3]) annotation (Line(points={{-279,-110},{-268,-110},{
          -268,-69.3333},{-254,-69.3333}},                                                                      color={0,0,127}));
  connect(DPL.y, gain.u) annotation (Line(points={{-233,70},{-226,70}}, color={0,0,127}));
  connect(sampler1.y, foh1.u) annotation (Line(points={{-119,70},{-110,70}}, color={0,0,127}));
  connect(add.y, sampler1.u) annotation (Line(points={{-157,70},{-142,70}}, color={0,0,127}));
  connect(gain.y, add.u1) annotation (Line(points={{-203,70},{-190,70},{-190,76},{-180,76}}, color={0,0,127}));
  connect(add.u2, DP.y) annotation (Line(points={{-180,64},{-202,64},{-202,-22},{-212,-22},{-212,-70},{-231,-70}}, color={0,0,127}));
  connect(clock.y,greaterEqualThreshold1. u)
    annotation (Line(points={{-107,-112},{-100,-112}},
                                                 color={0,0,127}));
  connect(greaterEqualThreshold1.y,noiseon. u2) annotation (Line(
        points={{-77,-112},{-56,-112}},
                                    color={255,0,255}));
  connect(const.y,noiseon. u3) annotation (Line(points={{-67,-142},{-62,-142},{-62,-120},{-56,-120}},
                                color={0,0,127}));
  connect(foh.y, noiseon.u1) annotation (Line(points={{-143,-70},{-66,-70},{-66,-104},{-56,-104}}, color={0,0,127}));
  connect(noiseon.y, plant.uLoad9) annotation (Line(points={{-33,-112},{0,-112},{0,-24.2},{26.98,-24.2}}, color={0,0,127}));
  connect(clock1.y, greaterEqualThreshold2.u) annotation (Line(points={{-49,128},{-42,128}}, color={0,0,127}));
  connect(greaterEqualThreshold2.y, noiseon1.u2) annotation (Line(points={{-19,128},{2,128}}, color={255,0,255}));
  connect(const1.y, noiseon1.u3) annotation (Line(points={{-9,98},{-4,98},{-4,120},{2,120}}, color={0,0,127}));
  connect(foh1.y, noiseon1.u1) annotation (Line(points={{-87,70},{-88,70},{-88,164},{-6,164},{-6,136},{2,136}}, color={0,0,127}));
  connect(noiseon1.y, plant.uPm) annotation (Line(points={{25,128},{38,128},{38,70},{-4,70},{-4,26.2},{27.4,26.2}}, color={0,0,127}));
  connect(AVRchange.y, plant.uAVRin) annotation (Line(points={{-39,0},{18,0},{18,1},{26.98,1}}, color={0,0,127}));
  annotation (
        experiment(
      StopTime=1800,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-320,-160},{100,180}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end NoNoise_BasicRampsWithTG_DemandFollow;
