within Example1.Base.Systems;
model gridIOsiso "Single input single output variant of gridIO"

  Systems.gridIO gridIO(
    t1=t1,
    t2=t2,
    opening=opening,
    redeclare record Bus = Example1.PFData.Data.BusData.PF_Bus_10,
    redeclare record Loads = Example1.PFData.Data.LoadData.PF_Loads_10,
    redeclare record Trafos = Example1.PFData.Data.TrafoData.PF_Trafos_10,
    redeclare record Machines = Example1.PFData.Data.MachineData.PF_Machines_10)
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.RealExpression zeros
    annotation (Placement(transformation(extent={{-60,8},{-40,28}})));
  parameter Modelica.Units.SI.Time t1=0.5 "Time of line removal"
    annotation (Dialog(group="Line Removal Parameters"));
  parameter Modelica.Units.SI.Time t2=0.57 "Line re-insertion time"
    annotation (Dialog(group="Line Removal Parameters"));
  parameter Integer opening=1
    "Type of opening (1: removes both ends at same time, 2: removes sending end, 3: removes receiving end)"
    annotation (Dialog(group="Line Removal Parameters"));
  Modelica.Blocks.Interfaces.RealOutput Vt
    annotation (Placement(transformation(extent={{100,6},{120,26}})));
  Modelica.Blocks.Interfaces.RealInput uvs
    annotation (Placement(transformation(extent={{-140,-38},{-100,2}})));
  // allow replaceable records for power flow data
  replaceable record Bus = PFData.Data.BusData.PF_Bus_10 constrainedby Example1.PFData.Data.BusData.Bus_Template annotation (
      choicesAllMatching=true,Dialog(group="Power Flow Data", tab="Power Flow Scenario"));
  replaceable record Loads = PFData.Data.LoadData.PF_Loads_10 constrainedby Example1.PFData.Data.LoadData.Loads_Template annotation (
      choicesAllMatching=true,Dialog(group="Power Flow Data", tab="Power Flow Scenario"));
  replaceable record Trafos = PFData.Data.TrafoData.PF_Trafos_10 constrainedby Example1.PFData.Data.TrafoData.Trafos_Template annotation (
      choicesAllMatching=true,Dialog(group="Power Flow Data", tab="Power Flow Scenario"));
  replaceable record Machines = PFData.Data.MachineData.PF_Machines_10 constrainedby Example1.PFData.Data.MachineData.Machines_Template
    annotation (choicesAllMatching=true,Dialog(group="Power Flow Data", tab="Power Flow Scenario"));
equation
  connect(gridIO.Vt, Vt)
    annotation (Line(points={{21,16},{110,16}}, color={0,0,127}));
  connect(gridIO.uvs, uvs)
    annotation (Line(points={{-22,-18},{-120,-18}}, color={0,0,127}));
  connect(zeros.y, gridIO.uPSS)
    annotation (Line(points={{-39,18},{-22,18}}, color={0,0,127}));
  connect(gridIO.uPm, zeros.y) annotation (Line(points={{-22.2,6},{-32,6},{-32,
          18},{-39,18}}, color={0,0,127}));
  connect(gridIO.uPload, zeros.y) annotation (Line(points={{-22,-6},{-32,-6},{
          -32,18},{-39,18}}, color={0,0,127}));
  annotation (Icon(graphics={                                        Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={28,108,200},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-100,20},{100,-20}},
          textColor={28,108,200},
          textString="%name"),            Text(
          extent={{-90,-44},{78,-82}},
          textColor={217,67,180},
          textString="SISO")}));
end gridIOsiso;
