within Example2.MonitoringAndRedesign.Analysis.Study02.SimplePSS;
model NoNoise
  extends Modelica.Icons.Example;
  Base.Systems.Study02.SystemIODetunedPSSwithTG plant(g1(Rdroop=0.025)) annotation (Placement(transformation(extent={{58,-40},{138,40}})));
  Modelica.Blocks.Sources.Constant r(k=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-24})));

  CustomComponents.TimedMultiRamp ramping(
    rampA_height=0.075,
    rampB_height=-0.035,
    rampC_height=-0.035,
    rampD_height=0.05) annotation (Placement(transformation(rotation=0, extent={{-134,28},{-94,68}})));
  CustomComponents.EventTriggerSnapshotScenario snapshots annotation (Placement(transformation(extent={{-146,-136},{-88,-86}})));
equation
  connect(r.y, plant.uLoad7) annotation (Line(points={{-98,-24},{33.2,-24}}, color={0,0,127}));
  connect(ramping.y, plant.uPm) annotation (Line(
      points={{-92,48},{34,48}},
      color={238,46,47},
      thickness=1,
      arrow={Arrow.None,Arrow.Filled}));
  connect(plant.uLoad9, ramping.y) annotation (Line(
      points={{33.2,-48},{-68,-48},{-68,48},{-92,48}},
      color={238,46,47},
      thickness=1));
  connect(plant.uPSS, r.y) annotation (Line(points={{33.2,24},{8,24},{8,-24},{-98,-24}}, color={0,0,127}));
  connect(plant.uAVRin, r.y) annotation (Line(points={{33.2,0},{-30,0},{-30,-24},{-98,-24}}, color={0,0,127}));
  annotation (
        experiment(
      StopTime=3900,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
      __Dymola_selections={Selection(name="MySelection", match={MatchVariable(name="plant.Vt", newName="Vt"),MatchVariable(name="plant.Q", newName="Q"),MatchVariable(name="plant.P",newName="P"),MatchVariable(name="plant.w",newName="w"),MatchVariable(name="plant.AVRin",newName="u"),MatchVariable(name="plant.AVRout",newName="AVRout"),MatchVariable(name="timedMultiRamp.y",newName="rampY"),MatchVariable(name="plant.Load9.P",newName="Pload"),MatchVariable(name="r.y",newName="r"),MatchVariable(name="plant.g1.pss.vs",newName="pssy")})});
end NoNoise;
