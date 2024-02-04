within Example2.MonitoringAndRedesign.Analysis.Study01.BaseAnalysisModels;
model InputSignalOnly
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
  CustomComponents.TimedInputInjection timedInputInjection(k=0.1)
    annotation (Placement(transformation(extent={{-208,30},{-188,50}})));
  Modelica.Blocks.Sources.Constant change_Zero(k=0)
    annotation (Placement(transformation(extent={{-180,-2},{-160,18}})));
equation
  connect(PSSchange.y, plantTripIO.uPm) annotation (Line(
      points={{-110,59},{-110,44},{-91.72,44},{-91.72,38.8}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(Pmchange.y, plantTripIO.uPSS) annotation (Line(
      points={{-150,59},{-150,30.4},{-92,30.4}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(timedInputInjection.y, plantTripIO.uAVRin) annotation (Line(
      points={{-187,40},{-152,40},{-152,22},{-92,22}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(change_Zero.y, plantTripIO.uLoad7) annotation (Line(points={{-159,8},
          {-100,8},{-100,13.6},{-92,13.6}}, color={0,0,127}));
  connect(plantTripIO.uLoad9, plantTripIO.uLoad7) annotation (Line(points={{-92,
          5.2},{-100,8},{-100,13.6},{-92,13.6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-220,-140},{100,
            100}})),
    experiment(
      StopTime=1320,
      __Dymola_NumberOfIntervals=10000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end InputSignalOnly;
