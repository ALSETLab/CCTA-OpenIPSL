within Example1.Interfaces;
partial model OutputsInterfaceWEfdAndAVRout
public
  Modelica.Blocks.Interfaces.RealOutput Vt
    annotation (Placement(transformation(extent={{140,70},{160,90}}),
        iconTransformation(extent={{140,70},{160,90}})));
  Modelica.Blocks.Interfaces.RealOutput Q
    annotation (Placement(transformation(extent={{140,-10},{160,10}}),
        iconTransformation(extent={{140,-10},{160,10}})));
  Modelica.Blocks.Interfaces.RealOutput P
    annotation (Placement(transformation(extent={{140,30},{160,50}}),
        iconTransformation(extent={{140,30},{160,50}})));
  Modelica.Blocks.Interfaces.RealOutput w
    annotation (Placement(transformation(extent={{140,-50},{160,-30}}),
        iconTransformation(extent={{140,-50},{160,-30}})));
  Modelica.Blocks.Interfaces.RealOutput delta
    annotation (Placement(transformation(extent={{140,-90},{160,-70}}),
        iconTransformation(extent={{140,-90},{160,-70}})));
  Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
        transformation(extent={{140,-128},{160,-108}}),
        iconTransformation(extent={{140,-130},{160,-110}})));
  Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
        transformation(extent={{140,-160},{160,-140}}),
        iconTransformation(extent={{140,-160},{160,-140}})));
  annotation (
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
    Diagram(coordinateSystem(extent={{-140,-160},{140,140}})),
    Icon(coordinateSystem(extent={{-140,-160},{140,140}})));
end OutputsInterfaceWEfdAndAVRout;
