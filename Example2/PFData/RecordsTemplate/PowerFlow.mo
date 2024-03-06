within Example2.PFData.RecordsTemplate;
record PowerFlow
  "Instantiable record containing the replaceable record with power flow results"
  extends Modelica.Icons.Record;

  replaceable record PowerFlow =
        Example2.PFData.RecordsTemplate.PowerFlowTemplate constrainedby
    Example2.PFData.RecordsTemplate.PowerFlowTemplate
    "Replaceable power flow record"
  annotation(choicesAllMatching=true);

PowerFlow powerflow;

end PowerFlow;
