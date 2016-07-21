<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:626px;top:264px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_BG_History" limit="15" columns=""
      onSaveCommit="saveCommit" orderBy="fYear desc"> 
      <reader action="/OA/badgut/logic/action/queryBGHistoryAction"/>  
      <writer action="/OA/badgut/logic/action/saveBGAlterMAction"/>  
      <creator action="/OA/badgut/logic/action/createBGAlterMAction"/>  
      </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="kindData" idColumn="fCode"><column label="fName" name="fName" type="String" xid="xid1"></column>
  <column label="fCode" name="fCode" type="String" xid="xid2"></column>
  <data xid="default9">[{&quot;fName&quot;:&quot;费用报销&quot;,&quot;fCode&quot;:&quot;reimburse&quot;},{&quot;fName&quot;:&quot;预算变更&quot;,&quot;fCode&quot;:&quot;alter&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="toolBar">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="refreshBtn" label="刷新" onClick="{operation:'mainData.refresh'}">
    <i xid="i2"></i>
    <span xid="span15">刷新</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnShow" label="查看" onClick="grid3RowClick" icon="icon-eye">
    <i xid="i3" class="icon-eye"></i>
    <span xid="span12">查看</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'dataFilter.menu'}">
    <i xid="i5" class="icon-android-search"></i>
    <span xid="span13">查询</span></a><div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter1" filterData="mainData" filterCol="fKindID">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true">
    <option xid="option2" data="kindData" value="fCode" label="fName"></option></div> </div><div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter2" filterData="mainData" dateCol="fDateTime" defaultValue="all">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4">
    <option xid="option6"></option></div> </div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter3" filterData="mainData" filterCols="OA_AS_UseApplyM,version,fNO,fApplyOgnID,fApplyOgnName,fApplyDeptID,fApplyDeptName,fApplyPosID,fApplyPosName,fApplyPsnID,fApplyPsnName,fApplyPsnFID,fApplyPsnFName,fApplyDate,fKindID,fKind,fName,fDemandDate,fReturnDate,fRequire,fApplyReason,fProcess,fProcessName,fRemark,fBizState,fBizStateName,fCreateOgnID,fCreateOgnName,fCreateDeptID,fCreateDeptName,fCreatePosID,fCreatePosName,fCreatePsnID,fCreatePsnName,fCreatePsnFID,fCreatePsnFName,fCreateTime,fUpdatePsnID,fUpdatePsnName,fUpdateTime,fCurrentActivities,fCurrentExecutors,fExtendStr1,fExtendStr2,fExtendStr3,fExtendStr4,fExtendStr5,fExtendStr6,fExtendStr7,fExtendStr8,fExtendStr9,fExtendDate1,fExtendDate2,fExtendDate3,fExtendDate4,fExtendDate5,fExtendNum1,fExtendNum2,fExtendNum3,fExtendNum4,fExtendNum5" class="x-smartFilter-clear-hide input-group">
    <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div>
    
  </div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" class="table table-hover table-striped" xid="listData" data="mainData" rowActiveClass="active" onRowDblClick="grid3RowClick" showRowNumber="true">
   <columns xid="column">
    <column name="fKindName" xid="column1" label="方式"></column>
  <column name="fCostCenterCode" xid="column2" label="成本中心编码"></column>
  <column name="fCostCenterName" xid="column3" label="成本中心"></column>
  <column name="fAccountCode" xid="column4" label="总账科目编码"></column>
  <column name="fAccountName" xid="column5" label="总账科目"></column>
  <column name="fYear" xid="column6" label="年度"></column>
  <column name="fMonth" xid="column7" label="月份"></column>
  <column name="fAmount" xid="column8" label="执行金额"></column>
  <column name="fSurplus" xid="column9" label="剩余金额"></column>
  <column name="fDeptName" xid="column10" label="执行部门"></column>
  <column name="fPersonName" xid="column12" label="执行人员"></column>
  <column name="fDateTime" xid="column13" label="执行时间"></column></columns> </div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pageBar" data="mainData">
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
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dataFilter" filterData="mainData" style="left:28px;top:290px;"></span></div>
