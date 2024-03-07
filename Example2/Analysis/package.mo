within Example2;
package Analysis "Models for simulation and linearization at multiple operating points through ramping of generation and load"
  extends Example2.Utilities.Icons.PackageWithSimAndLinModels;
  annotation (Documentation(info="<html>
<p>This package includes the main examples for linear analysis and simulation.</p>
<p>It includes three models and a sub-package.</p>
<p><i><b>Models:</b></i></p>
<ol>
<li><span style=\"font-family: Courier New;\">Example2.Analysis.Ramping</span>, illustrates how to simulate multiple operating conditions by ramping g1 and Load9 in Example2.Base.Systems.sys</li>
<li><span style=\"font-family: Courier New;\">Example2.Analysis.RampingRandomLoadAndInput,</span> illustrates how to add multisine input signal and random load variations (in addition to ramping) to the system in Example2.Base.Systems.sys.</li>
<li><span style=\"font-family: Courier New;\">Example2.Analysis.KchangeLinRamping</span>, designed to linearize the model Example2.Base.Systems.sys at any point in time while considering ramping as in Example2.Analysis.Ramping</li>
</ol>
<p><br><i><b>Sub-package:</b></i> <a href=\"Example2.Analysis.AutomationFunctions\">Example2.Analysis.AutomationFunctions</a></p>
<p>This sub-package contains three functions to automate the simulations of models 1 and 2, and to automate the linearization of model 3. See the documentation/info layer of each of the functions for more information.</p>
</html>"),preferredView="info");
end Analysis;
