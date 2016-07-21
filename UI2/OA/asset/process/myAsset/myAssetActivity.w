<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:774px;top:19px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AS_Card" limit="15" columns=""
      onSaveCommit="saveCommit"> 
      <reader action="/OA/asset/logic/action/queryASMyAssetAction"/>  
      <writer action="/OA/asset/logic/action/saveASCardAction"/>  
      <creator action="/OA/asset/logic/action/createASCardAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="itemsetData" idColumn="value">
   <column label="label" name="label" type="String" xid="xid1"></column>
   <column label="value" name="value" type="String" xid="xid2"></column>
   <data xid="default9">[{&quot;label&quot;:&quot;已确认&quot;,&quot;value&quot;:&quot;已确认&quot;},{&quot;label&quot;:&quot;未确认&quot;,&quot;value&quot;:&quot;未确认&quot;}]</data></div></div>  
  <div xid="bar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button3" onClick='{"operation":"mainData.refresh"}'>
    <i xid="i6"></i>
    <span xid="span10">刷新</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="资产确认" xid="trgConfirm" onClick="trgConfirmClick" icon="icon-android-checkmark">
    <i xid="i10" class="icon-android-checkmark"></i>
    <span xid="span17">资产确认</span></a><div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter2" filterData="mainData" filterCol="fAssetConfirm">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3" multiselect="true" defaultLabel="'全部'">
    <option xid="option5" data="itemsetData" value="value" label="label"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter2" filterData="mainData" dateCol="fCreateTime">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4">
    <option xid="option6"></option></div> </div>
  <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter2" class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true" filterData="mainData" orgFIDCol="fDutyPsnFID" personIDCol="fDutyPsnID" style="width:auto;">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" manageCodes="assetManagement" multiselect="true" style="width:140px;">
    <option xid="option7">
     <columns xid="columns4">
      <column name="sName" xid="column11"></column></columns> </option> </div> </div>
  <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="" class="x-smartFilter-clear-hide input-group" filterCols="fKind,fCode,fName,fSpecType,fDutyDeptName,fDutyPsnName,fSourceName">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input4"></input></div></div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" class="table table-hover table-striped" xid="listData" data="mainData" rowActiveClass="active" showRowNumber="true" multiSelect="true" onRowClick="listDataRowClick" onCellRender="listDataCellRender">
   <columns xid="column">
    <column name="fStatusName" xid="column2"></column>
    <column name="fAssetConfirm" xid="column3"></column>
    <column name="fCode" width="120" xid="column6"></column><column name="fName" xid="column7"></column><column name="fKind" xid="column1"></column>
    
    
    <column name="fDutyDeptName" xid="column8"></column>
    <column name="fDutyPsnName" xid="column9"></column>
    <column name="fDetailInfo" xid="column5"></column>
    <column name="fRemark" xid="column4"></column></columns> </div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pageBar" data="mainData">
   <div class="row" xid="div1">
    <div class="col-sm-3" xid="div2">
     <div class="x-pagerbar-length" xid="div3">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="limitSelect1">
       <span xid="span2">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default1">10</option>
        <option value="20" xid="default2">20</option>
        <option value="50" xid="default3">50</option>
        <option value="100" xid="default4">100</option></select> 
       <span xid="span5">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div4">
     <div class="x-pagerbar-info" xid="div5">当前显示1-10条，共16条</div></div> 
    <div class="col-sm-6" xid="div6">
     <div class="x-pagerbar-pagination" xid="div7">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li1">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span6">«</span>
         <span class="sr-only" xid="span7">Previous</span></a> </li> 
       <li class="next" xid="li2">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span8">»</span>
         <span class="sr-only" xid="span9">Next</span></a> </li> </ul> </div> </div> </div> </div>
  </div>
