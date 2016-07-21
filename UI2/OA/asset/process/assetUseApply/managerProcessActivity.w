<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="deptManagerActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

  <div xid="mainData" xui:update-mode="delete"/>
  <div xid="dKind" xui:update-mode="delete"/>
  <div xid="default14" xui:update-mode="delete"/>
  <div xid="orgSelectPC4" xui:update-mode="delete"/>
  <div xid="orgSelectPC3" xui:update-mode="delete"/>
  <div xid="input1" xui:update-mode="delete"/>
  <div xid="grdSltKind" xui:update-mode="delete"/>
  <div xid="fName" xui:update-mode="delete"/>
  <div xid="fDemandDate" xui:update-mode="delete"/>
  <div xid="fReturnDate" xui:update-mode="delete"/>
    <div autoLoad="true" autoNew="false" columns="" component="$UI/system/components/justep/data/bizData" concept="OA_AS_UseApplyM" directDelete="true" onSaveCommit="mainDataSaveCommit" onValueChanged="mainDataValueChanged" orderBy="" xid="mainData" xui:parent="model" xui:update-mode="insert" >
<reader action="/OA/asset/logic/action/queryASUseApplyMAction" xid="default21_5" />
<writer action="/OA/asset/logic/action/saveASUseApplyMAction" xid="default22_5" />
<creator action="/OA/asset/logic/action/createASUseApplyMAction" xid="default23_5" />
<rule xid="rule1" xui:parent="mainData" xui:update-mode="insert" >
<col name="fNO" xid="ruleCol211_5" >
<readonly xid="readonly1" >
<expr xid="default241_5" >
















true</expr>
</readonly>
</col>
<col name="fApplyDeptID" xid="ruleCol221_5" >
<readonly xid="readonly2" >
<expr xid="default251_5" >
















true</expr>
</readonly>
</col>
<col name="fApplyDeptName" xid="ruleCol231_5" >
<readonly xid="readonly3" >
<expr xid="default201_5" >
















true</expr>
</readonly>
</col>
<col name="fApplyPsnID" xid="ruleCol241_5" >
<readonly xid="readonly4" >
<expr xid="default191_5" >
















true</expr>
</readonly>
</col>
<col name="fApplyPsnName" xid="ruleCol251_5" >
<readonly xid="readonly5" >
<expr xid="default281_5" >
















true</expr>
</readonly>
</col>
<col name="fApplyDate" xid="ruleCol261_5" >
<readonly xid="readonly6" >
<expr xid="default291_5" >
















true</expr>
</readonly>
</col>
<col name="fKindID" xid="ruleCol271_5" >
<readonly xid="readonly7" >
<expr xid="default301_5" >
















true</expr>
</readonly>
</col>
<col name="fKind" xid="ruleCol281_5" >
<readonly xid="readonly8" >
<expr xid="default311_5" >
















true</expr>
</readonly>
</col>
<col name="fName" xid="ruleCol291_5" >
<readonly xid="readonly9" >
<expr xid="default321_5" >
















true</expr>
</readonly>
</col>
<col name="fDemandDate" xid="ruleCol301_5" >
<readonly xid="readonly10" >
<expr xid="default331_5" >
















true</expr>
</readonly>
</col>
<col name="fReturnDate" xid="ruleCol311_5" >
<readonly xid="readonly11" >
<expr xid="default341_5" >
















true</expr>
</readonly>
</col>
<col name="fRequire" xid="ruleCol321_5" >
<readonly xid="readonly12" >
<expr xid="default351_5" >
















true</expr>
</readonly>
</col>
<col name="fApplyReason" xid="ruleCol331_5" >
<readonly xid="readonly13" >
<expr xid="default361_5" >
















true</expr>
</readonly>
</col>
<col name="fRemark" xid="ruleCol332_5" >
<readonly xid="readonly14" >
<expr xid="default362_5" >
















true</expr>
</readonly>
</col>
</rule>
</div>
    <div autoLoad="true" component="$UI/system/components/justep/data/bizData" concept="OA_AS_UseArrange" limit="1" xid="dUseArrange" xui:parent="model" xui:update-mode="insert" >
<reader action="/OA/asset/logic/action/queryASUseArrangeAction" xid="default1_4" />
<writer action="/OA/asset/logic/action/saveASUseArrangeAction" xid="default2_4" />
<creator action="/OA/asset/logic/action/createASUseArrangeAction" xid="default3_4" />
<master auto-load="true" data="mainData" id="default4_4" relation="fMasterID" />
<rule concept="OA_AS_UseArrange" id="dataBizRule4" readonly="(call('this.getContext().getRequestParameter', 'activity-pattern') = 'detail')" />
</div>
    <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="value" xid="dProcessType" xui:parent="model" xui:update-mode="insert" >
<data xid="default7_4" >







[{&quot;label&quot;:&quot;安排&quot;,&quot;value&quot;:&quot;0&quot;},{&quot;label&quot;:&quot;购置&quot;,&quot;value&quot;:&quot;1&quot;},{&quot;label&quot;:&quot;调拨&quot;,&quot;value&quot;:&quot;2&quot;}]</data>
<column label="label" name="label" type="String" xid="default26_4" />
<column label="value" name="value" type="String" xid="default27_4" />
</div>
   <div xid="process" onBeforeAdvanceQuery="processBeforeAdvanceQuery" style="height:24px;width:24px;left:485px;top:72px;"  xui:update-mode="merge"/>
   <span xid="wDlgAssetCard" onReceive="wDlgAssetCardReceive"  xui:update-mode="merge"/>
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col21_4" xui:parent="row1" xui:update-mode="insert" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit11_4" >
<label class="x-label" style="width:100px;" title="资产分配信息" xid="label21_4" >
<![CDATA[资产分配信息]]>
</label>
<div class="x-edit" xid="div21_4" />
</div>
</div>
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col11_4" xui:parent="row1" xui:update-mode="insert" />
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col31_4" xui:parent="row1" xui:update-mode="insert" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput11_4" >
<label class="x-label" style="width:100px;" xid="label11_4" />
<div class="x-edit" xid="div11_4" />
</div>
</div>
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col51_4" xui:parent="row1" xui:update-mode="insert" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit21_4" >
<label class="x-label" style="width:100px;" title="处理方式" xid="label41_4" >
<![CDATA[处理方式]]>
</label>
<div class="x-edit" xid="div31_4" >
<div bind-labelRef="mainData.ref('fProcessName')" bind-ref="mainData.ref('fProcess')" class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelectProcessType" >
<option data="dProcessType" label="label" value="value" xid="option11_4" />
</div>
</div>
</div>
</div>
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col61_4" xui:parent="row1" xui:update-mode="insert" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput11_4" >
<label class="x-label" style="width:100px;" xid="label31_4" >
<![CDATA[安排日期]]>
</label>
<div class="x-edit" style="width:200px;" xid="div41_4" >
<div bind-ref="dUseArrange.ref('fArrangeDate')" class="form-control" component="$UI/system/components/justep/output/output" format="yyyy-MM-dd" xid="outfArrangeDate" />
</div>
</div>
</div>
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col41_4" xui:parent="row1" xui:update-mode="insert" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5_4" >
<label class="x-label" style="width:100px;" xid="label9_4" >
<![CDATA[安 排 人]]>
</label>
<div class="x-edit" xid="div9_4" >
<div bind-ref="dUseArrange.ref('fArrangePsnName')" bind-text="dUseArrange.ref('fArrangePsnName')" class="form-control" component="$UI/system/components/justep/output/output" xid="outfArrangePsnName" />
</div>
</div>
</div>
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col81_4" xui:parent="row1" xui:update-mode="insert" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit31_4" >
<label class="x-label" style="width:100px;" xid="label61_4" >
<![CDATA[资产编号]]>
</label>
<div class="x-edit" xid="div51_4" >
<div bind-ref="dUseArrange.ref('fCode')" class="form-control" component="$UI/system/components/justep/output/output" style="float:left;width:80%;" xid="outfCode" />
<a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-android-search" onClick="trgSelectAssetClick" style="width:5px;float:left;" xid="trgSelectAsset" >
<i class="icon-android-search" xid="i1_4" />
<span xid="span1_4" />
</a>
</div>
</div>
</div>
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col91_4" xui:parent="row1" xui:update-mode="insert" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput21_4" >
<label class="x-label" style="width:100px;" xid="label51_4" >
<![CDATA[资产分类]]>
</label>
<div class="x-edit" style="width:200px;" xid="div61_4" >
<div bind-ref="dUseArrange.ref('fKind')" class="form-control" component="$UI/system/components/justep/output/output" xid="outSubKind" />
</div>
</div>
</div>
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col71_4" xui:parent="row1" xui:update-mode="insert" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit6_4" >
<label class="x-label" style="width:100px;" xid="label10_4" >
<![CDATA[资产名称]]>
</label>
<div class="x-edit" xid="div10_4" >
<div bind-ref="dUseArrange.ref('fName')" class="form-control" component="$UI/system/components/justep/output/output" xid="outSubName" />
</div>
</div>
</div>
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col121_4" xui:parent="row1" xui:update-mode="insert" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit41_4" >
<label class="x-label" style="width:100px;" xid="label81_4" >
<![CDATA[规格型号]]>
</label>
<div class="x-edit" xid="div71_4" >
<div bind-ref="dUseArrange.ref('fSpecType')" class="form-control" component="$UI/system/components/justep/output/output" xid="outfSpecType" />
</div>
</div>
</div>
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col131_4" xui:parent="row1" xui:update-mode="insert" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput31_4" >
<label class="x-label" style="width:100px;" xid="label71_4" >
<![CDATA[计件单位]]>
</label>
<div class="x-edit" style="width:200px;" xid="div81_4" >
<div bind-ref="dUseArrange.ref('fUnit')" class="form-control" component="$UI/system/components/justep/output/output" xid="outUnit" />
</div>
</div>
</div>
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col101_4" xui:parent="row1" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fApplyDeptName')" class="form-control" component="$UI/system/components/justep/output/output" xid="output4_4" xui:parent="div6" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fApplyPsnName')" class="form-control" component="$UI/system/components/justep/output/output" xid="output5_4" xui:parent="div5" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fApplyDate')" class="form-control" component="$UI/system/components/justep/output/output" format="yyyy-MM-dd" xid="output6_4" xui:parent="div4" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fKind')" class="form-control" component="$UI/system/components/justep/output/output" xid="output7_4" xui:parent="div9" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fName')" class="form-control" component="$UI/system/components/justep/output/output" xid="output8_4" xui:parent="div8" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fDemandDate')" class="form-control" component="$UI/system/components/justep/output/output" format="yyyy-MM-dd" xid="output9_4" xui:parent="div12" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fReturnDate')" class="form-control" component="$UI/system/components/justep/output/output" format="yyyy-MM-dd" xid="optfReturnDate" xui:parent="div11" xui:update-mode="insert" />
   <textarea xid="fRemark" readonly="true"  xui:update-mode="merge"/>

</div>