<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:587px;top:20px;" onModelConstructDone="modelModelConstructDone"> 
    
  
  <div autoLoad="true" autoNew="false" columns="" component="$UI/system/components/justep/data/bizData" concept="OA_FC_ReimbApplyM" directDelete="true" isTree="false" orderBy="" xid="mainData" xui:update-mode="merge" confirmRefresh="false">
   <reader action="/OA/finance/logic/action/queryFCReimbApplyMAction" xid="default14"></reader>
   <writer action="/OA/finance/logic/action/saveFCReimbApplyMAction" xid="default15"></writer>
   <creator action="/OA/finance/logic/action/createFCReimbApplyMAction" xid="default16"></creator>
   <rule xid="rule2">
    <col name="fNO" xid="ruleCol2">
     <readonly xid="readonly1">
      <expr xid="default7">true</expr></readonly> </col> 
    <col name="fLoanDate" xid="ruleCol3">
     <required xid="required2">
      <expr xid="default8"></expr></required> 
     <readonly xid="readonly11" xui:parent="ruleCol3" xui:update-mode="insert">
      <expr xid="default11">true</expr></readonly> </col> 
    <col name="fReimAmt" xid="ruleCol5">
     <readonly xid="readonly3">
      <expr xid="default9">true</expr></readonly> </col> 
    <col name="fReiAllowance" xid="ruleCol6">
     <required xid="required3">
      <expr xid="default10"></expr></required> 
     <readonly xid="readonly21" xui:parent="ruleCol6" xui:update-mode="insert">
      <expr xid="default21">true</expr></readonly> </col> 
    <col name="fIsPreLoan" xid="ruleCol7">
     <required xid="required4">
      <expr xid="default11"></expr></required> 
     <readonly xid="readonly31" xui:parent="ruleCol7" xui:update-mode="insert">
      <expr xid="default31">true</expr></readonly> </col> 
    <col name="fLoanAmt" xid="ruleCol8">
     <readonly xid="readonly5">
      <expr xid="default12">true</expr></readonly> </col> 
    <col name="fFactAmount" xid="ruleCol9">
     <readonly xid="readonly6">
      <expr xid="default13">true</expr></readonly> </col> 
    <col name="fLoanDeptID" xid="ruleCol11" xui:parent="rule2" xui:update-mode="insert">
     <readonly xid="readonly41">
      <expr xid="default41">true</expr></readonly> </col> 
    <col name="fLoanDeptName" xid="ruleCol21" xui:parent="rule2" xui:update-mode="insert">
     <readonly xid="readonly51">
      <expr xid="default51">true</expr></readonly> </col> 
    <col name="fLoanPsnID" xid="ruleCol31" xui:parent="rule2" xui:update-mode="insert">
     <readonly xid="readonly61">
      <expr xid="default61">true</expr></readonly> </col> 
    <col name="fLoanPsnName" xid="ruleCol41" xui:parent="rule2" xui:update-mode="insert">
     <readonly xid="readonly71">
      <expr xid="default71">true</expr></readonly> </col> 
    <col name="fMustReimAmt" xid="ruleCol51" xui:parent="rule2" xui:update-mode="insert">
     <readonly xid="readonly81">
      <expr xid="default81">true</expr></readonly> </col> 
    <col name="fReiBeginDate" xid="ruleCol61" xui:parent="rule2" xui:update-mode="insert">
     <readonly xid="readonly91">
      <expr xid="default91">true</expr></readonly> </col> 
    <col name="fReiBackDate" xid="ruleCol71" xui:parent="rule2" xui:update-mode="insert">
     <readonly xid="readonly101">
      <expr xid="default101">true</expr></readonly> </col> 
    <col name="fReiEvent" xid="ruleCol81" xui:parent="rule2" xui:update-mode="insert">
     <readonly xid="readonly111">
      <expr xid="default111">true</expr></readonly> </col>
       <col name="fOughtReimbAmtCn" xid="ruleCol82" xui:parent="rule2" xui:update-mode="insert">
     <readonly xid="readonly112">
      <expr xid="default112">true</expr></readonly> </col>
       </rule> </div>
  <div autoLoad="true" autoNew="false" columns="OA_FC_ReimbApplyD,version,fCostType,fCostTypeCode,fCostTypeName,fBeginTime,fEndTime,fCostBillNum,fSimpleDeclara,fCostAmt,fReimFID,fFactAmount,fReiAllowancem" component="$UI/system/components/justep/data/bizData" concept="OA_FC_ReimbApplyD" directDelete="true" isTree="false" orderBy="" xid="detailData">
   <reader action="/OA/finance/logic/action/queryFCReimbApplyDAction" xid="default17"></reader>
   <writer action="/OA/finance/logic/action/saveFCReimbApplyDAction" xid="default18"></writer>
   <creator action="/OA/finance/logic/action/createFCReimbApplyDAction" xid="default20"></creator>
   <master data="mainData" relation="fReimFID" xid="default1"></master>
   <aggregateRelation relation="reimbApplyNo" xid="aggregateRelation1"></aggregateRelation></div>
  <div component="$UI/system/components/justep/data/bizData" xid="taskData" concept="SA_Task">
   <reader xid="default19" action="/system/logic/action/queryTaskAction"></reader></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div><div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chartBtn" label="流程图" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
    <i xid="i2"></i>
    <span xid="span2">流程图</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="processRecBtn" label="流程记录" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
    <i xid="i1"></i>
    <span xid="span1">流程记录</span></a> </div><div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="mainForm">
   <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1">
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col3">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1">
     <label class="x-label" style="width:90px;" title="基础信息" xid="fApplyDeptNamell">基础信息</label>
     <div class="x-edit" xid="div1"></div></div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col4"></div>
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit3">
     <label class="x-label" style="width:100px;" title="NO:" xid="label3">NO:</label>
     <div class="x-edit" xid="div3">
      <output bind-ref="mainData.ref('fNO')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="fNO"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit6">
     <label bind-text="mainData.label('fLoanDeptName')" class="x-label" style="width:100px;" xid="fLoanDeptNameL"></label>
     <div class="x-edit" xid="div6">
      <div bind-labelRef="mainData.ref('fLoanDeptName')" bind-ref="mainData.ref('fLoanDeptID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" includeOrgKind="ogn,dpt" xid="orgSelectPC4">
       <div autoLoad="true" component="$UI/system/components/justep/data/bizData" xid="dOrg"></div>
       <option label="sName" value="sCode" xid="option4">
        <columns xid="columns6">
         <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5">
     <label bind-text="mainData.label('fLoanPsnName')" class="x-label" style="width:100px;" xid="fLoanPsnNameL"></label>
     <div class="x-edit" xid="div5">
      <div bind-labelRef="mainData.ref('fLoanPsnName')" bind-ref="mainData.ref('fLoanPsnID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" includeOrgKind="psm" xid="orgSelectPC3">
       <div autoLoad="true" component="$UI/system/components/justep/data/bizData" limit="-1" xid="dPsm">
        <treeOption rootFilter="1=1" xid="default22"></treeOption></div> 
       <option label="sName" value="sCode" xid="option5">
        <columns xid="columns5">
         <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit4">
     <label bind-text="mainData.label('fLoanDate')" class="x-label" style="width:100px;" xid="fLoanDateL"></label>
     <div class="x-edit" xid="div4">
      <input bind-ref="mainData.ref('fLoanDate')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd" xid="fLoanDate"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit8">
     <label bind-text="mainData.label('fMustReimAmt')" class="x-label" style="width:100px;" xid="fMustReimAmtL"></label>
     <div class="x-edit" style="width:200px;" xid="div8">
      <input bind-ref="mainData.ref('fMustReimAmt')" class="form-control" component="$UI/system/components/justep/input/input" xid="fMustReimAmt"></input></div> </div> </div> 
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col18">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit9">
     <label bind-text="mainData.label('fOughtReimbAmtCn')" class="x-label" style="width:100px;" xid="fOughtReimbAmtCnL"></label>
     <div class="x-edit" xid="div9">
      <output bind-ref="mainData.ref('fOughtReimbAmtCn')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="fOughtReimbAmtCn"></output></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit15">
     <label bind-text="mainData.label('fReiEvent')" class="x-label" style="width:100px;" xid="fReiEventL"></label>
     <div class="x-edit" xid="div15">
      <textarea bind-ref="mainData.ref('fReiEvent')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="fReiEvent"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col20">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit7">
     <label class="x-label" style="color:#3366FF;width:534px;" title="如是出差报销，请在下面录入出差信息。" xid="label10">如是出差报销，请在下面录入出差信息。</label>
     <div class="x-edit" xid="div20"></div></div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col25">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit12">
     <label bind-text="mainData.label('fReiAllowance')" class="x-label" style="width:100px;" xid="fReiAllowanceL"></label>
     <div class="x-edit" xid="div12">
      <input bind-ref="mainData.ref('fReiAllowance')" class="form-control" component="$UI/system/components/justep/input/input" xid="fReiAllowance"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col5">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput1">
     <label bind-text="mainData.label('fReiBeginDate')" class="x-label" style="width:100px;" xid="fReiBeginDateL"></label>
     <div class="x-edit" xid="div2">
      <input bind-ref="mainData.ref('fReiBeginDate')" class="form-control" component="$UI/system/components/justep/input/input" xid="fReiBeginDate"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col6">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput2">
     <label bind-text="mainData.label('fReiBackDate')" class="x-label" style="width:100px;" xid="fReiBackDateL"></label>
     <div class="x-edit" xid="div7">
      <input bind-ref="mainData.ref('fReiBackDate')" class="form-control" component="$UI/system/components/justep/input/input" xid="fReiBackDate"></input></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col21">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit10">
     <label class="x-label" style="color:#3366FF;width:534px;" xid="label11">如果报销有对应请款申请，请在下面选择对应申请。</label>
     <div class="x-edit" xid="div21"></div></div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col23">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput2">
     <label bind-text="mainData.label('fIsPreLoan')" class="x-label" style="width:100px;" xid="fIsPreLoanLL"></label>
     <div class="x-edit" xid="div23">
      <output bind-ref="mainData.ref('fIsPreLoan')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" style="float:left;" xid="opfIsPreLoanL"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col8">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput4">
     <label bind-text="mainData.label('fLoanAmt')" class="x-label" style="width:100px;" xid="fLoanAmtL"></label>
     <div class="x-edit" xid="div11">
      <output bind-ref="mainData.ref('fLoanAmt')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" style="float:left;" xid="outfLoanAmt"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col9">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput5">
     <label bind-text="mainData.label('fReimAmt')" class="x-label" style="width:100px;" xid="fReimAmtL"></label>
     <div class="x-edit" xid="div13">
      <output bind-ref="mainData.ref('fReimAmt')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" style="float:left;" xid="outfReimAmt"></output></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col19">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit2">
     <label class="x-label" style="width:90px;" title="费用信息" xid="label8">费用信息</label>
     <div class="x-edit" xid="div19"></div></div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col22">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit11">
     <label class="x-label" style="color:#3366FF;width:795.75px;" xid="label12">请在下列录入报销单据信息，注意请在简要说明中录入报销单据，开始时间和结束时间用与描述旅店住宿费用、车票、机票等费用的时间区间。如无时间可不填写。</label>
     <div class="x-edit" xid="div22"></div></div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11">
    <div xid="div17">
     <div class="table table-hover table-striped" component="$UI/system/components/justep/dataTables/dataTables" data="detailData" flexibleWidth="true" rowActiveClass="active" showRowNumber="true" xid="dataTables" xui:parent="div17" xui:update-mode="insert">
      <columns xid="columns1">
       <column name="fCostTypeName" xid="column11"></column>
       <column name="fBeginTime" xid="column21"></column>
       <column name="fEndTime" xid="column31"></column>
       <column name="fCostBillNum" xid="column41"></column>
       <column name="fCostAmt" xid="column61"></column>
       <column name="fSimpleDeclara" xid="column51"></column></columns> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col1"></div>
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col2"></div>
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col7">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput4">
     <label bind-text="mainData.label('fFactAmount')" class="x-label" style="width:100px;" xid="fFactAmountL"></label>
     <div class="x-edit" xid="div16">
      <output bind-ref="mainData.ref('fFactAmount')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" style="float:left;" xid="fFactAmount"></output></div> </div> </div> </div></div></div>
