within Example2.MonitoringAndRedesign.Analysis.Study01.ParametrizedRedisgnedControllers;
model Base "Controller with Kundur's book parameters"
  extends Example2.Utilities.Icons.PartialExample;

  Modelica.Blocks.Interfaces.RealInput uPm
    annotation (Placement(transformation(extent={{-144,60},{-104,100}})));
  Modelica.Blocks.Interfaces.RealInput uPSS
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput uVsAVR "Feedback input"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealInput uLoadB7
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Interfaces.RealInput uLoadB9
    annotation (Placement(transformation(extent={{-138,-100},{-98,-60}})));
  .Example2.MonitoringAndRedesign.Base.Systems.Study01.PlantTripIO plantTripIO(
    t1=t1,
    vsmax=cntrlData.vsmax,
    vsmin=cntrlData.vsmin,
    Kw=cntrlData.Kw,
    Tw=cntrlData.Tw,
    T1=cntrlData.T1,
    T2=cntrlData.T2,
    T3=cntrlData.T3,
    T4=cntrlData.T4)
    annotation (Placement(transformation(extent={{-12,-22},{32,22}})));
  Modelica.Blocks.Interfaces.RealOutput Vt
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput P
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput Q
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
  Modelica.Blocks.Interfaces.RealOutput AVRout1
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));
  Modelica.Blocks.Interfaces.RealOutput w
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Interfaces.RealOutput delta
    annotation (Placement(transformation(extent={{100,-30},{120,-10}})));
  Modelica.Blocks.Interfaces.RealOutput AVRin
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
  replaceable Study01.ControllerData.CntrlDataTemplate cntrlData constrainedby
    Study01.ControllerData.CntrlDataTemplate                                                                            annotation (Placement(transformation(extent={{78,-98},{98,-78}})));
  parameter OpenIPSL.Types.Time t1=361;
equation
  connect(plantTripIO.Vt, Vt) annotation (Line(
      points={{78.2,26.4},{78.2,60},{110,60}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(plantTripIO.P, P) annotation (Line(
      points={{78.2,17.6},{78.2,16},{86,16},{86,40},{110,40}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(plantTripIO.Q, Q) annotation (Line(
      points={{78.2,8.8},{89.1,8.8},{89.1,20},{110,20}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(plantTripIO.AVRout, AVRout1) annotation (Line(
      points={{78.2,-26.4},{78.2,-60},{110,-60}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(plantTripIO.w, w) annotation (Line(
      points={{78.2,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(plantTripIO.delta, delta) annotation (Line(
      points={{78.2,-8.8},{94,-8.8},{94,-20},{110,-20}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(plantTripIO.AVRin, AVRin) annotation (Line(
      points={{78.2,-17.6},{78.2,-16},{90,-16},{90,-40},{110,-40}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uPm, plantTripIO.uPm) annotation (Line(
      points={{-124,80},{-90,80},{-90,26.4},{-55.56,26.4}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uPSS, plantTripIO.uPSS) annotation (Line(
      points={{-120,40},{-92,40},{-92,13.2},{-56,13.2}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uVsAVR, plantTripIO.uAVRin) annotation (Line(
      points={{-120,0},{-56,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uLoadB7, plantTripIO.uLoad7) annotation (Line(
      points={{-120,-40},{-64,-40},{-64,-13.2},{-56,-13.2}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uLoadB9, plantTripIO.uLoad9) annotation (Line(
      points={{-118,-80},{-56,-80},{-56,-26.4}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)), preferredView = "diagram");
end Base;
