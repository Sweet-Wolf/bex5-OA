<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc;"
  xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:358px;top:179px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AS_InM" columns="" autoNew="false"
      onSaveCommit="DataSaveCommit"> 
      <reader action="/OA/asset/logic/action/queryASInMAction"/>  
      <writer action="/OA/asset/logic/action/saveASInMAction"/>  
      <creator action="/OA/asset/logic/action/createASInMAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" concept="OA_AS_InD" columns="" autoNew="false"> 
      <reader action="/OA/asset/logic/action/queryASInDetailAction"/>  
      <writer action="/OA/asset/logic/action/saveASInDAction"/>  
      <creator action="/OA/asset/logic/action/createASInDAction"/>  
      <master data="mainData" relation="fMasterID"/> 
    </div> 
  <div component="$UI/system/components/justep/data/bizData" xid="modeData" concept="OA_Pub_BaseCode">
   <reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default2" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
   <creator xid="default3" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
   <filter name="filter" xid="filter2">OA_Pub_BaseCode.fScope='资产入库类型' and OA_Pub_BaseCode.fUseStatusName='启用'</filter></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="stateData" idColumn="value"><column label="入库状态" name="value" type="String" xid="xid1"></column>
  <data xid="default4">[{&quot;value&quot;:&quot;已完成&quot;},{&quot;value&quot;:&quot;未完成&quot;}]</data></div></div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="toolBar1">
   
   <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left" xid="refreshBtn" onClick="{operation:'mainData.refresh'}">
    <i xid="i1"></i>
    <span xid="span1"></span></a> 
   
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}">
   <i xid="i5" class="icon-android-search"></i>
   <span xid="span8">查询</span></a>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter" filterData="mainData" dateCol="fDate">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3">
    <option xid="option6"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="modeFilter" filterData="mainData" filterCol="fMode">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true">
    <option xid="option1" data="modeData" value="fName" label="fName"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="stateFilter" filterData="mainData" filterCol="fStateName">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4" multiselect="true">
    <option xid="option3" data="stateData" value="value" label="value"></option></div> </div>
  <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter3" filterData="mainData" filterCols="fDutyDeptName,fDutyPsnName,fAmount,fRemark" class="x-smartFilter-clear-hide input-group">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input4"></input></div></div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false" rowActiveClass="active" class="table table-condensed table-hover" xid="mainTables" data="mainData" pagingType="simple_numbers" lengthMenu="10,25,50,100" onRowDblClick="orderTablesRowDblClick" showRowNumber="true">
   <columns xid="column">
    <column name="fNO" xid="column1"></column>
    <column name="fDutyDeptName" xid="column2"></column>
    <column name="fDutyPsnName" xid="column3"></column>
    <column name="fDate" xid="column4"></column>
    <column name="fMode" xid="column5"></column>
    <column name="fAmount" xid="column6"></column>
    <column name="fStateName" xid="column7"></column>
    <column name="fRemark" xid="column8"></column></columns> </div>
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
         <span class="sr-only" xid="span20">Next</span></a> </li> </ul> </div> </div> </div> </div></div>
