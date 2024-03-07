within Example2;
partial class Readme
  "Summary of modeling and simulation aspects to used in this package."

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
<p>The model included here was originally developed using similar component models and parameters as the 11-bus 4-machine 2-area power grid model presented in [4] and in the Example 12.6 of [5], but instead implemented using the OpenIPSL library. The starting point for development was the implementation included in OpenIPSL, which can be found under: <span style=\"font-family: Courier New;\">OpenIPSL.Examples.TwoAreas.Two_Areas_PSSE_AVR</span></p>
<p>It has been substantially modified to meet the needs of the work in [1]-[3]. These differences are mainly in how the generator units where modeled, some of which are summarized below.</p>
<p>First, we note that the following components from OpenIPSL are used to build the individual power plant models (also known as generator units):</p>
<ul>
<li>Machine: GENROU - round rotor generator model with quadratic saturation, <span style=\"font-family: Courier New;\">OpenIPSL.Electrical.Machines.PSSE.GENROU</span></li>
<li>Exciter: SEXS - Simplified excitation system model (AC4), <span style=\"font-family: Courier New;\">OpenIPSL.Electrical.Controls.PSSE.ES.SEXS</span></li>
<li>Turbine and governor system: TGTypeII - simplified model including transient grain, <span style=\"font-family: Courier New;\">OpenIPSL.Electrical.Controls.PSAT.TG.TGTypeII</span></li>
<li>Power System Stabilizer: PSSTypeII - single input stabilizer, <span style=\"font-family: Courier New;\">OpenIPSL.Electrical.Controls.PSAT.PSS.PSSTypeII</span></li>
</ul>
<p>These components are used to build the generator unit models for g1, g2, g3 and g4, shown in the figure below. You can also refer to the diagram layer of <span style=\"font-family: Courier New;\">Example2.Base.Systems.sys. </span>Each of the generator units are built as follows:</p>
<p><img src=\"modelica://Example2/Resources/sys.png\"/></p>
<ul>
<li>Generator g1,<span style=\"font-family: Courier New;\"> Example2.Base.Plants.G1</span>, includes a turbine and governor system (TGTypeII), an excitation system (SEXS) and a specialized custom PSS. The PSS component is composed internally by five different PSS models (PSSTypeII). The output of each of them is enabled or disabled through a TimedInputInjectionOnOff component such that only the output of one of them is injected. This allows to &quot;emulate&quot; the change of parameters of a conventional PSS that would be represented by a single &quot;structure&quot;, i.e., the block diagram of PSSTypeII, for example.</li>
<li>Generator g2, <span style=\"font-family: Courier New;\">Example2.Base.Plants.G2</span>, includes a SEXS excitation system, no turbine governor are included.</li>
<li>Generator g3, <span style=\"font-family: Courier New;\">Example2.Base.Plants.G3</span>,includes a turbine and governor system (TypeII), an excitation system (SEXS) and a PSS (PSSType II).</li>
<li>Generator g4, <span style=\"font-family: Courier New;\">Example2.Base.Plants.G4</span>, is configured just as g2.</li>
</ul>
<p>To create the multiple operating points using the model above, g1 (via uPm) and the load at bus 9 (via uLoad9) increase/decrease their active power generated and consumed, respectively. Consequently, there is a corresponding change in the speed deviation at all generators, and the turbine and governor in g1 and g3 were included to both keep the system stable and to facilitate the transition to new operating points. This is achieved in the examples within the package: <span style=\"font-family: Courier New;\">Example2.Analysis</span>. The package includes the examples &quot;Ramping&quot;, &quot;RampingRandmLoadAndInput&quot; and &quot;KchangeLinRamping&quot;, as well as some functions that automate the running and plotting. Inspecting the model <span style=\"font-family: Courier New;\">Example2.Analysis.Ramping</span>, shows how the changes in uPm and uLoad9 on the figure above are applied. As shown in the figure below, the component &quot;ramping&quot; is applied to both the input uPm (top connector to &quot;plant&quot;) and uLoad9 (bottom connector).</p>
<p><img src=\"modelica://Example2/Resources/Ramping.png\"/></p>
<p>To simulate and plot the results shown below, execute the the function <span style=\"font-family: Courier New;\">Example2.Analysis.AutomationFunctions.simulate_and_plot_ramping,</span>following the instructions below.</p>
<p><img src=\"modelica://Example2/Resources/simulate_and_plot_ramping.png\"/></p>
<p>Observe that the plot above is very similar to that in Fig. 4 of [2]. To reproduce the results in Fig. 4 of [2], execute the function <span style=\"font-family: Courier New;\">Example2.Analysis.AutomationFunctions.simulate_and_plot_inputs</span> , which runs the model <span style=\"font-family: Courier New;\">Example2.Analysis.RampingRandomLoadAndInput</span>.</p>
<p><span style=\"color: #ee2e2f;\">Please note that running this model takes substantial time</span> compared to the &quot;Ramping&quot; example, the reason is that both random load and probing signals are added to the simulation which results in an additional computation burden. </p>
<p>An additional function, <span style=\"font-family: Courier New;\">Example2.Analysis.AutomationFunctions.linearize_KchangeLinRamping</span>, allows to linearize the model at any point in time while at the same time running the same simulation scenario as in the &quot;Ramping&quot; example above. Running the function outputs a linear model </p>
</html>"),preferredView="info");
end Readme;
