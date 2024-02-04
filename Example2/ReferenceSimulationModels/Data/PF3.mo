within Example2.ReferenceSimulationModels.Data;
record PF3 "Power flow data record, designed for test system assembled with PSSE models"
  extends Support.PF_TwoAreas(
    voltages(
      V1=1.02999997139,
      A1=0.68800303338,
      V2=1.04999995232,
      A2=0.39702884899,
      V3=1.02999997139,
      A3=-0.12217305596,
      V4=1.00999999046,
      A4=-0.30613562704,
      V5=1.0069,
      A5=0.24064774259,
      V6=0.97914,
      A6=0.06483200039,
      V7=1.01935839653,
      A7=0.11458134909,
      V8=0.94828,
      A8=-0.32311454975,
      V9=0.960842967033,
      A9=-0.54923815925,
      V10=0.98486,
      A10=-0.41387167085,
      V11=1.0088,
      A11=-0.23424936555),
    machines(
      P1_1=1100000000,
      Q1_1=187957901.001,
      P2_1=700000000,
      Q2_1=260817138.672,
      P3_1=757885437.012,
      Q3_1=218426849.365,
      P4_1=300000000,
      Q4_1=112581405.64),
    loads(
      PL7_1=1166999877.934,
      QL7_1=-523454879.7604,
      PL9_1=1567000000,
      QL9_1=-223126708.9844));
  annotation (Documentation(info="<html>
<p>Not working</p>
</html>"));
end PF3;
