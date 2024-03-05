within Example2.CustomComponents;
model TestTimedMultiRamp

  parameter Real tramp1_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp1_start=150 annotation (Dialog(tab="Default Ramp Values"));

  parameter Real tramp2_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp2_start=1350 annotation (Dialog(tab="Default Ramp Values"));

  parameter Real tramp3_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp3_start=2250 annotation (Dialog(tab="Default Ramp Values"));

  parameter Real tramp4_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp4_start=3150 annotation (Dialog(tab="Default Ramp Values"));

  extends Modelica.Icons.Example;
  TimedMultiRamp timedMultiRamp(
    rampA_duration=tramp1_duration,
    rampA_startTime=tramp1_start,
    rampB_duration=tramp2_duration,
    rampB_startTime=tramp2_start,
    rampC_height=-0.015,
    rampC_duration=tramp3_duration,
    rampC_startTime=tramp3_start,
    rampD_height=-0.015,
    rampD_duration=tramp4_duration,
    rampD_startTime=tramp4_start,
    timedinjection_threshold=0) annotation (Placement(transformation(extent={{-60,-20},{-20,20}})));

  TimedMultiRamp timedMultiRamp1 annotation (Placement(transformation(extent={{-60,-72},{-22,-34}})));
  annotation (Diagram(graphics={Text(
          extent={{-72,64},{66,38}},
          textColor={238,46,47},
          textString="Ramp Parameters Specified in the Text Layer")}), experiment(
      StopTime=3900,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestTimedMultiRamp;
