<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="$UI/OA/finance/process/financeReimbrseApply/createActivity.w" 
  __id="id_1" 
  design="device:pc;" 
  class="window" >

    <col name="fLoanDeptName" parent="rule2" update-mode="insert" xid="ruleCol111111_14" xui:parent="rule2" xui:update-mode="insert" >
<readonly xid="readonly211111_14" >
<expr xid="default211111_14" >
true</expr>
</readonly>
</col>
    <col name="fMustReimAmt" parent="rule2" update-mode="insert" xid="ruleCol21111_14" xui:parent="rule2" xui:update-mode="insert" >
<readonly xid="readonly31111_14" >
<expr xid="default31111_14" >
true</expr>
</readonly>
</col>
    <col name="fRemark" parent="rule2" update-mode="insert" xid="ruleCol31111_14" xui:parent="rule2" xui:update-mode="insert" >
<readonly xid="readonly41111_14" >
<expr xid="default41111_14" />
</readonly>
</col>
    <col name="fReiEvent" parent="rule2" update-mode="insert" xid="ruleCol4111_14" xui:parent="rule2" xui:update-mode="insert" >
<readonly xid="readonly5111_14" >
<expr xid="default5111_14" >
true</expr>
</readonly>
</col>
    <col name="fReiBeginDate" parent="rule2" update-mode="insert" xid="ruleCol511_14" xui:parent="rule2" xui:update-mode="insert" >
<readonly xid="readonly711_14" >
<expr xid="default711_14" >
true</expr>
</readonly>
</col>
    <col name="fReiBackDate" parent="rule2" update-mode="insert" xid="ruleCol611_14" xui:parent="rule2" xui:update-mode="insert" >
<readonly xid="readonly811_14" >
<expr xid="default811_14" >
true</expr>
</readonly>
</col>
    <col name="fLoanPsnName" xid="ruleCol7_14" xui:parent="rule2" xui:update-mode="insert" >
<readonly xid="readonly10_14" >
<expr xid="default10_14" >
true</expr>
</readonly>
</col>
    <col name="fOughtReimbAmtCn" xid="ruleCol8_14" xui:parent="rule2" xui:update-mode="insert" >
<readonly xid="readonly11_14" >
<expr xid="default11_14" >
true</expr>
</readonly>
</col>
    <readonly parent="ruleCol3" update-mode="insert" xid="readonly111111_14" xui:parent="ruleCol3" xui:update-mode="insert" >
<expr xid="default111111_14" >
true</expr>
</readonly>
    <readonly parent="ruleCol6" update-mode="insert" xid="readonly611_14" xui:parent="ruleCol6" xui:update-mode="insert" >
<expr xid="default611_14" >
true</expr>
</readonly>
    <readonly parent="ruleCol7" update-mode="insert" xid="readonly91_14" xui:parent="ruleCol7" xui:update-mode="insert" >
<expr xid="default91_14" >
true</expr>
</readonly>

</div>