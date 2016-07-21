<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div class="tab-pane active" xid="list">
   <div xid="bar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="mainData" class="pull-right" filterCols="fNO,fApplyDeptName,fApplyPsnName,fApplyDate,fCode,fKind,fName,fSpecType,fDealType,fBizStateName">
     <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input4"></input></div> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button3" onClick='{"operation":"mainData.refresh"}'>
     <i xid="i6"></i>
     <span xid="span10">刷新</span></a> 
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter2" filterData="mainData" filterCol="fBizState">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3" multiselect="true" defaultLabel="'全部'">
    <option xid="option5" data="itemsetData" value="value" label="label"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter2" filterData="mainData" dateCol="fApplyDate">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4">
    <option xid="option6"></option></div> </div>
  <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter2" class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true" filterData="mainData" orgFIDCol="fApplyPsnFID" personIDCol="fApplyPsnID" style="width:auto;">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" manageCodes="assetManagement" multiselect="true" style="width:140px;">
    <option xid="option7">
     <columns xid="columns4">
      <column name="sName" xid="column11"></column></columns> </option> </div> </div></div> 
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false" class="table table-hover table-striped" xid="listData" data="mainData" rowActiveClass="active" showRowNumber="true" onRowDblClick="listDataRowDblClick">
    <columns xid="column">
     <column name="fBizStateName" label=" 状态" width="50" xid="column1"></column>
     <column name="fNO" xid="column2" width="100"></column>
     <column name="fCode" width="150" xid="column3"></column>
     <column name="fKind" xid="column4" width="150"></column>
     <column name="fName" width="150" xid="column5"></column>
     <column name="fSpecType" xid="column6" width="100"></column>
     
     <column name="fDealType" xid="column7" width="50"></column><column name="fApplyDeptName" xid="column8" width="80"></column>
     <column name="fApplyPsnName" xid="column9" width="80"></column>
     <column name="fApplyDate" xid="column10" width="100"></column></columns> </div> 
   <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pageBar" data="mainData">
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
          <span class="sr-only" xid="span9">Next</span></a> </li> </ul> </div> </div> </div> </div> </div>
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:350px;top:185px;">
   <div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_AS_DealApply" limit="16" columns="">
    <reader action="/OA/asset/logic/action/queryASDealApplyAction" xid="default5"></reader>
    <writer action="/OA/asset/logic/action/saveASDealApplyAction" xid="default6"></writer>
    <creator action="/OA/asset/logic/action/createASDealApplyAction" xid="default7"></creator>
    <calculateRelation relation="calcCheckBox" xid="calculateRelation1"></calculateRelation></div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="itemsetData" idColumn="value">
   <column label="label" name="label" type="String" xid="xid1"></column>
   <column label="value" name="value" type="String" xid="xid2"></column>
   <data xid="default9">[{&quot;label&quot;:&quot;编辑中&quot;,&quot;value&quot;:&quot;bsEditing&quot;},{&quot;label&quot;:&quot;处理中&quot;,&quot;value&quot;:&quot;bsExecuting&quot;},{&quot;label&quot;:&quot;已完成&quot;,&quot;value&quot;:&quot;bsFinished&quot;},{&quot;label&quot;:&quot;已终止&quot;,&quot;value&quot;:&quot;bsAborted&quot;}]</data></div></div></div>