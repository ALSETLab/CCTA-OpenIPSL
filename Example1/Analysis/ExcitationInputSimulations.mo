within Example1.Analysis;
package ExcitationInputSimulations

  model noInputs
    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Example1.Base.Systems.gridIO sMIB_AVR_PSS_wInput_wLineRmoval_propagate(t1=0.5)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    Modelica.Blocks.Sources.Constant AVRchange(k=0)
      annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
          false)
      annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
    Modelica.Blocks.Sources.Constant Ploadchange(k=0) annotation (Placement(
          transformation(extent={{-100,-26},{-80,-6}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
  equation
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.uPSS, PSSchange.y)
      annotation (Line(points={{-45.7143,35},{-62.8572,35},{-62.8572,46},{-79,
            46}},      color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.uPm, Pmchange.y)
      annotation (Line(points={{-45.7143,15},{-62,15},{-62,16},{-79,16}},
                                                      color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.Vt, Vt) annotation (Line(
          points={{42.8571,25},{72.4286,25},{72.4286,80},{110,80}},
          color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.P, P) annotation (Line(
          points={{42.8571,15},{73.4286,15},{73.4286,40},{110,40}},
          color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.Q, Q)
      annotation (Line(points={{42.8571,5},{76,5},{76,0},{110,0}},
                                                     color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.w, w) annotation (Line(
          points={{42.8571,-5},{73.4286,-5},{73.4286,-40},{110,-40}},
          color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.delta, delta) annotation (
        Line(points={{42.8571,-15},{72.4286,-15},{72.4286,-80},{110,-80}},
          color={0,0,127}));
    connect(AVRchange.y, sMIB_AVR_PSS_wInput_wLineRmoval_propagate.uvs)
      annotation (Line(points={{-79,-50},{-64,-50},{-64,-25},{-45.1429,-25}},
                                 color={0,0,127}));
    connect(Ploadchange.y, sMIB_AVR_PSS_wInput_wLineRmoval_propagate.uPload)
      annotation (Line(points={{-79,-16},{-64,-16},{-64,-10},{-45.7143,-10}},
                                 color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.AVRin, AVRin)
      annotation (Line(points={{42.8571,-25},{68,-25},{68,-100},{110,-100}},
                    color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.AVRout, AVRout)
      annotation (Line(points={{42.8571,-32.5},{58,-32.5},{58,-120},{110,-120}},
                        color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
              {-120,-100},{100,100}})),                            Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-92,-80},{48,-102}},
            lineColor={162,29,33},
            horizontalAlignment=TextAlignment.Left,
            textString="Note: 
Click on the \"Plant\" block to specify controller parameters.")}),
      experiment(
        StopTime=360,
        __Dymola_NumberOfIntervals=10000,
        Tolerance=1e-06,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"));
  end noInputs;

  model noise_avrinput_lowimpactmultisine

    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Example1.Base.Systems.gridIO Plant(t1=0.5)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
          false)
      annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Utilities.EventTriggerSnapshot eventTriggerSnapshot
      annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
    CustomComponents.TimedNoiseInjection loadnoise
      annotation (Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Pulse uloaddist(
      amplitude=1.25,
      width=100,
      period=8/60,
      nperiod=1,
      offset=0,
      startTime=1245) annotation (Placement(transformation(extent={{-160,
              -38},{-140,-18}})));
    CustomComponents.TimedInputInjection timedInputInjection_LowImpact
      annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-45.7143,35},{
            -62.8572,35},{-62.8572,46},{-79,46}},      color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-45.7143,15},{-62,
            15},{-62,16},{-79,16}},          color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42.8571,25},{72.4286,25},{
            72.4286,80},{110,80}},              color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42.8571,15},{73.4286,15},{
            73.4286,40},{110,40}},      color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42.8571,5},{76,5},{76,0},{110,
            0}},         color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42.8571,-5},{73.4286,-5},{
            73.4286,-40},{110,-40}},      color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42.8571,-15},{72.4286,
            -15},{72.4286,-80},{110,-80}},          color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{60,-100},{
            60,-25},{42.8571,-25}},        color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},
            {52,-32.5},{42.8571,-32.5}},          color={0,0,127}));
    connect(uload.u1, loadnoise.y) annotation (Line(points={{-122,-6},{
            -132,-6},{-132,12},{-139,12}}, color={0,0,127}));
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-139,-28},
            {-132,-28},{-132,-18},{-122,-18}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,
            -12},{-72.5,-10},{-45.7143,-10}},     color={0,0,127}));
    connect(timedInputInjection_LowImpact.y, Plant.uvs) annotation (
        Line(points={{-79,-50},{-62,-50},{-62,-25},{-45.1429,-25}},
          color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-96,-80},{44,-102}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        Interval=60,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"));
  end noise_avrinput_lowimpactmultisine;

  model nonoise_noinput_load_disturbance

    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Example1.Base.Systems.gridIO Plant(
      t1=0.5,
      Kw=12.6924,
      Tw=0.5602)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
          false)
      annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Utilities.EventTriggerSnapshot eventTriggerSnapshot
      annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
    Modelica.Blocks.Sources.Constant loadnoise(k=0) annotation (
        Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Pulse uloaddist(
      amplitude=1.25,
      width=100,
      period=8/60,
      nperiod=1,
      offset=0,
      startTime=1245) annotation (Placement(transformation(extent={{-158,
              -38},{-138,-18}})));
    Modelica.Blocks.Sources.Constant uARVinput(k=0) annotation (
        Placement(transformation(extent={{-102,-50},{-82,-30}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-45.7143,35},{
            -62.8572,35},{-62.8572,46},{-79,46}},      color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-45.7143,15},{-62,
            15},{-62,16},{-79,16}},          color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42.8571,25},{72.4286,25},{
            72.4286,80},{110,80}},              color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42.8571,15},{73.4286,15},{
            73.4286,40},{110,40}},      color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42.8571,5},{76,5},{76,0},{110,
            0}},         color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42.8571,-5},{73.4286,-5},{
            73.4286,-40},{110,-40}},      color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42.8571,-15},{72.4286,
            -15},{72.4286,-80},{110,-80}},          color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{60,-100},{
            60,-25},{42.8571,-25}},        color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},
            {52,-32.5},{42.8571,-32.5}},          color={0,0,127}));
    connect(uload.u1, loadnoise.y) annotation (Line(points={{-122,-6},{
            -132,-6},{-132,12},{-139,12}}, color={0,0,127}));
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-137,-28},
            {-132,-28},{-132,-18},{-122,-18}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,
            -12},{-72.5,-10},{-45.7143,-10}},     color={0,0,127}));
    connect(uARVinput.y, Plant.uvs) annotation (Line(points={{-81,-40},{-64,-40},
            {-64,-25},{-45.1429,-25}},           color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-98,-78},{42,-100}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        __Dymola_NumberOfIntervals=20000,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"));
  end nonoise_noinput_load_disturbance;

  model noise_only_loads_input

    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Example1.Base.Systems.gridIO Plant(t1=0.5)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
          false)
      annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Utilities.EventTriggerSnapshot eventTriggerSnapshot
      annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
    CustomComponents.TimedNoiseInjection loadnoise
      annotation (Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Constant
                                  uloaddist(k=0)
                      annotation (Placement(transformation(extent={{-160,
              -38},{-140,-18}})));
    Modelica.Blocks.Sources.Constant uAVR(k=0)
      annotation (Placement(transformation(extent={{-100,-50},{-80,-30}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-45.7143,35},{
            -62.8572,35},{-62.8572,46},{-79,46}},      color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-45.7143,15},{-62,
            15},{-62,16},{-79,16}},          color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42.8571,25},{72.4286,25},{
            72.4286,80},{110,80}},              color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42.8571,15},{73.4286,15},{
            73.4286,40},{110,40}},      color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42.8571,5},{76,5},{76,0},{110,
            0}},         color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42.8571,-5},{73.4286,-5},{
            73.4286,-40},{110,-40}},      color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42.8571,-15},{72.4286,
            -15},{72.4286,-80},{110,-80}},          color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{60,-100},{
            60,-25},{42.8571,-25}},        color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},
            {52,-32.5},{42.8571,-32.5}},          color={0,0,127}));
    connect(uload.u1, loadnoise.y) annotation (Line(points={{-122,-6},{
            -132,-6},{-132,12},{-139,12}}, color={0,0,127}));
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-139,-28},
            {-132,-28},{-132,-18},{-122,-18}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,
            -12},{-72.5,-10},{-45.7143,-10}},     color={0,0,127}));
    connect(uAVR.y, Plant.uvs) annotation (Line(points={{-79,-40},{-54,-40},{
            -54,-25},{-45.1429,-25}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-96,-80},{44,-102}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        Interval=60,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"));
  end noise_only_loads_input;

  model noise_random_loads_1Hz_switching

    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Example1.Base.Systems.gridIO Plant(t1=0.5)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
          false)
      annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Utilities.EventTriggerSnapshot eventTriggerSnapshot
      annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
    CustomComponents.TimedNoiseInjection loadnoise
      annotation (Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Pulse uloaddist(
      amplitude=0.25,
      width=5,
      period=1,
      offset=0.25,
      startTime=0.1)  annotation (Placement(transformation(extent={{-160,
              -38},{-140,-18}})));
    Modelica.Blocks.Sources.Constant uAVR(k=0)
      annotation (Placement(transformation(extent={{-100,-50},{-80,-30}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-45.7143,35},{
            -62.8572,35},{-62.8572,46},{-79,46}},      color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-45.7143,15},{-62,
            15},{-62,16},{-79,16}},          color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42.8571,25},{72.4286,25},{
            72.4286,80},{110,80}},              color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42.8571,15},{73.4286,15},{
            73.4286,40},{110,40}},      color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42.8571,5},{76,5},{76,0},{110,
            0}},         color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42.8571,-5},{73.4286,-5},{
            73.4286,-40},{110,-40}},      color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42.8571,-15},{72.4286,
            -15},{72.4286,-80},{110,-80}},          color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{60,-100},{
            60,-25},{42.8571,-25}},        color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},
            {52,-32.5},{42.8571,-32.5}},          color={0,0,127}));
    connect(uload.u1, loadnoise.y) annotation (Line(points={{-122,-6},{
            -132,-6},{-132,12},{-139,12}}, color={0,0,127}));
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-139,-28},
            {-132,-28},{-132,-18},{-122,-18}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,
            -12},{-72.5,-10},{-45.7143,-10}},     color={0,0,127}));
    connect(uAVR.y, Plant.uvs) annotation (Line(points={{-79,-40},{-54,-40},{
            -54,-25},{-45.1429,-25}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-96,-80},{44,-102}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        Interval=60,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"));
  end noise_random_loads_1Hz_switching;
end ExcitationInputSimulations;
