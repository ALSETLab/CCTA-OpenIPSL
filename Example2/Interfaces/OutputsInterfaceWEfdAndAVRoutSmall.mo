within Example2.Interfaces;
partial model OutputsInterfaceWEfdAndAVRoutSmall
public
  Modelica.Blocks.Interfaces.RealOutput Vt
    annotation (Placement(transformation(extent={{280,110},{300,130}}),
        iconTransformation(extent={{140,110},{160,130}})));
  Modelica.Blocks.Interfaces.RealOutput Q
    annotation (Placement(transformation(extent={{280,30},{300,50}}),
        iconTransformation(extent={{140,30},{160,50}})));
  Modelica.Blocks.Interfaces.RealOutput P
    annotation (Placement(transformation(extent={{280,70},{300,90}}),
        iconTransformation(extent={{140,70},{160,90}})));
  Modelica.Blocks.Interfaces.RealOutput w
    annotation (Placement(transformation(extent={{280,-10},{300,10}}),
        iconTransformation(extent={{140,-10},{160,10}})));
  Modelica.Blocks.Interfaces.RealOutput delta
    annotation (Placement(transformation(extent={{280,-50},{300,-30}}),
        iconTransformation(extent={{140,-50},{160,-30}})));
  Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
        transformation(extent={{280,-90},{300,-70}}),
        iconTransformation(extent={{140,-90},{160,-70}})));
  Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
        transformation(extent={{280,-130},{300,-110}}),
        iconTransformation(extent={{140,-130},{160,-110}})));
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
    Diagram(coordinateSystem(extent={{-140,-140},{140,140}})),
    Icon(coordinateSystem(extent={{-140,-140},{140,140}})));
end OutputsInterfaceWEfdAndAVRoutSmall;
