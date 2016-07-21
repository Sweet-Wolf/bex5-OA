<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:626px;top:264px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_WM_repairApply" limit="15" columns=""
      onSaveCommit="saveCommit"> 
      <reader action="/OA/workTime/logic/action/queryOA_WM_repairApplyAction"/>  
      <writer action="/OA/workTime/logic/action/saveOA_WM_repairApplyAction"/>  
      <creator action="/OA/workTime/logic/action/createOA_WM_repairApplyAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="stateData" idColumn="value">
   <column label="业务状态" name="value" type="String" xid="column6"></column>
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
    <option xid="option6"></option></div> </div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter3" filterData="mainData" filterCols="OA_WM_repairApply,fNO,fTYPEID,fTYPENAME,fAPPLYPERSONID,fAPPLYPERSONNAME,fAPPLYDATE,fAPPLYDEPTID,fAPPLYDEPTNAME,fERPTM,fPLANID,fPLANNAME,fPROJECTID,fPROJECTNAME,fCLIENTERID,fCLIENTERNAME,fSTARTTIME,fENDTIME,fDAYS,fHOURS,fTIME,fREASON,fREMARK,fISSURE,fCANCELHOLSDEPTID,fCANCELHOLSDEPTNAME,fCANCELHOLSPERSONNAME,fCANCELHOLSDATE,fNUMBER,fPERSONNEL,fCARDTIME,fSQUADID,fSQUAD,fPLACE,fMODEID,fMODENAME,fARRANGE,fMONEY,fEXPLAIN,fFACTSTARTTIME,fFACTENDTIME,fFACTDAYS,fFACTHOURS,fCREATEDEPTID,fCREATEDEPTNAME,fCREATEPERID,fCREATEPERNAME,fCREATETIME,fUPDATEDEPTID,fUPDATEDEPTNAME,fUPDATEPERID,fUPDATEPERNAME,fUPDATETIME,version,fDEPTPATH,fURL,fBizState,fBizStateName,fCurrentExecutors,fCurrentActivities,fFactTime,fBrefExplain,fCANCELHOLSPERSONID" class="x-smartFilter-clear-hide input-group">
    <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div>
    
  </div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" class="table table-hover table-striped" xid="listData" data="mainData" rowActiveClass="active" onRowDblClick="grid3RowClick" showRowNumber="true">
   <columns xid="column">
    <column name="fBizStateName" xid="column10" label="状态"></column><column name="fNO" xid="column1"></column>
  
  <column name="fAPPLYPERSONNAME" xid="column3"></column>
  <column name="fAPPLYDEPTNAME" xid="column4"></column>
  <column name="fAPPLYDATE" xid="column9"></column><column name="fCARDTIME" xid="column7"></column><column name="fTYPENAME" xid="column2"></column><column name="fSQUAD" xid="column8"></column><column name="fREASON" xid="column5"></column>
  
  </columns> </div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pageBar" data="mainData">
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
