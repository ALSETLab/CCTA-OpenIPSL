within Example2.PFData.Data.LoadData;
record PF_Loads_2
  "Case 2: 760 MW Total Generation. Solution generated through PSAT and exported"
extends PFData.Data.LoadData.Loads_Template(
PL7_1 = 1e06*(  250.000000000000000000000000),
QL7_1 = 1e06*(  0.000000000000000000000000),
PL9_1 = 1e06*(  500.000000000000000000000000),
QL9_1 = 1e06*(  0.000000000000000000000000));
end PF_Loads_2;
