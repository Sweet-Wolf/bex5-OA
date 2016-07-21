<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div xid="detailTabContent">
   <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter">
    
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button3" onClick='{"operation":"mainData.refresh"}' label="刷新">
     <i xid="i11"></i>
     <span xid="span9">刷新</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="preBtn" onClick="{operation:'mainData.prevRow'}">
     <i xid="i3"></i>
     <span xid="span3"></span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="nextBtn" onClick="{operation:'mainData.nextRow'}">
     <i xid="i5"></i>
     <span xid="span4"></span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left" xid="chartBtn" onClick="chartBtnClick" label="流程图" icon="icon-image">
   <i xid="i8" class="icon-image"></i>
   <span xid="span8">流程图</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}" xid="button4">
   <i xid="i4"></i>
   <span xid="span5"></span></a>
  </div> 
   <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
    <div xid="formGroup2" class="form-group">
     <div xid="col21" class="col-sm-2">
      <label xid="fApplyDeptNameL" class="control-label" bind-text="mainData.label('fApplyDeptName')"></label></div> 
     <div xid="col22" class="col-sm-4">
      <output xid="fApplyDeptName" class="form-control" component="$UI/system/components/justep/output/output" bind-ref="mainData.ref('fApplyDeptName')"></output></div> 
     <div xid="col23" class="col-sm-2">
      <label xid="fApplyDateL" class="control-label" bind-text="mainData.label('fApplyDate')"></label></div> 
     <div xid="col24" class="col-sm-4">
      <output xid="fApplyDate" class="form-control" component="$UI/system/components/justep/output/output" bind-ref="mainData.ref('fApplyDate')"></output></div> </div> 
    <div xid="formGroup3" class="form-group">
     <div xid="col31" class="col-sm-2">
      <label xid="fApplyPsnNameL" class="control-label" bind-text="mainData.label('fApplyPsnName')"></label></div> 
     <div xid="col32" class="col-sm-4">
      <output xid="fApplyPsnName" class="form-control" component="$UI/system/components/justep/output/output" bind-ref="mainData.ref('fApplyPsnName')"></output></div> 
     <div xid="col33" class="col-sm-2">
      <label xid="fConsultAmountL" class="control-label" bind-text="mainData.label('fConsultAmount')"></label></div> 
     <div xid="col34" class="col-sm-4">
      <output xid="fConsultAmount" class="form-control" component="$UI/system/components/justep/output/output" bind-ref="mainData.ref('fConsultAmount')"></output></div> </div> 
    <div xid="formGroup1" class="form-group">
     <div xid="col11" class="col-sm-2">
      <label xid="fApplyReasonL" class="control-label" bind-text="mainData.label('fApplyReason')"></label></div> 
     <div xid="col12" class="col-sm-10">
      <textarea xid="fApplyReason" class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fApplyReason')"></textarea></div> </div> 
    <div xid="formGroup4" class="form-group">
     <div xid="col43" class="col-sm-2">
      <label xid="fRemarkL" class="control-label" bind-text="mainData.label('fRemark')"></label></div> 
     <div xid="col44" class="col-sm-10">
      <textarea xid="fRemark" class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fRemark')"></textarea></div> </div> 
    <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="用品信息" xid="controlGroup1">
     <div class="x-control-group-title" xid="controlGroupTitle1">
      <span xid="span21">用品信息</span></div> 
     <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="detailData">
      <columns xid="columns1">
       <column name="fCode" xid="column2"></column>
       <column name="fName" xid="column1"></column>
       <column name="fSpecType" xid="column3"></column>
       <column name="fKindName" xid="column4"></column>
       <column name="fUnitName" xid="column5"></column>
       <column name="fConsultPrice" xid="column6"></column>
       <column name="fFactPrice" xid="column7"></column>
       <column name="fDemandNum" xid="column8"></column>
       <column name="fApprovalNum" xid="column9"></column>
       <column name="fFactNum" xid="column10"></column>
       <column name="fConsultAmount" xid="column11"></column>
       <column name="fFactAmount" xid="column12"></column>
       <column name="fRemark" xid="column13" orderable="false"></column></columns> </div> 
     <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="detailPagerBar" data="detailData">
      <div class="row" xid="div3">
       <div class="col-sm-3" xid="div9">
        <div class="x-pagerbar-length" xid="div10">
         <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect2">
          <span xid="span22">显示</span>
          <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select2">
           <option value="10" xid="default16">10</option>
           <option value="20" xid="default17">20</option>
           <option value="50" xid="default18">50</option>
           <option value="100" xid="default19">100</option></select> 
          <span xid="span23">条</span></label> </div> </div> 
       <div class="col-sm-3" xid="div11">
        <div class="x-pagerbar-info" xid="div12">当前显示0条，共0条</div></div> 
       <div class="col-sm-6" xid="div13">
        <div class="x-pagerbar-pagination" xid="div14">
         <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination2">
          <li class="prev" xid="li3">
           <a href="#" xid="a2">
            <span aria-hidden="true" xid="span24">«</span>
            <span class="sr-only" xid="span25">Previous</span></a> </li> 
          <li class="next" xid="li4">
           <a href="#" xid="a4">
            <span aria-hidden="true" xid="span26">»</span>
            <span class="sr-only" xid="span27">Next</span></a> </li> </ul> </div> </div> </div> </div> </div> </div> </div>
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:179px;top:72px;" onModelConstructDone="modelModelConstructDone">
   <div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_OSC_BuyApplyM" columns="" autoNew="false" orderBy="fApplyDate desc">
    <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCBuyApplyMAction" xid="default1"></reader>
    <writer action="" xid="default2"></writer>
    <creator action="" xid="default3"></creator>
  <rule xid="rule1">
   <readonly xid="readonly1">
    <expr xid="default8">true</expr></readonly> </rule></div> 
   <div component="$UI/system/components/justep/data/bizData" xid="detailData" directDelete="true" autoLoad="true" concept="OA_OSC_BuyApplyD" columns="" autoNew="false">
    <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCBuyApplyDAction" xid="default4"></reader>
    <writer action="" xid="default5"></writer>
    <creator action="" xid="default6"></creator>
    <master data="mainData" relation="fMasterID" xid="default7"></master>
  <rule xid="rule2">
   <readonly xid="readonly2">
    <expr xid="default9">true</expr></readonly> </rule></div> 
  <div component="$UI/system/components/justep/data/bizData" xid="taskData" concept="SA_Task">
   <reader xid="default10" action="/system/logic/action/queryTaskAction"></reader></div></div>
  <div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div></div>