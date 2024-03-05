within Example2.MonitoringAndRedesign.Analysis.Study02.SimplePSS;
model LoadNoise
  extends Modelica.Icons.Example;
  Base.Systems.Study02.SystemIODetunedPSSwithTG plant(g1(Rdroop=0.025)) annotation (Placement(transformation(extent={{58,-40},{138,40}})));
  Modelica.Blocks.Sources.Constant r(k=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,20})));

  CustomComponents.TimedMultiRamp ramping(
    rampA_height=0.075,
    rampB_height=-0.035,
    rampC_height=-0.035,
    rampD_height=0.05)                    annotation (Placement(transformation(
        rotation=270,
        extent={{-20,-20},{20,20}},
        origin={0,100})));
  CustomComponents.TimedNoiseInjection uL7(
    samplePeriod=0.01,
    sigma=0.1,
    threshold=30.0)
                   annotation (Placement(transformation(extent={{-140,-62},{-98,-20}})));
  CustomComponents.TimedNoiseInjection uL9(
    samplePeriod=0.01,
    sigma=0.1,
    threshold=30)  annotation (Placement(transformation(extent={{-120,-140},{-80,-100}})));
  Modelica.Blocks.Sources.RealExpression rampingLoad(y=ramping.y) annotation (Placement(transformation(extent={{-140,-196},{-80,-138}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-50,-160},{-10,-120}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
    annotation (Placement(transformation(extent={{60,-158},{140,-80}})));
  CustomComponents.EventTriggerSnapshotScenario snapshots annotation (Placement(transformation(extent={{134,130},{184,174}})));
equation
  connect(ramping.y, plant.uPm) annotation (Line(
      points={{0,78},{0,48},{34,48}},
      color={238,46,47},
      thickness=1,
      arrow={Arrow.None,Arrow.Filled}));
  connect(uL7.y, plant.uLoad7) annotation (Line(points={{-95.9,-41},{-60,-41},{-60,-24},{33.2,-24}}, color={0,0,127}));
  connect(r.y, plant.uPSS) annotation (Line(points={{-98,20},{20,20},{20,24},{33.2,24}}, color={0,0,127}));
  connect(uL9.y, add.u1) annotation (Line(
      points={{-78,-120},{-70,-120},{-70,-128},{-54,-128}},
      color={0,140,72},
      thickness=1));
  connect(rampingLoad.y, add.u2) annotation (Line(
      points={{-77,-167},{-64,-167},{-64,-152},{-54,-152}},
      color={238,46,47},
      thickness=1));
  connect(add.y, plant.uLoad9) annotation (Line(
      points={{-8,-140},{8,-140},{8,-48},{33.2,-48}},
      color={0,140,72},
      thickness=1));
  connect(plant.uAVRin, r.y) annotation (Line(points={{33.2,0},{-10,0},{-10,20},{-98,20}}, color={0,0,127}));
  annotation (
        experiment(
      StopTime=3900,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
          __Dymola_selections={Selection(name="MySelection", match={MatchVariable(name="plant.Vt", newName="Vt"),MatchVariable(name="plant.Q", newName="Q"),MatchVariable(name="plant.P",newName="P"),MatchVariable(name="plant.w",newName="w"),MatchVariable(name="plant.AVRin",newName="u"),MatchVariable(name="plant.AVRout",newName="AVRout"),MatchVariable(name="timedMultiRamp.y",newName="rampY"),MatchVariable(name="plant.Load9.P",newName="Pload"),MatchVariable(name="r.y",newName="r")})});
end LoadNoise;
