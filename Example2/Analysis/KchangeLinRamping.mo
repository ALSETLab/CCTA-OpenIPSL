within Example2.Analysis;
model KchangeLinRamping
  "Model to perform blind estimation with default controller and re-design"
  extends Example2.Utilities.Icons.ModelForLinearization;
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
    annotation (Placement(transformation(extent={{60,-38},{140,42}})));
  Modelica.Blocks.Sources.Constant zeroInputs(k=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-180,80})));

  Modelica.Blocks.Interfaces.RealInput          r annotation (Placement(transformation(extent={{-244,-20},{-202,22}}), iconTransformation(extent={{-142,-22},{-100,20}})));
  Modelica.Blocks.Sources.RealExpression rampingLoad(y=ramping.y) annotation (Placement(transformation(extent={{-200,-196},{-140,-138}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-110,-160},{-70,-120}})));
  Modelica.Blocks.Interfaces.RealOutput w annotation (Placement(transformation(extent={{200,-10},{220,10}}), iconTransformation(extent={{192,-10},{212,10}})));
  Modelica.Blocks.Interfaces.RealInput uLoad7 annotation (Placement(transformation(extent={{-240,-60},{-200,-20}}), iconTransformation(extent={{-244,-64},{-204,-24}})));
  Example2.CustomComponents.TimedMultiRamp ramping(
    rampA_height=0.2,
    rampB_height=0.125,
    rampC_height=-0.075,
    rampD_height=-0.075) annotation (Placement(transformation(
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