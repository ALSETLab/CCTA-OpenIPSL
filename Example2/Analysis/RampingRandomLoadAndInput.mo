within Example2.Analysis;
model RampingRandomLoadAndInput
  "Model to perform blind estimation with default controller and re-design"
  extends Modelica.Icons.Example;
  Example2.Base.Systems.SysDtunedG14sstPSSTGRevG3plusPSS plant(
    g1(Rdroop=0.025),
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
    pss5_Tw=0.380100702453755)
    annotation (Placement(transformation(extent={{58,-40},{138,40}})));
  Modelica.Blocks.Sources.Constant zeroInputs(k=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-122,80})));

  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
    annotation (Placement(transformation(extent={{60,-190},{140,-112}})));
  Example2.CustomComponents.TimedInjectionOnOffTableData r
    annotation (Placement(transformation(extent={{-142,-22},{-100,20}})));
  Example2.CustomComponents.TimedNoiseInjection uL7(
    samplePeriod=0.01,
    sigma=0.1*0.25,
    threshold=30.0)
    annotation (Placement(transformation(extent={{-140,-78},{-98,-36}})));
  Modelica.Blocks.Sources.RealExpression rampingLoad(y=ramping.y) annotation (Placement(transformation(extent={{-200,-196},{-140,-138}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-110,-160},{-70,-120}})));
  Example2.CustomComponents.TimedMultiRamp ramping(
    rampA_height=0.2,
    rampB_height=0.125,
    rampC_height=-0.075,
    rampD_height=-0.075) annotation (Placement(transformation(
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
      Tolerance=1e-03,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),preferredView="diagram");
end RampingRandomLoadAndInput;
