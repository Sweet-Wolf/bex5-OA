<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="mdKnowledge" style="height:auto;left:147px;top:258px;" onModelConstructDone="mdKnowledgeModelConstructDone"><div component="$UI/system/components/justep/data/bizData" xid="dKnowledge" concept="OA_KM_Knowledge" columns="fTitle,fKeyword,fDocNumber,fImportant,fImportantName,fWriter,fFolderID,fFolderName,fFolderFullID,fFolderFullName,fRightsText,fIsNeedApprove,fContentType,fContentTypeName,fTemplateID,fTemplateName,fLinkURL,fContentURL,fIsTop,fTopBeginTime,fTopEndTime,fCreateOgnID,fCreateOgnName,fCreateDeptID,fCreateDeptName,fCreatePsnID,fCreatePsnName,fCreatePsnFID,fCreatePsnFName,fCreateTime,fReleaseOgnID,fReleaseOgnName,fReleaseDeptID,fReleaseDeptName,fReleasePsnID,fReleasePsnName,fReleasePsnFID,fReleasePsnFName,fReleaseTime,fReleaseStatus,fReleaseStatusName,fApproverID,fApproverName,fApproveTime,fBizState,fBizStateName,fIsDisplayOnPortal,fIsInheritRights,fOtherFolders,fBizID,fBizType,fBizTypeName,fReaderCount,fRepliesCount,version,fGZPsnIDs" orderBy="fReleaseTime:desc" confirmRefresh="false"><reader xid="default1" action="/OA/knowledge/logic/action/queryKnowledgeAction"></reader>
  <calculateRelation relation="rec" xid="calculateRelation1" type="Integer"></calculateRelation>
  <rule xid="rule1">
   <col name="fGZPsnIDs" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default11">$model.knowledgeRecState(val(&quot;fGZPsnIDs&quot;))</expr></calculate> </col> 
   <col name="rec" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default6">$row.index() + 1</expr></calculate> </col> </rule>
  <writer xid="default13" action="/OA/knowledge/logic/action/saveKMKnowledgeAction"></writer></div>
<div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dTemp"></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dReleaseStatus" idColumn="label"><column label="label" name="label" type="String" xid="default14"></column>
  <column label="value" name="value" type="Integer" xid="default15"></column>
  <data xid="default16">[{&quot;label&quot;:&quot;未发布&quot;,&quot;value&quot;:0},{&quot;label&quot;:&quot;已发布&quot;,&quot;value&quot;:1},{&quot;label&quot;:&quot;已取消&quot;,&quot;value&quot;:2}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dFolder" idColumn="folderID" onIndexChanged="dFolderIndexChanged" isTree="true" onCreate="dFolderCreate">
   <column label="fName" name="fName" type="String" xid="default5"></column>
   <column label="folderFullID" name="folderFullID" type="String" xid="default12"></column>
   <column label="folderID" name="folderID" type="String" xid="column2"></column>
   <column label="fParent" name="fParent" type="String" xid="column3"></column>
   <treeOption xid="default5" parentRelation="fParent"></treeOption></div></div> 

  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dKnowledgeFilter" style="left:64px;top:223px;" filterData="dKnowledge"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgPublishKWActivity" src="$UI/OA/knowledge/process/publishKnowledge/publishKWActivity.w" status="normal" width="90%" height="90%" showTitle="true"></span>
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1"><div component="$UI/system/components/bootstrap/row/row(bootstrap)" class="row" xid="row1">
   <div class="col col-xs-3" xid="div1"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grdFolder" data="dFolder" width="100%" height="auto" appearance="tree" expandColumn="fName" onRowClick="grdFolderRowClick">
   <columns xid="columns1"><column width="100" name="fName" xid="column1" label="名称" editable="true"></column>
  </columns></div></div>
   <div class="col col-xs-9" xid="div2"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1">
  
  
  
  
  
  
  
  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dKnowledge.refresh'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dKnowledgeFilter.menu'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnPublish" label="发布知识" onClick="relaseKnowledge">
   <i xid="i3"></i>
   <span xid="span3">发布知识</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnStopPublish" label="取消发布" onClick="cancelRelaseKnowledge">
   <i xid="i4"></i>
   <span xid="span4">取消发布</span></a>
  <div component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter" class="x-control" filterData="dKnowledge" filterMode="singleDate" dateCol="fReleaseTime" defaultValue="all" autoRefresh="true">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect" style="width:70px;" optionHeight="390">
    <option xid="option2"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gdfRelaseStatus" filterData="dKnowledge" filterCol="fReleaseStatus">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true" defaultLabel="'未发布,已发布'">
    <option xid="option1" data="dReleaseStatus" value="value" label="label"></option></div> </div><div class="x-smartFilter-clear-hide input-group" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="dKnowledge" filterCols="fFolderName,fTitle,fDocNumber,fWriter" style="width:140px;" autoRefresh="true">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input14"></input>
   <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))" xid="span14">
    <i class="icon-android-search" xid="i9"></i></span> </div>
  </div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dtKnowledge" data="dKnowledge" onRowDblClick="dtKnowledgeRowDblClick">
   <columns xid="columns4">
   <column name="rec" xid="column19" label="序号"></column><column name="fReleaseStatusName" xid="column18"></column><column name="fTitle" xid="column7"></column>
  <column name="fFolderFullName" xid="column11"></column><column name="fKeyword" xid="column8"></column>
  <column name="fDocNumber" xid="column9"></column>
  <column name="fWriter" xid="column10"></column>
  
  <column name="fCreateDeptName" xid="column12"></column>
  <column name="fCreatePsnName" xid="column13"></column>
  <column name="fCreateTime" xid="column14"></column>
  <column name="fReleaseDeptName" xid="column15"></column>
  <column name="fReleasePsnName" xid="column16"></column>
  <column name="fReleaseTime" xid="column17"></column>
  
  </columns></div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar" data="dKnowledge">
   <div class="row" xid="div6">
    <div class="col-sm-3" xid="div7">
     <div class="x-pagerbar-length" xid="div8">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span5">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default7">10</option>
        <option value="20" xid="default8">20</option>
        <option value="50" xid="default9">50</option>
        <option value="100" xid="default10">100</option></select> 
       <span xid="span6">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div9">
     <div class="x-pagerbar-info" xid="div10">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div11">
     <div class="x-pagerbar-pagination" xid="div12">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li1">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span7">«</span>
         <span class="sr-only" xid="span8">Previous</span></a> </li> 
       <li class="next" xid="li2">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span9">»</span>
         <span class="sr-only" xid="span10">Next</span></a> </li> </ul> </div> </div> </div> </div></div>
   </div></div></div>