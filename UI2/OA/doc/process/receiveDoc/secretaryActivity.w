<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/doc/process/receiveDoc/startActivity.w" 
  xid="window" 
  class="window window window window window window window window window window window window window window window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

  <div xid="rule1" xui:update-mode="delete"/>
    <span component="$UI/system/components/justep/org/orgDialogPC" multiSelection="true" onReceive="wDlgPsnIDs4Receive" selectFilter="$row.val('sOrgKindID')==='psm'" showTitle="true" status="normal" title="选择传阅人员" xid="wDlgPsnIDs4" xui:before="content" xui:parent="window" xui:update-mode="insert" />
    <span component="$UI/system/components/justep/org/orgDialogPC" multiSelection="true" onReceive="wDlgPsnIDs1Receive" selectFilter="$row.val('sOrgKindID')==='psm'" showTitle="true" status="normal" title="选择领导批示人员" xid="wDlgPsnIDs1" xui:before="content" xui:parent="window" xui:update-mode="insert" />
    <span component="$UI/system/components/justep/org/orgDialogPC" multiSelection="true" onReceive="wDlgPsnIDs3Receive" selectFilter="$row.val('sOrgKindID')==='psm'" showTitle="true" status="normal" title="选择部门协办人员" xid="wDlgPsnIDs3" xui:before="dlgReadeOpinion" xui:parent="window" xui:update-mode="insert" />
    <span component="$UI/system/components/justep/org/orgDialogPC" multiSelection="true" onReceive="wDlgPsnIDs2Receive" selectFilter="$row.val('sOrgKindID')==='psm'" showTitle="true" status="normal" title="选择部门主办人员" xid="wDlgPsnIDs2" xui:before="dlgReadeOpinion" xui:parent="window" xui:update-mode="insert" />
    <rule xid="rule1" xui:parent="dDoc" xui:update-mode="insert" >
<col name="fTitle" xid="ruleCol1" >
<readonly xid="readonly1_1" >
<expr xid="default1_1" >



js:true</expr>
</readonly>
<required xid="required1" >
<expr xid="default7" >



js:true</expr>
<message xid="default9" >



标题不能为空！</message>
</required>
</col>
<col name="fKeyword" xid="ruleCol2" >
<readonly xid="readonly211111_1" >
<expr xid="default211111_1" >



js:true</expr>
</readonly>
<required xid="required2" >
<expr xid="default10" >



js:true</expr>
<message xid="default11" >



主题词不能为空！</message>
</required>
</col>
<col name="fDocNumber" xid="ruleCol3" >
<readonly xid="readonly31111_1" >
<expr xid="default31111_1" >



js:true</expr>
</readonly>
<required xid="required3" >
<expr xid="default12" >



js:true</expr>
<message xid="default13" >



收文编号不能为空！</message>
</required>
</col>
<col name="fSourceDept" xid="ruleCol111111_1" >
<readonly xid="readonly41111_1" >
<expr xid="default41111_1" >



js:true</expr>
</readonly>
</col>
<col name="fSourceDocNumber" xid="ruleCol6" >
<readonly xid="readonly51111_1" >
<expr xid="default51111_1" >



js:true</expr>
</readonly>
<required xid="required6" >
<expr xid="default18" >



js:true</expr>
<message xid="default19" >



来文字号不能为空！</message>
</required>
</col>
<col name="fSponsorDeptID" xid="ruleCol21111_1" >
<readonly xid="readonly61111_1" >
<expr xid="default61111_1" >



js:true</expr>
</readonly>
</col>
<col name="fSponsorDept" xid="ruleCol31111_1" >
<readonly xid="readonly71111_1" >
<expr xid="default71111_1" >



js:true</expr>
</readonly>
</col>
<col name="fDocExigenceLevel" xid="ruleCol41111_1" >
<readonly xid="readonly81111_1" >
<expr xid="default81111_1" >



js:true</expr>
</readonly>
</col>
<col name="fDocExigenceLevelCode" xid="ruleCol51111_1" >
<readonly xid="readonly91111_1" >
<expr xid="default91111_1" >



js:true</expr>
</readonly>
</col>
<col name="fDocExigenceLevelName" xid="ruleCol61111_1" >
<readonly xid="readonly101111_1" >
<expr xid="default101111_1" >



js:true</expr>
</readonly>
</col>
<col name="fDocSecretLevel" xid="ruleCol71111_1" >
<readonly xid="readonly111111_1" >
<expr xid="default111111_1" >



js:true</expr>
</readonly>
</col>
<col name="fDocSecretLevelName" xid="ruleCol81111_1" >
<readonly xid="readonly121111_1" >
<expr xid="default121111_1" >



js:true</expr>
</readonly>
</col>
<col name="fSourceSort" xid="ruleCol91111_1" >
<readonly xid="readonly131111_1" >
<expr xid="default131111_1" >



js:true</expr>
</readonly>
</col>
<col name="fSourceSortName" xid="ruleCol101111_1" >
<readonly xid="readonly141111_1" >
<expr xid="default141111_1" >



js:true</expr>
</readonly>
</col>
<col name="fIssueDate" xid="ruleCol4" >
<readonly xid="readonly151111_1" >
<expr xid="default151111_1" >



js:true</expr>
</readonly>
<required xid="required4" >
<expr xid="default14" >



js:true</expr>
<message xid="default15" >



收文日期不能为空</message>
</required>
</col>
<col name="fCopies" xid="ruleCol111111_1" >
<readonly xid="readonly161111_1" >
<expr xid="default161111_1" >



js:true</expr>
</readonly>
</col>
<col name="fPages" xid="ruleCol121111_1" >
<readonly xid="readonly171111_1" >
<expr xid="default171111_1" >



js:true</expr>
</readonly>
</col>
<col name="fContent" xid="ruleCol131111_1" >
<readonly xid="readonly181111_1" >
<expr xid="default181111_1" >



js:true</expr>
</readonly>
</col>
<col name="fMainDestDeptID" xid="ruleCol141111_1" >
<readonly xid="readonly191111_1" >
<expr xid="default191111_1" >



js:true</expr>
</readonly>
</col>
<col name="fMainDestDept" xid="ruleCol151111_1" >
<readonly xid="readonly201111_1" >
<expr xid="default201111_1" >



js:true</expr>
</readonly>
</col>
<col name="fDraftPerID" xid="ruleCol161111_1" >
<readonly xid="readonly211111_1" >
<expr xid="default211111_1" >



js:true</expr>
</readonly>
</col>
<col name="fDraftPerPhone" xid="ruleCol171111_1" >
<readonly xid="readonly221111_1" >
<expr xid="default221111_1" >



js:true</expr>
</readonly>
</col>
<col name="fCheckTime" xid="ruleCol181111_1" >
<readonly xid="readonly231111_1" >
<expr xid="default231111_1" >



js:true</expr>
</readonly>
</col>
<col name="fSourceDate" xid="ruleCol241_1" >
<readonly xid="readonly291_1" >
<expr xid="default291_1" >



js:true</expr>
</readonly>
</col>
<col name="fDocKind" xid="ruleCol5" >
<readonly xid="readonly2711_1" >
<expr xid="default2711_1" >



js:true</expr>
</readonly>
<required xid="required5" >
<expr xid="default16" >



js:true</expr>
<message xid="default17" >



公文种类不能为空</message>
</required>
</col>
<col name="fDocKindCode" xid="ruleCol2311_1" >
<readonly xid="readonly2811_1" >
<expr xid="default2811_1" >



js:true</expr>
</readonly>
</col>
<col name="fDocKindName" xid="ruleCol19111_1" >
<readonly xid="readonly24111_1" >
<expr xid="default24111_1" >



js:true</expr>
</readonly>
</col>
<col name="fYear" xid="ruleCol20111_1" >
<readonly xid="readonly25111_1" >
<expr xid="default25111_1" >



js:true</expr>
</readonly>
</col>
<col name="fMonth" xid="ruleCol22111_1" >
<readonly xid="readonly26111_1" >
<expr xid="default26111_1" >



js:true</expr>
</readonly>
</col>
<col name="fDraftContent" xid="ruleCol25_1" >
<readonly xid="readonly30_1" >
<expr xid="default30_1" >



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
<i xid="i1_4" />
<span xid="span1_4" >



回退</span>
</a>
</li>
    <h1 style="font-size:14px;" xid="h11_11" xui:parent="col1" xui:update-mode="insert" >
<![CDATA[指定环节审批人员]]>
</h1>
    <div class="row" component="$UI/system/components/bootstrap/row/row" xid="default11_1" xui:parent="col1" xui:update-mode="insert" >
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11_1" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit12_1" >
<label class="x-label" style="width:100px;" xid="label12_1" >



部门主办</label>
<div class="x-edit" xid="div12_1" >
<div bind-ref="dDoc.ref('fExtendPsnNames2')" class="form-control" component="$UI/system/components/justep/output/output" xid="output12_1" />
</div>
<a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-android-search" label="选择部门主办人员" onClick="btnselPsm2Click" xid="button11_1" >
<i class="icon-android-search" xid="i12_1" />
<span xid="span12_1" >



选择部门主办人员</span>
</a>
</div>
</div>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4_1" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit2_1" >
<label class="x-label" style="width:100px;" xid="label2_1" >
<![CDATA[部门协办]]>
</label>
<div class="x-edit" xid="div2_1" >
<div bind-ref="dDoc.ref('fExtendPsnNames3')" class="form-control" component="$UI/system/components/justep/output/output" xid="output21_1" />
</div>
<a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-android-search" label="选择部门协办人员" onClick="btnselPsm3Click" xid="btnselPsm3" >
<i class="icon-android-search" xid="i21_1" />
<span xid="span21_1" >



选择部门协办人员</span>
</a>
</div>
</div>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6_1" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit31_1" >
<label class="x-label" style="width:100px;" xid="label31_1" >
<![CDATA[传阅人员]]>
</label>
<div class="x-edit" xid="div31_1" >
<div bind-ref="dDoc.ref('fExtendPsnNames4')" class="form-control" component="$UI/system/components/justep/output/output" xid="output31_1" />
</div>
<a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-android-search" label="选择传阅人员" onClick="btnselPsm4Click" xid="btnselPsm4" >
<i class="icon-android-search" xid="i31_1" />
<span xid="span31_1" >



选择传阅人员</span>
</a>
</div>
</div>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col8_1" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit41_1" >
<label class="x-label" style="width:100px;" xid="label41_1" >
<![CDATA[领导批示人员]]>
</label>
<div class="x-edit" xid="div41_1" >
<div bind-ref="dDoc.ref('fExtendPsnNames1')" class="form-control" component="$UI/system/components/justep/output/output" xid="output41_1" />
</div>
<a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-android-search" label="选择领导批示人员" onClick="btnselPsm1Click" xid="btnselPsm1" >
<i class="icon-android-search" xid="i41_1" />
<span xid="span41_1" >



选择领导批示人员</span>
</a>
</div>
</div>
</div>

</div>