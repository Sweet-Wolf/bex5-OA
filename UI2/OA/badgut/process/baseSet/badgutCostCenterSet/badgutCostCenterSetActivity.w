<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:540px;top:305px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_BG_CostCenter" orderBy=""
      columns="" autoNew="false" onSaveCommit="dataSaveCommit"> 
      <reader action="/OA/common/logic/action/queryBGCostCenterAction"/>  
      <writer action="/OA/common/logic/action/saveBGCostCenterAction"/>  
      <creator action="/OA/common/logic/action/createBGCostCenterAction"/>  
      <calculateRelation relation="recNo"/> 
    <rule xid="rule1">
    <col name="fCostCenterName" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default6">true</expr></required> </col>
     <col name="fCostCenterCode" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default7">true</expr></required> </col>
   <col name="fAttachDeptName" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default8">true</expr></required> </col> </rule></div>
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" concept="OA_BG_CostAccount" columns=""
      autoNew="false"> 
      <reader action="/OA/common/logic/action/queryBGCostAccountAction"/>  
      <writer action="/OA/common/logic/action/saveBGCostAccountAction"/>  
      <creator action="/OA/common/logic/action/createBGCostAccountAction"/>  
      <master xid="default1" data="mainData" relation="fCostCenterID"/> 
    </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dBtnStatus" idColumn="rowid">
  <column label="rowid" name="rowid" type="String" xid="xid5"></column>
  <column label="startUse" name="startUse" type="String" xid="xid3"></column>
  <column label="stopUse" name="stopUse" type="String" xid="xid4"></column></div></div>  
  <div xid="view">
  <div class="x-panel-content container-fluid" xid="content1">
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2" style="height:100%;overflow: hidden;">
    <div class="col col-xs-7 col-sm-7 col-md-7 col-lg-7" xid="col2" style="padding-left: 0;height:100%;">
     <div class="x-bordered" style="height:100%;" xid="searchDiv">
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="mainBar">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="newBtn" label="新建" onClick='{operation:"mainData.new"}'>
    <i xid="i8"></i>
    <span xid="span8">新建</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="saveBtn" onClick='{"operation":"mainData.save"}' label="保存">
    <i xid="i7"></i>
    <span xid="span7">保存</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="delBtn" onClick='{"operation":"mainData.delete"}'>
    <i xid="i2"></i>
    <span xid="span3"></span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left" xid="refreshBtn" onClick="{operation:'mainData.refresh'}">
    <i xid="i1"></i>
    <span xid="span1"></span></a> 
   <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button" icon="icon-ios7-play" label="启用" onClick="StartUseBtnClick" xid="StartUseBtn">
    <i class="icon-ios7-play" xid="i12"></i>
    <span xid="span9">启用</span></a> 
   <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button" icon="icon-ios7-play" label="全部启用" onClick="AllUseBtnClick" xid="AllUseBtn">
    <i class="icon-ios7-play" xid="i14"></i>
    <span xid="span12">全部启用</span></a> 
   <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button" icon="icon-ios7-pause" label="停用" onClick="StopUseBtnClick" xid="StopUseBtn">
    <i class="icon-ios7-pause" xid="i13"></i>
    <span xid="span12">停用</span></a> </div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" xid="mainGrid" data="mainData" height="auto" class="x-grid-no-bordered" showRowNumber="true" multiselect="true">
   <columns xid="column">
    <column width="100" name="fUseStatusName" xid="column7"></column>
    <column name="fCostCenterCode" editable="true" xid="column2">
     <editor xid="editor2">
      <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fCostCenterCode')" xid="input4"></input></editor> </column> 
    <column name="fCostCenterName" editable="true" xid="column1">
     <editor xid="editor1">
      <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fCostCenterName')" xid="input3"></input></editor> </column> 
    <column name="fAllAccount" editable="true" xid="column3">
     <editor xid="editor3">
      <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox1" bind-ref="ref('fAllAccount')" style="font-weight:bold;" value="1"></span></editor> </column> 
    <column name="fAttachDeptName" editable="true" xid="column4">
     <editor xid="editor4">
      <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fAttachDeptName')" xid="input6"></input></editor> </column> </columns> </div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="bar" data="mainData">
   <div class="row" xid="div11">
    <div class="col-sm-3" xid="div12">
     <div class="x-pagerbar-length" xid="div13">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect2">
       <span xid="span411">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select11">
        <option value="10" xid="default5">10</option>
        <option value="20" xid="default2">20</option>
        <option value="50" xid="default4">50</option>
        <option value="100" xid="default3">100</option></select> 
       <span xid="span61">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div14">
     <div class="x-pagerbar-info" xid="div15">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div16">
     <div class="x-pagerbar-pagination" xid="div17">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination11">
       <li class="prev" xid="li11">
        <a href="#" xid="a11">
         <span aria-hidden="true" xid="span114">«</span>
         <span class="sr-only" xid="span115">Previous</span></a> </li> 
       <li class="next" xid="li21">
        <a href="#" xid="a21">
         <span aria-hidden="true" xid="span161">»</span>
         <span class="sr-only" xid="span171">Next</span></a> </li> </ul> </div> </div> </div> </div></div> </div> 
    <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col2" style="padding:5% 0 0 0;height:100%;width:10px;">
     
     
     
     </div> 
    <div class="col col-xs-4 col-sm-4 col-md-4 col-lg-4" xid="col7" style="height:100%;padding-right: 0;">
     <div class="x-bordered" style="height:100%;" xid="div1">
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter" xid="detailBar">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="addBtn" icon="icon-plus" label="添加" onClick="addBtnClick">
    <i xid="i6" class="icon-plus"></i>
    <span xid="span10">添加</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="deleteBtn" onClick="{operation:'detailData.delete'}">
    <i xid="i17"></i>
    <span xid="span11">删除</span></a> </div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" xid="detailGrid" data="detailData" height="auto" class="x-grid-no-bordered" showRowNumber="true">
   <columns xid="columns">
    <column name="fAccountName" editable="true" xid="column5">
     <editor xid="editor5">
      <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fAccountName')" xid="input7"></input></editor> </column> 
    <column name="fAccountCode" editable="true" xid="column6">
     <editor xid="editor6">
      <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fAccountCode')" xid="input8"></input></editor> </column> </columns> </div></div> </div> </div> </div></div><span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgAccount" showTitle="true" width="700px" height="500px" status="normal" src="$UI/OA/badgut/process/dialog/selectAccountDialog/selectAccountDialog.w" title="选择总账科目" onReceive="dlgAccountReceive"></span>
  </div>