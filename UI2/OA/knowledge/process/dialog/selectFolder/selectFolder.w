<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:481px;top:91px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dFolder"
      concept="OA_KM_Folder" limit="-1" orderBy="fName asc" autoLoad="true" isTree="true">
      <reader xid="default2" action="/OA/knowledge/logic/action/queryFolderAction"/>  
      <treeOption xid="default3" parentRelation="fParent" rootFilter="OA_KM_Folder.fParent = 'public'"/>
    <filter name="dataFilter" xid="filter1"><![CDATA[OA_KM_Folder.fUseStatus = 1]]></filter></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="bizDataSelected"
      concept="OA_KM_Folder" limit="-1">
      <reader xid="default4" action="/OA/knowledge/logic/action/queryFolderAction"/>  
      </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dataSelected" idColumn="recNo"><column label="排序" name="recNo" type="Integer" xid="default5"></column>
  <column label="栏目ID" name="fFolderID" type="String" xid="default6"></column>
  <column label="栏目ID路径" name="fFolderFullID" type="String" xid="default7"></column>
  <column label="名称" name="fName" type="String" xid="default8"></column>
  <rule xid="rule1">
   <col name="recNo" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default9">$row.index() + 1</expr></calculate> </col> </rule></div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/>
  

  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content" xid="content1">
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1" style="height:100%;"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="default1" style="height:100%;"> 
    <div class="col col-xs-4 col-sm-4 col-md-4 col-lg-4" xid="col1" style="border-style:ridge ridge ridge ridge;height:100%;">
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grdFolder" data="dFolder" appearance="tree" expandColumn="fName" width="100%" height="auto"> 
        <columns xid="columns1">
          <column width="100" name="fName" xid="column2" />
        </columns>
      </div>
    </div>  
    <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col2">
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1" style="border-bottom-style:hidden;width:85px;">
        <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="选择&gt;" xid="selectBtn" style="margin-top:60px;" onClick="selectBtnClick"> 
          <i xid="i1" />  
          <span xid="span1">选择&gt;</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="&lt;取消" xid="cancelBtn" style="margin-top:60px;" onClick="cancelBtnClick"> 
          <i xid="i2" />  
          <span xid="span2">&lt;取消</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="cancleAllBtn" label="全部取消" style="margin-top:60px;" onClick="cancleAllBtnClick"> 
          <i xid="i3" />  
          <span xid="span3">全部取消</span>
        </a>
      </div>
    </div>  
    <div class="col col-xs-7 col-sm-7 col-md-7 col-lg-7" xid="col3" style="border-style:ridge ridge ridge ridge;height:100%;">
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dtDes" data="dataSelected"> 
        <columns xid="columns3">
          <column name="recNo" xid="column1"></column>
  <column name="fName" xid="column3"></column></columns>
      </div>
    </div>
  </div></div></div>
   <div class="x-panel-bottom" xid="bottom2">
   <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取    消" style="margin-left:30px;width:80px;" xid="button4" onClick="{operation:'windowReceiver.windowCancel'}">
    <i xid="i41"></i>
    <span xid="span41">取 消</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="ensureBtn" onClick="ensureBtnClick">
    <i xid="i7"></i>
    <span xid="span7">确定</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="刷新" xid="refreshBtn" onClick="{operation:'dFolder.refresh'}">
   <i xid="i8"></i>
   <span xid="span8">刷新</span></a></div></div></div>
