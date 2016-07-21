<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:321px;top:214px;" onLoad="modelLoad"><div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="docNodeTree" concept="SA_DocNode" isTree="true" limit="-1"><reader xid="default1" action="/system/logic/action/queryDocNodeAction"></reader>
  <writer xid="default2" action="/system/logic/action/saveDocNodeAction"></writer>
  <creator xid="default3" action="/system/logic/action/createDocNodeAction"></creator>
  <filter name="sKindFilter" xid="filter1"><![CDATA[SA_DocNode.sKind='dir']]></filter>
  <treeOption xid="default7" parentRelation="sParentID" rootFilter="SA_DocNode.sParentID IS NULL"></treeOption>
  <filter name="sFlagFilter" xid="filter2"><![CDATA[SA_DocNode.sFlag=1]]></filter>
  </div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="docNodeList" concept="SA_DocNode"><reader xid="default4" action="/system/logic/action/queryDocNodeAction"></reader>
  <writer xid="default5" action="/system/logic/action/saveDocNodeAction"></writer>
  <creator xid="default6" action="/system/logic/action/createDocNodeAction"></creator>
  <filter name="sKindFilter" xid="filter3"><![CDATA[SA_DocNode.sKind<>'dir']]></filter>
  <filter name="sFlagFilter" xid="filter4"><![CDATA[SA_DocNode.sFlag=1]]></filter></div></div> 
<span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1" filterData="docNodeList"></span>
  <span component="$UI/system/components/justep/dialog/dialog" xid="uploadDirProgress" title="正在上传..." width="40%" height="30%" showTitle="true" status="normal"></span><span component="$UI/system/components/justep/dialog/dialog" xid="downProgess" title="正在下载..." showTitle="true" status="normal" width="40%" height="30%"></span><div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu" xid="moreMenu" direction="left-bottom" anchor="moreBtn" opacity="0">
   <div class="x-popMenu-overlay" xid="div1"></div>
   <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content" xid="menuContent"><li class="x-menu-item" xid="item1">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="删除" xid="button6" icon="icon-android-close">
    <i xid="i9" class="icon-android-close"></i>
    <span xid="span9">删除</span></a> </li>
  <li class="x-menu-item" xid="item2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="权限" xid="button9" icon="icon-card">
    <i xid="i10" class="icon-card"></i>
    <span xid="span10">权限</span></a> </li></ul></div><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1" style="width:100%;">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-3" xid="col1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="newDirBtnClick" xid="newDirBtn" label="新建" icon="icon-android-add">
   <i xid="i1" class="icon-android-add"></i>
   <span xid="span1">新建</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="属性" xid="attributeBtn" onClick="attributeBtnClick">
   <i xid="i2"></i>
   <span xid="span2">属性</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-right" label="更多操作" xid="moreBtn" icon="icon-arrow-down-b" onClick="{operation:'moreMenu.show'}">
   <i xid="i3" class="icon-arrow-down-b"></i>
   <span xid="span3">更多操作</span></a>
  </div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="treeGrid" data="docNodeTree" width="100%" height="auto" appearance="tree" expandColumn="sDocName" useVirtualRoot="false">
   <columns xid="columns1"><column name="sDocName" xid="column1"></column></columns></div></div>
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-9" xid="col2"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar2"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'docNodeList.new'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span4"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="编辑" xid="button5" icon="icon-ios7-compose-outline">
   <i xid="i5" class="icon-ios7-compose-outline"></i>
   <span xid="span5">编辑</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="下载" xid="dowBtn" onClick="dowBtnClick" icon="icon-ios7-download-outline">
   <i xid="i6" class="icon-ios7-download-outline"></i>
   <span xid="span6">下载</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="button7" icon="icon-ios7-search-strong" onClick="{operation:'bizFilter1.show'}">
   <i xid="i7" class="icon-ios7-search-strong"></i>
   <span xid="span7">查询</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'docNodeList.refresh'}" xid="button8">
   <i xid="i8"></i>
   <span xid="span8"></span></a></div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="docNodeList">
   <columns xid="columns3"><column name="sDocName" xid="column10"></column>
  <column name="sSize" xid="column11"></column>
  <column name="sCreatorName" xid="column12"></column>
  <column name="sCreatorDeptName" xid="column13"></column>
  <column name="sCreateTime" xid="column14"></column>
  <column name="sEditorName" xid="column15"></column>
  <column name="sLastWriterName" xid="column16"></column>
  <column name="sLastWriteTime" xid="column17"></column></columns></div></div>
   </div>
  </div>