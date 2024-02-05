within Example1;
package Utilities
  extends Modelica.Icons.UtilitiesPackage;
  package Icons
    extends Modelica.Icons.IconsPackage;
    model FunctionDependentExample
      "f+m = for this model, a function drives the simulation of the model"
      annotation (Icon(coordinateSystem(extent={{-200,-200},{200,200}}),
                       graphics={
            Ellipse(
              lineColor={108,88,49},
              fillColor={213,255,170},
              fillPattern=FillPattern.Solid,
              extent={{-200,-200},{198,200}}),
            Polygon(lineColor={0,0,255},
                    fillColor={105,193,102},
                    pattern=LinePattern.None,
                    fillPattern=FillPattern.Solid,
                    points={{30,-40},{228,-140},{30,-242},{30,-40}},
              origin={-140,-110},
              rotation=90),
            Text(
              lineColor={0,140,72},
              extent={{-74,-192},{86,-72}},
              textString="f+m")}), Documentation(info="<html>
<p><b><span style=\"font-size: 24pt;\">f+m Example</span></b></p>
<p>DO NOT try to run this model on it&apos;s own! </p>
<p>Models with this icon will not simulate on their own, instead they work together with a function that populates certain parameters in the model and perform other operations.</p>
<p>See the associated function to run.</p>
</html>"));
    end FunctionDependentExample;
  end Icons;

  package SetupSolverSettings
    "Setups up the solver settings, enabling/disabling flags that include options on DAE and Sparsity"
    function On "Turns on DAE Mode"
      extends Modelica.Icons.Function;
    algorithm
      Advanced.Define.DAEsolver := true;
      Modelica.Utilities.Streams.print("DAE Mode is turned on.");
      Advanced.Define.GlobalOptimizations :=2;
      Modelica.Utilities.Streams.print("Global optimization is enabled.");
      Advanced.SparseActivate :=true;
      Advanced.Translation.SparseActivateIntegrator :=true;
      Advanced.Translation.SparseActivateSystems :=true;
      Advanced.SparseMaximumDensity :=3;
      Advanced.SparseMinimumStates :=25;
      Modelica.Utilities.Streams.print("Sparse options enabled.");
    end On;

    function Off "Turns off DAE Mode"
      extends Modelica.Icons.Function;
    algorithm
      Advanced.Define.DAEsolver := false;
      Modelica.Utilities.Streams.print("DAE Mode is turned off.");
      Advanced.Define.GlobalOptimizations :=0;
      Modelica.Utilities.Streams.print("Global optimization is disabled.");
      Advanced.SparseActivate :=false;
      Advanced.Translation.SparseActivateIntegrator :=false;
      Advanced.Translation.SparseActivateSystems :=false;
      Modelica.Utilities.Streams.print("Sparse options disabled.");
    end Off;
    annotation (Icon(graphics={
          Rectangle(
            lineColor={200,200,200},
            fillColor={248,248,248},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100,-100},{100,100}},
            radius=25.0),
          Rectangle(
            lineColor={128,128,128},
            extent={{-100,-100},{100,100}},
            radius=25.0),
            Text(
              textColor={128,128,128},
              extent={{-90,-90},{90,90}},
              textString="f"),
                     Rectangle(
            extent={{-76,80},{78,-82}},
            lineColor={28,108,200},
            fillColor={255,170,213},
            fillPattern=FillPattern.Solid), Text(
            extent={{-100,78},{100,-64}},
            textColor={28,108,200},
            textString="Sim
Run")}));
  end SetupSolverSettings;

  package DAEMode
    function DAEModeOn "Turns on DAE Mode"
      extends Modelica.Icons.Function;
    algorithm
      Advanced.Define.DAEsolver := true;
      Modelica.Utilities.Streams.print("DAE Mode is turned on.");
      Advanced.Define.GlobalOptimizations :=2;
      Modelica.Utilities.Streams.print("Global optimization is enabled.");
    end DAEModeOn;

    function DAEModeOff "Turns off DAE Mode"
      extends Modelica.Icons.Function;
    algorithm
      Advanced.Define.DAEsolver := false;
      Modelica.Utilities.Streams.print("DAE Mode is turned off.");
      Advanced.Define.GlobalOptimizations :=0;
      Modelica.Utilities.Streams.print("Global optimization is disabled.");
    end DAEModeOff;
    annotation (Icon(graphics={
          Rectangle(
            lineColor={200,200,200},
            fillColor={248,248,248},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-100,-100},{100,100}},
            radius=25.0),
          Rectangle(
            lineColor={128,128,128},
            extent={{-100,-100},{100,100}},
            radius=25.0),
            Text(
              textColor={128,128,128},
              extent={{-90,-90},{90,90}},
              textString="f"),
                     Rectangle(
            extent={{-76,80},{78,-82}},
            lineColor={28,108,200},
            fillColor={170,213,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-122,60},{78,-82}},
            textColor={28,108,200},
            textString="DAE
          Mode")}));
  end DAEMode;

  model EventTriggerSnapshot
    "Trigger snapshot saving at specific points of the simulation"
    Real x;
  equation
    x = time;
    when x >= 1230 then
      Dymola.Simulation.TriggerResultSnapshot();
    elsewhen x>=1245 then
      Dymola.Simulation.TriggerResultSnapshot();
    end when;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false),
          graphics={
          Polygon(points={{-54,86},{-54,86}}, lineColor={28,108,200}),
          Polygon(
            points={{-60,80},{60,80},{80,40},{80,-40},{60,-80},{-60,-80},
                {-80,-40},{-80,40},{-60,80}},
            lineColor={28,108,200},
            smooth=Smooth.Bezier,
            fillColor={170,213,255},
            fillPattern=FillPattern.CrossDiag),
          Text(
            extent={{-80,40},{80,-20}},
            lineColor={28,108,200},
            fillColor={170,213,255},
            fillPattern=FillPattern.CrossDiag,
            textString="%name")}),                                 Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end EventTriggerSnapshot;
end Utilities;
