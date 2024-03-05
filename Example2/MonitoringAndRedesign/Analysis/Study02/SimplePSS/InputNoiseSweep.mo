within Example2.MonitoringAndRedesign.Analysis.Study02.SimplePSS;
model InputNoiseSweep
  extends Modelica.Icons.Example;
  Base.Systems.Study02.SystemIODetunedPSSwithTG plant(g1(Rdroop=0.025)) annotation (Placement(transformation(extent={{58,-40},{138,40}})));
  Modelica.Blocks.Sources.Constant zeroInputs(k=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,24})));

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
  CustomComponents.TimedInjectionOnOffVariablefreqSine r annotation (Placement(transformation(extent={{-140,-60},{-98,-18}})));
equation
  connect(ramping.y, plant.uPm) annotation (Line(
      points={{0,78},{0,48},{34,48}},
      color={238,46,47},
      thickness=1,
      arrow={Arrow.None,Arrow.Filled}));
  connect(zeroInputs.y, plant.uPSS) annotation (Line(points={{-98,24},{33.2,24}},                 color={0,0,127}));
  connect(plant.uLoad7, zeroInputs.y) annotation (Line(points={{33.2,-24},{0,-24},{0,24},{-98,24}}, color={0,0,127}));
  connect(plant.uLoad9, zeroInputs.y) annotation (Line(points={{33.2,-48},{0,-48},{0,24},{-98,24}}, color={0,0,127}));
  connect(r.y, plant.uAVRin) annotation (Line(
      points={{-94.64,-39},{-80,-39},{-80,0},{33.2,0}},
      color={217,67,180},
      thickness=1));
  annotation (
        experiment(
      StopTime=3900,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
__Dymola_selections={Selection(name="MySelection", match={MatchVariable(name="plant.Vt", newName="Vt"),MatchVariable(name="plant.Q", newName="Q"),MatchVariable(name="plant.P",newName="P"),MatchVariable(name="plant.w",newName="w"),MatchVariable(name="plant.AVRin",newName="u"),MatchVariable(name="plant.AVRout",newName="AVRout"),MatchVariable(name="timedMultiRamp.y",newName="rampY"),MatchVariable(name="plant.Load9.P",newName="Pload"),MatchVariable(name="r.y",newName="r")})});
end InputNoiseSweep;
