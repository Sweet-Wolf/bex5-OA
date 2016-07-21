<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="managerProcessActivity.w" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

  <div xid="gridSelectProcessType" xui:update-mode="delete"/>
  <div xid="trgSelectAsset" xui:update-mode="delete"/>
   <div xid="dUseArrange" autoLoad="true"  xui:update-mode="merge"/>
    <col name="fMasterID" xid="ruleCol1_8" xui:parent="rule1_8" xui:update-mode="insert" >
<readonly xid="readonly1_8" >
<expr xid="default1_8" >
true</expr>
</readonly>
</col>
    <col name="fAssetID" xid="ruleCol2_8" xui:parent="rule1_8" xui:update-mode="insert" >
<readonly xid="readonly2_8" >
<expr xid="default2_8" >
true</expr>
</readonly>
</col>
    <col name="fKind" xid="ruleCol3_8" xui:parent="rule1_8" xui:update-mode="insert" >
<readonly xid="readonly3_8" >
<expr xid="default3_8" >
true</expr>
</readonly>
</col>
    <col name="fCode" xid="ruleCol4_8" xui:parent="rule1_8" xui:update-mode="insert" >
<readonly xid="readonly4_8" >
<expr xid="default4_8" >
true</expr>
</readonly>
</col>
    <col name="fName" xid="ruleCol5_8" xui:parent="rule1_8" xui:update-mode="insert" >
<readonly xid="readonly5_8" >
<expr xid="default5_8" >
true</expr>
</readonly>
</col>
    <col name="fSpecType" xid="ruleCol6_8" xui:parent="rule1_8" xui:update-mode="insert" >
<readonly xid="readonly6_8" >
<expr xid="default6_8" >
true</expr>
</readonly>
</col>
    <col name="fUnit" xid="ruleCol7_8" xui:parent="rule1_8" xui:update-mode="insert" >
<readonly xid="readonly7_8" >
<expr xid="default7_8" >
true</expr>
</readonly>
</col>
    <col name="fArrangeDate" xid="ruleCol8_8" xui:parent="rule1_8" xui:update-mode="insert" >
<readonly xid="readonly8_8" >
<expr xid="default8_8" >
true</expr>
</readonly>
</col>
    <col name="fArrangePsnName" xid="ruleCol9_8" xui:parent="rule1_8" xui:update-mode="insert" >
<readonly xid="readonly9_8" >
<expr xid="default9_8" >
true</expr>
</readonly>
</col>
   <div xid="process" autoClose="false" autoFilter="false" autoSave="false" autoStart="false"  xui:update-mode="merge"/>
    <div bind-ref="mainData.ref('fProcessName')" class="form-control" component="$UI/system/components/justep/output/output" xid="output11_16" xui:parent="div31_4" xui:update-mode="insert" />
<xu:modifications>
  <xu:remove select="//*[@xid='outfCode']/@style"/>
</xu:modifications>

</div>