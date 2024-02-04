within Example1.Interfaces;
partial model OutputsInterfaceWEfdAndAVRout
public
  Modelica.Blocks.Interfaces.RealOutput Vt
    annotation (Placement(transformation(extent={{200,150},{220,170}}),
        iconTransformation(extent={{200,150},{220,170}})));
  Modelica.Blocks.Interfaces.RealOutput Q
    annotation (Placement(transformation(extent={{200,70},{220,90}}),
        iconTransformation(extent={{200,70},{220,90}})));
  Modelica.Blocks.Interfaces.RealOutput P
    annotation (Placement(transformation(extent={{200,110},{220,130}}),
        iconTransformation(extent={{200,110},{220,130}})));
  Modelica.Blocks.Interfaces.RealOutput w
    annotation (Placement(transformation(extent={{200,-10},{220,10}}),
        iconTransformation(extent={{200,-10},{220,10}})));
  Modelica.Blocks.Interfaces.RealOutput delta
    annotation (Placement(transformation(extent={{200,-90},{220,-70}}),
        iconTransformation(extent={{200,-90},{220,-70}})));
  Modelica.Blocks.Interfaces.RealOutput AVRin annotation (Placement(
        transformation(extent={{200,-130},{220,-110}}),
        iconTransformation(extent={{200,-130},{220,-110}})));
  Modelica.Blocks.Interfaces.RealOutput AVRout annotation (Placement(
        transformation(extent={{200,-170},{220,-150}}),
        iconTransformation(extent={{200,-170},{220,-150}})));
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
    Diagram(coordinateSystem(extent={{-200,-200},{200,200}})),
    Icon(coordinateSystem(extent={{-200,-200},{200,200}})));
end OutputsInterfaceWEfdAndAVRout;
