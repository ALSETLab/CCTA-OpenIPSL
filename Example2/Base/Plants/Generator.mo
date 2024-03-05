within Example2.Base.Plants;
partial model Generator
  "Template icon for generation units used in this example"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{90,-10},
            {110,10}}), iconTransformation(extent={{140,-10},{160,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-150,
            -150},{150,150}}),
                         graphics={Ellipse(
          extent={{-150,150},{150,-150}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),Line(
          points={{20,-20},{50,-40},{80,0}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier),
                         Text(
          extent={{-40,20},{40,-20}},
          lineColor={0,0,0},
          textString="%name"),Line(
          points={{-20,20},{-50,40},{-80,0}},
          color={0,0,0},
          thickness=0.5,
          smooth=Smooth.Bezier)}),
                           preferredView = diagram);
end Generator;
