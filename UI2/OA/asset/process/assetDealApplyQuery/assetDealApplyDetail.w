<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div><div xid="detail">
   
   <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chartBtn" label="流程图" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
   <i xid="i2"></i>
   <span xid="span2">流程图</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="processRecBtn" label="流程记录" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
   <i xid="i1"></i>
   <span xid="span1">流程记录</span></a></div>
  <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col1">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
      <label class="x-label" xid="label4">基础信息</label>
      <div class="x-edit" xid="div1"></div></div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col2">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
      <label class="x-label" xid="label5"></label>
      <div class="x-edit" xid="div2"></div></div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col9">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
      <label class="x-label" xid="outfNOL" style="width:100px;">NO：</label>
      <div class="x-edit" xid="div3">
       <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fNO')" xid="outfNO"></output></div> </div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
      <label class="x-label" xid="outfApplyDeptNameL" bind-text="mainData.label('fApplyDeptName')" style="width:100px;"></label>
      <div class="x-edit" xid="div4">
       <output xid="fApplyDeptName" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fApplyDeptName')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
      <label class="x-label" xid="outfApplyPsmName" bind-text="mainData.label('fApplyPsnName')" style="width:100px;"></label>
      <div class="x-edit" xid="div5">
       <output xid="fApplyPsnName" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fApplyPsnName')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
      <label class="x-label" xid="outfApplyDateL" bind-text="mainData.label('fApplyDate')" style="width:100px;"></label>
      <div class="x-edit" xid="div6">
       <output xid="fApplyDate" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fApplyDate')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col19">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit7">
      <label class="x-label" xid="outfCodeL" bind-text="mainData.label('fCode')" style="width:100px;"></label>
      <div class="x-edit" xid="div7">
       <output xid="fCode" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fCode')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col27">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit8">
      <label class="x-label" xid="outfKindL" bind-text="mainData.label('fKind')" style="width:100px;"></label>
      <div class="x-edit" xid="div8">
       <output xid="output6" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fKind')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col20">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
      <label class="x-label" xid="label12" bind-text="mainData.label('fName')" style="width:100px;"></label>
      <div class="x-edit" xid="div9">
       <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fName')" xid="output2"></output></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col28">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit10">
      <label class="x-label" xid="outfSpecTypeL" bind-text="mainData.label('fSpecType')" style="width:100px;"></label>
      <div class="x-edit" xid="div10">
       <output xid="output3" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fSpecType')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col30">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit11">
      <label class="x-label" xid="fDealTypeL" bind-text="mainData.label('fDealType')" style="width:100px;"></label>
      <div class="x-edit" xid="div11">
       <output xid="fDealType" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fDealType')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col37">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit13">
      <label class="x-label" xid="outfServiceYearL" bind-text="mainData.label('fServiceYear')" style="width:100px;"></label>
      <div class="x-edit" xid="div13">
       <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fServiceYear')" xid="output1"></output></div> </div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col39">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit14">
      <label class="x-label" xid="outfUsedYearL" bind-text="mainData.label('fUsedYear')" style="width:100px;"></label>
      <div class="x-edit" xid="div14">
       <output xid="output4" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fUsedYear')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-md-6 col-lg-4" xid="col38">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit15">
      <label class="x-label" bind-text="mainData.label('fEvaluateValue')" style="width:100px;" xid="outfRemainValueL1"></label>
      <div class="x-edit" xid="div15">
       <output xid="fRemainValue" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fEvaluateValue')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col40">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit16">
      <label class="x-label" xid="outReason" bind-text="mainData.label('fReason')" style="width:100px;"></label>
      <div class="x-edit" xid="div16">
       <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fReason')" xid="fReason"></textarea></div> </div> </div> 
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col47">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit24">
      <label class="x-label" xid="outfRemarkL1" bind-text="mainData.label('fRemark')" style="width:100px;"></label>
      <div class="x-edit" xid="div24">
       <textarea xid="fRemark" class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fRemark')"></textarea></div> </div> </div> </div> </div></div>
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:262px;top:173px;" onModelConstructDone="modelModelConstructDone">
   <div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_AS_DealApply" limit="16" columns="" confirmRefresh="false">
    <reader action="/OA/asset/logic/action/queryASDealApplyAction" xid="default1"></reader>
    <writer action="/OA/asset/logic/action/saveASDealApplyAction" xid="default2"></writer>
    <creator action="/OA/asset/logic/action/createASDealApplyAction" xid="default3"></creator>
    <calculateRelation relation="calcCheckBox" xid="calculateRelation1"></calculateRelation>
  <master xid="default6"></master>
  <rule xid="rule2">
   <readonly xid="readonly2">
    <expr xid="default5">true</expr></readonly> 
   <col name="fNO" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default7">true</expr></readonly> </col> 
   <col name="fApplyDeptName" xid="ruleCol2">
    <readonly xid="readonly3">
     <expr xid="default8">true</expr></readonly> </col> 
   <col name="fApplyPsnName" xid="ruleCol3">
    <readonly xid="readonly4">
     <expr xid="default9">true</expr></readonly> </col> 
   <col name="fApplyDate" xid="ruleCol4">
    <readonly xid="readonly5">
     <expr xid="default10">true</expr></readonly> </col> 
   <col name="fAssetID" xid="ruleCol5">
    <readonly xid="readonly6">
     <expr xid="default11">true</expr></readonly> </col> 
   <col name="fCode" xid="ruleCol6">
    <readonly xid="readonly7">
     <expr xid="default12">true</expr></readonly> </col> 
   <col name="fKind" xid="ruleCol7">
    <readonly xid="readonly8">
     <expr xid="default13">true</expr></readonly> </col> 
   <col name="fName" xid="ruleCol8">
    <readonly xid="readonly9">
     <expr xid="default14">true</expr></readonly> </col> 
   <col name="fSpecType" xid="ruleCol9">
    <readonly xid="readonly10">
     <expr xid="default15">true</expr></readonly> </col> 
   <col name="fServiceYear" xid="ruleCol10">
    <readonly xid="readonly11">
     <expr xid="default16">true</expr></readonly> </col> 
   <col name="fUsedYear" xid="ruleCol11">
    <readonly xid="readonly12">
     <expr xid="default17">true</expr></readonly> </col> 
   <col name="fEvaluateValue" xid="ruleCol12">
    <readonly xid="readonly13">
     <expr xid="default18">true</expr></readonly> </col> 
   <col name="fDealType" xid="ruleCol13">
    <readonly xid="readonly14">
     <expr xid="default19">true</expr></readonly> </col> 
   <col name="fRemark" xid="ruleCol14">
    <readonly xid="readonly15">
     <expr xid="default20">true</expr></readonly> </col> </rule></div> 
  <div component="$UI/system/components/justep/data/bizData" xid="taskData" concept="SA_Task">
   <reader xid="default4" action="/system/logic/action/queryTaskAction"></reader></div></div></div>