within Example2.CustomComponents.TestCustomComponents;
model TestTimedInjectionOnOff
  "Tests the model \"TimedInjectionOnOff\""
  extends Modelica.Icons.Example;

  parameter Real talpha = 0 "start of the scenario";
  parameter Real t2p5 = 150 "Ramping interval (default 2.5 min)";
  parameter Real t5p0 = 300 "Probing interval (default 5.0 min)";

  parameter Real tnin_start = talpha + t2p5;
  parameter Real tnin_duration = t2p5;

  parameter Real tramp1_start=t2p5 annotation (Dialog(group="Default Ramp Values"));
  parameter Real tramp1_duration=tnin_start + tnin_duration annotation (Dialog(group="Default Ramp Values"));

  parameter Real tA_start = tramp1_start + tramp1_duration;
  parameter Real tA_duration = t5p0;

  parameter Real tB_start = tA_start + tA_duration;
  parameter Real tB_duration = t5p0;

  parameter Real tC_start = tB_start + tB_duration;
  parameter Real tC_duration = t5p0;

  parameter Real tramp2_start=tC_start + tC_duration annotation (Dialog(group="Default Ramp Values"));
  parameter Real tramp2_duration=t2p5 annotation (Dialog(group="Default Ramp Values"));

  parameter Real tbeta = tramp2_start + tramp2_duration;

  parameter Real tD_start = tbeta + t2p5;
  parameter Real tD_duration = t5p0;

  parameter Real tE_start = tD_start + tD_duration;
  parameter Real tE_duration = t5p0;

  parameter Real tramp3_start = tE_start + tE_duration  annotation (Dialog(group="Default Ramp Values"));
  parameter Real tramp3_duration = t2p5 annotation (Dialog(group="Default Ramp Values"));

  parameter Real tgamma = tramp3_start + tramp3_duration;

  parameter Real tF_start = tgamma + t2p5;
  parameter Real tF_duration = t5p0;

  parameter Real tG_start = tF_start + tF_duration;
  parameter Real tG_duration = t5p0;

  parameter Real tramp4_start = tG_start + tG_duration annotation (Dialog(group="Default Ramp Values"));
  parameter Real tramp4_duration = t2p5  annotation (Dialog(group="Default Ramp Values"));

  parameter Real tdelta = tramp4_start + tramp4_duration;

  parameter Real tH_start = tdelta + t2p5;
  parameter Real tH_duration = t5p0;

  parameter Real tI_start = tH_start + tH_duration;
  parameter Real tI_duration = t5p0;
  TimedInjectionOnOff timedInjectionOnOff(timedinjection_threshold=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine sine(amplitude=1, f=1) annotation (Placement(transformation(extent={{-40,-10},
            {-20,10}})));
  Modelica.Blocks.Math.Gain gain(k=1) annotation (Placement(transformation(extent={{20,-10},
            {40,10}})));
equation
  connect(sine.y, timedInjectionOnOff.u)
    annotation (Line(points={{-19,0},{-11,0}}, color={0,0,127}));
  connect(gain.u, timedInjectionOnOff.y)
    annotation (Line(points={{18,0},{11.6,0}}, color={0,0,127}));
  annotation (experiment(StopTime=3900),preferredView="diagram");
end TestTimedInjectionOnOff;
