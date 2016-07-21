<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="startActivity.m.w" 
  xid="window" 
  class="window container-fluid oa" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

   <div xid="mainData" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
    <rule parent="mainData" update-mode="insert" xid="rule1_7" xui:parent="mainData" xui:update-mode="insert" >
<col name="fLoanTypeName" xid="ruleCol11_7" >
<readonly xid="readonly11_7" >
<expr xid="default11_7" >
true</expr>
</readonly>
</col>
<col name="fLoanTypeCode" xid="ruleCol21_7" >
<readonly xid="readonly21_7" >
<expr xid="default21_7" >
true</expr>
</readonly>
</col>
<col name="fLoanAmt" xid="ruleCol31_7" >
<readonly xid="readonly31_7" >
<expr xid="default31_7" >
true</expr>
</readonly>
</col>
<col name="fReturnDate" xid="ruleCol41_7" >
<readonly xid="readonly41_7" >
<expr xid="default41_7" >
true</expr>
</readonly>
</col>
<col name="fLoanPurpose" xid="ruleCol51_7" >
<readonly xid="readonly51_7" >
<expr xid="default51_7" >
true</expr>
</readonly>
</col>
<col name="fLoanDate" xid="ruleCol6_7" >
<readonly xid="readonly6_7" >
<expr xid="default6_7" >
true</expr>
</readonly>
</col>
</rule>

</div>