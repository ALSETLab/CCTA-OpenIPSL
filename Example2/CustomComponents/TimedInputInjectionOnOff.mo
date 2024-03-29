within Example2.CustomComponents;
model TimedInputInjectionOnOff
  "Injects the signal specified at the input for a user-specified time period, otherwise outputs zero."
  extends Modelica.Blocks.Interfaces.SO;
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Blocks.Sources.ContinuousClock clock
    annotation (Placement(transformation(extent={{-100,-30},{-80,-10}})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=t_start)
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Modelica.Blocks.Logical.Switch inputOn
    annotation (Placement(transformation(extent={{0,-30},{20,-10}})));
  Modelica.Blocks.Sources.Constant inputZero(k=0) annotation (
      Placement(transformation(extent={{-60,70},{-40,90}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold inputOff(threshold=t_stop)
             annotation (Placement(transformation(extent={{-58,22},{-38,42}})));
  Modelica.Blocks.Math.Gain gain(k=k)
    annotation (Placement(transformation(extent={{-30,4},{-10,24}})));
  parameter Real k=1 "Scaling Factor - Gain value multiplied with input signal";
  parameter Real t_start=60 "Start time of the injection";
  parameter Real t_stop=1260 "Stop time of the injection";
  Modelica.Blocks.Interfaces.RealInput u "Input signal connector" annotation (
      Placement(transformation(extent={{-140,-20},{-100,20}}),
        iconTransformation(extent={{-140,-20},{-100,20}})));
equation
  connect(clock.y, greaterThreshold.u)
    annotation (Line(points={{-79,-20},{-62,-20}},
                                               color={0,0,127}));
  connect(greaterThreshold.y,inputOn. u2)
    annotation (Line(points={{-39,-20},{-2,-20}},
                                              color={255,0,255}));
  connect(const.y, inputOn.u3) annotation (Line(points={{-39,-50},{
          -20,-50},{-20,-28},{-2,-28}}, color={0,0,127}));
  connect(y, switch2.y)
    annotation (Line(points={{110,0},{81,0}}, color={0,0,127}));
  connect(inputOn.y, switch2.u3) annotation (Line(points={{21,-20},{
          48,-20},{48,-8},{58,-8}}, color={0,0,127}));
  connect(inputOff.u, greaterThreshold.u) annotation (Line(points={{-60,32},{-74,32},{-74,-20},{-62,-20}},
                                                 color={0,0,127}));
  connect(inputZero.y, switch2.u1) annotation (Line(points={{-39,80},
          {8,80},{8,8},{58,8}}, color={0,0,127}));
  connect(inputOff.y, switch2.u2) annotation (Line(points={{-37,32},{6,32},{6,0},{58,0}},
                               color={255,0,255}));
  connect(gain.y, inputOn.u1) annotation (Line(
      points={{-9,14},{-4,14},{-4,-6},{-8,-6},{-8,-12},{-2,-12}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(gain.u, u) annotation (Line(
      points={{-32,14},{-94,14},{-94,0},{-120,0}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-100,-100},{100,100}}), graphics={
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
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={255,170,255},
          smooth=Smooth.Bezier,
          origin={-12,17.9},
          rotation=90),   Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={162,29,33},
          smooth=Smooth.Bezier,
          origin={-6,-20.1},
          rotation=90),   Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={255,0,0},
          smooth=Smooth.Bezier,
          origin={-10,-2.1},
          rotation=90),
        Rectangle(
          lineColor={200,200,200},
          fillColor={248,248,248},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-76,-88},{2,-12}},
          radius=25.0),              Line(
          points={{-64,-68},{-46,-32},{-28,-58},{-10,-26}},
          color={0,86,134},
          thickness=0.5,
          smooth=Smooth.Bezier),
        Polygon(
          points={{-96,-40},{-76,-50},{-96,-60},{-96,-40}},
          lineColor={200,200,200},
          fillPattern=FillPattern.Solid,
          fillColor={0,86,134}),
        Polygon(
          points={{4,-40},{24,-50},{4,-60},{4,-40}},
          lineColor={0,86,134},
          fillPattern=FillPattern.Solid,
          fillColor={215,215,215},
          lineThickness=1)}),
    experiment(
      StopTime=1320),
    Documentation(info="<html>
<p>Outputs a signal &quot;y&quot;, which is a copy of the input signal &quot;u&quot;, during a user-defined time period defined by parameters t_start and t_stop, otherwise it outputs zero.</p>
</html>"),preferredView="diagram");
end TimedInputInjectionOnOff;
