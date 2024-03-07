within Example1;
partial class Readme "Summary: modeling aspects and how to use this package"

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Ellipse(
          lineColor={75,138,73},
          fillColor={75,138,73},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{-100.0,-100.0},{100.0,100.0}}),
        Polygon(origin={-4.167,-15.0},
          fillColor={255,255,255},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          points={{-15.833,20.0},{-15.833,30.0},{14.167,40.0},{24.167,20.0},{4.167,-30.0},{14.167,-30.0},{24.167,-30.0},{24.167,-40.0},{-5.833,-50.0},{-15.833,-30.0},{4.167,20.0},{-5.833,20.0}},
          smooth=Smooth.Bezier),
        Ellipse(origin={7.5,56.5},
          fillColor={255,255,255},
          pattern=LinePattern.None,
          fillPattern=FillPattern.Solid,
          extent={{-12.5,-12.5},{12.5,12.5}})}),
                            Documentation(info="<html>
<p><br>The models were originally developed using similar component models and parameters as the single-machine infinite bus model used in the Example 13.2 in [3], pp. 864-869, implemented using the OpenIPSL&nbsp;library.</p>
<p>This implementation has been carried out to illustrate Modelica and OpenIPSL features useful for identification and control applications [1,2], and as such, is set up a bit differently from models typically used only for simulation puroses in power system analysis. A similar implementation with narrower scope (i.e., only time-domain simulation) is included in OpenIPSL, which can be found under: <span style=\"font-family: Courier New;\"><a href=\"OpenIPSL.Examples.KundurSMIB\">OpenIPSL.Examples.KundurSMIB</a></span></p>
<p>To meet the needs of the work in [1,2], the model was built with input and output interfaces as shown in the figure below (see more details in [1], Figs. 3 and 4):</p>
<p><br><br><img src=\"modelica://Example1/Resources/Images/sys.png\"/></p>
<p><img src=\"modelica://Example1/Resources/Images/plant.png\"/></p>
<p><br><br><br><br><img src=\"modelica://Example1/Resources/Images/lin.png\"/></p>
<p><br><br>To simulate and plot the results shown below, execute the the function <span style=\"font-family: Courier New;\"><a href=\"Example2.Analysis.AutomationFunctions.simulate_and_plot_ramping\">Example2.Analysis.AutomationFunctions.simulate_and_plot_ramping</a>,</span>following the instructions below.</p>
<p>Observe that the plot above is very similar to that in Fig. 4 of [2]. To reproduce the results in Fig. 4 of [2], execute the function <span style=\"font-family: Courier New;\"><a href=\"Example2.Analysis.AutomationFunctions.simulate_and_plot_inputs\">Example2.Analysis.AutomationFunctions.simulate_and_plot_inputs</a></span> , which runs the model <span style=\"font-family: Courier New;\">Example2.Analysis.RampingRandomLoadAndInput</span>.</p>
<p><span style=\"color: #ee2e2f;\">Please note that running this model takes substantial time</span> compared to the &quot;Ramping&quot; example, the reason is that both random load and probing signals are added to the simulation which results in an additional computation burden. </p>
<p>An additional function, <span style=\"font-family: Courier New;\"><a href=\"Example2.Analysis.AutomationFunctions.linearize_KchangeLinRamping\">Example2.Analysis.AutomationFunctions.linearize_KchangeLinRamping</a></span>, allows to linearize the model <span style=\"font-family: Courier New;\">Example2.Analysis.KchangeLinRamping</span> at any point in time while at the same time running the same simulation scenario as in the &quot;Ramping&quot; example above. Running the function outputs a linear model.</p>
</html>"),preferredView="info");
end Readme;
