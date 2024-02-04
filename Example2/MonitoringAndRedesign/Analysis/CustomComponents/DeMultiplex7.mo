within Example2.MonitoringAndRedesign.Analysis.CustomComponents;
block DeMultiplex7 "DeMultiplexer block for 7 output connectors"
  extends Modelica.Blocks.Icons.Block;
  parameter Integer n1=1 "Dimension of output signal connector 1";
  parameter Integer n2=1 "Dimension of output signal connector 2";
  parameter Integer n3=1 "Dimension of output signal connector 3";
  parameter Integer n4=1 "Dimension of output signal connector 4";
  parameter Integer n5=1 "Dimension of output signal connector 5";
  parameter Integer n6=1 "Dimension of output signal connector 6";
  parameter Integer n7=1 "Dimension of output signal connector 7";
  Modelica.Blocks.Interfaces.RealInput u[n1 + n2 + n3 + n4 + n5 + n6 + n7]
    "Connector of Real input signals"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput y1[n1]
    "Connector of Real output signals 1" annotation (Placement(transformation(
          extent={{100,80},{120,100}})));
  Modelica.Blocks.Interfaces.RealOutput y2[n2]
    "Connector of Real output signals 2" annotation (Placement(transformation(
          extent={{100,44},{120,64}})));
  Modelica.Blocks.Interfaces.RealOutput y3[n3]
    "Connector of Real output signals 3" annotation (Placement(transformation(
          extent={{100,8},{120,28}})));
  Modelica.Blocks.Interfaces.RealOutput y4[n4]
    "Connector of Real output signals 4" annotation (Placement(transformation(
          extent={{100,-28},{120,-8}})));
  Modelica.Blocks.Interfaces.RealOutput y5[n5]
    "Connector of Real output signals 5" annotation (Placement(transformation(
          extent={{100,-64},{120,-44}})));
  Modelica.Blocks.Interfaces.RealOutput y6[n6]
    "Connector of Real output signals 6" annotation (Placement(transformation(
          extent={{100,-100},{120,-80}})));

  Modelica.Blocks.Interfaces.RealOutput y7[n7]
    "Connector of Real output signals 7" annotation (Placement(transformation(
          extent={{100,-128},{120,-108}}), iconTransformation(extent={{100,-128},
            {120,-108}})));
equation
  [u] = [y1; y2; y3; y4; y5; y6; y7];
  annotation (
    Documentation(info="<html>
<p>The input connector is <b>split</b> into <span style=\"color: #ee2e2f;\">seven</span> output connectors. Note, that the dimensions of the output connector signals have to be explicitly defined via parameters n1, n2, n3, n4, n5, n6 and <span style=\"color: #ee2e2f;\">n7</span>.</p>
</html>"),
         Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Ellipse(
          extent={{-15,15},{15,-15}},
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,127}),
        Line(points={{-100,0},{-6,0}}, color={0,0,127}),
        Line(points={{100,90},{60,90},{0,4}}, color={0,0,127}),
        Line(points={{100,54},{60,54},{8,6}}, color={0,0,127}),
        Line(points={{100,18},{60,18},{10,2}}, color={0,0,127}),
        Line(points={{100,-18},{60,-18},{10,-2}}, color={0,0,127}),
        Line(points={{100,-54},{60,-54},{8,-6}}, color={0,0,127}),
        Line(points={{100,-90},{60,-90},{0,-4}}, color={0,0,127}),
        Line(points={{100,-120},{26,-120},{0,-4}},
                                                 color={0,0,127})}),
    Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Line(points={{100,90},{60,90},{0,4}}, color={0,0,127}),
        Line(points={{100,-90},{60,-90},{0,-4}}, color={0,0,127}),
        Line(points={{-100,0},{-6,0}}, color={0,0,127}),
        Ellipse(
          extent={{-15,15},{15,-15}},
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,127}),
        Line(points={{100,54},{60,54},{8,6}}, color={0,0,127}),
        Line(points={{100,-54},{60,-54},{8,-6}}, color={0,0,127}),
        Line(points={{100,18},{60,18},{10,2}}, color={0,0,127}),
        Line(points={{100,-18},{60,-18},{10,-2}}, color={0,0,127}),
        Line(points={{100,-120},{60,-120},{-2,-4}},
                                                 color={0,0,127})}));
end DeMultiplex7;
