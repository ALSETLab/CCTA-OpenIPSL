within Example2.MonitoringAndRedesign.Analysis.Study01.ControllerRedesignSimulationTests;
model RedesignTestingNoNoiseNoInput_kw57p55_tw1p93
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant PSSchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-110,70})));
  Modelica.Blocks.Sources.Constant Pmchange(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-150,70})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=false)
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  Base.Systems.Study01.PlantTripIO plantTripIO(
    Kw=57.55,
    Tw=1.93,
    T1=Modelica.Constants.small,
    T2=Modelica.Constants.small,
    T3=Modelica.Constants.small,
    T4=Modelica.Constants.small,
    t1busfault=120,
    t2busfault=120 + 3/60) annotation (Placement(transformation(extent={{-64,8},{-36,36}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-228,-180},{-208,-160}})));
  Modelica.Blocks.Sources.Constant     uL7_timedNoiseInjection(k=0)
    annotation (Placement(transformation(extent={{-200,-8},{-180,8}})));
  Modelica.Blocks.Sources.Constant     const(k=0)
    annotation (Placement(transformation(extent={{-200,30},{-180,50}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-162,-40},{-142,-20}})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=3,
    width=100,
    period=8/60,
    nperiod=1,
    offset=0,
    startTime=60)
    annotation (Placement(transformation(extent={{-200,-70},{-180,-50}})));
  Modelica.Blocks.Sources.Constant     uL9_timedNoiseInjection1(k=0)
    annotation (Placement(transformation(extent={{-200,-40},{-180,-20}})));
equation
  connect(PSSchange.y, plantTripIO.uPm) annotation (Line(
      points={{-110,59},{-110,44},{-91.72,44},{-91.72,38.8}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(Pmchange.y, plantTripIO.uPSS) annotation (Line(
      points={{-150,59},{-150,30.4},{-92,30.4}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uL7_timedNoiseInjection.y, plantTripIO.uLoad7) annotation (Line(
      points={{-179,0},{-166,0},{-140,0},{-140,14},{-108,14},{-108,13.6},{-92,
          13.6}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(const.y, plantTripIO.uAVRin) annotation (Line(
      points={{-179,40},{-152,40},{-152,22},{-92,22}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(pulse.y, add.u2) annotation (Line(points={{-179,-60},{-164,-60},{-164,
          -36}}, color={0,0,127}));
  connect(uL9_timedNoiseInjection1.y, add.u1) annotation (Line(
      points={{-179,-30},{-176,-30},{-176,-26},{-172,-26},{-164,-26},{-164,-24}},
      color={0,0,127},
      smooth=Smooth.Bezier));

  connect(add.y, plantTripIO.uLoad9) annotation (Line(
      points={{-141,-30},{-128,-30},{-128,4},{-116,4},{-92,4},{-92,5.2}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-220,-140},{100,
            100}})),
    experiment(
      StopTime=180,
      __Dymola_NumberOfIntervals=10000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end RedesignTestingNoNoiseNoInput_kw57p55_tw1p93;
