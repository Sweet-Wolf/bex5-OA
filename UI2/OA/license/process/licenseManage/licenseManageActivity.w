<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:125px;top:481px;"><div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_LS_LicenseManage" limit="15" columns="" onSaveCommit="saveCommit" orderBy="fOperateDate desc">
   <reader action="/OA/license/logic/action/queryLSLicenseManageAction" xid="default1"></reader>
   <writer action="/OA/license/logic/action/saveLSLicenseManageAction" xid="default2"></writer>
   <creator action="/OA/license/logic/action/createLSLicenseManageAction" xid="default3"></creator>
   <calculateRelation relation="calcCheckBox" xid="calculateRelation1"></calculateRelation>
   <rule xid="rule1">
    <col name="fLicenseNo" xid="ruleCol1">
     <required xid="required1">
      <expr xid="default8">js:true</expr>
      <message xid="default9">证照号不能为空</message></required> </col> 
    <col name="fSerialNumber" xid="ruleCol2">
     <required xid="required2">
      <expr xid="default10">js:true</expr>
      <message xid="default11">编号不能为空</message></required> </col> 
    <col name="fLicenseName" xid="ruleCol3">
     <required xid="required3">
      <expr xid="default12">js:true</expr>
      <message xid="default13">证照名不能为空</message></required> </col> </rule> </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dTypeFilter" idColumn="typeName">
   <column label="typeName" name="typeName" type="String" xid="default5"></column>
   <column label="typeValue" name="typeValue" type="String" xid="default6"></column>
   <data xid="default7">[{&quot;typeName&quot;:&quot;闲置&quot;,&quot;typeValue&quot;:&quot;Unused&quot;},{&quot;typeName&quot;:&quot;借出&quot;,&quot;typeValue&quot;:&quot;Lended&quot;}]</data></div></div> 
<div xid="div">
   <div xid="bar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="mainData" class="pull-right" filterCols="fUseStatusName,fLicenseNo,fSerialNumber,fLicenseName,fReleaseDeptName,fReleaseDate,fValidityDate,fNextExamDate,fIsCopyName">
     <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input4"></input></div> 
    
    
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button5" onClick="button5Click" label="新增" icon="icon-android-add">
   <i xid="i4" class="icon-android-add"></i>
   <span xid="span11">新增</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.delete'}" xid="button4">
   <i xid="i3"></i>
   <span xid="span9"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button3" onClick='{"operation":"mainData.refresh"}'>
     <i xid="i6"></i>
     <span xid="span10">刷新</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'bizFilter1.menu'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span8"></span></a>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter1" filterData="mainData" dateCol="fOperateDate" defaultValue="all">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1">
    <option xid="option1"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter1" filterData="mainData" filterCol="fUseStatus">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" defaultLabel="'选择状态'">
    <option xid="option2" data="dTypeFilter" value="typeValue" label="typeName"></option></div> </div>
  
  </div> 
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false" class="table table-hover hidder-xs" xid="listData" data="mainData" rowActiveClass="active" showRowNumber="false" responsive="true" onRowDblClick="listDataRowDblClick">
    <columns xid="column">
     <column name="fUseStatusName" label="状态" xid="column1"></column>
     <column name="fSerialNumber" label="编号" xid="column2"></column>
     <column name="fLicenseName" label="证照名称" xid="column3"></column>
     <column name="fLicenseNo" label="证照号" xid="column4"></column>
     <column name="fIsCopyName" label="标示" xid="column5"></column>
     <column name="fReleaseDeptName" label="颁发部门" xid="column6"></column>
     <column name="fReleaseDate" label="颁发日期" xid="column7"></column>
     <column name="fValidityDate" label="有效期" xid="column8"></column>
     <column name="fNextExamDate" label="下次年检时间" xid="column9"></column></columns> </div> 
   <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar" data="mainData">
    <div class="row" xid="div2">
     <div class="col-sm-3" xid="div3">
      <div class="x-pagerbar-length" xid="div4">
       <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
        <span xid="span1">显示</span>
        <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
         <option value="10" xid="default4">10</option>
         <option value="20" xid="default14">20</option>
         <option value="50" xid="default15">50</option>
         <option value="100" xid="default4">100</option></select> 
        <span xid="span2">条</span></label> </div> </div> 
     <div class="col-sm-3" xid="div5">
      <div class="x-pagerbar-info" xid="div6">当前显示0条，共0条</div></div> 
     <div class="col-sm-6" xid="div7">
      <div class="x-pagerbar-pagination" xid="div8">
       <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
        <li class="prev" xid="li3">
         <a href="#" xid="a1">
          <span aria-hidden="true" xid="span3">«</span>
          <span class="sr-only" xid="span4">Previous</span></a> </li> 
        <li class="next" xid="li4">
         <a href="#" xid="a2">
          <span aria-hidden="true" xid="span5">»</span>
          <span class="sr-only" xid="span6">Next</span></a> </li> </ul> </div> </div> </div> </div> </div>
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1" style="left:33px;top:389px;" filterData="mainData"></span></div>