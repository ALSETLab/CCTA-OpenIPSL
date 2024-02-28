within Example1;
package Analysis "Simulation and linearization models."
  extends Modelica.Icons.ExamplesPackage;

  annotation (Documentation(info="<html>
<p>This package includes the main examples for linear analysis and simulation.</p>
<p>It includes three subpackages:</p>
<ul>
<li>LinearAnalysis: shows how to linearize the model, simulate the obtained linear model and compare it against the nonlinear model&apos;s response.</li>
<li>ExcitationInputSimulations: shows how to introduce different types of input signals and perform simulations using the nonlinear model.</li>
<li>RedesignedControllerVerification: simulation scenarios without additional input signals that aim to verify the response of the designed controller to a large load disturbance.</li>
</ul>
</html>"));
end Analysis;
