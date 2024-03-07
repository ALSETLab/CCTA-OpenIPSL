within Example2.CustomComponents.TestCustomComponents;
model TestMultiRamp "Tests \"MiltiRamp\" block"

  parameter Real tramp1_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp1_start=150 annotation (Dialog(tab="Default Ramp Values"));

  parameter Real tramp2_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp2_start=1350 annotation (Dialog(tab="Default Ramp Values"));

  parameter Real tramp3_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp3_start=2250 annotation (Dialog(tab="Default Ramp Values"));

  parameter Real tramp4_duration=150 annotation (Dialog(tab="Default Ramp Values"));
  parameter Real tramp4_start=3150 annotation (Dialog(tab="Default Ramp Values"));

  extends Modelica.Icons.Example;

  MultiRamp multiRamp
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  annotation (                                                         experiment(
      StopTime=3900),preferredView="diagram");
end TestMultiRamp;
