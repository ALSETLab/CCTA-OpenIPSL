within Example2.CustomComponents;
package PSSChangeParam "PSS Model with 4 or 5 different stages that have different parameters triggered at different times"
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
          textStyle={TextStyle.Italic},
          textString="..."),
        Text(
          extent={{-20,0},{4,-26}},
          textColor={28,108,200},
          textStyle={TextStyle.Italic},
          textString="n"),
        Text(
          extent={{-100,-58},{100,-100}},
          textColor={28,108,200},
          textString="PSS",
          textStyle={TextStyle.Bold})}), Documentation(info="<html>
<p>Specialized custom PSS models. </p>
<p>The PSS components in this package are composed internally by four or five different PSS models (PSSTypeII) internally. </p>
<p>The output of each of them is enabled or disabled through a <a href=\"Example2.CustomComponents.TimedInputInjectionOnOff\">Example2.CustomComponents.TimedInputInjectionOnOff</a> component such that only the output of one of them is injected. </p>
<p>This allows to &quot;emulate&quot; the change of parameters of a conventional PSS that would be represented by a single &quot;structure&quot;, i.e., the block diagram of PSSTypeII, for a user-specified time-period.</p>
</html>"));
end PSSChangeParam;
