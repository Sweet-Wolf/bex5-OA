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

  <div xid="ruleCol4" xui:update-mode="delete"/>
   <div xid="mainData" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
    <col name="fReimAmt" xid="ruleCol11_26" xui:parent="rule1" xui:update-mode="insert" >
<readonly xid="readonly31_26" >
<expr xid="default31_26" >
true</expr>
</readonly>
<required xid="required1_26" >
<expr xid="default1_26" >
true</expr>
</required>
</col>
    <col name="fExtendStr1" xid="ruleCol21_26" xui:parent="rule1" xui:update-mode="insert" >
<readonly xid="readonly41_26" >
<expr xid="default41_26" >
true</expr>
</readonly>
</col>
    <col name="fExtendStr2" xid="ruleCol31_26" xui:parent="rule1" xui:update-mode="insert" >
<readonly xid="readonly51_26" >
<expr xid="default51_26" >
true</expr>
</readonly>
</col>
    <readonly xid="readonly11_26" xui:parent="ruleCol2" xui:update-mode="insert" >
<expr xid="default11_26" >
true</expr>
</readonly>
    <readonly xid="readonly21_26" xui:parent="ruleCol3" xui:update-mode="insert" >
<expr xid="default21_26" >
true</expr>
</readonly>

</div>