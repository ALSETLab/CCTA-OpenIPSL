within Example2.MonitoringAndRedesign.Analysis.Study02.Scenarios;
package PSSRedesign
  extends Modelica.Icons.ExamplesPackage;
  package CaseASingleRedesign
    "In this package, the redesign has one been done for one operating point and applied at all the new ones."
    extends Modelica.Icons.ExamplesPackage;
    model NoNoiseModeRamping
      extends Modelica.Icons.Example;
      Base.Systems.Study02.SysDtunedG14sstPSSTGRevG3plusPSS
                                                    plant(g1(Rdroop=0.025),
        t2pssin=1200,
        t3pssin=2100,
        g3(pss(
            Kw=40,
            Tw=10,
            T1=0.5336,
            T2=0.0942,
            T3=0.5336,
            T4=0.0942), sEXS(K=200)),
        pss2_Kw=48.660727200594167,
        pss2_Tw=0.355570139928890,
        pss3_Kw=48.660727200594167,
        pss3_Tw=0.355570139928890,
        pss4_Kw=48.660727200594167,
        pss4_Tw=0.355570139928890,
        pss5_Kw=48.660727200594167,
        pss5_Tw=0.355570139928890)                                                                                          annotation (Placement(transformation(extent={{58,-40},{138,40}})));
      Modelica.Blocks.Sources.Constant r(k=0) annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-120,-24})));

      CustomComponents.TimedMultiRamp ramping(
        rampA_height=0.2,
        rampB_height=0.125,
        rampC_height=-0.075,
        rampD_height=-0.075)
                           annotation (Placement(transformation(rotation=0, extent={{-140,28},{-100,68}})));
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
          StopTime=2100,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"),
        Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end NoNoiseModeRamping;

    model NoiseAndInputRamping "Model to perform blind estimation with default controller and re-design"
      extends Modelica.Icons.Example;
      Base.Systems.Study02.SysDtunedG14sstPSSTGRevG3plusPSS
                                                    plant(g1(Rdroop=0.025),
        t2pssin=1200,
        t3pssin=2100,
        t4pssin=3000,
        t5pssin=3900,
        g3(pss(
            Kw=40,
            Tw=10,
            T1=0.5336,
            T2=0.0942,
            T3=0.5336,
            T4=0.0942), sEXS(K=200)),
        pss2_Kw=47.627315837430373,
        pss2_Tw=0.380100702453755,
        pss3_Kw=47.627315837430373,
        pss3_Tw=0.380100702453755,
        pss4_Kw=47.627315837430373,
        pss4_Tw=0.380100702453755,
        pss5_Kw=47.627315837430373,
        pss5_Tw=0.380100702453755)                                          annotation (Placement(transformation(extent={{58,-40},{138,40}})));
      Modelica.Blocks.Sources.Constant zeroInputs(k=0) annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-122,80})));

      inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
        annotation (Placement(transformation(extent={{60,-190},{140,-112}})));
      CustomComponents.TimedInjectionOnOffTableData r annotation (Placement(transformation(extent={{-142,-22},{-100,20}})));
      CustomComponents.TimedNoiseInjection uL7(
        samplePeriod=0.01,
        sigma=0.1*0.25,
        threshold=30.0)
                       annotation (Placement(transformation(extent={{-140,-78},{-98,-36}})));
      Modelica.Blocks.Sources.RealExpression rampingLoad(y=ramping.y) annotation (Placement(transformation(extent={{-200,-196},{-140,-138}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-110,-160},{-70,-120}})));
      CustomComponents.TimedMultiRamp ramping(
        rampA_height=0.2,
        rampB_height=0.125,
        rampC_height=-0.075,
        rampD_height=-0.075)
                            annotation (Placement(transformation(
            rotation=270,
            extent={{-20,-20},{20,20}},
            origin={0,122})));
    equation
      connect(zeroInputs.y, plant.uPSS) annotation (Line(points={{-100,80},{-26,80},{-26,24},{33.2,24}},
                                                                                                      color={0,0,127}));
      connect(uL7.y, plant.uLoad7) annotation (Line(points={{-95.9,-57},{-95.9,-60},{-80,-60},{-80,-24},{33.2,-24}},
                                                                                                         color={0,0,127}));
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
      connect(ramping.y, plant.uPm) annotation (Line(
          points={{0,100},{0,48},{34,48}},
          color={238,46,47},
          thickness=1));
      connect(add.u1, zeroInputs.y) annotation (Line(points={{-114,-128},{-150,-128},{-150,-102},{-60,-102},{-60,80},{-100,80}}, color={0,0,127}));
      annotation (
            experiment(
          StopTime=4050,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"),
        Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
          __Dymola_selections={Selection(name="MySelection", match={MatchVariable(name="plant.Vt", newName="Vt"),MatchVariable(name="plant.Q", newName="Q"),MatchVariable(name="plant.P",newName="P"),MatchVariable(name="plant.w",newName="w"),MatchVariable(name="plant.AVRin",newName="u"),MatchVariable(name="plant.AVRout",newName="AVRout"),MatchVariable(name="timedMultiRamp.y",newName="rampY"),MatchVariable(name="plant.Load9.P",newName="Pload"),MatchVariable(name="r.y",newName="r"),MatchVariable(name="plant.g1.pss.vs",newName="pssy"),MatchVariable(name="ramping.y",newName="rampingy")})});
    end NoiseAndInputRamping;

    model KchangeLinRamping "Model to perform blind estimation with default controller and re-design"
      extends Example2.Utilities.Icons.ModelForLinearization;
      Base.Systems.Study02.SysDtunedG14sstPSSTGRevG3plusPSS
                                                    plant(g1(Rdroop=0.025),
        t2pssin=1200,
        t3pssin=2100,
        t4pssin=3000,
        t5pssin=3900,
        g3(pss(
            Kw=40,
            Tw=10,
            T1=0.5336,
            T2=0.0942,
            T3=0.5336,
            T4=0.0942), sEXS(K=200)),
        pss2_Kw=47.627315837430373,
        pss2_Tw=0.380100702453755,
        pss3_Kw=47.627315837430373,
        pss3_Tw=0.380100702453755,
        pss4_Kw=47.627315837430373,
        pss4_Tw=0.380100702453755,
        pss5_Kw=47.627315837430373,
        pss5_Tw=0.380100702453755)                                          annotation (Placement(transformation(extent={{60,-38},{140,42}})));
      Modelica.Blocks.Sources.Constant zeroInputs(k=0) annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-180,80})));

      Modelica.Blocks.Interfaces.RealInput          r annotation (Placement(transformation(extent={{-244,-20},{-202,22}}), iconTransformation(extent={{-142,-22},{-100,20}})));
      Modelica.Blocks.Sources.RealExpression rampingLoad(y=ramping.y) annotation (Placement(transformation(extent={{-200,-196},{-140,-138}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-110,-160},{-70,-120}})));
      Modelica.Blocks.Interfaces.RealOutput w annotation (Placement(transformation(extent={{200,-10},{220,10}}), iconTransformation(extent={{192,-10},{212,10}})));
      Modelica.Blocks.Interfaces.RealInput uLoad7 annotation (Placement(transformation(extent={{-240,-60},{-200,-20}}), iconTransformation(extent={{-244,-64},{-204,-24}})));
      CustomComponents.TimedMultiRamp ramping(
        rampA_height=0.2,
        rampB_height=0.125,
        rampC_height=-0.075,
        rampD_height=-0.075)
                            annotation (Placement(transformation(
            rotation=270,
            extent={{-20,-20},{20,20}},
            origin={0,118})));
    equation
      connect(zeroInputs.y, plant.uPSS) annotation (Line(points={{-158,80},{-26,80},{-26,26},{35.2,26}},
                                                                                                      color={0,0,127}));
      connect(rampingLoad.y,add. u2) annotation (Line(
          points={{-137,-167},{-124,-167},{-124,-152},{-114,-152}},
          color={238,46,47},
          thickness=1));
      connect(add.y, plant.uLoad9) annotation (Line(
          points={{-68,-140},{-46,-140},{-46,-46},{35.2,-46}},
          color={0,140,72},
          thickness=1));
      connect(r, plant.uAVRin) annotation (Line(points={{-223,1},{20,1},{20,2},{35.2,2}}, color={0,0,127}));
      connect(plant.w, w) annotation (Line(points={{160,2},{186,2},{186,0},{210,0}},
                                                                     color={0,0,127}));
      connect(add.u1, zeroInputs.y) annotation (Line(points={{-114,-128},{-138,-128},{-138,80},{-158,80}}, color={0,0,127}));
                                                                //,
    //      __Dymola_selections={Selection(name="MySelection", match={MatchVariable(name="plant.Vt", newName="Vt"),MatchVariable(name="plant.Q", newName="Q"),MatchVariable(name="plant.P",newName="P"),MatchVariable(name="plant.w",newName="w"),MatchVariable(name="plant.AVRin",newName="u"),MatchVariable(name="plant.AVRout",newName="AVRout"),MatchVariable(name="timedMultiRamp.y",newName="rampY"),MatchVariable(name="plant.Load9.P",newName="Pload"),MatchVariable(name="r.y",newName="r"),MatchVariable(name="plant.g1.pss.vs",newName="pssy"),MatchVariable(name="ramping.y",newName="rampingy")})});
      connect(plant.uLoad7, uLoad7) annotation (Line(points={{35.2,-22},{-112,-22},{-112,-40},{-220,-40}}, color={0,0,127}));
      connect(plant.uPm, ramping.y) annotation (Line(
          points={{36,50},{0,50},{0,96}},
          color={238,46,47},
          thickness=1));
      annotation (
        Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end KchangeLinRamping;

  end CaseASingleRedesign;

  package CaseBSequentialRedesignMaxDamping
    extends Modelica.Icons.ExamplesPackage;
    model NoNoiseModeRamping
      extends Modelica.Icons.Example;
      Base.Systems.Study02.SysDtunedG14sstPSSTGRevG3plusPSS
                                                    plant(g1(Rdroop=0.025),
        t2pssin=1200,
        t3pssin=2100,
        pss5_Kw=40.5805815036253,
        pss5_Tw=0.662145720506094,
        pss2_Kw=41.5513557406031,
        pss2_Tw=0.472438118409176,
        g3(pss(
            Kw=40,
            Tw=10,
            T1=0.5336,
            T2=0.0942,
            T3=0.5336,
            T4=0.0942), sEXS(K=200)),
        pss3_Kw=33.7003892474916,
        pss3_Tw=0.630136173640335,
        pss4_Kw=44.5111950842239,
        pss4_Tw=7.17749741248918)                                                                                           annotation (Placement(transformation(extent={{58,-40},{138,40}})));
      Modelica.Blocks.Sources.Constant r(k=0) annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-120,-24})));

      CustomComponents.TimedMultiRamp ramping(
        rampA_height=0.2,
        rampB_height=0.125,
        rampC_height=-0.075,
        rampD_height=-0.075)
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
          StopTime=2100,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"),
        Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end NoNoiseModeRamping;

    model NoiseAndInputRamping "Model to perform blind estimation with default controller and re-design"
      extends Modelica.Icons.Example;
      Base.Systems.Study02.SysDtunedG14sstPSSTGRevG3plusPSS
                                                    plant(g1(Rdroop=0.025),
        t2pssin=1200,
        t3pssin=2100,
        pss5_Kw=40.5805815036253,
        pss5_Tw=0.662145720506094,
        t4ppsin=3000,
        pss2_Kw=41.5513557406031,
        pss2_Tw=0.472438118409176,
        g3(pss(
            Kw=40,
            Tw=10,
            T1=0.5336,
            T2=0.0942,
            T3=0.5336,
            T4=0.0942), sEXS(K=200)),
        pss3_Kw=33.7003892474916,
        pss3_Tw=0.630136173640335,
        pss4_Kw=44.5111950842239,
        pss4_Tw=7.17749741248918)                                           annotation (Placement(transformation(extent={{58,-40},{138,40}})));
      Modelica.Blocks.Sources.Constant zeroInputs(k=0) annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-122,80})));

      inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
        annotation (Placement(transformation(extent={{60,-190},{140,-112}})));
      CustomComponents.EventTriggerSnapshotScenario snapshots annotation (Placement(transformation(extent={{134,130},{184,174}})));
      CustomComponents.TimedInjectionOnOffTableData r annotation (Placement(transformation(extent={{-142,-22},{-100,20}})));
      CustomComponents.TimedNoiseInjection uL7(
        samplePeriod=0.01,
        sigma=0.1*0.25,
        threshold=30.0)
                       annotation (Placement(transformation(extent={{-140,-78},{-98,-36}})));
      Modelica.Blocks.Sources.RealExpression rampingLoad(y=ramping.y) annotation (Placement(transformation(extent={{-200,-196},{-140,-138}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-110,-160},{-70,-120}})));
      CustomComponents.TimedMultiRamp ramping(
        rampA_height=0.2,
        rampB_height=0.125,
        rampC_height=-0.075,
        rampD_height=-0.075)
                            annotation (Placement(transformation(
            rotation=270,
            extent={{-20,-20},{20,20}},
            origin={0,122})));
    equation
      connect(zeroInputs.y, plant.uPSS) annotation (Line(points={{-100,80},{-26,80},{-26,24},{33.2,24}},
                                                                                                      color={0,0,127}));
      connect(uL7.y, plant.uLoad7) annotation (Line(points={{-95.9,-57},{-95.9,-60},{-80,-60},{-80,-24},{33.2,-24}},
                                                                                                         color={0,0,127}));
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
      connect(ramping.y, plant.uPm) annotation (Line(
          points={{0,100},{0,48},{34,48}},
          color={238,46,47},
          thickness=1));
      connect(add.u1, zeroInputs.y) annotation (Line(points={{-114,-128},{-150,-128},{-150,-102},{-60,-102},{-60,80},{-100,80}}, color={0,0,127}));
      annotation (
            experiment(
          StopTime=2100,
          __Dymola_NumberOfIntervals=5000,
          Tolerance=1e-06,
          __Dymola_Algorithm="Dassl"),
        Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}})),
          __Dymola_selections={Selection(name="MySelection", match={MatchVariable(name="plant.Vt", newName="Vt"),MatchVariable(name="plant.Q", newName="Q"),MatchVariable(name="plant.P",newName="P"),MatchVariable(name="plant.w",newName="w"),MatchVariable(name="plant.AVRin",newName="u"),MatchVariable(name="plant.AVRout",newName="AVRout"),MatchVariable(name="timedMultiRamp.y",newName="rampY"),MatchVariable(name="plant.Load9.P",newName="Pload"),MatchVariable(name="r.y",newName="r"),MatchVariable(name="plant.g1.pss.vs",newName="pssy"),MatchVariable(name="ramping.y",newName="rampingy")})});
    end NoiseAndInputRamping;

    model KchangeLinRamping "Model to perform blind estimation with default controller and re-design"
      extends Example2.Utilities.Icons.ModelForLinearization;
      Base.Systems.Study02.SysDtunedG14sstPSSTGRevG3plusPSS
                                                    plant(g1(Rdroop=0.025),
        t2pssin=1200,
        t3pssin=2100,
        t4pssin=3000,
        t5pssin=3900,
        pss2_Kw=41.5513557406031,
        pss2_Tw=0.472438118409176,
        g3(pss(
            Kw=40,
            Tw=10,
            T1=0.5336,
            T2=0.0942,
            T3=0.5336,
            T4=0.0942), sEXS(K=200)),
        pss3_Kw=33.7003892474916,
        pss3_Tw=0.630136173640335,
        pss4_Kw=44.5111950842239,
        pss4_Tw=7.17749741248918,
        pss5_Kw=40.5805815036253,
        pss5_Tw=0.662145720506094)                                          annotation (Placement(transformation(extent={{60,-38},{140,42}})));
      Modelica.Blocks.Sources.Constant zeroInputs(k=0) annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-180,80})));

      Modelica.Blocks.Interfaces.RealInput          r annotation (Placement(transformation(extent={{-244,-20},{-202,22}}), iconTransformation(extent={{-142,-22},{-100,20}})));
      Modelica.Blocks.Sources.RealExpression rampingLoad(y=ramping.y) annotation (Placement(transformation(extent={{-200,-196},{-140,-138}})));
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-110,-160},{-70,-120}})));
      Modelica.Blocks.Interfaces.RealOutput w annotation (Placement(transformation(extent={{200,-10},{220,10}}), iconTransformation(extent={{192,-10},{212,10}})));
      Modelica.Blocks.Interfaces.RealInput uLoad7 annotation (Placement(transformation(extent={{-240,-60},{-200,-20}}), iconTransformation(extent={{-244,-64},{-204,-24}})));
      CustomComponents.TimedMultiRamp ramping(
        rampA_height=0.2,
        rampB_height=0.125,
        rampC_height=-0.075,
        rampD_height=-0.075)
                            annotation (Placement(transformation(
            rotation=270,
            extent={{-20,-20},{20,20}},
            origin={0,118})));
    equation
      connect(zeroInputs.y, plant.uPSS) annotation (Line(points={{-158,80},{-26,80},{-26,26},{35.2,26}},
                                                                                                      color={0,0,127}));
      connect(rampingLoad.y,add. u2) annotation (Line(
          points={{-137,-167},{-124,-167},{-124,-152},{-114,-152}},
          color={238,46,47},
          thickness=1));
      connect(add.y, plant.uLoad9) annotation (Line(
          points={{-68,-140},{-46,-140},{-46,-46},{35.2,-46}},
          color={0,140,72},
          thickness=1));
      connect(r, plant.uAVRin) annotation (Line(points={{-223,1},{20,1},{20,2},{35.2,2}}, color={0,0,127}));
      connect(plant.w, w) annotation (Line(points={{160,2},{186,2},{186,0},{210,0}},
                                                                     color={0,0,127}));
      connect(add.u1, zeroInputs.y) annotation (Line(points={{-114,-128},{-138,-128},{-138,80},{-158,80}}, color={0,0,127}));
                                                                //,
    //      __Dymola_selections={Selection(name="MySelection", match={MatchVariable(name="plant.Vt", newName="Vt"),MatchVariable(name="plant.Q", newName="Q"),MatchVariable(name="plant.P",newName="P"),MatchVariable(name="plant.w",newName="w"),MatchVariable(name="plant.AVRin",newName="u"),MatchVariable(name="plant.AVRout",newName="AVRout"),MatchVariable(name="timedMultiRamp.y",newName="rampY"),MatchVariable(name="plant.Load9.P",newName="Pload"),MatchVariable(name="r.y",newName="r"),MatchVariable(name="plant.g1.pss.vs",newName="pssy"),MatchVariable(name="ramping.y",newName="rampingy")})});
      connect(plant.uLoad7, uLoad7) annotation (Line(points={{35.2,-22},{-112,-22},{-112,-40},{-220,-40}}, color={0,0,127}));
      connect(plant.uPm, ramping.y) annotation (Line(
          points={{36,50},{0,50},{0,96}},
          color={238,46,47},
          thickness=1));
      annotation (
        Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end KchangeLinRamping;
  end CaseBSequentialRedesignMaxDamping;
end PSSRedesign;
