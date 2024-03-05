within Example2.Base.Systems;
model TestSystemIODetunedPSSLinNoOutput
  extends Example2.Utilities.Icons.ModelForLinearization;

  Example2.Base.Systems.SystemIODetunedPSS plantTripIODetunedPSS(t1=60)
    annotation (Placement(transformation(extent={{12,-66},{144,66}})));
  Modelica.Blocks.Interfaces.RealInput uPm1 annotation (Placement(transformation(extent={{-140,60},{-100,100}}), iconTransformation(extent={{-140,12},{-100,52}})));
  Modelica.Blocks.Interfaces.RealInput uPSS1 annotation (Placement(transformation(extent={{-140,20},{-100,60}}), iconTransformation(extent={{-138,-2},{-98,38}})));
  Modelica.Blocks.Interfaces.RealInput uAVRin1
                                              "Feedback input" annotation (Placement(transformation(extent={{-140,-20},{-100,20}}), iconTransformation(extent={{-166,-18},{-126,22}})));
  Modelica.Blocks.Interfaces.RealInput uLoad1 annotation (Placement(transformation(extent={{-140,-60},{-100,-20}}), iconTransformation(extent={{-142,-54},{-102,-14}})));
  Modelica.Blocks.Interfaces.RealInput uLoad2 annotation (Placement(transformation(extent={{-140,-100},{-100,-60}}), iconTransformation(extent={{-142,-104},{-102,-64}})));
equation
  connect(uPm1, plantTripIODetunedPSS.uPm) annotation (Line(points={{-120,80},{-40,80},{-40,79.2},{-27.6,79.2}}, color={0,0,127}));
  connect(uPSS1, plantTripIODetunedPSS.uPSS) annotation (Line(points={{-120,40},{-40,40},{-40,39.6},{-28.92,39.6}}, color={0,0,127}));
  connect(uAVRin1, plantTripIODetunedPSS.uAVRin) annotation (Line(points={{-120,0},{-28.92,0}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.uLoad7, uLoad1) annotation (Line(points={{-28.92,-39.6},{-94,-39.6},{-94,-40},{-120,-40}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.uLoad9, uLoad2) annotation (Line(points={{-28.92,-79.2},{-94,-79.2},{-94,-80},{-120,-80}}, color={0,0,127}));
  annotation (experiment(
      StopTime=360,
      __Dymola_NumberOfIntervals=10000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100,-100},{260,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{260,100}})));
end TestSystemIODetunedPSSLinNoOutput;
