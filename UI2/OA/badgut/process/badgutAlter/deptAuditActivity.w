<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="applyActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc;" >

  <div xid="required1" xui:update-mode="delete"/>
  <div xid="required2" xui:update-mode="delete"/>
  <div xid="trgSelectAsset" xui:update-mode="delete"/>
  <div xid="detailBar" xui:update-mode="delete"/>
    <col name="fRemark" xid="ruleCol1_5" xui:parent="rule1" xui:update-mode="insert" >
<readonly xid="readonly9" >
<expr xid="default4_5" >
true</expr>
</readonly>
</col>
    <readonly xid="readonly6" xui:parent="ruleCol1" xui:update-mode="insert" >
<expr xid="default11111_5" >
true</expr>
</readonly>
    <readonly xid="readonly7" xui:parent="ruleCol2" xui:update-mode="insert" >
<expr xid="default21_5" >
true</expr>
</readonly>
    <readonly xid="readonly8" xui:parent="ruleCol3" xui:update-mode="insert" >
<expr xid="default3_5" >
true</expr>
</readonly>
   <expr xid="default4"  xui:update-mode="merge-and-replace"></expr>   <column xid="column31" editable="false"  xui:update-mode="merge"/>
   <column xid="column32" editable="false"  xui:update-mode="merge"/>
   <column xid="column19" editable="false"  xui:update-mode="merge"/>
   <column xid="column33" editable="false"  xui:update-mode="merge"/>
   <column xid="column20" editable="false"  xui:update-mode="merge"/>
   <column xid="column8" editable="false"  xui:update-mode="merge"/>
   <column xid="column34" editable="false"  xui:update-mode="merge"/>
   <column xid="column21" editable="false"  xui:update-mode="merge"/>
   <column xid="column9" editable="false"  xui:update-mode="merge"/>
   <column xid="column35" editable="false"  xui:update-mode="merge"/>
   <column xid="column22" editable="false"  xui:update-mode="merge"/>
   <column xid="column10" editable="false"  xui:update-mode="merge"/>
   <column xid="column36" editable="false"  xui:update-mode="merge"/>
   <column xid="column23" editable="false"  xui:update-mode="merge"/>
   <column xid="column11" editable="false"  xui:update-mode="merge"/>
   <column xid="column37" editable="false"  xui:update-mode="merge"/>
   <column xid="column24" editable="false"  xui:update-mode="merge"/>
   <column xid="column12" editable="false"  xui:update-mode="merge"/>
   <column xid="column38" editable="false"  xui:update-mode="merge"/>
   <column xid="column25" editable="false"  xui:update-mode="merge"/>
   <column xid="column13" editable="false"  xui:update-mode="merge"/>
   <column xid="column39" editable="false"  xui:update-mode="merge"/>
   <column xid="column26" editable="false"  xui:update-mode="merge"/>
   <column xid="column14" editable="false"  xui:update-mode="merge"/>
   <column xid="column44" editable="false"  xui:update-mode="merge"/>
   <column xid="column27" editable="false"  xui:update-mode="merge"/>
   <column xid="column15" editable="false"  xui:update-mode="merge"/>
   <column xid="column41" editable="false"  xui:update-mode="merge"/>
   <column xid="column28" editable="false"  xui:update-mode="merge"/>
   <column xid="column16" editable="false"  xui:update-mode="merge"/>
   <column xid="column42" editable="false"  xui:update-mode="merge"/>
   <column xid="column29" editable="false"  xui:update-mode="merge"/>
   <column xid="column17" editable="false"  xui:update-mode="merge"/>
<xu:modifications>
  <xu:remove select="//*[@xid='fCostCenterName']/@style"/>
</xu:modifications>

</div>