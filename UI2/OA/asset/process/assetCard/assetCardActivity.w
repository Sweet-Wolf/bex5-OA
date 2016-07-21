<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:460px;top:17px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AS_Card" limit="15" columns=""> 
      <reader action="/OA/asset/logic/action/queryASCardAction"/>  
      <writer action="/OA/asset/logic/action/saveASCardAction"/>  
      <creator action="/OA/asset/logic/action/createASCardAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <rule xid="rule1">
   <col name="fKind" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default18">true</expr></required> </col> 
   <col name="fKindID" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default19">true</expr></required> </col> 
   <col name="fCode" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default20">true</expr></required> </col> 
   <col name="fName" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default21">true</expr></required> </col> </rule></div> 
  <div component="$UI/system/components/justep/data/bizData" xid="kindData" concept="OA_Pub_BaseCode" autoLoad="true"><reader xid="default5" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
  <writer xid="default6" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
  <creator xid="default7" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
  <filter name="filter0" xid="filter1"><![CDATA[OA_Pub_BaseCode.fScope='固定资产类别' and OA_Pub_BaseCode.fUseStatusName='启用']]></filter></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dAssetStatus" idColumn="label"><column label="col0" name="label" type="String" xid="default8"></column>
  <column label="col1" name="value" type="Integer" xid="default9"></column>
  <data xid="default10">[{&quot;label&quot;:&quot;闲置&quot;,&quot;value&quot;:0},{&quot;label&quot;:&quot;占用&quot;,&quot;value&quot;:1},{&quot;label&quot;:&quot;报废&quot;,&quot;value&quot;:2},{&quot;label&quot;:&quot;处理&quot;,&quot;value&quot;:3}]</data></div>
  <div component="$UI/system/components/justep/data/bizData" xid="unitData" concept="OA_Pub_BaseCode" autoLoad="true">
   <reader xid="default12" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default13" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
   <creator xid="default14" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
  <filter name="filter1" xid="filter2"><![CDATA[OA_Pub_BaseCode.fScope='办公用品计量单位' and OA_Pub_BaseCode.fUseStatusName='启用']]></filter></div>
  <div component="$UI/system/components/justep/data/bizData" xid="sourceData" concept="OA_Pub_BaseCode" autoLoad="true">
   <reader xid="default15" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default16" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
   <creator xid="default17" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
  <filter name="filter2" xid="filter3"><![CDATA[OA_Pub_BaseCode.fScope='资产入库类型' and OA_Pub_BaseCode.fUseStatusName='启用']]></filter></div></div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter" filterData="mainData"></span><div xid="bar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="addBtnClick" xid="newButton" label="新增" icon="icon-android-add">
    <i xid="i13" class="icon-android-add"></i>
    <span xid="span19">新增</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button3" onClick="{operation:'mainData.refresh'}">
    <i xid="i6"></i>
    <span xid="span10">刷新</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}">
   <i xid="i5" class="icon-android-search"></i>
   <span xid="span1">查询</span></a>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter" filterData="mainData" dateCol="fCreateTime">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2">
    <option xid="option6"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="statusFilter" filterData="mainData" filterCol="fStatusName">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3" multiselect="true">
    <option xid="option3" data="dAssetStatus" value="label" label="label"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="kindFilter" filterData="mainData" filterCol="fKind">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true">
    <option xid="option4" data="kindData" value="fName" label="fName"></option></div> </div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="mainData" filterCols="fName" class="x-smartFilter-clear-hide input-group">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input4"></input></div>
  </div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" class="table table-hover table-striped" xid="listData" data="mainData" rowActiveClass="active" onRowDblClick="grid3RowClick" showRowNumber="true">
   <columns xid="column">
    <column name="fStatusName" xid="column1"></column>
    <column name="fAssetConfirm" xid="column2"></column>
    <column name="fCode" xid="column3"></column>
    <column name="fKind" xid="column4"></column>
    <column name="fName" xid="column5"></column>
    <column name="fSpecType" xid="column6"></column>
    <column name="fSourceName" xid="column7"></column>
    <column name="fOriginValue" xid="column8"></column>
    <column name="fRemainValue" xid="column9"></column></columns> </div>
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
         <span class="sr-only" xid="span9">Next</span></a> </li> </ul> </div> </div> </div> </div></div>
