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
<p>The models in this package were originally developed using similar component models and parameters as the single-machine infinite bus (SMIB) model used in the Example 13.2 in [3], pp. 864-869, implemented using the OpenIPSL&nbsp;library.</p>
<p>This implementation has been carried out to illustrate Modelica and OpenIPSL features useful for identification and control applications [1,2], and as such, is set up a bit differently from models typically used only for simulation puroses in power system analysis. A similar implementation with much narrower scope (i.e., only time-domain simulation) is included in OpenIPSL, which can be found under: <span style=\"font-family: Courier New;\"><a href=\"OpenIPSL.Examples.KundurSMIB\">OpenIPSL.Examples.KundurSMIB</a></span></p>
<p>To meet the needs of the work in [1,2], the model was built with input and output interfaces as shown in the figure below (see more details in [1], Figs. 3 and 4). </p>
<p><img src=\"modelica://Example1/Resources/Images/syssmall.png\"/></p>
<p>Let us first describe the figure enclosed by a dashed blue line, i.e. (A), this corresponds to the <a href=\"Example1.Base.Systems.gridIO\">Example1.Base.Systems.gridIO</a> model within this package:</p>
<ul>
<li>In (A), the whole single-machine infinite bus (SMIB) model is shown, it is composed by the main power plant (also called generator unit), G1, a transformer, trans, several buses, lines, etc. </li>
<li>The inputs to the system are inclosed in a solid green line and labeled &quot;Input(s)&quot;. They include, uPSS, uPm and uvs in the main generator, G1, and uPload in the load.</li>
<li>The outputs are enclosed in a solid light-blue line in (A), and include, Vt, P, Q, etc. These are inherited from an <a href=\"Example1.Interfaces.OutputsInterfaceWEfdAndAVRout\">output interface</a> and linked to variables of the <a href=\"Example1.Base.Systems.gridIO\">gridIO</a> model within it&apos;s text layer.</li>
<li>The main generator unit, G1, is built from multiple components from OpenIPSL, as shown in the figure below, including a 4th order synchronous machine model, an excitation control system and a PSS. Comparing the figure below with the one in (A), it can be seen that uPSS provides a direct input to the PSS, uPm provides an input to the mechanical power reference of the machine, pm, and uvs provides an input into the error signal between the PSS and AVR. This is the point where an input signal is injected for closed loop identification as discussed in [2].</li>
<p><img src=\"modelica://Example1/Resources/Images/plantsmall.jpg\"/></p>
<li>The model shown in (A) can be used for both simulation and linearization purposes. For simulation, inputs have to be provided, as shown in (B), where the load input (uPload) is connected to a pulse, while the others are set to zero.</li>
</ul>
<p>To get started using these models and facilitate simulation/linearization workflows, the <a href=\"Example1.Analysis\">Example1.Analysis</a> package consists of three sub-packages that provide different model variants and functions to perform the following studies:</p>
<ul>
<li><a href=\"Example1.Analysis.LinearAnalysis\">Example1.Analysis.LinearAnalysis</a>, provides models and functions to illustrate how to perform linearization on a model, simulate the linear model and compare it against the response of a nonlinear model. These tasks are automated executing the function <a href=\"Example1.Analysis.LinearAnalysis.CustomFunctions.LinearizeAndCompare\">LinearizeAndCompare</a>, which will help to reproduce the results shown in Fig. 6 of [1]. See more information in the documentation/info layer of the function.</li>
<li><a href=\"Example1.Analysis.NonlinSimulationsMultipleInputs\">Example1.Analysis.NonlinSimulationsMultipleInputs</a> illustrates how to provide input signals to the model. The main model that can be used to reproduce the simulations presented in [2] is <span style=\"font-family: Courier New;\">A_randomload_and_lowimpactmultisine</span>. Running that model will help produce the data presented in Figs. 6 and 10 of [2]. To facilitate simulation and plotting of any of the model variants under this package, executing the function <a href=\"Example1.Analysis.NonlinSimulationsMultipleInputs.simulate_and_plot\">simulate_and_plot</a>, will produce the plot below. To simulate other cases, the name/path of the model can be provided as a string input into the function, see more information in the documentation/info layer of the function.</li>
<li><a href=\"Example1.Analysis.RedesignedControllerVerification\">Example1.Analysis.RedesignedControllerVerification</a>, is configured to simulate the response to an 8-cycle load disturbance and to compare the default PSS control design with the two redesigned controllers presented in [2]. There are three models with different control designs that need to be simulated and compared, to facilitate analysis and reproduce a similar figure to Fig. 10 in [2], the <a href=\"Example1.Analysis.RedesignedControllerVerification.C012_simulate_plot_compare\">C012_simulate_plot_compare</a> function can be executed. See more information in the documentation/info layer of the function.</li>
</ul>
<p><br>To better understand how the model is built please refer to [1]. Meanwhile, to find the applications in identification and control where this model was used, you can find more details in [2].</p>
</html>"),preferredView="info");
end Readme;
