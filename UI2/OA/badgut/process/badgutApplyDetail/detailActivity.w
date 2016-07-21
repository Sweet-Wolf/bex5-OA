<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:587px;top:20px;" onModelConstructDone="modelModelConstructDone"> 
    
  
  <div component="$UI/system/components/justep/data/bizData" xid="taskData" concept="SA_Task">
   <reader xid="default19" action="/system/logic/action/queryTaskAction"></reader></div>
  <div autoLoad="true" autoNew="false" columns="" component="$UI/system/components/justep/data/bizData" concept="OA_BG_ApplyM" directDelete="true" isTree="false" orderBy="" xid="mainData" xui:update-mode="merge">
   <reader action="/OA/badgut/logic/action/queryBGApplyMAction" xid="default1"></reader>
   <writer action="/OA/badgut/logic/action/saveBGApplyMAction" xid="default10"></writer>
   <creator action="/OA/badgut/logic/action/createBGApplyMAction" xid="default11"></creator>
   <rule xid="rule1">
    <col name="fCostCenterCode" xid="ruleCol1">
     <required xid="required1">
      <expr xid="default2" xui:update-mode="merge-and-replace"></expr></required> 
     <readonly xid="readonly111" xui:parent="ruleCol1" xui:update-mode="insert">
      <expr xid="default111">true</expr></readonly> </col> 
    <col name="fCostCenterName" xid="ruleCol2">
     <required xid="required2">
      <expr xid="default3" xui:update-mode="merge-and-replace"></expr></required> 
     <readonly xid="readonly211" xui:parent="ruleCol2" xui:update-mode="insert">
      <expr xid="default211">true</expr></readonly> </col> 
    <col name="fYear" xid="ruleCol3">
     <required xid="required3">
      <expr xid="default4" xui:update-mode="merge-and-replace"></expr></required> 
     <readonly xid="readonly311" xui:parent="ruleCol3" xui:update-mode="insert">
      <expr xid="default311">true</expr></readonly> </col> 
    <col name="fCreateDeptID" xid="ruleCol4">
     <readonly xid="readonly1">
      <expr xid="default5">true</expr></readonly> </col> 
    <col name="fCreateDeptName" xid="ruleCol5">
     <readonly xid="readonly2">
      <expr xid="default6">true</expr></readonly> </col> 
    <col name="fCreatePsnID" xid="ruleCol6">
     <readonly xid="readonly3">
      <expr xid="default7">true</expr></readonly> </col> 
    <col name="fCreatePsnName" xid="ruleCol7">
     <readonly xid="readonly4">
      <expr xid="default8">true</expr></readonly> </col> 
    <col name="fCreateTime" xid="ruleCol8">
     <readonly xid="readonly5">
      <expr xid="default9">true</expr></readonly> </col> 
    <col name="fRemark" xid="ruleCol11" xui:parent="rule1" xui:update-mode="insert">
     <readonly xid="readonly41">
      <expr xid="default41">true</expr></readonly> </col> </rule> </div>
  <div autoLoad="true" autoNew="false" columns="OA_BG_ApplyD,version,fAccountID,fAccountCode,fAccountName,fBGApplyID,fPlan1,fPlan2,fPlan3,fPlan4,fPlan5,fPlan6,fPlan7,fPlan8,fPlan9,fPlan10,fPlan11,fPlan12,fPlanall" component="$UI/system/components/justep/data/bizData" concept="OA_BG_ApplyD" directDelete="true" isTree="false" orderBy="" xid="detailData">
   <reader action="/OA/badgut/logic/action/queryBGApplyDAction" xid="default12"></reader>
   <writer action="/OA/badgut/logic/action/saveBGApplyDAction" xid="default13"></writer>
   <creator action="/OA/badgut/logic/action/createBGApplyDAction" xid="default14"></creator>
   <master data="mainData" relation="fBGApplyID" xid="default1"></master></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div><div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chartBtn" label="流程图" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
    <i xid="i2"></i>
    <span xid="span2">流程图</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="processRecBtn" label="流程记录" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
    <i xid="i1"></i>
    <span xid="span1">流程记录</span></a> </div><div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="mainForm">
   <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1">
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col3">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1">
     <label class="x-label" style="width:90px;" title="基础信息" xid="fApplyDeptNamell">基础信息</label>
     <div class="x-edit" xid="div1"></div></div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit8">
     <label class="x-label" style="width:100px;" title="成本编码" xid="label1">成本编码</label>
     <div class="x-edit" style="width:200px;" xid="div8">
      <output bind-ref="mainData.ref('fCostCenterCode')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="fCostCenterCode"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col23">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput2">
     <label class="x-label" style="width:100px;" title="成本中心" xid="fIsPreLoanLL">成本中心</label>
     <div class="x-edit" xid="div23">
      <output bind-ref="mainData.ref('fCostCenterName')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="fCostCenterName"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col8">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput4">
     <label class="x-label" style="width:100px;" title="年 度" xid="fLoanAmtL">年 度</label>
     <div class="x-edit" xid="div11">
      <input bind-ref="mainData.ref('fYear')" class="form-control" component="$UI/system/components/justep/input/input" xid="fYear"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit6">
     <label class="x-label" style="width:100px;" title="提交部门" xid="fLoanDeptNameL">提交部门</label>
     <div class="x-edit" xid="div6">
      <div bind-labelRef="mainData.ref('fCreateDeptName')" bind-ref="mainData.ref('fCreateDeptID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" includeOrgKind="ogn,dpt" xid="orgSelectPC4">
       <div autoLoad="true" component="$UI/system/components/justep/data/bizData" xid="dOrg"></div>
       <option label="sName" value="sCode" xid="option4">
        <columns xid="columns6">
         <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5">
     <label class="x-label" style="width:100px;" title="提 交 人" xid="fLoanPsnNameL">提 交 人</label>
     <div class="x-edit" xid="div5">
      <div bind-labelRef="mainData.ref('fCreatePsnName')" bind-ref="mainData.ref('fCreatePsnID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" includeOrgKind="psm" xid="orgSelectPC3">
       <div autoLoad="true" component="$UI/system/components/justep/data/bizData" limit="-1" xid="dPsm">
        <treeOption rootFilter="1=1" xid="default15"></treeOption></div> 
       <option label="sName" value="sCode" xid="option5">
        <columns xid="columns5">
         <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit4">
     <label class="x-label" style="width:100px;" title="提交时间" xid="fLoanDateL">提交时间</label>
     <div class="x-edit" xid="div4">
      <output bind-ref="mainData.ref('fCreateTime')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output1"></output></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col2">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit15">
     <label class="x-label" style="width:100px;" title="备      注" xid="fRemarkL">备      注</label>
     <div class="x-edit" xid="div15">
      <textarea bind-ref="mainData.ref('fRemark')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="fRemark"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28"></div>
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col19">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit2">
     <label class="x-label" style="width:90px;" title="详细信息" xid="label8">详细信息</label>
     <div class="x-edit" xid="div19"></div></div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11">
    <div xid="div17">
     <div class="table table-hover table-striped" component="$UI/system/components/justep/dataTables/dataTables" data="detailData" flexibleWidth="false" responsive="false" rowActiveClass="active" scrollCollapse="false" showRowNumber="true" style="width:150%;" xid="dataTables" xui:parent="div17" xui:update-mode="insert">
      <columns xid="columns11">
       <column name="fAccountCode" xid="column11"></column>
       <column name="fAccountName" xid="column21"></column>
       <column name="fPlan1" xid="column31"></column>
       <column name="fPlan2" xid="column41"></column>
       <column name="fPlan3" xid="column51"></column>
       <column name="fPlan4" xid="column61"></column>
       <column name="fPlan5" xid="column71"></column>
       <column name="fPlan6" xid="column81"></column>
       <column name="fPlan7" xid="column91"></column>
       <column name="fPlan8" xid="column101"></column>
       <column name="fPlan9" xid="column111"></column>
       <column name="fPlan10" xid="column121"></column>
       <column name="fPlan11" xid="column131"></column>
       <column name="fPlan12" xid="column141"></column>
       <column name="fPlanall" xid="column151"></column></columns> </div> </div> </div> </div></div></div>
