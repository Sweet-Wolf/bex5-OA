<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div xid="listContent">
   <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="listBar">
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="mainData" style="float: right;" filterCols="fNO,fRetDate,fRemark,fCreateDeptName,fCreatePsnName,fCreateTime">
     <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="refreshBtn" onClick="{operation:'mainData.refresh'}">
     <i xid="i1"></i>
     <span xid="span1"></span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="" xid="filterBtn" icon="icon-search" onClick="{operation:'filter.menu'}">
     <i xid="i4" class="icon-search"></i>
     <span xid="span5"></span></a> 
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter2" filterData="mainData" filterCol="fBizState">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3" multiselect="true" defaultLabel="'状态'">
    <option xid="option5" data="itemsetData" value="value" label="label"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter2" filterData="mainData" dateCol="fCreateTime" defaultValue="all">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4">
    <option xid="option6"></option></div> </div>
  <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter2" class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true" filterData="mainData" orgFIDCol="fCreatePsnFID" personIDCol="fCreatePsnID" style="width:auto;">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" manageCodes="licenseManagement" multiselect="true" style="width:140px;">
    <option xid="option7" value="SA_OPOrg" label="sName">
     <columns xid="columns4">
      <column name="sName" xid="column8"></column></columns> </option> </div> </div></div> 
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false" rowActiveClass="active" class="table table-hover hidder-xs" xid="list" data="mainData" pagingType="simple_numbers" onRowDblClick="listTablesRowDblClick" showRowNumber="true" responsive="true">
    <columns xid="column">
     <column name="fBizStateName" label="状态" xid="column1"></column>
     <column name="fNO" label="单据号" xid="column2"></column>
     <column name="fRetDate" label="归还日期" xid="column3"></column>
     <column name="fRemark" label="备注" xid="column4"></column>
     <column name="fCreateDeptName" label="提交部门" xid="column5"></column>
     <column name="fCreatePsnName" label="经办人" xid="column6"></column>
     <column name="fCreateTime" label="提交时间" xid="column7"></column></columns> </div> 
   <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar" data="mainData">
    <div class="row" xid="div1">
     <div class="col-sm-3" xid="div2">
      <div class="x-pagerbar-length" xid="div4">
       <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect2">
        <span xid="span7">显示</span>
        <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select2">
         <option value="10" xid="default14">10</option>
         <option value="20" xid="default15">20</option>
         <option value="50" xid="default16">50</option>
         <option value="100" xid="default17">100</option></select> 
        <span xid="span10">条</span></label> </div> </div> 
     <div class="col-sm-3" xid="div9">
      <div class="x-pagerbar-info" xid="div10">当前显示1-10条，共16条</div></div> 
     <div class="col-sm-6" xid="div11">
      <div class="x-pagerbar-pagination" xid="div12">
       <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
        <li class="prev" xid="li3">
         <a href="#" xid="a1">
          <span aria-hidden="true" xid="span11">«</span>
          <span class="sr-only" xid="span12">Previous</span></a> </li> 
        <li class="next" xid="li4">
         <a href="#" xid="a5">
          <span aria-hidden="true" xid="span13">»</span>
          <span class="sr-only" xid="span14">Next</span></a> </li> </ul> </div> </div> </div> </div> </div>
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:245px;top:383px;">
   <div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" autoNew="false" concept="OA_LS_LicenseApplyM" columns="" orderBy="fCreateTime desc">
    <reader action="/OA/license/logic/action/queryLSLicenseApplyMAction" xid="default2"></reader>
    <writer action="/OA/license/logic/action/saveLSLicenseApplyMAction" xid="default3"></writer>
    <creator action="/OA/license/logic/action/createLSLicenseApplyMAction" xid="default4"></creator></div> 
   <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="itemsetData" idColumn="value">
   <column label="label" name="label" type="String" xid="xid1"></column>
   <column label="value" name="value" type="String" xid="xid2"></column>
   <data xid="default9">[{&quot;label&quot;:&quot;编辑中&quot;,&quot;value&quot;:&quot;bsEditing&quot;},{&quot;label&quot;:&quot;处理中&quot;,&quot;value&quot;:&quot;bsExecuting&quot;},{&quot;label&quot;:&quot;已完成&quot;,&quot;value&quot;:&quot;bsFinished&quot;},{&quot;label&quot;:&quot;已终止&quot;,&quot;value&quot;:&quot;bsAborted&quot;}]</data></div></div>
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="filter" filterData="mainData" filterCols="fNO,fRetDate,fRemark,fCreateDeptName,fCreatePsnName,fCreateTime"></span></div>