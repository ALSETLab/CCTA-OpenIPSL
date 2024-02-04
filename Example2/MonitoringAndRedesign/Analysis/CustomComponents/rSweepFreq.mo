within Example2.MonitoringAndRedesign.Analysis.CustomComponents;
model rSweepFreq "input signal with constant amplitude and variable frequency"
  Modelica.Blocks.Sources.LogFrequencySweep logSweep(
    wMin=wMin,
    wMax=wMax,
    startTime=startTime,
    duration=duration) annotation (Placement(transformation(extent={{-80,-20},{-40,20}})));
  Modelica.Blocks.Sources.SineVariableFrequencyAndAmplitude sine(useConstantAmplitude=false) annotation (Placement(transformation(extent={{0,-8},{40,32}})));
  parameter Real wMin=0.01 "Start frequency";
  parameter Real wMax=10 "End frequency";
  parameter Modelica.Units.SI.Time startTime=0 "Start time of frequency sweep";
  parameter Modelica.Units.SI.Time duration=150 "Duration of ramp (= 0.0 gives a Step)";
  Modelica.Blocks.Interfaces.RealOutput
             y "Connector of Real output signal" annotation (Placement(
        transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Modelica.Blocks.Noise.UniformNoise amplitude(
    samplePeriod=samplePeriod,
    y_min=y_min,
    y_max=y_max)                               annotation (Placement(transformation(extent={{-80,42},{-40,80}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed annotation (Placement(transformation(extent={{60,60},{80,80}})));
  parameter Modelica.Units.SI.Period samplePeriod=0.01 "Period for sampling the raw random numbers";
  parameter Real y_min=-0.005 "Lower limit of amplitude";
  parameter Real y_max=0.005 "Upper limit of amplitude";
equation
  connect(logSweep.y, sine.f) annotation (Line(points={{-38,0},{-4,0}}, color={0,0,127}));
  connect(amplitude.y, sine.amplitude) annotation (Line(
      points={{-38,61},{-14,61},{-14,24},{-4,24}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(y, sine.y) annotation (Line(
      points={{110,0},{50,0},{50,12},{42,12}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid), Text(
        extent={{-150,150},{150,110}},
        textString="%name",
        textColor={0,0,255}),
        Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
        Polygon(
          points={{-80,90},{-88,68},{-72,68},{-80,90}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{68,0}}, color={192,192,192}),
        Polygon(
          points={{90,0},{68,8},{68,-8},{90,0}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,0},{-78.4,0},{-76.8,0},{-75.2,0},{-73.6,0.1},{-72,0.1},{-70.4,0.2},{-68.8,0.3},{-67.2,0.4},{-65.6,0.6},{-64,0.8},{-62.4,1.1},{-60.8,1.4},{-59.2,1.8},{-57.6,2.2},{-56,2.7},{-54.4,3.3},{-52.8,3.9},{-51.2,4.6},{-49.6,5.4},{-48,6.2},{-46.4,7.2},{-44.8,8.2},{-43.2,9.2},{-41.6,10.4},{-40,11.6},{-38.4,12.9},{-36.8,14.2},{-35.2,15.6},{-33.6,17.1},{-32,18.6},{-30.4,20.1},{-28.8,21.6},{-27.2,23.1},{-25.6,24.6},{-24,26.1},{-22.4,27.5},{-20.8,28.8},{-19.2,30},{-17.6,31.1},{-16,32},{-14.4,32.7},{-12.8,33.2},{-11.2,33.5},{-9.6,33.5},{-8,33.2},{-6.4,32.5},{-4.8,31.5},{-3.2,30.1},{-1.6,28.4},{0,26.2},{1.6,23.6},{3.2,20.6},{4.8,17.2},{6.4,13.3},{8,9.1},{9.6,4.6},{11.2,-0.3},{12.8,-5.4},{14.4,-10.7},{16,-16.1},{17.6,-21.6},{19.2,-27.1},{20.8,-32.3},{22.4,-37.4},{24,-42.1},{25.6,-46.3},{27.2,-49.9},{28.8,-52.8},{30.4,-54.8},{32,-56},{33.6,-56.1},{35.2,-55.2},{36.8,-53.1},{38.4,-49.8},{40,-45.3},{41.6,-39.7},{43.2,-33},{44.8,-25.3},{46.4,-16.6},{48,-7.3},{49.6,2.6},{51.2,12.8},{52.8,
              23},{54.4,33},{56,42.5},{57.6,51.2},{59.2,58.8},{60.8,64.9},{62.4,69.3},{64,71.9},{65.6,72.3},{67.2,70.5},{68.8,66.4},{70.4,60},{72,51.4},{73.6,40.8},{75.2,28.4},{76.8,14.7},{78.4,0},{80,-15.1}},
                 smooth = Smooth.Bezier,
          thickness=1,
          color={238,46,47})}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end rSweepFreq;
