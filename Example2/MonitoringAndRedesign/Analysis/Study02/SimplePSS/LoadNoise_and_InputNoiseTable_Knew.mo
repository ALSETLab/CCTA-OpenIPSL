within Example2.MonitoringAndRedesign.Analysis.Study02.SimplePSS;
model LoadNoise_and_InputNoiseTable_Knew
  extends Modelica.Icons.Example;
  Base.Systems.Study02.SystemIODetunedPSSwithTG plant(g1(Rdroop=0.025),
    Kw=73.5830,
    Tw=4.9469)                                                          annotation (Placement(transformation(extent={{58,-40},{138,40}})));
  Modelica.Blocks.Sources.Constant zeroInputs(k=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-122,80})));

  CustomComponents.TimedMultiRamp ramping(
    rampA_height=0.075,
    rampB_height=-0.035,
    rampC_height=-0.035,
    rampD_height=0.05)                    annotation (Placement(transformation(
        rotation=270,
        extent={{-20,-20},{20,20}},
        origin={0,100})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
    annotation (Placement(transformation(extent={{60,-158},{140,-80}})));
  CustomComponents.EventTriggerSnapshotScenario snapshots annotation (Placement(transformation(extent={{134,130},{184,174}})));
  CustomComponents.TimedInjectionOnOffTableData r annotation (Placement(transformation(extent={{-142,-22},{-100,20}})));
  CustomComponents.TimedNoiseInjection uL7(
    samplePeriod=0.01,
    sigma=0.1,
    threshold=30.0)
                   annotation (Placement(transformation(extent={{-140,-80},{-98,-38}})));
  CustomComponents.TimedNoiseInjection uL9(
    samplePeriod=0.01,
    sigma=0.1,
    threshold=30)  annotation (Placement(transformation(extent={{-180,-140},{-140,-100}})));
  Modelica.Blocks.Sources.RealExpression rampingLoad(y=ramping.y) annotation (Placement(transformation(extent={{-200,-196},{-140,-138}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-110,-160},{-70,-120}})));
equation
  connect(ramping.y, plant.uPm) annotation (Line(
      points={{0,78},{0,48},{34,48}},
      color={238,46,47},
      thickness=1,
      arrow={Arrow.None,Arrow.Filled}));
  connect(zeroInputs.y, plant.uPSS) annotation (Line(points={{-100,80},{-26,80},{-26,24},{33.2,24}},
                                                                                                  color={0,0,127}));
  connect(uL7.y, plant.uLoad7) annotation (Line(points={{-95.9,-59},{-95.9,-60},{-80,-60},{-80,-24},{33.2,-24}},
                                                                                                     color={0,0,127}));
  connect(uL9.y,add. u1) annotation (Line(
      points={{-138,-120},{-130,-120},{-130,-128},{-114,-128}},
      color={0,140,72},
      thickness=1));
  connect(rampingLoad.y,add. u2) annotation (Line(
      points={{-137,-167},{-124,-167},{-124,-152},{-114,-152}},
      color={238,46,47},
      thickness=1));
  connect(add.y, plant.uLoad9) annotation (Line(
      points={{-68,-140},{-46,-140},{-46,-48},{33.2,-48}},
      color={0,140,72},
      thickness=1));
  connect(r.y, plant.uAVRin) annotation (Line(
      points={{-96.64,-1},{-96.64,0},{33.2,0}},
      color={217,67,180},
      thickness=1));
  annotation (
        experiment(
      StopTime=3900,
      Interval=0.01,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
__Dymola_selections={Selection(name="MySelection", match={MatchVariable(name="plant.Vt", newName="Vt"),MatchVariable(name="plant.Q", newName="Q"),MatchVariable(name="plant.P",newName="P"),MatchVariable(name="plant.w",newName="w"),MatchVariable(name="plant.AVRin",newName="u"),MatchVariable(name="plant.AVRout",newName="AVRout"),MatchVariable(name="timedMultiRamp.y",newName="rampY"),MatchVariable(name="plant.Load9.P",newName="Pload"),MatchVariable(name="r.y",newName="r")})});
end LoadNoise_and_InputNoiseTable_Knew;
