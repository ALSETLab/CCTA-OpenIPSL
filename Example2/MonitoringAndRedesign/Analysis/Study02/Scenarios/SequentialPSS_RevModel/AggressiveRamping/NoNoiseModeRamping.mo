within Example2.MonitoringAndRedesign.Analysis.Study02.Scenarios.SequentialPSS_RevModel.AggressiveRamping;
model NoNoiseModeRamping
  extends Modelica.Icons.Example;
  Base.Systems.Study02.SysDetuned4SubstructurePSSTGRev
                                                plant(g1(Rdroop=0.025),
    t2pssin=1200,
    t3pssin=2100,
    t4ppsin=3000,
    pss2_Kw=43.2018547310748,
    pss2_Tw=0.884138474674591,
    pss3_Kw=47.8216492280637,
    pss3_Tw=2.24860364156199,
    pss4_Kw=34.5976123669692,
    pss4_Tw=1.28453193073444)                                                                                           annotation (Placement(transformation(extent={{58,-40},{138,40}})));
  Modelica.Blocks.Sources.Constant r(k=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-24})));

  CustomComponents.TimedMultiRamp ramping(
    rampA_height=0.2,
    rampB_height=0.125,
    rampC_height=-0.25,
    rampD_height=-0.25)
                       annotation (Placement(transformation(rotation=0, extent={{-140,28},{-100,68}})));
  CustomComponents.EventTriggerSnapshotScenario snapshots annotation (Placement(transformation(extent={{-146,-136},{-88,-86}})));
  parameter OpenIPSL.Types.PerUnit pss_vsmax=0.2 "Max stabilizer output signal" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter OpenIPSL.Types.PerUnit pss_vsmin=-0.2 "Min stabilizer output signal" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter Real pss1_Kw=5 "Stabilizer gain [pu/pu]" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter OpenIPSL.Types.Time pss1_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter Real pss2_Kw=5 "Stabilizer gain [pu/pu]" annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter OpenIPSL.Types.Time pss2_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter Real pss3_Kw=5 "Stabilizer gain [pu/pu]" annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter OpenIPSL.Types.Time pss3_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter Real pss4_Kw=5 "Stabilizer gain [pu/pu]" annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
  parameter OpenIPSL.Types.Time pss4_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
equation
  connect(r.y, plant.uLoad7) annotation (Line(points={{-98,-24},{33.2,-24}}, color={0,0,127}));
  connect(ramping.y, plant.uPm) annotation (Line(
      points={{-98,48},{34,48}},
      color={238,46,47},
      thickness=1,
      arrow={Arrow.None,Arrow.Filled}));
  connect(plant.uLoad9, ramping.y) annotation (Line(
      points={{33.2,-48},{-68,-48},{-68,48},{-98,48}},
      color={238,46,47},
      thickness=1));
  connect(plant.uPSS, r.y) annotation (Line(points={{33.2,24},{8,24},{8,-24},{-98,-24}}, color={0,0,127}));
  connect(plant.uAVRin, r.y) annotation (Line(points={{33.2,0},{-30,0},{-30,-24},{-98,-24}}, color={0,0,127}));
                                                            //,
//     __Dymola_selections={Selection(name="MySelection", match={MatchVariable(name="plant.Vt", newName="Vt"),MatchVariable(name="plant.Q", newName="Q"),MatchVariable(name="plant.P",newName="P"),MatchVariable(name="plant.w",newName="w"),MatchVariable(name="plant.AVRin",newName="u"),MatchVariable(name="plant.AVRout",newName="AVRout"),MatchVariable(name="timedMultiRamp.y",newName="rampY"),MatchVariable(name="plant.Load9.P",newName="Pload"),MatchVariable(name="r.y",newName="r"),MatchVariable(name="plant.g1.pss.vs",newName="pssy"),MatchVariable(name="ramping.y",newName="rampingy")})});
  annotation (
        experiment(
      StopTime=4050,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
end NoNoiseModeRamping;
