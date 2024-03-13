within Example2;
package PFData "Records with power flow data to simulate various scenarios that use OpenIPSL type declarations."
  extends Modelica.Icons.RecordsPackage;

annotation (Icon(graphics={             Text(
        extent={{-76,148},{86,-14}},
        lineColor={28,108,200},
        textString="PFlow")}), Documentation(info="<html>
<p>This subpackage contains power flow data records to initialize the simulation models.</p>
<p>Note that the templates in this package make use of the type declarations with <span style=\"font-family: Courier New;\">nominal</span> attributes provided by OpenIPSL, which therefore leads to different initialization solutions when the data is used as compared with the package in <a href=\"modelica://Example2.Base.Systems.Basic.Data\">Example2.Base.Systems.Basic.Data</a>. This is used to illustrate the use of types with nominal values, observe that in the templates here, types with nominal values are used. Observe that this is an important aspect as, &quot;the nominal value can be used by an analysis tool to determine appropriate tolerances or epsilons, or may be used for scaling&quot; (see the Modelica Specification, <a href=\"https://specification.modelica.org/maint/3.5/class-predefined-types-and-declarations.html\">Ch.4.8.6</a>).</p>
<p>For example, the templates in this package use OpenIPSL types, as in <a href=\"modelica://Example2.PFData.Data.BusData.Bus_Template\">Example2.PFData.Data.BusData.Bus_Template</a></p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; color: #0000ff;\">parameter&nbsp;</span><span style=\"color: #ff0000;\">OpenIPSL.Types.PerUnit&nbsp;V1;</span></p>
<p>where the type declaration is:</p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; color: #0000ff;\">type</span>&nbsp;Voltage&nbsp;=&nbsp;<span style=\"font-family: Courier New; color: #ff0000;\">SI.Voltage</span>(nominal&nbsp;=&nbsp;1e4,&nbsp;displayUnit&nbsp;=&nbsp;&quot;kV&quot;);</p>
<p>In contrast, the voltage mangitude is defined in <a href=\"modelica://Example2.Base.Systems.Basic.Data.PF_TwoAreas.Voltages\">Example2.Base.Systems.Basic.Data.PF_TwoAreas.Voltages</a> as:</p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; color: #0000ff;\">parameter&nbsp;</span><span style=\"color: #ff0000;\">Real&nbsp;V1;</span></p>
<p>This difference will result in different intialization solutions despite having the same power flow solution as initial guess data.</p>
<p>It is recommended that the approach used within this package is favored. The other package (i.e. Example2.Base.Systems.Basic.Data) is used to illustrate the point discussed above and for the sake of reproducibility of the work in [1] and [2].</p>
</html>"), preferredView = "info");
end PFData;
