within Example2.Base.Systems.Basic;
package Data "Power flow data records for network initialization without the use of OpenIPSL Types"
  extends Modelica.Icons.RecordsPackage;
annotation (Documentation(info="<html>
<p>This package contains different sets of data records that can be used to initialize the power network on an initial operating point.</p>
<p>Note that the templates in this package do not include the type declarations with <span style=\"font-family: Courier New;\">nominal</span> attributes provided by OpenIPSL, which therefore leads to different initialization solutions when the data is used as compared with the package <a href=\"modelica://Example2.PFData\">Example2.PFData</a>. This is used to illustrate the use of types with nominal values, observe that in the templates here, no nominal values are used, as compared with the package <a href=\"modelica://Example2.PFData\">Example2.PFData</a>, where they are. Observe that this is an important aspect as, &quot;the nominal value can be used by an analysis tool to determine appropriate tolerances or epsilons, or may be used for scaling&quot; (see the Modelica Specification, <a href=\"https://specification.modelica.org/maint/3.5/class-predefined-types-and-declarations.html\">Ch.4.8.6</a>).</p>
<p>For example, in this package the voltage mangitude is defined in <a href=\"Example2.Base.Systems.Basic.Data.PF_TwoAreas.Voltages\">Example2.Base.Systems.Basic.Data.PF_TwoAreas.Voltages</a> as:</p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; color: #0000ff;\">parameter&nbsp;</span><span style=\"color: #ff0000;\">Real&nbsp;V1;</span></p>
<p>Meanwhile, for the case of the templates in Example2.PFData, OpenIPSL</p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; color: #0000ff;\">parameter&nbsp;</span><span style=\"color: #ff0000;\">OpenIPSL.Types.PerUnit&nbsp;V1;</span></p>
<p>where the type declaration is:</p>
<p style=\"margin-left: 30px;\"><span style=\"font-family: Courier New; color: #0000ff;\">type</span>&nbsp;Voltage&nbsp;=&nbsp;<span style=\"font-family: Courier New; color: #ff0000;\">SI.Voltage</span>(nominal&nbsp;=&nbsp;1e4,&nbsp;displayUnit&nbsp;=&nbsp;&quot;kV&quot;);</p>
<p>This difference will result in different intialization solutions despite having the same power flow data.</p>
<p>It is recommended that the solution provided in the package <a href=\"modelica://Example2.PFData\">Example2.PFData</a> is favored.</p>
</html>"),preferredView="info");
end Data;
