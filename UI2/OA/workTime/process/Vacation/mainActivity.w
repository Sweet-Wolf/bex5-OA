<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:70px;top:49px;" onModelConstructDone="modelModelConstructDone" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="oporgData"
      autoLoad="true" autoNew="false" concept="SA_OPOrg" columns=""
      isTree="true" limit="-1"> 
      <reader action="/system/logic/action/queryOrgAction"/>
      <treeOption parentRelation="sParent" nodeKindRelation="sLevel" rootFilter="sParent is null or sParent = '_is_root_'"/>
    <writer xid="default1" action="/SA/OPM/logic/action/saveOPRoleAction"></writer>
  <creator xid="default2" action="/SA/OPM/logic/action/createOPOrgAction"></creator>
  <filter name="filter0" xid="filter1"><![CDATA[SA_OPOrg.sOrgKindID='ogn' or SA_OPOrg.sOrgKindID='dpt']]></filter></div> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="vacationData" concept="OA_WM_Vacation" orderBy="fYear:asc"><reader xid="default3" action="/OA/workTime/logic/action/queryOA_WM_VacationAction"></reader>
  <writer xid="default4" action="/OA/workTime/logic/action/saveOA_WM_VacationAction"></writer>
  <creator xid="default5" action="/OA/workTime/logic/action/createOA_WM_VacationAction"></creator></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="changeData" idColumn="isChange" limit="-1" confirmDelete="false"><column label="isChange" name="isChange" type="String" xid="xid1"></column>
  <column label="显示下级" name="label" type="String" xid="xid3"></column>
  <data xid="default11">[]</data></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="leaveApplyData" concept="OA_WM_LeaveApply" orderBy="fCreateTime:desc"><reader xid="default7" action="/OA/workTime/logic/action/queryOA_WM_LeaveApplyAction"></reader>
  <writer xid="default8" action="/OA/workTime/logic/action/saveOA_WM_LeaveApplyAction"></writer>
  <creator xid="default9" action="/OA/workTime/logic/action/createOA_WM_LeaveApplyAction"></creator>
  </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="tempData" idColumn="year" autoNew="true"><column label="年" name="year" type="String" xid="xid4"></column>
  <column label="显示" name="isChange" type="String" xid="xid5"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="yearData" idColumn="year"><column label="年" name="year" type="Integer" xid="xid2"></column></div></div> 
  
<span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1" filterData="vacationData"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="yearDialog" showTitle="true" title="生成假期" status="normal" width="40%" height="50%" onReceive="yearDialogReceive"></span><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-3 col-sm-3 col-md-3 col-lg-3" xid="col1" style="height:100%;"><div component="$UI/system/components/justep/grid/grid" appearance="tree" data="oporgData" expandColumn="sName" useVirtualRoot="true" virtualRootLabel="组织机构" xid="treeGrid" class="x-grid-no-bordered" height="auto" width="100%" onRowClick="treeGridRowClick">
   <columns xid="columns2">
    <column name="sName" xid="column2"></column></columns> </div></div>
   <div class="col col-xs-9 col-sm-9 col-md-9 col-lg-9" xid="col2"><div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs">
   <ul class="nav nav-tabs" xid="ul1">
    <li class="active" xid="nav-list">
     <a content="listContent" xid="tabItem1"><![CDATA[列表]]></a></li> 
    <li role="presentation" xid="nav-detail">
     <a content="detailedContent" xid="tabItem2"><![CDATA[详细]]></a></li> </ul> 
   <div class="tab-content" xid="div1">
    <div class="tab-pane active" xid="listContent"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><div class="pull-right" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="vacationData" filterCols="fPersonName,fYear,fPersonCode,fHoliday,fLeavingsDay,fJoinInWork">
   
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input>
   </div><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'vacationData.delete'}" xid="button2" label="删除">
   <i xid="i2"></i>
   <span xid="span2">删除</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'vacationData.refresh'}" xid="button3" label="刷新">
   <i xid="i3"></i>
   <span xid="span3">刷新</span></a>
  <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox" label="显示下级" onChange="checkboxChange" checked="false" bind-ref="changeData.ref('isChange')" checkedValue="1"></span><div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="tempData.ref('year')">
   <option xid="option1" data="yearData" value="year" label="year"></option></div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="生成假期" xid="button4" onClick="button4Click">
   <i xid="i6"></i>
   <span xid="span10">生成假期</span></a>
  </div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid1" data="vacationData" multiselect="true" onRowDblClick="grid1RowDblClick">
   <columns xid="columns3"><column width="100" name="fPersonName" xid="column3"></column>
  <column width="100" name="fYear" xid="column4"></column>
  <column width="100" name="fPersonCode" xid="column5"></column>
  <column width="100" name="fEffectiveDate" xid="column6"></column>
  <column width="100" name="fExpiryDate" xid="column7"></column>
  <column width="100" name="fLeavingsDay" xid="column8"></column>
  <column width="100" name="fJoinInWork" xid="column9"></column>
  <column width="100" name="fLeavingsHour" xid="column10"></column>
  <column width="100" name="fAlreadyDay" xid="column11"></column>
  <column width="100" name="fAlreadyHour" xid="column12"></column></columns></div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1" data="vacationData">
   <div class="row" xid="div12">
    <div class="col-sm-3" xid="div13">
     <div class="x-pagerbar-length" xid="div14">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span11">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default12">10</option>
        <option value="20" xid="default13">20</option>
        <option value="50" xid="default14">50</option>
        <option value="100" xid="default15">100</option></select> 
       <span xid="span12">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div15">
     <div class="x-pagerbar-info" xid="div16">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div17">
     <div class="x-pagerbar-pagination" xid="div18">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li4">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span13">«</span>
         <span class="sr-only" xid="span14">Previous</span></a> </li> 
       <li class="next" xid="li5">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span15">»</span>
         <span class="sr-only" xid="span16">Next</span></a> </li> </ul> </div> </div> </div> </div></div>
    <div class="tab-pane" xid="detailedContent"><h5 xid="h51" style="height:30px;"><![CDATA[休假设置信息]]></h5>
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row6">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12">
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label3" style="width:100px;" bind-text="vacationData.label('fPersonName')"></label>
   <div class="x-edit" xid="div2"><div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output5" bind-ref="vacationData.ref('fPersonName')"></div></div></div></div>
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
   <label class="x-label" xid="label5" style="width:100px;" bind-text="vacationData.label('fYear')"></label>
   <div class="x-edit" xid="div4">
    <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output6" bind-ref="vacationData.ref('fYear')"></div></div> </div></div>
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
   <label class="x-label" xid="label6" style="width:100px;" bind-text="vacationData.label('fLeaveTypeName')"></label>
   <div class="x-edit" xid="div5">
    <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output7" bind-ref="vacationData.ref('fLeaveTypeName')"></div></div> </div></div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col18">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit7">
    <label class="x-label" xid="label7" style="width:100px;" bind-text="vacationData.label('fHoliday')"></label>
    <div class="x-edit" xid="div8">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output10" bind-ref="vacationData.ref('fHoliday')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col17">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit6">
    <label class="x-label" xid="label9" style="width:100px;" bind-text="vacationData.label('fLeavingsDay')"></label>
    <div class="x-edit" xid="div7">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output9" bind-ref="vacationData.ref('fLeavingsDay')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
    <label class="x-label" xid="label8" style="width:100px;" bind-text="vacationData.label('fLeavingsHour')"></label>
    <div class="x-edit" xid="div6">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output8" bind-ref="vacationData.ref('fLeavingsHour')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col21">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit10">
    <label class="x-label" xid="label10" style="width:100px;" bind-text="vacationData.label('fEffectiveDate')"></label>
    <div class="x-edit" xid="div11">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output13" bind-ref="vacationData.ref('fEffectiveDate')" format="yyyy-MM-dd"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col20">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit9">
    <label class="x-label" xid="label12" style="width:100px;" bind-text="vacationData.label('fExpiryDate')"></label>
    <div class="x-edit" xid="div10">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output12" bind-ref="vacationData.ref('fExpiryDate')" format="yyyy-MM-dd"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col19">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit8">
    <label class="x-label" xid="label11" style="width:100px;" bind-text="vacationData.label('fRemark')"></label>
    <div class="x-edit" xid="div9">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output11" bind-ref="vacationData.ref('fRemark')" style="height:60px;"></div></div> </div> </div></div>
  <h5 xid="h52" style="height:30px;"><![CDATA[休假详细信息]]></h5>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables2" data="leaveApplyData" showRowNumber="true">
   <columns xid="columns4"><column name="fBizStateName" xid="column18"></column><column name="fLeaveTypeName" xid="column15"></column><column name="fStartTime" xid="column13"></column>
  <column name="fEndTime" xid="column14"></column>
  
  <column name="fFactDays" xid="column16"></column>
  <column name="fFactTime" xid="column17"></column>
  </columns></div></div></div> </div></div>
   </div>
  </div>