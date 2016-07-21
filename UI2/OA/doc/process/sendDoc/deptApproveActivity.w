<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="draftActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

  <div xid="rule1" xui:update-mode="delete"/>
   <div xid="model" style="height:auto;left:351px;top:351px;"  xui:update-mode="merge"/>
    <rule xid="rule1" xui:parent="dDoc" xui:update-mode="insert" >
<readonly xid="readonly1" >
<expr xid="default4" >
$model.getContext().getRequestParameter('activity-pattern') == 'detail'</expr>
</readonly>

<col name="fDocNumber" xid="ruleCol3" >
<readonly xid="readonly2" >
<expr xid="default19" >
!$model.contains($model.getContext().getActivity(),['registerNumActivity','dispenseActivity'])</expr>
</readonly>
<constraint xid="constraint1" >
<expr xid="default20" >
$model.checkDocNumber() == '0'</expr>
<message xid="default21" >
发文编号不能重复且不能为空！</message>
</constraint>
</col>
<col name="fSourceDeptID" xid="ruleCol112_17" >
<readonly xid="readonly312_17" >
<expr xid="default312_17" >
js:true</expr>
</readonly>
</col>
<col name="fSourceDept" xid="ruleCol212_17" >
<readonly xid="readonly411_17" >
<expr xid="default411_17" >
js:true</expr>
</readonly>
</col>
<col name="fSourceDocNumber" xid="ruleCol312_17" >
<readonly xid="readonly511_17" >
<expr xid="default511_17" >
js:true</expr>
</readonly>
</col>
<col name="fSponsorDeptID" xid="ruleCol411_17" >
<readonly xid="readonly611_17" >
<expr xid="default611_17" >
js:true</expr>
</readonly>
</col>
<col name="fSponsorDept" xid="ruleCol511_17" >
<readonly xid="readonly711_17" >
<expr xid="default711_17" >
!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity'])</expr>
</readonly>
</col>
<col name="fDocExigenceLevel" xid="ruleCol4" >
<readonly xid="readonly2" >
<expr xid="default22" >
!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity'])</expr>
</readonly>
</col>
<col name="fDocSecretLevel" xid="ruleCol5" >
<readonly xid="readonly3" >
<expr xid="default23" >
!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity'])</expr>
</readonly>
</col>
<col name="fOrgLetter" xid="ruleCol611_17" >
<readonly xid="readonly811_17" >
<expr xid="default811_17" >
!$model.contains($model.getContext().getActivity(),['registerNumActivity','dispenseActivity'])</expr>
</readonly>
</col>
<col name="fOrgLetterName" xid="ruleCol321_17" >
<readonly xid="readonly331_17" >
<expr xid="default421_17" >
js:true</expr>
</readonly>
</col>
<col name="fSourceSort" xid="ruleCol711_17" >
<readonly xid="readonly911_17" >
<expr xid="default911_17" >
js:true</expr>
</readonly>
</col>
<col name="fSourceSortName" xid="ruleCol811_17" >
<readonly xid="readonly1011_17" >
<expr xid="default1011_17" >
js:true</expr>
</readonly>
</col>
<col name="fIssueDate" xid="ruleCol911_17" >
<readonly xid="readonly1111_17" >
<expr xid="default1111_17" >
!$model.contains($model.getContext().getActivity(),['startActivity','draftActivity','deptApproveActivity','drafterActivity','registerNumActivity','dispenseActivity','stampActivity'])</expr>
</readonly>
<required xid="required111_17" >
<expr xid="default1211_17" >
$model.contains($model.getContext().getActivity(),['stampActivity'])</expr>
<message xid="default1311_17" >
发文日期不能为空</message>
</required>
</col>
<col name="fCopies" xid="ruleCol1011_17" >
<readonly xid="readonly1211_17" >
<expr xid="default1411_17" >
!$model.contains($model.getContext().getActivity(),['startActivity','draftActivity','deptApproveActivity','drafterActivity','registerNumActivity','dispenseActivity', 'stampActivity', 'dispenseActivity'])</expr>
</readonly>
<required xid="required211_17" >
<expr xid="default1511_17" >
$model.contains($model.getContext().getActivity(),['startActivity','draftActivity','stampActivity'])</expr>
<message xid="default1611_17" >
份数不能为空！</message>
</required>
</col>
<col name="fPages" xid="ruleCol1111_17" >
<readonly xid="readonly1311_17" >
<expr xid="default1711_17" >
js:true</expr>
</readonly>
</col>
<col name="fContent" xid="ruleCol1211_17" >
<readonly xid="readonly1411_17" >
<expr xid="default1811_17" >
js:true</expr>
</readonly>
</col>

<col name="fCopyDestDeptID" xid="ruleCol1511_17" >
<readonly xid="readonly1711_17" >
<expr xid="default2111_17" >
js:true</expr>
</readonly>
</col>
<col name="fDraftPerID" xid="ruleCol1611_17" >
<readonly xid="readonly1811_17" >
<expr xid="default2211_17" >
js:true</expr>
</readonly>
</col>
<col name="fDraftPerName" xid="ruleCol1711_17" >
<readonly xid="readonly1911_17" >
<expr xid="default2311_17" >
!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity'])</expr>
</readonly>
</col>
<col name="fDraftPerPhone" xid="ruleCol1811_17" >
<readonly xid="readonly2011_17" >
<expr xid="default2411_17" >
!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity'])</expr>
</readonly>
</col>
<col name="fDraftTime" xid="ruleCol1911_17" >
<readonly xid="readonly2111_17" >
<expr xid="default2511_17" >
!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity','stampActivity'])</expr>
</readonly>
</col>
<col name="fCheckPerName" xid="ruleCol2011_17" >
<readonly xid="readonly2211_17" >
<expr xid="default2611_17" >
!$model.contains($model.getContext().getActivity(),['checkActivity'])</expr>
</readonly>
</col>
<col name="fCheckTime" xid="ruleCol2111_17" >
<readonly xid="readonly2311_17" >
<expr xid="default2711_17" >
!$model.contains($model.getContext().getActivity(),['dispenseActivity'])</expr>
</readonly>
</col>
<col name="fTypePerName" xid="ruleCol2211_17" >
<readonly xid="readonly2411_17" >
<expr xid="default2811_17" >
true</expr>
</readonly>
</col>
<col name="fProofReader" xid="ruleCol2311_17" >
<readonly xid="readonly2511_17" >
<expr xid="default2911_17" >
true</expr>
</readonly>
</col>
<col name="fSourceDate" xid="ruleCol2411_17" >
<readonly xid="readonly2611_17" >
<expr xid="default3011_17" >
js:true</expr>
</readonly>
</col>
<col name="fAttachment" xid="ruleCol2511_17" >
<readonly xid="readonly2711_17" >
<expr xid="default3111_17" >
true</expr>
</readonly>
</col>
<col name="fDocKind" xid="ruleCol2611_17" >
<readonly xid="readonly2811_17" >
<expr xid="default3211_17" >
!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','deptApproveActivity','drafterActivity','dispenseActivity','stampActivity'])</expr>
</readonly>
<required xid="required311_17" >
<expr xid="default3311_17" >
$model.contains($model.getContext().getActivity(),['startActivity','draftActivity','stampActivity'])</expr>
<message xid="default3411_17" >
公文种类不能为空！</message>
</required>
</col>
<col name="fYear" xid="ruleCol2711_17" >
<readonly xid="readonly2911_17" >
<expr xid="default3511_17" >
js:true</expr>
</readonly>
</col>
<col name="fMonth" xid="ruleCol2811_17" >
<readonly xid="readonly3011_17" >
<expr xid="default3611_17" >
js:true</expr>
</readonly>
</col>
<col name="fDraftContent" xid="ruleCol2911_17" >
<readonly xid="readonly3111_17" >
<expr xid="default3711_17" >
js:true</expr>
</readonly>
</col>
<col name="fTemplate" xid="ruleCol3011_17" >
<required xid="required411_17" >
<expr xid="default3811_17" >
true</expr>
<message xid="default3911_17" >
正文不能为空！</message>
</required>
</col>
<col name="fSuperPrintPsnName" xid="ruleCol3111_17" >
<readonly xid="readonly3211_17" >
<expr xid="default4011_17" >
!$model.contains($model.getContext().getActivity(),['dispenseActivity'])</expr>
</readonly>
</col>
</rule>

</div>