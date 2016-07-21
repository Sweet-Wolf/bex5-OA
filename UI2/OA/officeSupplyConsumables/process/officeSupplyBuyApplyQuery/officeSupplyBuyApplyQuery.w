<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div class="tab-pane active" xid="ListTabContent">
   <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="toolBar1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left" xid="refreshBtn" onClick="{operation:'mainData.refresh'}">
     <i xid="i1"></i>
     <span xid="span1"></span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="" xid="filterBtn" icon="icon-search" onClick="{operation:'bizFilter.menu'}">
     <i xid="i4" class="icon-search"></i>
     <span xid="span5"></span></a> 
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="mainData" filterCols="fBizStateName,fConsultAmount,fApplyReason,fRemark,fApplyDeptName,fApplyPsnName,fApplyDate" class="pull-right">
     <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input2"></input></div> 
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter2" filterData="mainData" filterCol="fBizState">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3" multiselect="true" defaultLabel="'全部'">
    <option xid="option5" data="itemsetData" value="value" label="label"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter2" filterData="mainData" dateCol="fApplyDate" defaultValue="all">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4">
    <option xid="option6"></option></div> </div>
  <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter2" class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true" filterData="mainData" orgFIDCol="fApplyPsnFID" personIDCol="fApplyPsnID" style="width:auto;">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" manageCodes="officeManagement" multiselect="true" style="width:140px;">
    <option xid="option7">
     <columns xid="columns4">
      <column name="sName" xid="column8"></column></columns> </option> </div> </div></div> 
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-condensed table-hover" xid="mainTables" data="mainData" pagingType="simple_numbers" lengthMenu="10,25,50,100" onRowDblClick="orderTablesRowDblClick">
    <columns xid="column">
     <column name="fNO" xid="column14"></column>
     <column name="fBizStateName" xid="column1"></column>
     <column name="fConsultAmount" xid="column2"></column>
     <column name="fApplyReason" xid="column3"></column>
     <column name="fRemark" orderable="false" xid="column4"></column>
     <column name="fApplyDeptName" orderable="false" xid="column5"></column>
     <column name="fApplyPsnName" xid="column6"></column>
     <column name="fApplyDate" xid="column7"></column></columns> </div> 
   <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar" data="mainData">
    <div class="row" xid="div1">
     <div class="col-sm-3" xid="div2">
      <div class="x-pagerbar-length" xid="div4">
       <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
        <span xid="span15">显示</span>
        <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
         <option value="10" xid="default9">10</option>
         <option value="20" xid="default10">20</option>
         <option value="50" xid="default14">50</option>
         <option value="100" xid="default15">100</option></select> 
        <span xid="span16">条</span></label> </div> </div> 
     <div class="col-sm-3" xid="div5">
      <div class="x-pagerbar-info" xid="div6">当前显示1-10条，共16条</div></div> 
     <div class="col-sm-6" xid="div7">
      <div class="x-pagerbar-pagination" xid="div8">
       <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
        <li class="prev" xid="li1">
         <a href="#" xid="a1">
          <span aria-hidden="true" xid="span17">«</span>
          <span class="sr-only" xid="span18">Previous</span></a> </li> 
        <li class="next" xid="li2">
         <a href="#" xid="a3">
          <span aria-hidden="true" xid="span19">»</span>
          <span class="sr-only" xid="span20">Next</span></a> </li> </ul> </div> </div> </div> </div> </div>
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:179px;top:72px;">
   <div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_OSC_BuyApplyM" columns="" autoNew="false" orderBy="fApplyDate desc">
    <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCBuyApplyMAction" xid="default1"></reader>
    <writer action="" xid="default2"></writer>
    <creator action="" xid="default3"></creator></div> 
   <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="itemsetData" idColumn="value">
   <column label="label" name="label" type="String" xid="xid1"></column>
   <column label="value" name="value" type="String" xid="xid2"></column>
   <data xid="default8">[{&quot;label&quot;:&quot;编辑中&quot;,&quot;value&quot;:&quot;bsEditing&quot;},{&quot;label&quot;:&quot;处理中&quot;,&quot;value&quot;:&quot;bsExecuting&quot;},{&quot;label&quot;:&quot;已完成&quot;,&quot;value&quot;:&quot;bsFinished&quot;},{&quot;label&quot;:&quot;已终止&quot;,&quot;value&quot;:&quot;bsAborted&quot;}]</data></div></div>
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter" filterData="mainData" style="left:28px;top:290px;" filterCols="fBizStateName,fApplyReason,fRemark,fApplyDeptName,fApplyPsnName"></span></div>