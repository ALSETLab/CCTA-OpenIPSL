within Example2.CustomComponents.TestCustomComponents;
model TestTimedMultiRamp
  "Tests the \"TimedMultiRamp\" block"

  parameter Real tramp1_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp1_start=150 annotation (Dialog(tab="Default Ramp Values"));

  parameter Real tramp2_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp2_start=1350 annotation (Dialog(tab="Default Ramp Values"));

  parameter Real tramp3_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp3_start=2250 annotation (Dialog(tab="Default Ramp Values"));

  parameter Real tramp4_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp4_start=3150 annotation (Dialog(tab="Default Ramp Values"));

  extends Modelica.Icons.Example;
  TimedMultiRamp timedmultiRampA(
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
    timedinjection_threshold=0)
    annotation (Placement(transformation(extent={{-60,20},{-20,60}})));

  TimedMultiRamp timedmultiRampB
    annotation (Placement(transformation(extent={{-60,-60},{-22,-22}})));
  annotation (Diagram(graphics={Text(
          extent={{-70,-68},{68,-94}},
          textColor={238,46,47},
          textString="Note: Ramp Parameters for multiRampA have been Specified in the Text Layer")}),
                                                                       experiment(
      StopTime=3900),preferredView="diagram");
end TestTimedMultiRamp;
