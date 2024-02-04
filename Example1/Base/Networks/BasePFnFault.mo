within Example1.Base.Networks;
model BasePFnFault
  "Partial SMIB Model with power flow data and a fault component"
  extends BaseWithPF;
  OpenIPSL.Electrical.Events.PwFault fault(
    R=0,
    t1=0.5,
    t2=0.57,
    X=1e-5) annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=0,
        origin={54,-20})));
equation
  connect(fault.p, B4.p) annotation (Line(points={{47,-20},{36,-20},{36,-40},{
          28,-40}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>This model extends <code>BaseWithPF</code> by adding a fault block.</p>
</html>"), preferredView = "diagram");
end BasePFnFault;
