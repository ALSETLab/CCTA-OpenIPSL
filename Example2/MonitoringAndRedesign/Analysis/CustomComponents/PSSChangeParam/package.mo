within Example2.MonitoringAndRedesign.Analysis.CustomComponents;
package PSSChangeParam "PSS Model with 4 different submodels that have different parameters triggered at different times"
  extends Modelica.Icons.Package;
  annotation (Icon(graphics={
        Rectangle(
          extent={{-80,60},{20,0}},
          lineColor={28,108,200},
          fillColor={195,208,218},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,40},{40,-20}},
          lineColor={28,108,200},
          fillColor={211,225,236},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-40,20},{60,-40}},
          lineColor={28,108,200},
          fillColor={221,236,247},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-20,0},{80,-60}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80,60},{-56,34}},
          textColor={28,108,200},
          textString="1",
          textStyle={TextStyle.Italic}),
        Text(
          extent={{-60,40},{-36,14}},
          textColor={28,108,200},
          textString="2",
          textStyle={TextStyle.Italic}),
        Text(
          extent={{-40,20},{-16,-6}},
          textColor={28,108,200},
          textString="3",
          textStyle={TextStyle.Italic}),
        Text(
          extent={{-20,0},{4,-26}},
          textColor={28,108,200},
          textString="4",
          textStyle={TextStyle.Italic}),
        Text(
          extent={{-100,-58},{100,-100}},
          textColor={28,108,200},
          textString="PSS",
          textStyle={TextStyle.Bold})}));
end PSSChangeParam;
