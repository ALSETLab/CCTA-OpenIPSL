within Example2.MonitoringAndRedesign.Analysis.Study01;
model NonlinModelForLinearizationTwoOutputs
  extends Example2.Utilities.Icons.ModelForLinearization;
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
  Base.Systems.Study01.PlantTripIOTwoOutputs plantTripIOTwoOutputs(t1=361, redeclare ReferenceSimulationModels.Data.PF1 PF_results) annotation (Placement(transformation(extent={{-12,-20},{32,24}})));
  Modelica.Blocks.Interfaces.RealOutput Vt
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput w
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(plantTripIOTwoOutputs.Vt, Vt) annotation (Line(
      points={{78.2,28.4},{78.2,60},{110,60}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(plantTripIOTwoOutputs.w, w) annotation (Line(
      points={{78.2,2},{94,2},{94,0},{110,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uPm, plantTripIOTwoOutputs.uPm) annotation (Line(
      points={{-124,80},{-90,80},{-90,28.4},{-55.56,28.4}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uPSS, plantTripIOTwoOutputs.uPSS) annotation (Line(
      points={{-120,40},{-92,40},{-92,15.2},{-56,15.2}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uVsAVR, plantTripIOTwoOutputs.uAVRin) annotation (Line(
      points={{-120,0},{-88,0},{-88,2},{-56,2}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uLoadB7, plantTripIOTwoOutputs.uLoad7) annotation (Line(
      points={{-120,-40},{-64,-40},{-64,-11.2},{-56,-11.2}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uLoadB9, plantTripIOTwoOutputs.uLoad9) annotation (Line(
      points={{-118,-80},{-56,-80},{-56,-24.4}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end NonlinModelForLinearizationTwoOutputs;
