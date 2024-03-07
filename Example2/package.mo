within ;
package Example2 "This package contains the power system models used in Example 2 of the paper \"Power System Modeling for Identification and Control Applications using Modelica and OpenIPSL\""
annotation (uses(
    Modelica(version="4.0.0"),
    PSSMonitoringRedesign(version="3"),
    DataFiles(version="1.1.0"),
    Modelica_LinearSystems2(version="2.4.0"),
      DymolaCommands(version="1.16"),
      OpenIPSL(version="3.0.1"),
      Example1(version="3")),                  Icon(graphics={
        Rectangle(
          lineColor={0,140,72},
          fillColor={170,255,85},
          fillPattern=FillPattern.Sphere,
          extent={{-102,-100},{98,100}},
          radius=25),
        Rectangle(
          lineColor={128,128,128},
          extent={{-102,-100},{98,100}},
          radius=25.0),
      Rectangle(
        origin={-2,35.149},
        fillColor={255,255,255},
        extent={{-30.0,-20.1488},{30.0,20.1488}},
          lineColor={255,255,255},
          lineThickness=1),
      Rectangle(
        origin={-2,-34.851},
        fillColor={255,255,255},
        extent={{-30.0,-20.1488},{30.0,20.1488}},
          lineColor={255,255,255},
          lineThickness=1),
      Line(
        origin={-53.25,-2},
        points={{21.25,-35.0},{-13.75,-35.0},{-13.75,35.0},{6.25,35.0}},
          color={255,255,255},
          thickness=1),
      Polygon(
        origin={-42,35},
        pattern=LinePattern.None,
        points={{10.0,0.0},{-5.0,5.0},{-5.0,-5.0}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
      Line(
        origin={49.25,0},
        points={{-21.25,35.0},{13.75,35.0},{13.75,-35.0},{-6.25,-35.0}},
          color={255,255,255},
          thickness=1),
      Polygon(
        origin={38,-35},
        pattern=LinePattern.None,
        points={{-10.0,0.0},{5.0,5.0},{5.0,-5.0}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
                          Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={0,140,72},
          smooth=Smooth.Bezier,
          origin={-2,-20.1},
          rotation=90),   Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={0,140,72},
          smooth=Smooth.Bezier,
          origin={-6,-2.1},
          rotation=90),   Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={0,140,72},
          smooth=Smooth.Bezier,
          origin={-8,17.9},
          rotation=90)}),
    Documentation(info="<html>
<p>This package contains the power system models used in the paper &quot;Power System Modeling for Identification and Control Applications using Modelica and OpenIPSL&quot; by Luigi Vanfretti, submitted for review to the IEEE CCTA 2024.</p>
<p>The models have the following dependencies:</p>
<ul>
<li>Modelica Standard Library v.4.0.0, </li>
<li>Modelica_LinearSystems2 v2.4.0, </li>
<li>DataFiles v1.1.0, </li>
<li>DymolaCommands v1.16, </li>
<li>LinearAnalysis v1.0.1, </li>
<li>OpenIPSL v.3.0.1</li>
</ul>
<p><br>Developed and tested with Dymola 2024X under MS Windows 11.</p>
<p>(c) 2024, Luigi Vanfretti, Rensselaer Polytechnic Institute, Troy, NY, USA.</p>
</html>"),preferredView="info");
end Example2;
