<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:253px;top:262px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AM_Fonds" orderBy=""
      columns="" autoNew="false" onSaveCommit="mainDataSaveCommit"> 
      <reader action="/OA/archival/logic/action/queryAMFondsAction"/>  
      <writer action="/OA/archival/logic/action/saveAMFondsAction"/>  
      <creator action="/OA/archival/logic/action/createAMFondsAction"/>  
      <calculateRelation relation="recNo"/> 
    <rule xid="rule1">
   
   
   
   <col name="fFondsNO" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default9">true</expr></required> </col> 
   <col name="fFondsName" xid="ruleCol5">
    <required xid="required5">
     <expr xid="default10">true</expr></required> </col> 
   <col name="fOwnDeptName" xid="ruleCol6">
    <required xid="required6">
     <expr xid="default11">true</expr></required> </col> </rule></div>
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" concept="OA_AM_FondsCategory" columns="OA_AM_FondsCategory,version,fFondsID,fCategoryID,fCategoryNO,fCategoryName"
      autoNew="false" orderBy="fCategoryNO asc"> 
      <reader action="/OA/archival/logic/action/queryAMFondsCategoryAction"/>  
      <writer action="/OA/archival/logic/action/saveAMFondsCategoryAction"/>  
      <creator action="/OA/archival/logic/action/createAMFondsCategoryAction"/>  
      <master xid="default1" data="mainData" relation="fFondsID"/> 
    </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dBtnStatus" idColumn="rowid">
  <column label="rowid" name="rowid" type="String" xid="xid5"></column>
  <column label="startUse" name="startUse" type="String" xid="xid3"></column>
  <column label="stopUse" name="stopUse" type="String" xid="xid4"></column></div></div>  
  <div xid="view">
  <div class="x-panel-content container-fluid" xid="content1">
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-9" xid="col2" style="overflow:auto;">
     <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="mainBar">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="newBtn" label="新建" onClick='{operation:"mainData.new"}'>
    <i xid="i8"></i>
    <span xid="span8">新建</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="saveBtn" onClick="{operation:'mainData.save'}" label="保存">
    <i xid="i7"></i>
    <span xid="span7">保存</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="delBtn" onClick="{operation:'mainData.delete'}">
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
    <span xid="span12">停用</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="导入Excel" xid="impexcelBtn" onClick="{operation:'importExcel1.importExcel'}" icon="icon-archive">
   <i xid="i9" class="icon-archive"></i>
   <span xid="span6">导入Excel</span></a></div><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" xid="mainGrid" data="mainData" height="auto" class="x-grid-no-bordered" showRowNumber="true" multiselect="false" altRows="true" width="100%" onCellRender="mainGridCellRender">
   <columns xid="column">
    <column width="100" name="fUseStatusName" xid="column17" editable="true"></column><column width="100" name="fFondsNO" xid="column5" editable="true"><editor xid="editor1">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="ref('fFondsNO')"></input></editor></column>
  <column width="100" name="fFondsName" xid="column6" editable="true"><editor xid="editor2">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="ref('fFondsName')"></input></editor></column>
  
  <column width="100" name="fAllCategory" xid="column9" editable="true" align="left"><editor xid="editor3">
   <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox x-checkbox-sm" xid="checkbox1" style="width:28px;" checked="false" bind-ref="ref('fAllCategory')" disabled="false" checkedValue="1"></span>
   </editor></column>
  <column width="150" name="fOwnDeptName" xid="column10" editable="true"><editor xid="editor4">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelect" bind-ref="ref('fOwnDeptID')" bind-labelRef="ref('fOwnDeptName')" includeOrgKind="ogn,dpt">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="dOrg" limit="-1"></div>
   <option xid="option2" value="sCode" label="sName">
    <columns xid="columns1">
     <column name="sName" xid="column1"></column></columns> </option> </div></editor></column>
  <column width="100" name="fCreatePsnName" xid="column11" editable="true"></column>
  <column width="140" name="fCreateTime" xid="column12" editable="true"></column>
  </columns> </div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="bar" data="mainData">
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
         <span class="sr-only" xid="span171">Next</span></a> </li> </ul> </div> </div> </div> </div></div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-3" xid="col7">
     <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter" xid="detailBar">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="addBtn" icon="icon-plus" label="添加" onClick="addBtnClick">
    <i xid="i6" class="icon-plus"></i>
    <span xid="span10">添加</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="deleteBtn" onClick="{operation:'detailData.delete'}">
    <i xid="i17"></i>
    <span xid="span11">删除</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'detailData.save'}" xid="button1">
   <i xid="i3"></i>
   <span xid="span2"></span></a></div><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" xid="detailGrid" data="detailData" height="auto" showRowNumber="true" cascade="true" width="100%" class="x-grid-no-bordered">
   <columns xid="columns">
    
    <column width="70" name="fCategoryNO" xid="column15" editable="true"></column>
  <column name="fCategoryName" xid="column16" editable="false"></column></columns> </div></div> </div> 
  </div></div><span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:23px;top:423px;"/> 
<div component="$UI/system/components/justep/excel/importExcel" xid="importExcel1" to="UI" data="mainData" mappings="$UI/OA/archival/process/archivalFonds/import.mapping.xml" onSuccess="importExcel1Success"></div><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectCategory" showTitle="true" width="700px" height="500px" status="normal" src="$UI/OA/archival/process/dialog/categorySingleDialog/categorySingleDialog.w" title="类目选择" onReceive="dlgSelectCategoryReceive"></span>
  </div>