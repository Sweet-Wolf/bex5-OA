<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="createActivity.m.w" 
  __id="id_1" 
  design="device:mobile" 
  class="oa" >

   <div xid="mainData" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
    <col name="fExtendStr1" xid="ruleCol1_4" xui:parent="rule1" xui:update-mode="insert" >
<readonly xid="readonly3_4" >
<expr xid="default3_4" >
true</expr>
</readonly>
</col>
    <col name="fExtendStr2" xid="ruleCol2_4" xui:parent="rule1" xui:update-mode="insert" >
<readonly xid="readonly4_4" >
<expr xid="default4_4" >
true</expr>
</readonly>
</col>
    <readonly xid="readonly1_4" xui:parent="ruleCol2" xui:update-mode="insert" >
<expr xid="default1_4" >
true</expr>
</readonly>
    <readonly xid="readonly2_4" xui:parent="ruleCol3" xui:update-mode="insert" >
<expr xid="default2_4" >
true</expr>
</readonly>
   <expr xid="default13"  xui:update-mode="merge-and-replace">true</expr>
</div>