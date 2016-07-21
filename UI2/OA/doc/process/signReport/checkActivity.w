<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/doc/process/signReport/startActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window window window window window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

  <div xid="rule1" xui:update-mode="delete"/>
   <div xid="dDoc" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
    <rule xid="rule1" xui:parent="dDoc" xui:update-mode="insert" >
<readonly xid="readonly11111_1" >
<expr xid="default11111_1" >
js:true</expr>
</readonly>
<col name="fTitle" xid="ruleCol1" >
<readonly xid="readonly112_1" >
<expr xid="default112_1" >
js:true</expr>
</readonly>
<required xid="required1" >
<expr xid="default7" >
js:true</expr>
<message xid="default9" >
标题不能为空！</message>
</required>
</col>
<col name="fKeyword" xid="ruleCol111_1" >
<readonly xid="readonly211_1" >
<expr xid="default211_1" >
js:true</expr>
</readonly>
</col>
<col name="fDocNumber" xid="ruleCol211_1" >
<readonly xid="readonly31_1" >
<expr xid="default31_1" >
js:true</expr>
</readonly>
</col>
<col name="fSourceDeptID" xid="ruleCol31_1" >
<readonly xid="readonly41_1" >
<expr xid="default41_1" >
js:true</expr>
</readonly>
</col>
<col name="fSourceDept" xid="ruleCol41_1" >
<readonly xid="readonly51_1" >
<expr xid="default51_1" >
js:true</expr>
</readonly>
</col>
<col name="fSourceDocNumber" xid="ruleCol51_1" >
<readonly xid="readonly61_1" >
<expr xid="default61_1" >
js:true</expr>
</readonly>
</col>
<col name="fSponsorDeptID" xid="ruleCol61_1" >
<readonly xid="readonly71_1" >
<expr xid="default71_1" >
js:true</expr>
</readonly>
</col>
<col name="fSponsorDept" xid="ruleCol71_1" >
<readonly xid="readonly81_1" >
<expr xid="default81_1" >
js:true</expr>
</readonly>
</col>
<col name="fDocExigenceLevel" xid="ruleCol81_1" >
<readonly xid="readonly91_1" >
<expr xid="default91_1" >
js:true</expr>
</readonly>
</col>
<col name="fDocExigenceLevelName" xid="ruleCol91_1" >
<readonly xid="readonly101_1" >
<expr xid="default101_1" >
js:true</expr>
</readonly>
</col>
<col name="fDocSecretLevel" xid="ruleCol101_1" >
<readonly xid="readonly121_1" >
<expr xid="default121_1" >
js:true</expr>
</readonly>
</col>
<col name="fDocSecretLevelName" xid="ruleCol111_1" >
<readonly xid="readonly131_1" >
<expr xid="default131_1" >
js:true</expr>
</readonly>
</col>
<col name="fOrgLetter" xid="ruleCol121_1" >
<readonly xid="readonly141_1" >
<expr xid="default141_1" >
js:true</expr>
</readonly>
</col>
<col name="fOrgLetterCode" xid="ruleCol131_1" >
<readonly xid="readonly151_1" >
<expr xid="default151_1" >
js:true</expr>
</readonly>
</col>
<col name="fIssueDate" xid="ruleCol23_1" >
<readonly xid="readonly25_1" >
<expr xid="default25_1" >
js:true</expr>
</readonly>
</col>
<col name="fCopies" xid="ruleCol141_1" >
<readonly xid="readonly161_1" >
<expr xid="default161_1" >
js:true</expr>
</readonly>
</col>
<col name="fPages" xid="ruleCol151_1" >
<readonly xid="readonly171_1" >
<expr xid="default171_1" >
js:true</expr>
</readonly>
</col>
<col name="fContent" xid="ruleCol161_1" >
<readonly xid="readonly181_1" >
<expr xid="default181_1" >
js:true</expr>
</readonly>
</col>
<col name="fDraftPerName" xid="ruleCol171_1" >
<readonly xid="readonly191_1" >
<expr xid="default191_1" >
js:true</expr>
</readonly>
</col>
<col name="fDocKind" xid="ruleCol181_1" >
<readonly xid="readonly201_1" >
<expr xid="default201_1" >
js:true</expr>
</readonly>
</col>
<col name="fDocKindName" xid="ruleCol191_1" >
<readonly xid="readonly211_1" >
<expr xid="default211_1" >
js:true</expr>
</readonly>
</col>
<col name="fYear" xid="ruleCol201_1" >
<readonly xid="readonly221_1" >
<expr xid="default221_1" >
js:true</expr>
</readonly>
</col>
<col name="fMonth" xid="ruleCol211_1" >
<readonly xid="readonly231_1" >
<expr xid="default231_1" >
js:true</expr>
</readonly>
</col>
<col name="fDraftContent" xid="ruleCol221_1" >
<readonly xid="readonly241_1" >
<expr xid="default241_1" >
js:true</expr>
</readonly>
</col>
<col name="fTemplate" xid="ruleCol7" >
<required xid="required7" >
<expr xid="default29" >
js:true</expr>
<message xid="default30" >
正文不能为空！</message>
</required>
</col>
</rule>
    <li class="x-menu-item" xid="backItem" xui:parent="moreContent" xui:update-mode="insert" >
<a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button" label="回退" onClick="{operation:'process.back'}" xid="backBtn" >
<i xid="i1_2" />
<span xid="span1_2" >

回退</span>
</a>
</li>
   <div xid="AttachmentZW" access="duu"  xui:update-mode="merge"/>
   <div xid="BizFile" access="duu"  xui:update-mode="merge"/>

</div>