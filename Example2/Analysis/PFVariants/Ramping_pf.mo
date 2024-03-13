within Example2.Analysis.PFVariants;
model Ramping_pf
  "Model for simulation used to illustrate how ramping is applied to move the system to multiple operating points."
  extends Modelica.Icons.Example;
  Base.Systems.PFVariants.syspf plant(
    g1(Rdroop=0.025),
    t2pssin=1200,
    t3pssin=2100,
    g3(pss(
        Kw=40,
        Tw=10,
        T1=0.5336,
        T2=0.0942,
        T3=0.5336,
        T4=0.0942), sEXS(K=200)),
    pss2_Kw=48.660727200594167,
    pss2_Tw=0.355570139928890,
    pss3_Kw=48.660727200594167,
    pss3_Tw=0.355570139928890,
    pss4_Kw=48.660727200594167,
    pss4_Tw=0.355570139928890,
    pss5_Kw=48.660727200594167,
    pss5_Tw=0.355570139928890,
    redeclare record Bus = Example2.PFData.Data.BusData.PF_Bus_1,
    redeclare record Loads = Example2.PFData.Data.LoadData.PF_Loads_1,
    redeclare record Trafos = Example2.PFData.Data.TrafoData.PF_Trafos_0,
    redeclare record Machines = Example2.PFData.Data.MachineData.PF_Machines_1)
    annotation (Placement(transformation(extent={{58,-40},{138,40}})));
  Modelica.Blocks.Sources.Constant r(k=0) annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=0,
        origin={-120,-24})));

  Example2.CustomComponents.TimedMultiRamp ramping(
    rampA_height=0.2,
    rampB_height=0.125,
    rampC_height=-0.075,
    rampD_height=-0.075) annotation (Placement(transformation(rotation=0,
          extent={{-140,28},{-100,68}})));
  parameter OpenIPSL.Types.PerUnit pss_vsmax=0.2 "Max stabilizer output signal" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter OpenIPSL.Types.PerUnit pss_vsmin=-0.2 "Min stabilizer output signal" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter Real pss1_Kw=5 "Stabilizer gain [pu/pu]" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter OpenIPSL.Types.Time pss1_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 1"));
  parameter Real pss2_Kw=5 "Stabilizer gain [pu/pu]" annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter OpenIPSL.Types.Time pss2_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 2"));
  parameter Real pss3_Kw=5 "Stabilizer gain [pu/pu]" annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter OpenIPSL.Types.Time pss3_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 3"));
  parameter Real pss4_Kw=5 "Stabilizer gain [pu/pu]" annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
  parameter OpenIPSL.Types.Time pss4_Tw=5 "Wash-out time constant" annotation (Dialog(tab="PSS Parameters", group="PSS 4"));
equation
  connect(r.y, plant.uLoad7) annotation (Line(points={{-98,-24},{-24,-24},{-24,
          -17.1429},{51.7143,-17.1429}},                                     color={0,0,127}));
  connect(ramping.y, plant.uPm) annotation (Line(
      points={{-98,48},{-22,48},{-22,34.2857},{52.2857,34.2857}},
      color={238,46,47},
      thickness=1,
      arrow={Arrow.None,Arrow.Filled}));
  connect(plant.uLoad9, ramping.y) annotation (Line(
      points={{51.7143,-34.2857},{-68,-34.2857},{-68,48},{-98,48}},
      color={238,46,47},
      thickness=1));
  connect(plant.uPSS, r.y) annotation (Line(points={{51.7143,17.1429},{8,
          17.1429},{8,-24},{-98,-24}},                                                   color={0,0,127}));
  connect(plant.uAVRin, r.y) annotation (Line(points={{51.7143,0},{-30,0},{-30,
          -24},{-98,-24}},                                                                   color={0,0,127}));
                                                            //,
//     __Dymola_selections={Selection(name="MySelection", match={MatchVariable(name="plant.Vt", newName="Vt"),MatchVariable(name="plant.Q", newName="Q"),MatchVariable(name="plant.P",newName="P"),MatchVariable(name="plant.w",newName="w"),MatchVariable(name="plant.AVRin",newName="u"),MatchVariable(name="plant.AVRout",newName="AVRout"),MatchVariable(name="timedMultiRamp.y",newName="rampY"),MatchVariable(name="plant.Load9.P",newName="Pload"),MatchVariable(name="r.y",newName="r"),MatchVariable(name="plant.g1.pss.vs",newName="pssy"),MatchVariable(name="ramping.y",newName="rampingy")})});
  annotation (
        experiment(
      StopTime=4050,
      __Dymola_NumberOfIntervals=5000,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"),
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}})),preferredView="diagram",
    Documentation(info="<html>
<p>This model illustrates how ramping is applied to move the system to multiple operating points.</p>
<p>To simulate this model and plot the results, execute the function <a href=\"Example2.Analysis.PFVariants.AutomationFunctions.simulate_and_plot_ramping_pf\">Example2.Analysis.PFVariants.AutomationFunctions.simulate_and_plot_ramping_pf</a> , which sets up the adequate solver settings to minimize run time.</p>
</html>"));
end Ramping_pf;
