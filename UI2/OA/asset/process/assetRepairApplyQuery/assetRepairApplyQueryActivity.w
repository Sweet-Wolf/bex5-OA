<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:350px;top:185px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AS_RepairApply" limit="15" columns=""> 
      <reader action="/OA/asset/logic/action/queryASRepairApplyAction"/>  
      <writer action="/OA/asset/logic/action/saveASRepairApplyAction"/>  
      <creator action="/OA/asset/logic/action/createASRepairApplyAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>
  <div component="$UI/system/components/justep/data/bizData" concept="OA_AS_RepairItem" limit="-1" xid="dRepairItem" xui:parent="model" xui:update-mode="insert" autoLoad="true">
   <reader action="/OA/asset/logic/action/queryASRepairItemAction" xid="default11"></reader>
   <writer action="/OA/asset/logic/action/saveASRepairItemAction" xid="default21"></writer>
   <creator action="/OA/asset/logic/action/createASRepairItemAction" xid="default31"></creator>
   <master data="mainData" relation="fMasterID" xid="default41"></master>
   <rule xid="rule11">
    <col name="fItem" xid="ruleCol11">
     <required xid="required11">
      <expr xid="default51">true</expr>
      <message xid="default61">'维修项目不能为空！'</message></required> </col> 
    <col name="fAmount" xid="ruleCol21">
     <required xid="required21">
      <expr xid="default71">true</expr>
      <message xid="default81">'金额不能为空！'</message></required> </col> </rule> </div>
  <div component="$UI/system/components/justep/data/bizData" concept="OA_AS_FittingInfo" limit="-1" xid="dFittingInfo" xui:parent="model" xui:update-mode="insert" autoLoad="true">
   <reader action="/OA/asset/logic/action/queryASFittingInfoAction" xid="default91"></reader>
   <writer action="/OA/asset/logic/action/saveASFittingInfoAction" xid="default101"></writer>
   <creator action="/OA/asset/logic/action/createASFittingInfoAction" xid="default111"></creator>
   <master data="mainData" relation="fMasterID" xid="default121"></master>
   <rule xid="rule111">
    <col name="fName" xid="ruleCol1111">
     <required xid="required1111">
      <expr xid="default1311"></expr>
      <message xid="default2111"></message></required> </col> 
    <col name="fNum" xid="ruleCol2111">
     <constraint xid="constraint1111">
      <expr xid="default3111">$data.val(&quot;fNum&quot;) &gt;0</expr>
      <message xid="default4111">'数量必须大于0！'</message></constraint> </col> 
    <col name="fPrice" xid="ruleCol3111">
     <constraint xid="constraint2111">
      <expr xid="default5111">$data.val(&quot;fPrice&quot;)&gt;0</expr>
      <message xid="default6111">'单价必须大于0！'</message></constraint> </col> 
    <col name="fAmount" xid="ruleCol4111">
     <required xid="required2111">
      <expr xid="default7111"></expr>
      <message xid="default8111"></message></required> 
     <calculate xid="calculate11">
      <expr xid="default211">$model.dFittingInfo.val(&quot;fPrice&quot;) * $model.dFittingInfo.val(&quot;fNum&quot;)</expr></calculate> </col> </rule> 
   <calculateRelation relation="relation1" xid="calculateRelation211"></calculateRelation></div>
  <div component="$UI/system/components/justep/data/bizData" xid="dRepairType" concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence:asc">
   <reader xid="default15" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default16"></writer>
   <creator xid="default17"></creator>
   <filter name="repairTypeFilter" xid="filter1">OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='资产维修类型'</filter>
   <master xid="default19" data="mainData"></master></div>
  <div component="$UI/system/components/justep/data/bizData" xid="kindData" concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence:asc">
   <reader xid="default8" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default7"></writer>
   <creator xid="default6"></creator>
   <filter name="repairTypeFilter" xid="filter2"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='固定资产类别']]></filter>
   <master xid="default5" data="mainData"></master></div></div>  
  <div xid="bar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button3" onClick='{"operation":"mainData.refresh"}'>
    <i xid="i6"></i>
    <span xid="span10">刷新</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}">
   <i xid="i5" class="icon-android-search"></i>
   <span xid="span1">查询</span></a>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter" filterData="mainData" dateCol="fApplyDate">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3">
    <option xid="option6"></option></div> </div>
  <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter" class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true" filterData="mainData" orgFIDCol="fApplyPsnFID" personIDCol="fApplyPsnID" style="width:auto;">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC1" manageCodes="assetManagement" multiselect="true" style="width:140px;">
    <option xid="option7">
     <columns xid="columns4">
      <column name="sName" xid="column1"></column></columns> </option> </div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="kindFilter" filterData="mainData" filterCol="fKind">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" multiselect="true">
    <option xid="option2" data="kindData" value="fName" label="fName"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="typeFilter" filterData="mainData" filterCol="fRepairType">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true">
    <option xid="option1" data="dRepairType" value="fName" label="fName"></option></div> </div></div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" class="table table-hover table-striped" xid="listData" data="mainData" rowActiveClass="active" onRowDblClick="grid3RowClick" showRowNumber="true">
   <columns xid="column">
    <column name="fNO" width="200px" xid="column2"></column>
    <column name="fApplyDeptName" xid="column3"></column>
    <column name="fApplyPsnName" xid="column4"></column>
    <column name="fApplyDate" xid="column5"></column>
    <column name="fCode" xid="column6"></column>
    <column name="fKind" xid="column7"></column>
    <column name="fName" xid="column8"></column>
    <column name="fRepairType" xid="column9"></column>
    <column name="fRepairDate" xid="column10"></column>
    <column name="fRepairAmount" xid="column11"></column>
    <column name="fBizStateName" xid="column12"></column></columns> </div>
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
         <span class="sr-only" xid="span9">Next</span></a> </li> </ul> </div> </div> </div> 
  </div>
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter" filterData="mainData" style="left:129px;top:318px;"></span></div>