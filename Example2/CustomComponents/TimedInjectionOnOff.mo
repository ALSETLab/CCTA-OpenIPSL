within Example2.CustomComponents;
model TimedInjectionOnOff
  parameter Real talpha = 0 "start of the scenario";
  parameter Real t2p5 = 150 "Ramping interval (default 2.5 min)";
  parameter Real t5p0 = 300 "Probing interval (default 5.0 min)";

  parameter Real tnin_start = talpha + t2p5;
  parameter Real tnin_duration = t2p5;

  parameter Real tramp1_start=t2p5 annotation (Dialog(group="Default Ramp Values"));
  parameter Real tramp1_duration=tnin_start + tnin_duration annotation (Dialog(group="Default Ramp Values"));

  parameter Real tA_start = tramp1_start + tramp1_duration;
  parameter Real tA_duration = t5p0;

  parameter Real tB_start = tA_start + tA_duration;
  parameter Real tB_duration = t5p0;

  parameter Real tC_start = tB_start + tB_duration;
  parameter Real tC_duration = t5p0;

  parameter Real tramp2_start=tC_start + tC_duration annotation (Dialog(group="Default Ramp Values"));
  parameter Real tramp2_duration=t2p5 annotation (Dialog(group="Default Ramp Values"));

  parameter Real tbeta = tramp2_start + tramp2_duration;

  parameter Real tD_start = tbeta + t2p5;
  parameter Real tD_duration = t5p0;

  parameter Real tE_start = tD_start + tD_duration;
  parameter Real tE_duration = t5p0;

  parameter Real tramp3_start = tE_start + tE_duration  annotation (Dialog(group="Default Ramp Values"));
  parameter Real tramp3_duration = t2p5 annotation (Dialog(group="Default Ramp Values"));

  parameter Real tgamma = tramp3_start + tramp3_duration;

  parameter Real tF_start = tgamma + t2p5;
  parameter Real tF_duration = t5p0;

  parameter Real tG_start = tF_start + tF_duration;
  parameter Real tG_duration = t5p0;

  parameter Real tramp4_start = tG_start + tG_duration annotation (Dialog(group="Default Ramp Values"));
  parameter Real tramp4_duration = t2p5  annotation (Dialog(group="Default Ramp Values"));

  parameter Real tdelta = tramp4_start + tramp4_duration;

  parameter Real tH_start = tdelta + t2p5;
  parameter Real tH_duration = t5p0;

  parameter Real tI_start = tH_start + tH_duration;
  parameter Real tI_duration = t5p0;

  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(rotation=0, extent={{99,-10},{129,10}}), iconTransformation(extent={{101,-10},{131,10}})));
  parameter Real timedinjection_threshold=60 "Time threshold to inject the signal" annotation (Dialog(group="Timed Injection Parameters"));
  TimedInputInjectionOnOff injectionAt_tB_tC(t_start=tB_start, t_stop=tC_start) annotation (Placement(transformation(extent={{-40,48},{-4,84}})));
  TimedInputInjectionOnOff injectionAt_tD_tE(t_start=tD_start, t_stop=tE_start) annotation (Placement(transformation(extent={{-40,0},{-4,36}})));
  TimedInputInjectionOnOff injectionAt_tF_tG(t_start=tF_start, t_stop=tG_start) annotation (Placement(transformation(extent={{-40,-50},{-4,-14}})));
  TimedInputInjectionOnOff injectionAt_tF_tG1(t_start=tH_start, t_stop=tI_start) annotation (Placement(transformation(extent={{-40,-98},{-4,-62}})));
  Modelica.Blocks.Interfaces.RealInput
                               u                            annotation (Placement(transformation(extent={{-120,-10},{-100,10}}), iconTransformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Math.Sum Injection(nin=4) annotation (Placement(transformation(extent={{34,-10},{54,10}})));
equation
  connect(Injection.y, y) annotation (Line(
      points={{55,0},{94,0},{114,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(injectionAt_tB_tC.y, Injection.u[1]) annotation (Line(
      points={{-2.2,66},{22,66},{22,-0.75},{32,-0.75}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(injectionAt_tD_tE.y, Injection.u[2]) annotation (Line(
      points={{-2.2,18},{22,18},{22,-0.25},{32,-0.25}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(injectionAt_tF_tG.y, Injection.u[3]) annotation (Line(
      points={{-2.2,-32},{22,-32},{22,0.25},{32,0.25}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(injectionAt_tF_tG1.y, Injection.u[4]) annotation (Line(
      points={{-2.2,-80},{22,-80},{22,0.75},{32,0.75}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(injectionAt_tB_tC.u, u) annotation (Line(points={{-43.6,66},{-96,66},
          {-96,0},{-110,0}}, color={0,0,127}));
  connect(injectionAt_tD_tE.u, u) annotation (Line(points={{-43.6,18},{-96,18},
          {-96,0},{-110,0}}, color={0,0,127}));
  connect(injectionAt_tF_tG.u, u) annotation (Line(points={{-43.6,-32},{-96,-32},
          {-96,0},{-110,0}}, color={0,0,127}));
  connect(injectionAt_tF_tG1.u, u) annotation (Line(points={{-43.6,-80},{-96,
          -80},{-96,0},{-110,0}}, color={0,0,127}));
  annotation (Icon(graphics={   Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,228,244},
        fillPattern=FillPattern.Solid),
        Line(points={{80,0},{60,0}}, color={160,160,164}),
        Line(
          points={{0,0},{40,0}},
          thickness=0.5),
        Line(
          points={{0,0},{0,50}},
          thickness=0.5),
        Line(points={{0,80},{0,60}}, color={160,160,164}),
        Line(points={{37,70},{26,50}}, color={160,160,164}),
        Line(points={{70,38},{49,26}}, color={160,160,164}),
                          Line(
          points={{80,-0.1},{68.7,-34.3},{61.5,-53.2},{55.1,-66.5},{49.4,-74.7},{43.8,-79.2},{38.2,-79.9},{32.6,-76.7},{26.9,-69.8},{21.3,-59.5},{14.9,-44.2},{6.83,-21.3},{-10.1,30.7},{-17.3,50.1},{-23.7,64.1},{-29.3,73},{-35,78.3},{-40.6,79.9},{-46.2,77.5},{-51.9,71.4},{-57.5,61.8},{-63.9,47.1},{-72,24.7},{-80,-0.1}},
          color={28,108,200},
          smooth=Smooth.Bezier,
          origin={-10,-2.1},
          rotation=0,
          thickness=1),
        Text(
          extent={{-100,140},{100,100}},
          textColor={28,108,200},
          textString="%name"),
                          Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={162,29,33},
          smooth=Smooth.Bezier,
          origin={2,-18.1},
          rotation=90),   Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={255,0,0},
          smooth=Smooth.Bezier,
          origin={-2,-0.1},
          rotation=90),   Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={255,170,255},
          smooth=Smooth.Bezier,
          origin={-4,19.9},
          rotation=90)}),preferredView="diagram");
end TimedInjectionOnOff;
