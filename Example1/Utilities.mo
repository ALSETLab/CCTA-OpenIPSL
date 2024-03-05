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
</html>"),    preferredView="info");
    end FunctionDependentExample;

    model ModelForLinearization "This model is used for linearization."
      annotation (Icon(graphics={
            Ellipse(
              lineColor={0,140,72},
              fillColor={213,255,170},
              fillPattern=FillPattern.Solid,
              extent={{-100,-100},{100,100}},
              lineThickness=1),
            Text(
              lineColor={0,140,72},
              extent={{-100,-50},{100,50}},
              textString="Lin")}), Documentation(info="<html>
<p><b><span style=\"font-size: 24pt;\">f+m Example</span></b></p>
<p>DO NOT try to run this model on it&apos;s own! </p>
<p>Models with this icon will not simulate on their own, instead they work together with a function that populates certain parameters in the model and perform other operations.</p>
<p>See the associated function to run.</p>
</html>"),    preferredView="info");
    end ModelForLinearization;
    annotation (Documentation(info="<html>
<p>Frequently used custom icons.</p>
</html>"),  preferredView="info");
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
            radius=25.0),                   Text(
            extent={{-100,68},{100,-74}},
            textColor={28,108,200},
            textString="Sim
Run")}),  preferredView="info");
  end SetupSolverSettings;

  package DAEMode "Enable or disable DAE Mode"
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
      Advanced.Define.GlobalOptimizations :=2;
      Modelica.Utilities.Streams.print("Global optimization is enabled.");
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
            radius=25.0),                   Text(
            extent={{-66,50},{62,-40}},
            textColor={28,108,200},
            textString="DAE
Mode")}),  preferredView="info");
  end DAEMode;

  package PlotDownsample "Downsample plotting, enable or disable"

    function downsamplePlottingON "Enable flag for downsampling"
      extends Modelica.Icons.Function;
    algorithm
      Advanced.Beta.Plot.DownsampleLimit :=4;
      Modelica.Utilities.Streams.print("Plotting downsampling is enabled.");
    end downsamplePlottingON;

    function downsamplePlottingOFF "Disable flag for downsampling"
      extends Modelica.Icons.Function;
    algorithm
      Advanced.Beta.Plot.DownsampleLimit := 0;
      Modelica.Utilities.Streams.print("Plotting downsampling is disabled.");
    end downsamplePlottingOFF;
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
            radius=25.0),              Line(
            points={{-76,-58},{-26,28},{32,-40},{70,52}},
            color={0,86,134},
            thickness=0.5,
            smooth=Smooth.Bezier)}),preferredView="info");
  end PlotDownsample;
  annotation (Documentation(info="<html>
<p>This package contains several utility packages, comprised mostly of functions that enable or disable certain functionalities of Dymola.</p>
<p>Also included are some of the customized icons that are frequently extended from.</p>
</html>"), preferredView="info");
end Utilities;
