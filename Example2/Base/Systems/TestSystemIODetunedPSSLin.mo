within Example2.Base.Systems;
model TestSystemIODetunedPSSLin
  extends Example2.Utilities.Icons.ModelForLinearization;

  Example2.Base.Systems.SystemIODetunedPSS plantTripIODetunedPSS(t1=60)
    annotation (Placement(transformation(extent={{12,-66},{144,66}})));
  Modelica.Blocks.Interfaces.RealInput uPm1 annotation (Placement(transformation(extent={{-140,60},{-100,100}}), iconTransformation(extent={{-140,12},{-100,52}})));
  Modelica.Blocks.Interfaces.RealInput uPSS1 annotation (Placement(transformation(extent={{-140,20},{-100,60}}), iconTransformation(extent={{-138,-2},{-98,38}})));
  Modelica.Blocks.Interfaces.RealInput uAVRin1
                                              "Feedback input" annotation (Placement(transformation(extent={{-140,-20},{-100,20}}), iconTransformation(extent={{-166,-18},{-126,22}})));
  Modelica.Blocks.Interfaces.RealInput uLoad1 annotation (Placement(transformation(extent={{-140,-60},{-100,-20}}), iconTransformation(extent={{-142,-54},{-102,-14}})));
  Modelica.Blocks.Interfaces.RealInput uLoad2 annotation (Placement(transformation(extent={{-140,-100},{-100,-60}}), iconTransformation(extent={{-142,-104},{-102,-64}})));
  Modelica.Blocks.Interfaces.RealOutput Vt1 annotation (Placement(transformation(extent={{260,70},{280,90}}), iconTransformation(extent={{242,70},{262,90}})));
  Modelica.Blocks.Interfaces.RealOutput P1 annotation (Placement(transformation(extent={{260,44},{280,64}}), iconTransformation(extent={{256,44},{276,64}})));
  Modelica.Blocks.Interfaces.RealOutput Q1 annotation (Placement(transformation(extent={{258,16},{278,36}}), iconTransformation(extent={{240,18},{260,38}})));
  Modelica.Blocks.Interfaces.RealOutput w1 annotation (Placement(transformation(extent={{260,-10},{280,10}}), iconTransformation(extent={{238,-8},{258,12}})));
  Modelica.Blocks.Interfaces.RealOutput delta1 annotation (Placement(transformation(extent={{260,-36},{280,-16}}), iconTransformation(extent={{250,-36},{270,-16}})));
  Modelica.Blocks.Interfaces.RealOutput AVRin1 annotation (Placement(transformation(extent={{260,-64},{280,-44}}), iconTransformation(extent={{244,-62},{264,-42}})));
  Modelica.Blocks.Interfaces.RealOutput AVRout1 annotation (Placement(transformation(extent={{260,-88},{280,-68}}), iconTransformation(extent={{230,-88},{250,-68}})));
equation
  connect(uPm1, plantTripIODetunedPSS.uPm) annotation (Line(points={{-120,80},{-40,80},{-40,79.2},{-27.6,79.2}}, color={0,0,127}));
  connect(uPSS1, plantTripIODetunedPSS.uPSS) annotation (Line(points={{-120,40},{-40,40},{-40,39.6},{-28.92,39.6}}, color={0,0,127}));
  connect(uAVRin1, plantTripIODetunedPSS.uAVRin) annotation (Line(points={{-120,0},{-28.92,0}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.uLoad7, uLoad1) annotation (Line(points={{-28.92,-39.6},{-94,-39.6},{-94,-40},{-120,-40}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.uLoad9, uLoad2) annotation (Line(points={{-28.92,-79.2},{-94,-79.2},{-94,-80},{-120,-80}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.Vt, Vt1) annotation (Line(points={{177,79.2},{178,80},{270,80}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.P, P1) annotation (Line(points={{177,52.8},{221.5,52.8},{221.5,54},{270,54}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.Q, Q1) annotation (Line(points={{177,26.4},{178,26},{268,26}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.w, w1) annotation (Line(points={{177,0},{270,0}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.delta, delta1) annotation (Line(points={{177,-26.4},{218.5,-26.4},{218.5,-26},{270,-26}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.AVRin, AVRin1) annotation (Line(points={{177,-52.8},{177,-52},{254,-52},{254,-54},{270,-54}}, color={0,0,127}));
  connect(plantTripIODetunedPSS.AVRout, AVRout1) annotation (Line(points={{177,-79.2},{254,-79.2},{254,-78},{270,-78}}, color={0,0,127}));
  annotation (experiment(
      StopTime=360,
      __Dymola_NumberOfIntervals=10000,
      Tolerance=1e-12,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-100,-100},{260,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{260,100}})));
end TestSystemIODetunedPSSLin;
