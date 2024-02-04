within Example2.MonitoringAndRedesign.Interfaces;
partial model OutputsInterfaceTwoOutputs
public
  Modelica.Blocks.Interfaces.RealOutput Vt
    annotation (Placement(transformation(extent={{298,50},{318,70}}),
        iconTransformation(extent={{300,110},{320,130}})));
  Modelica.Blocks.Interfaces.RealOutput w
    annotation (Placement(transformation(extent={{300,-70},{320,-50}}),
        iconTransformation(extent={{300,-10},{320,10}})));
  annotation ( preferredView = text,
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput,
    Documentation(info="<html>
<p>This is a partial model for inheritance, outputs need to be coupled with the simulation model at the equation level.</p>
</html>"),
    Diagram(coordinateSystem(extent={{-240,-120},{240,120}})),
    Icon(coordinateSystem(extent={{-140,-140},{280,140}})));
end OutputsInterfaceTwoOutputs;
