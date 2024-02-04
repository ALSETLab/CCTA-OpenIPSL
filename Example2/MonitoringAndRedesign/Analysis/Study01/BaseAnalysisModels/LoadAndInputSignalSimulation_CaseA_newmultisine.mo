within Example2.MonitoringAndRedesign.Analysis.Study01.BaseAnalysisModels;
model LoadAndInputSignalSimulation_CaseA_newmultisine
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
  Base.Systems.Study01.PlantTripIO plantTripIO annotation (Placement(transformation(extent={{-64,8},{-36,36}})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-228,-180},{-208,-160}})));
  CustomComponents.TimedNoiseInjection uL7_timedNoiseInjection(
    samplePeriod=0.01,
    sigma=0.01,
    threshold=0.1)
    annotation (Placement(transformation(extent={{-200,-8},{-180,8}})));
  CustomComponents.TimedNoiseInjection uL9_timedNoiseInjection1(
    samplePeriod=0.01,
    sigma=0.01,
    threshold=0.1)
    annotation (Placement(transformation(extent={{-200,-38},{-180,-22}})));
  CustomComponents.TimedInputInjection timedInputInjection(k=1/20)
    annotation (Placement(transformation(extent={{-208,30},{-188,50}})));
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
  connect(timedInputInjection.y, plantTripIO.uAVRin) annotation (Line(
      points={{-187,40},{-152,40},{-152,22},{-92,22}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uL9_timedNoiseInjection1.y, plantTripIO.uLoad9) annotation (Line(
      points={{-179,-30},{-148,-30},{-148,4},{-116,4},{-92,4},{-92,5.2}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-220,-140},{100,
            100}})),
    experiment(
      StopTime=1320,
      __Dymola_NumberOfIntervals=10000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end LoadAndInputSignalSimulation_CaseA_newmultisine;
