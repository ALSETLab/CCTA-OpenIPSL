within Example1.Analysis;
package RedesignedControllerVerification
  "Simulations to verify the new control designs to failure"
  model C0_fail_conditions

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
    Modelica.Blocks.Sources.Constant loadnoise(k=0) annotation (
        Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Pulse uloaddist(
      amplitude=1.3275,
      width=100,
      period=22/60,
      nperiod=1,
      offset=0,
      startTime=1245) annotation (Placement(transformation(extent={{
              -160,-40},{-140,-20}})));
    Modelica.Blocks.Sources.Constant uARVinput(k=0) annotation (
        Placement(transformation(extent={{-102,-50},{-82,-30}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-44,36},{
            -62.8572,36},{-62.8572,46},{-79,46}},      color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-44.4,12},{-62,12},
            {-62,16},{-79,16}},              color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42,32},{72.4286,32},{
            72.4286,80},{110,80}},              color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42,24},{73.4286,24},{73.4286,
            40},{110,40}},              color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42,16},{76,16},{76,0},{110,0}},
                         color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42,0},{73.4286,0},{73.4286,
            -40},{110,-40}},              color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42,-16},{72.4286,-16},
            {72.4286,-80},{110,-80}},               color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{60,-100},{
            60,-24},{42,-24}},             color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},
            {52,-32},{42,-32}},                   color={0,0,127}));
    connect(uload.u1, loadnoise.y) annotation (Line(points={{-122,-6},{
            -132,-6},{-132,12},{-139,12}}, color={0,0,127}));
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-139,-30},
            {-132,-30},{-132,-18},{-122,-18}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,
            -12},{-72.5,-12},{-44,-12}},          color={0,0,127}));
    connect(uARVinput.y, Plant.uvs) annotation (Line(points={{-81,-40},{-64,-40},
            {-64,-36},{-44,-36}},                color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-100,-80},{40,-102}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        __Dymola_NumberOfIntervals=20000,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"));
  end C0_fail_conditions;

  model C1_fail_conditions

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
      Kw=22.4455,
      Tw=0.5217)
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
    Modelica.Blocks.Sources.Constant loadnoise(k=0) annotation (
        Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Pulse uloaddist(
      amplitude=1.3275,
      width=100,
      period=25/60,
      nperiod=1,
      offset=0,
      startTime=1245) annotation (Placement(transformation(extent={{
              -160,-40},{-140,-20}})));
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
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-139,-30},
            {-132,-30},{-132,-18},{-122,-18}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,
            -12},{-72.5,-10},{-45.7143,-10}},     color={0,0,127}));
    connect(uARVinput.y, Plant.uvs) annotation (Line(points={{-81,-40},{-64,-40},
            {-64,-25},{-45.1429,-25}},           color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-100,-80},{40,-102}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        __Dymola_NumberOfIntervals=20000,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"));
  end C1_fail_conditions;

  model C2_fail_conditions

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
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
          false)
      annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Example1.Base.Systems.gridIO Plant(
      t1=0.5,
      Kw=12.6924,
      Tw=0.5602)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    Modelica.Blocks.Sources.Constant loadnoise(k=0) annotation (
        Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Pulse uloaddist(
      amplitude=1.3275,
      width=100,
      period=24/60,
      nperiod=1,
      offset=0,
      startTime=1245) annotation (Placement(transformation(extent={{
              -160,-40},{-140,-20}})));
    Modelica.Blocks.Sources.Constant uARVinput(k=0) annotation (
        Placement(transformation(extent={{-102,-50},{-82,-30}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-44,36},{-62.8572,36},
            {-62.8572,46},{-79,46}},                   color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-44.4,12},{-62,12},{-62,
            16},{-79,16}},                   color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42,32},{72.4286,32},{72.4286,80},
            {110,80}},                          color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42,24},{73.4286,24},{73.4286,40},
            {110,40}},                  color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42,16},{76,16},{76,0},{110,0}},
                         color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42,0},{73.4286,0},{73.4286,-40},
            {110,-40}},                   color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42,-16},{72.4286,-16},{72.4286,
            -80},{110,-80}},                        color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{60,-100},{60,
            -24},{42,-24}},                color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},{52,
            -32},{42,-32}},                       color={0,0,127}));
    connect(uload.u1, loadnoise.y) annotation (Line(points={{-122,-6},{
            -132,-6},{-132,12},{-139,12}}, color={0,0,127}));
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-139,-30},
            {-132,-30},{-132,-18},{-122,-18}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,-12},
            {-72.5,-12},{-44,-12}},               color={0,0,127}));
    connect(uARVinput.y, Plant.uvs) annotation (Line(points={{-81,-40},{-64,-40},{
            -64,-36},{-44,-36}},                 color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-100,-80},{40,-102}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        __Dymola_NumberOfIntervals=20000,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"));
  end C2_fail_conditions;
  annotation (Icon(graphics={
        Rectangle(
          fillColor={239,46,49},
          fillPattern=FillPattern.Solid,
          extent={{-100,-100},{100,100}},
          radius=25,
          lineColor={127,22,22},
          lineThickness=1),
      Rectangle(
        origin={0,35.149},
        fillColor={255,255,255},
        extent={{-30.0,-20.1488},{30.0,20.1488}},
          lineColor={255,255,255},
          lineThickness=1),
      Rectangle(
        origin={0,-34.851},
        fillColor={255,255,255},
        extent={{-30.0,-20.1488},{30.0,20.1488}},
          lineColor={255,255,255},
          lineThickness=1),
      Line(
        origin={-51.25,-2},
        points={{21.25,-35.0},{-13.75,-35.0},{-13.75,35.0},{6.25,35.0}},
          color={255,255,255},
          thickness=1),
      Polygon(
        origin={-40,35},
        pattern=LinePattern.None,
        points={{10.0,0.0},{-5.0,5.0},{-5.0,-5.0}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
      Line(
        origin={51.25,0},
        points={{-21.25,35.0},{13.75,35.0},{13.75,-35.0},{-6.25,-35.0}},
          color={255,255,255},
          thickness=1),
      Polygon(
        origin={40,-35},
        pattern=LinePattern.None,
        points={{-10.0,0.0},{5.0,5.0},{5.0,-5.0}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}),preferredView = "info");
end RedesignedControllerVerification;
