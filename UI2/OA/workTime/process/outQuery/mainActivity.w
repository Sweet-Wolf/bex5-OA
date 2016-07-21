<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:626px;top:264px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_WM_outApply" limit="15" columns=""
      onSaveCommit="saveCommit"> 
      <reader action="/OA/workTime/logic/action/queryOA_WM_outApplyAction"/>  
      <writer action="/OA/workTime/logic/action/saveOA_WM_outApplyAction"/>  
      <creator action="/OA/workTime/logic/action/createOA_WM_outApplyAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="stateData" idColumn="value">
   <column label="业务状态" name="value" type="String" xid="column8"></column>
   <data xid="default8">[{&quot;value&quot;:&quot;编辑中&quot;},{&quot;value&quot;:&quot;处理中&quot;},{&quot;value&quot;:&quot;已完成&quot;},{&quot;value&quot;:&quot;已终止&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="toolBar">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="refreshBtn" label="刷新" onClick="{operation:'mainData.refresh'}">
    <i xid="i2"></i>
    <span xid="span15">刷新</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnShow" label="查看" onClick="grid3RowClick" icon="icon-eye">
    <i xid="i3" class="icon-eye"></i>
    <span xid="span12">查看</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'dataFilter.menu'}">
    <i xid="i5" class="icon-android-search"></i>
    <span xid="span13">查询</span></a><div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="stateFilter" filterData="mainData" filterCol="fBizStateName">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true">
    <option xid="option3" data="stateData" value="value" label="value"></option></div> </div><div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter2" filterData="mainData" dateCol="fAPPLYDATE">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4">
    <option xid="option6"></option></div> </div><div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter1" class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true" filterData="mainData" orgFIDCol="fAPPLYPERSONID" personIDCol="fAPPLYPERSONNAME" onFilter="orgFilterFilter" style="width:auto;">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC1" manageCodes="workTimeManagement" multiselect="true" style="width:140px;">
    <option xid="option7">
     <columns xid="columns4">
      <column name="sName" xid="column11"></column></columns> </option> </div> </div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter3" filterData="mainData" filterCols="fAPPLYPERSONNAME,fAPPLYDEPTNAME,fPERSONNEL,fREASON,fRemark,fCANCELHOLSPERSONNAME" class="x-smartFilter-clear-hide input-group">
    <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div>
    
  </div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false" class="table table-hover table-striped" xid="listData" data="mainData" rowActiveClass="active" onRowDblClick="grid3RowClick" showRowNumber="true">
   <columns xid="column">
    <column name="fBizStateName" xid="column10" label="状态"></column><column name="fNO" xid="column1" label="单据号"></column>
  <column name="fAPPLYPERSONNAME" xid="column2" label="申请人"></column>
  <column name="fAPPLYDEPTNAME" xid="column3" label="所属部门"></column>
  <column name="fAPPLYDATE" xid="column12" label="申请日期"></column><column name="fSTARTTIME" xid="column13" label="开始时间" format="yyyy-MM-dd hh:mm"></column><column name="fENDTIME" xid="column14" label="结束时间" format="yyyy-MM-dd hh:mm"></column><column name="fDAYS" xid="column4" label="天数"></column>
  <column name="fHOURS" xid="column5" label="小时数"></column>
  <column name="fPERSONNEL" xid="column7" label="外出人员"></column><column name="fNUMBER" xid="column6" label="人数"></column>
  
  
  
  
  
  <column name="fFACTSTARTTIME" xid="column16" label="实际开始时间"></column><column name="fFACTENDTIME" xid="column15" label="实际结束时间"></column></columns> </div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pageBar" data="mainData">
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
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dataFilter" filterData="mainData" style="left:28px;top:290px;"></span>
  </div>
