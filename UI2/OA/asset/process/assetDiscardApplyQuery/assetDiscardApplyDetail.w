<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:262px;top:131px;" onModelConstructDone="modelModelConstructDone">
   <div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="false" concept="OA_AS_DiscardApply" limit="16" columns="">
    <reader action="/OA/asset/logic/action/queryASDiscardApplyAction" xid="default1"></reader>
    <writer action="/OA/asset/logic/action/saveASDiscardApplyAction" xid="default2"></writer>
    <creator action="/OA/asset/logic/action/createASDiscardApplyAction" xid="default3"></creator>
    <calculateRelation relation="calcCheckBox" xid="calculateRelation1"></calculateRelation>
  <rule xid="rule1">
   
   <col name="fNO" xid="ruleCol1">
    <readonly xid="readonly2">
     <expr xid="default5">true</expr></readonly> </col> 
   <col name="fApplyDeptName" xid="ruleCol2">
    <readonly xid="readonly3">
     <expr xid="default6">true</expr></readonly> </col> 
   <col name="fApplyPsnName" xid="ruleCol3">
    <readonly xid="readonly4">
     <expr xid="default7">true</expr></readonly> </col> 
   <col name="fApplyDate" xid="ruleCol4">
    <readonly xid="readonly5">
     <expr xid="default8">true</expr></readonly> </col> 
   <col name="fAssetID" xid="ruleCol5">
    <readonly xid="readonly6">
     <expr xid="default9">true</expr></readonly> </col> 
   <col name="fCode" xid="ruleCol6">
    <readonly xid="readonly7">
     <expr xid="default10">true</expr></readonly> </col> 
   <col name="fKind" xid="ruleCol7">
    <readonly xid="readonly8">
     <expr xid="default11">true</expr></readonly> </col> 
   <col name="fName" xid="ruleCol8">
    <readonly xid="readonly9">
     <expr xid="default12">true</expr></readonly> </col> 
   <col name="fSpecType" xid="ruleCol9">
    <readonly xid="readonly10">
     <expr xid="default13">true</expr></readonly> </col> 
   <col name="fServiceYear" xid="ruleCol10">
    <readonly xid="readonly11">
     <expr xid="default14">true</expr></readonly> </col> 
   <col name="fUsedYear" xid="ruleCol11">
    <readonly xid="readonly12">
     <expr xid="default15">true</expr></readonly> </col> 
   <col name="fEvaluateValue" xid="ruleCol12">
    <readonly xid="readonly13">
     <expr xid="default16">true</expr></readonly> </col> 
   <col name="fReason" xid="ruleCol13">
    <readonly xid="readonly14">
     <expr xid="default17">true</expr></readonly> </col> 
   <col name="fRemark" xid="ruleCol14">
    <readonly xid="readonly15">
     <expr xid="default18">true</expr></readonly> </col> </rule></div> 
  <div component="$UI/system/components/justep/data/bizData" xid="taskData" concept="SA_Task">
   <reader xid="default19" action="/system/logic/action/queryTaskAction"></reader></div></div>
  <div class="tab-pane" xid="detail">
   <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chartBtn" label="流程图" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
   <i xid="i2"></i>
   <span xid="span2">流程图</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="processRecBtn" label="流程记录" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
   <i xid="i1"></i>
   <span xid="span1">流程记录</span></a></div> 
   <div class="container-fluid" xid="div1">
    <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="详细" collapsible="true" xid="controlGroup1">
     <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="mainForm">
      <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1">
       <div class="col col-xs-12 col-md-6 col-lg-4" xid="col1">
        <div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1">
         <label class="x-label" xid="label4" style="width:100px;">基础信息</label>
         <div class="x-edit" xid="div14"></div></div> </div> 
       <div class="col col-xs-12 col-md-6 col-lg-4" xid="col2">
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit2">
         <label class="x-label" xid="label5"></label>
         <div class="x-edit" xid="div13"></div></div> </div> 
       <div class="col col-xs-12 col-md-6 col-lg-4" xid="col9">
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit3">
         <label class="x-label" style="width:100px;" xid="outfNOL">NO：</label>
         <div class="x-edit" xid="div12">
          <output bind-ref="mainData.ref('fNO')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="outfNO"></output></div> </div> </div> 
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit4">
    <label bind-text="mainData.label('fApplyDeptName')" class="x-label" style="width:100px;" xid="outfApplyDeptNameL"></label>
    <div class="x-edit" xid="div11">
     <output bind-ref="mainData.ref('fApplyDeptName')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="outApplyDeptName" xui:parent="div11" xui:update-mode="insert"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5">
    <label bind-text="mainData.label('fApplyPsnName')" class="x-label" style="width:100px;" xid="outfApplyPsmName"></label>
    <div class="x-edit" xid="div10">
     <output bind-ref="mainData.ref('fApplyPsnName')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="outApplyPsnName" xui:parent="div10" xui:update-mode="insert"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit6">
    <label bind-text="mainData.label('fApplyDate')" class="x-label" style="width:100px;" xid="outfApplyDateL"></label>
    <div class="x-edit" xid="div9">
     <output bind-ref="mainData.ref('fApplyDate')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="outApplyDate" xui:parent="div9" xui:update-mode="insert" format="yyyy-MM-dd"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col19">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit7">
    <label bind-text="mainData.label('fCode')" class="x-label" style="width:100px;" xid="outfCodeL"></label>
    <div class="x-edit" xid="div8">
     <output bind-ref="mainData.ref('fCode')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" style="float:left;" xid="outpfCode"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col27">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit8">
    <label bind-text="mainData.label('fKind')" class="x-label" style="width:100px;" xid="outfKindL"></label>
    <div class="x-edit" xid="div8">
     <output bind-ref="mainData.ref('fKind')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output6"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col20">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit9">
    <label bind-text="mainData.label('fName')" class="x-label" style="width:100px;" xid="label12"></label>
    <div class="x-edit" xid="div9">
     <output bind-ref="mainData.ref('fName')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output2"></output></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit10">
    <label bind-text="mainData.label('fSpecType')" class="x-label" style="width:100px;" xid="outfSpecTypeL"></label>
    <div class="x-edit" xid="div10">
     <output bind-ref="mainData.ref('fSpecType')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output3"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col37">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit13">
    <label bind-text="mainData.label('fServiceYear')" class="x-label" style="width:100px;" xid="outfServiceYearL"></label>
    <div class="x-edit" xid="div2">
     <output bind-ref="mainData.ref('fServiceYear')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output1"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col39">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit14">
    <label bind-text="mainData.label('fUsedYear')" class="x-label" style="width:100px;" xid="outfUsedYearL"></label>
    <div class="x-edit" xid="div3">
     <output bind-ref="mainData.ref('fUsedYear')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output4"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col38">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit15">
    <label bind-text="mainData.label('fEvaluateValue')" class="x-label" style="width:100px;" xid="outfRemainValueL1"></label>
    <div class="x-edit" xid="div15">
     <output bind-ref="mainData.ref('fEvaluateValue')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="fRemainValue"></output></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col40">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit16">
    <label bind-text="mainData.label('fReason')" class="x-label" style="width:100px;" xid="outReason"></label>
    <div class="x-edit" xid="div16">
     <textarea bind-ref="mainData.ref('fReason')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="fReason"></textarea></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col47">
   <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit24">
    <label bind-text="mainData.label('fRemark')" class="x-label" style="width:100px;" xid="outfRemarkL1"></label>
    <div class="x-edit" xid="div24">
     <textarea bind-ref="mainData.ref('fRemark')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="fRemark"></textarea></div> </div> </div></div> 
      </div> </div> </div> </div>
  <div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div></div>