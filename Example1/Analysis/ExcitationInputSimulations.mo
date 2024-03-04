within Example1.Analysis;
package ExcitationInputSimulations
  "Example nonlinear time simulations with different input signals"

  function simulate_and_plot
    "Run and plot the simulation used for identification and controller verification."
    extends Modelica.Icons.Function;
    input String modelname = "Example1.Analysis.ExcitationInputSimulations.A_noise_lowimpactmultisine" "Model to simulate.";
  algorithm
    // Turn on flags to run the simulation faster
    Example1.Utilities.SetupSolverSettings.On();
    // Simulate the model
    simulateModel(
    modelname,
    stopTime=1260,
    numberOfIntervals=10000,
    resultFile="noise_lowimpactmultisine");
    // Plot
    removePlots(false);
    Advanced.FilenameInLegend :=true;
    Advanced.FilesToKeep :=10;
    createPlot(id=1, position={26, 14, 959, 831}, y={"Vt"}, range={0.0, 1300.0, 0.92, 1.04}, autoscale=false, grid=true, filename="noise_lowimpactmultisine.mat", subPlot=101, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
    createPlot(id=1, position={26, 14, 959, 831}, y={"Vt"}, range={0.0, 45.0, 0.98, 1.02}, autoscale=false, grid=true, subPlot=102, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
    createPlot(id=2, position={685, 280, 962, 847}, y={"w"}, range={0.0, 1300.0, 0.996, 1.006}, autoscale=false, grid=true, subPlot=101, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
    createPlot(id=2, position={685, 280, 962, 847}, y={"w"}, range={0.0, 45.0, 0.997, 1.003}, autoscale=false, grid=true, subPlot=102, colors={{28,108,200}}, timeUnit="s", displayUnits={"1"});
    annotation (Documentation(info="<html>
<p><i><b><span style=\"font-family: Arial;\">Usage</span></b></i></p>
<ol>
<li><span style=\"font-family: Arial;\">In the Package Browser, right click on the function and select &quot;Call function...&quot;. This will open the function&apos;s window.</span></li>
<li><span style=\"font-family: Arial;\">Modify the input string &quot;modelname&quot; by entering any of the other model names within quotes, for example, to simulate the second model in this package, insert the string:&nbsp;</span><span style=\"font-family: Courier New;\">&quot;Example1.Analysis.ExcitationInputSimulations.B_noise_random_load_and_load_disturbance&quot;</span><span style=\"font-family: Arial;\">, note that the quotes have to be included. Leave the default parameters on first use.</span></li>
<li><span style=\"font-family: Arial;\">Go to the bottom of the window and click on &quot;Execute&quot;, if successful, messages/results are displayed in the command window.</span></li>
<li><span style=\"font-family: Arial;\">Go back to the function&apos;s own window and click on &quot;Close&quot;.</span></li>
</ol>
</html>"));
  end simulate_and_plot;

  model A_noise_lowimpactmultisine
    "Main model used for the identification and verification experiments as in Figs. 6 and 10 in [2]."

    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Example1.Base.Systems.gridIO Plant(t1=0.5, t2=Modelica.Constants.inf)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
          false)
      annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    CustomComponents.EventTriggerSnapshot eventTriggerSnapshot
      annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
    CustomComponents.TimedNoiseInjection loadnoise
      annotation (Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Pulse uloaddist(
      amplitude=1.25,
      width=100,
      period=8/60,
      nperiod=1,
      offset=0,
      startTime=1245) annotation (Placement(transformation(extent={{-160,
              -38},{-140,-18}})));
    CustomComponents.TimedInputInjection timedInputInjection_LowImpact
      annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-44,36},{
            -62.8572,36},{-62.8572,46},{-79,46}},      color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-44.4,12},{-62,12},
            {-62,16},{-79,16}},              color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42,32},{72.4286,32},{
            72.4286,80},{110,80}},              color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42,24},{73.4286,24},{73.4286,
            40},{110,40}},              color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42,16},{76,16},{76,0},{110,0}},
                         color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42,0},{73.4286,0},{73.4286,
            -40},{110,-40}},              color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42,-16},{72.4286,-16},
            {72.4286,-80},{110,-80}},               color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{60,-100},{
            60,-24},{42,-24}},             color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},
            {52,-32},{42,-32}},                   color={0,0,127}));
    connect(uload.u1, loadnoise.y) annotation (Line(points={{-122,-6},{
            -132,-6},{-132,12},{-139,12}}, color={0,0,127}));
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-139,-28},
            {-132,-28},{-132,-18},{-122,-18}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,
            -12},{-72.5,-12},{-44,-12}},          color={0,0,127}));
    connect(timedInputInjection_LowImpact.y, Plant.uvs) annotation (
        Line(points={{-79,-50},{-62,-50},{-62,-36},{-44,-36}},
          color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-96,-80},{44,-102}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        Interval=60,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"),preferredView="diagram");
  end A_noise_lowimpactmultisine;

  model B_noise_random_load_and_load_disturbance
    "Same as \"A_\" above, but removing the input signal for identification."

    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Example1.Base.Systems.gridIO Plant(t1=0.5, t2=Modelica.Constants.inf)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
          false)
      annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    CustomComponents.EventTriggerSnapshot eventTriggerSnapshot
      annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
    CustomComponents.TimedNoiseInjection loadnoise
      annotation (Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Constant uAVR(k=0)
      annotation (Placement(transformation(extent={{-100,-50},{-80,-30}})));
    Modelica.Blocks.Sources.Pulse uloaddist(
      amplitude=1.25,
      width=100,
      period=8/60,
      nperiod=1,
      offset=0,
      startTime=1245) annotation (Placement(transformation(extent={{-160,-40},{
              -140,-20}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-44,36},{-62.8572,36},
            {-62.8572,46},{-79,46}},                   color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-44.4,12},{-62,12},{-62,
            16},{-79,16}},                   color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42,32},{72.4286,32},{72.4286,80},
            {110,80}},                          color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42,24},{73.4286,24},{73.4286,40},
            {110,40}},                  color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42,16},{76,16},{76,0},{110,0}},
                         color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42,0},{73.4286,0},{73.4286,-40},
            {110,-40}},                   color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42,-16},{72.4286,-16},{72.4286,
            -80},{110,-80}},                        color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{60,-100},{60,
            -24},{42,-24}},                color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},{52,
            -32},{42,-32}},                       color={0,0,127}));
    connect(uload.u1, loadnoise.y) annotation (Line(points={{-122,-6},{
            -132,-6},{-132,12},{-139,12}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,-12},
            {-72.5,-12},{-44,-12}},               color={0,0,127}));
    connect(uAVR.y, Plant.uvs) annotation (Line(points={{-79,-40},{-54,-40},{-54,-36},
            {-44,-36}},               color={0,0,127}));
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-139,-30},{-130,
            -30},{-130,-18},{-122,-18}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-96,-80},{44,-102}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        Interval=60,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"),preferredView="diagram");
  end B_noise_random_load_and_load_disturbance;

  model C_noise_only_randomload
    "Same as \"B_\" above, but removing the load disturbance."

    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Example1.Base.Systems.gridIO Plant(t1=0.5, t2=Modelica.Constants.inf)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
          false)
      annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    CustomComponents.EventTriggerSnapshot eventTriggerSnapshot
      annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
    CustomComponents.TimedNoiseInjection loadnoise
      annotation (Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Constant
                                  uloaddist(k=0)
                      annotation (Placement(transformation(extent={{-160,
              -38},{-140,-18}})));
    Modelica.Blocks.Sources.Constant uAVR(k=0)
      annotation (Placement(transformation(extent={{-100,-50},{-80,-30}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-44,36},{
            -62.8572,36},{-62.8572,46},{-79,46}},      color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-44.4,12},{-62,12},
            {-62,16},{-79,16}},              color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42,32},{72.4286,32},{
            72.4286,80},{110,80}},              color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42,24},{73.4286,24},{73.4286,
            40},{110,40}},              color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42,16},{76,16},{76,0},{110,0}},
                         color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42,0},{73.4286,0},{73.4286,
            -40},{110,-40}},              color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42,-16},{72.4286,-16},
            {72.4286,-80},{110,-80}},               color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{60,-100},{
            60,-24},{42,-24}},             color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},
            {52,-32},{42,-32}},                   color={0,0,127}));
    connect(uload.u1, loadnoise.y) annotation (Line(points={{-122,-6},{
            -132,-6},{-132,12},{-139,12}}, color={0,0,127}));
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-139,-28},
            {-132,-28},{-132,-18},{-122,-18}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,
            -12},{-72.5,-12},{-44,-12}},          color={0,0,127}));
    connect(uAVR.y, Plant.uvs) annotation (Line(points={{-79,-40},{-54,-40},{
            -54,-36},{-44,-36}},      color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-96,-80},{44,-102}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        Interval=60,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"),preferredView="diagram");
  end C_noise_only_randomload;

  model D_nonoise_nomultisine_with_load_disturbance
    "Same as \"B_\" above, but removing the random load."

    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Example1.Base.Systems.gridIO Plant(
      t1=0.5, t2=Modelica.Constants.inf)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=
          false)
      annotation (Placement(transformation(extent={{-96,72},{-76,92}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    CustomComponents.EventTriggerSnapshot eventTriggerSnapshot
      annotation (Placement(transformation(extent={{-100,-120},{-80,-100}})));
    Modelica.Blocks.Sources.Constant loadnoise(k=0) annotation (
        Placement(transformation(extent={{-160,2},{-140,22}})));
    Modelica.Blocks.Math.Add uload annotation (Placement(transformation(
            extent={{-120,-22},{-100,-2}})));
    Modelica.Blocks.Sources.Pulse uloaddist(
      amplitude=1.25,
      width=100,
      period=8/60,
      nperiod=1,
      offset=0,
      startTime=1245) annotation (Placement(transformation(extent={{-158,
              -38},{-138,-18}})));
    Modelica.Blocks.Sources.Constant uARVinput(k=0) annotation (
        Placement(transformation(extent={{-102,-50},{-82,-30}})));
  equation
    connect(Plant.uPSS, PSSchange.y) annotation (Line(points={{-44,36},{-62.8572,36},
            {-62.8572,46},{-79,46}},                   color={0,0,127}));
    connect(Plant.uPm, Pmchange.y) annotation (Line(points={{-44.4,12},{-62,12},{-62,
            16},{-79,16}},                   color={0,0,127}));
    connect(Plant.Vt, Vt) annotation (Line(points={{42,32},{72.4286,32},{72.4286,80},
            {110,80}},                          color={0,0,127}));
    connect(Plant.P, P) annotation (Line(points={{42,24},{73.4286,24},{73.4286,40},
            {110,40}},                  color={0,0,127}));
    connect(Plant.Q, Q) annotation (Line(points={{42,16},{76,16},{76,0},{110,0}},
                         color={0,0,127}));
    connect(Plant.w, w) annotation (Line(points={{42,0},{73.4286,0},{73.4286,-40},
            {110,-40}},                   color={0,0,127}));
    connect(Plant.delta, delta) annotation (Line(points={{42,-16},{72.4286,-16},{72.4286,
            -80},{110,-80}},                        color={0,0,127}));
    connect(AVRin, Plant.AVRin) annotation (Line(points={{110,-100},{60,-100},{60,
            -24},{42,-24}},                color={0,0,127}));
    connect(AVRout, Plant.AVRout) annotation (Line(points={{110,-120},{52,-120},{52,
            -32},{42,-32}},                       color={0,0,127}));
    connect(uload.u1, loadnoise.y) annotation (Line(points={{-122,-6},{
            -132,-6},{-132,12},{-139,12}}, color={0,0,127}));
    connect(uloaddist.y, uload.u2) annotation (Line(points={{-137,-28},
            {-132,-28},{-132,-18},{-122,-18}}, color={0,0,127}));
    connect(uload.y, Plant.uPload) annotation (Line(points={{-99,-12},{-72.5,-12},
            {-72.5,-12},{-44,-12}},               color={0,0,127}));
    connect(uARVinput.y, Plant.uvs) annotation (Line(points={{-81,-40},{-64,-40},{
            -64,-36},{-44,-36}},                 color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-98,-78},{42,-100}},
            lineColor={162,29,33},
            textString="Note: see the block uloaddist on the load disturbance data specification.
Click on the \"Plant\" block to specify controller parameters.",
            horizontalAlignment=TextAlignment.Left)}),
      experiment(
        StopTime=1320,
        __Dymola_NumberOfIntervals=20000,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"),preferredView="diagram");
  end D_nonoise_nomultisine_with_load_disturbance;

  model E_no_noise_no_inputs
    "Used to test the \"Plant\" block with constant (zero) inputs."
    extends Modelica.Icons.Example;
    Modelica.Blocks.Interfaces.RealOutput Vt
      annotation (Placement(transformation(extent={{100,70},{120,90}}),
          iconTransformation(extent={{100,70},{120,90}})));
  public
    Modelica.Blocks.Interfaces.RealOutput Q
      annotation (Placement(transformation(extent={{100,-10},{120,10}}),
          iconTransformation(extent={{100,-10},{120,10}})));
    Modelica.Blocks.Interfaces.RealOutput P
      annotation (Placement(transformation(extent={{100,30},{120,50}}),
          iconTransformation(extent={{100,30},{120,50}})));
    Modelica.Blocks.Interfaces.RealOutput w
      annotation (Placement(transformation(extent={{100,-50},{120,-30}}),
          iconTransformation(extent={{100,-50},{120,-30}})));
    Modelica.Blocks.Interfaces.RealOutput delta
      annotation (Placement(transformation(extent={{100,-90},{120,-70}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Sources.Constant PSSchange(k=0)
      annotation (Placement(transformation(extent={{-100,36},{-80,56}})));
    Modelica.Blocks.Sources.Constant Pmchange(k=0)
      annotation (Placement(transformation(extent={{-100,6},{-80,26}})));
    Example1.Base.Systems.gridIO sMIB_AVR_PSS_wInput_wLineRmoval_propagate(t1=0.5, t2=
          Modelica.Constants.inf)
      annotation (Placement(transformation(extent={{-40,-40},{40,40}})));
    Modelica.Blocks.Sources.Constant AVRchange(k=0)
      annotation (Placement(transformation(extent={{-100,-60},{-80,-40}})));
    Modelica.Blocks.Sources.Constant Ploadchange(k=0) annotation (Placement(
          transformation(extent={{-100,-26},{-80,-6}})));
    Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
          transformation(extent={{100,-110},{120,-90}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
    Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
          transformation(extent={{100,-130},{120,-110}}),
          iconTransformation(extent={{100,-90},{120,-70}})));
  equation
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.uPSS, PSSchange.y)
      annotation (Line(points={{-44,36},{-62.8572,36},{-62.8572,46},{-79,46}},
                       color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.uPm, Pmchange.y)
      annotation (Line(points={{-44.4,12},{-62,12},{-62,16},{-79,16}},
                                                      color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.Vt, Vt) annotation (Line(
          points={{42,32},{72.4286,32},{72.4286,80},{110,80}},
          color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.P, P) annotation (Line(
          points={{42,24},{73.4286,24},{73.4286,40},{110,40}},
          color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.Q, Q)
      annotation (Line(points={{42,16},{76,16},{76,0},{110,0}},
                                                     color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.w, w) annotation (Line(
          points={{42,0},{73.4286,0},{73.4286,-40},{110,-40}},
          color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.delta, delta) annotation (
        Line(points={{42,-16},{72.4286,-16},{72.4286,-80},{110,-80}},
          color={0,0,127}));
    connect(AVRchange.y, sMIB_AVR_PSS_wInput_wLineRmoval_propagate.uvs)
      annotation (Line(points={{-79,-50},{-64,-50},{-64,-36},{-44,-36}},
                                 color={0,0,127}));
    connect(Ploadchange.y, sMIB_AVR_PSS_wInput_wLineRmoval_propagate.uPload)
      annotation (Line(points={{-79,-16},{-64,-16},{-64,-12},{-44,-12}},
                                 color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.AVRin, AVRin)
      annotation (Line(points={{42,-24},{68,-24},{68,-100},{110,-100}},
                    color={0,0,127}));
    connect(sMIB_AVR_PSS_wInput_wLineRmoval_propagate.AVRout, AVRout)
      annotation (Line(points={{42,-32},{58,-32},{58,-120},{110,-120}},
                        color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={
              {-120,-100},{100,100}})),                            Diagram(
          coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -140},{100,100}}), graphics={Text(
            extent={{-92,-80},{48,-102}},
            lineColor={162,29,33},
            horizontalAlignment=TextAlignment.Left,
            textString="Note: 
Click on the \"Plant\" block to specify controller parameters.")}),
      experiment(
        StopTime=360,
        __Dymola_NumberOfIntervals=10000,
        Tolerance=1e-06,
        __Dymola_fixedstepsize=0.01,
        __Dymola_Algorithm="Dassl"),preferredView="diagram");
  end E_no_noise_no_inputs;
  annotation (Icon(graphics={   Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,0},
          radius=25),
        Line(points={{80,0},{60,0}}, color={160,160,164},
          thickness=1),
        Line(
          points={{0,0},{40,0}},
          thickness=1),
        Line(
          points={{0,0},{0,50}},
          thickness=0.5),
        Line(points={{0,80},{0,60}}, color={160,160,164},
          thickness=1),
        Line(points={{37,70},{26,50}}, color={160,160,164},
          thickness=1),
        Line(points={{70,38},{49,26}}, color={160,160,164},
          thickness=1),   Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={255,170,255},
          smooth=Smooth.Bezier,
          origin={-12,17.9},
          rotation=90,
          thickness=1),   Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={162,29,33},
          smooth=Smooth.Bezier,
          origin={-6,-20.1},
          rotation=90,
          thickness=1),   Line(
          points={{80,0.1},{68.7,34.3},{61.5,53.2},{55.1,66.5},{49.4,74.7},{43.8,
              79.2},{38.2,79.9},{32.6,76.7},{26.9,69.8},{21.3,59.5},{14.9,44.2},
              {6.83,21.3},{-10.1,-30.7},{-17.3,-50.1},{-23.7,-64.1},{-29.3,-73},
              {-35,-78.3},{-40.6,-79.9},{-46.2,-77.5},{-51.9,-71.4},{-57.5,-61.8},
              {-63.9,-47.1},{-72,-24.7},{-80,0.1}},
          color={255,0,0},
          smooth=Smooth.Bezier,
          origin={-10,-2.1},
          rotation=90,
          thickness=1)}),preferredView = "info",
    Documentation(info="<html>
<p>To perform run any simulation and plot the following function is provided:</p>
<p><span style=\"font-family: Courier New;\">Example1.Analysis.ExcitationInputSimulations.simulate_and_plot</span></p>
<p><i><b>Usage</b></i></p>
<ol>
<li>In the Package Browser, right click on the function and select &quot;Call function...&quot;. This will open the function&apos;s window.</li>
<li>Modify the input string &quot;modelname&quot; by entering any of the other model names within quotes, for example, to simulate the second model in this package, insert the string: <span style=\"font-family: Courier New;\">&quot;Example1.Analysis.ExcitationInputSimulations.B_noise_random_load_and_load_disturbance&quot;</span>, note that the quotes have to be included. Leave the default parameters on first use.</li>
<li>Go to the bottom of the window and click on &quot;Execute&quot;, if successful, messages/results are displayed in the command window.</li>
<li>Go back to the function&apos;s own window and click on &quot;Close&quot;.</li>
</ol>
</html>"));
end ExcitationInputSimulations;
