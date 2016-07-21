<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:626px;top:264px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_FC_ReimbApplyM" limit="15" columns=""
      onSaveCommit="saveCommit"> 
      <reader action="/OA/finance/logic/action/queryFCReimbApplyMAction"/>  
      <writer action="/OA/finance/logic/action/saveFCReimbApplyMAction"/>  
      <creator action="/OA/finance/logic/action/createFCReimbApplyMAction"/>  
      </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dStatus" idColumn="value"><column label="label" name="label" type="String" xid="xid1"></column>
  <column label="value" name="value" type="String" xid="xid2"></column>
  <data xid="default9">[{&quot;label&quot;:&quot;已完成&quot;,&quot;value&quot;:&quot;bsFinished&quot;},{&quot;label&quot;:&quot;处理中&quot;,&quot;value&quot;:&quot;bsExecuting&quot;},{&quot;label&quot;:&quot;已终止&quot;,&quot;value&quot;:&quot;bsAborted&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="toolBar">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="refreshBtn" label="刷新" onClick="{operation:'mainData.refresh'}">
    <i xid="i2"></i>
    <span xid="span15">刷新</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnShow" label="查看" onClick="grid3RowClick" icon="icon-eye">
    <i xid="i3" class="icon-eye"></i>
    <span xid="span12">查看</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'dataFilter.menu'}">
    <i xid="i5" class="icon-android-search"></i>
    <span xid="span13">查询</span></a><div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="statusSelect" bind-ref="mainData.ref('fBizState')" bind-labelRef="mainData.ref('fBizStateName')" style="width:100px;" multiselect="true" onUpdateValue="statusSelectUpdateValue">
   <option xid="option1" data="dStatus" value="value" label="label"></option></div> 
   
   <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter2" filterData="mainData" dateCol="fLoanDate">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4">
    <option xid="option6"></option></div> </div><div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter1" class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true" filterData="mainData" orgFIDCol="fLoanPsnFullID" personIDCol="fLoanPsnFullName" onFilter="orgFilterFilter" style="width:auto;">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC1" manageCodes="financeManagement" multiselect="true" style="width:140px;">
    <option xid="option7">
     <columns xid="columns4">
      <column name="sName" xid="column11"></column></columns> </option> </div> </div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter3" filterData="mainData" filterCols="OA_AS_UseApplyM,version,fNO,fApplyOgnID,fApplyOgnName,fApplyDeptID,fApplyDeptName,fApplyPosID,fApplyPosName,fApplyPsnID,fApplyPsnName,fApplyPsnFID,fApplyPsnFName,fApplyDate,fKindID,fKind,fName,fDemandDate,fReturnDate,fRequire,fApplyReason,fProcess,fProcessName,fRemark,fBizState,fBizStateName,fCreateOgnID,fCreateOgnName,fCreateDeptID,fCreateDeptName,fCreatePosID,fCreatePosName,fCreatePsnID,fCreatePsnName,fCreatePsnFID,fCreatePsnFName,fCreateTime,fUpdatePsnID,fUpdatePsnName,fUpdateTime,fCurrentActivities,fCurrentExecutors,fExtendStr1,fExtendStr2,fExtendStr3,fExtendStr4,fExtendStr5,fExtendStr6,fExtendStr7,fExtendStr8,fExtendStr9,fExtendDate1,fExtendDate2,fExtendDate3,fExtendDate4,fExtendDate5,fExtendNum1,fExtendNum2,fExtendNum3,fExtendNum4,fExtendNum5" class="x-smartFilter-clear-hide input-group">
    <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div>
    
  </div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" class="table table-hover table-striped" xid="listData" data="mainData" rowActiveClass="active" onRowDblClick="grid3RowClick" showRowNumber="true">
   <columns xid="column">
    <column name="fBizStateName" xid="column7"></column><column name="fNO" xid="column1"></column>
  <column name="fLoanDeptName" xid="column2"></column>
  <column name="fLoanPsnName" xid="column3"></column>
  
  <column name="fReimAmt" xid="column5"></column>
  <column name="fLoanAmt" xid="column9"></column><column name="fMustReimAmt" xid="column8"></column>
  <column name="fLoanDate" xid="column4"></column></columns> </div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pageBar" data="mainData">
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
