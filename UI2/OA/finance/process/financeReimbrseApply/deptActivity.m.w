<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="$UI/OA/finance/process/financeReimbrseApply/startActivity.m.w" 
  __id="id_1" 
  design="device:mobile" 
  class="oa" >

   <div xid="mainData" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
    <col name="fExtendStr1" xid="ruleCol1_27" xui:parent="rule1" xui:update-mode="insert" >
<readonly xid="readonly3_27" >
<expr xid="default3_27" >
true</expr>
</readonly>
</col>
    <col name="fExtendStr2" xid="ruleCol2_27" xui:parent="rule1" xui:update-mode="insert" >
<readonly xid="readonly4_27" >
<expr xid="default4_27" >
true</expr>
</readonly>
</col>
    <readonly xid="readonly1_27" xui:parent="ruleCol2" xui:update-mode="insert" >
<expr xid="default1_27" >
true</expr>
</readonly>
    <readonly xid="readonly2_27" xui:parent="ruleCol3" xui:update-mode="insert" >
<expr xid="default2_27" >
true</expr>
</readonly>
   <expr xid="default13"  xui:update-mode="merge-and-replace">true</expr>
</div>