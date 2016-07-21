<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:230px;top:515px;" onLoad="modelLoad"><div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="archivalData" concept="OA_AM_Archival"><reader xid="default1" action="/OA/archival/logic/action/queryAMArchivalAction"></reader></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="treeData" concept="V_OA_AM_CategorySelect" isTree="true" limit="-1"><reader xid="default2" action="/OA/archival/logic/action/queryVAMCategorySelectAction"></reader>
  <treeOption xid="default3" parentRelation="fParentID" rootFilter="V_OA_AM_CategorySelect.fParentID='_is_root_' AND V_OA_AM_CategorySelect.fFondsName='c31'"></treeOption>
  <master xid="default4" data="treeData"></master></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dStateFilter" idColumn="label"><column label="名" name="label" type="String" xid="xid1"></column>
  <column label="值" name="value" type="String" xid="xid2"></column>
  <data xid="default5">[{&quot;label&quot;:&quot;按卷查询&quot;,&quot;value&quot;:&quot;1&quot;},{&quot;label&quot;:&quot;按件查询&quot;,&quot;value&quot;:&quot;0&quot;}]</data></div></div> 

  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter" filterData="archivalData"></span><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog" title="案卷信息" showTitle="true" status="normal"></span><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1" style="width:100%;">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-3" xid="col1">
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid1" data="treeData" appearance="tree" expandColumn="fCategoryName" useVirtualRoot="true" virtualRootLabel="档案管理" onRowClick="grid1RowClick" width="100%" height="auto">
   <columns xid="columns2"><column name="fCategoryName" xid="column20"></column>
  </columns></div></div>
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-9" xid="col2" style="overflow:auto;">
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'archivalData.refresh'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}">
   <i xid="i5" class="icon-android-search"></i>
   <span xid="span8">查询</span></a>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="stateFilter" filterData="archivalData" filterCol="fIsRoll">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true">
    <option xid="option3" data="dStateFilter" value="value" label="label"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter2" filterData="archivalData" dateCol="fFileDate">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4">
    <option xid="option6"></option></div> </div>
  <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="archivalData" filterCols="fArchivalNO,fFileNO,fTitle,OA_AM_Archival.fFondsName,fCategoryName,fRollName,fFileDeptName,fResponsibleName,fAMYear,fSecret,fKeepLimit,fCarry,fDocumentNO,fMenuNO,fPageNO,fBoxNO,fMicroNO" class="x-smartFilter-clear-hide input-group">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div></div><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid2" data="archivalData" height="auto" width="100%" showRowNumber="true" rowNumberWidth="20" onCellRender="grid2CellRender" onRowClick="grid2RowClick">
   <columns xid="columns3"><column name="fTitle" xid="column25" editable="false" width="200"></column><column name="fArchivalNO" xid="column22" width="120"></column>
  <column name="fFileDeptName" xid="column26" width="100"></column>
  <column name="fResponsibleName" xid="column27" width="100"></column>
  <column name="fFileDate" xid="column28" width="100"></column>
  <column name="fIsBorrow" xid="column29" width="100"></column>
  <column name="fAMDate" xid="column30" width="100"></column>
  <column name="fAMYear" xid="column31" width="100"></column>
  <column name="fSecret" xid="column32" width="100"></column>
  <column name="fKeepLimit" xid="column33" width="100"></column>
  <column name="fCarry" xid="column34" width="100"></column>
  <column name="fNum" xid="column35" width="100"></column>
  <column name="fUnit" xid="column36" width="100"></column>
  <column name="fDocumentNO" xid="column37" width="100"></column>
  <column name="fMenuNO" xid="column39" width="100"></column><column name="fMicroNO" xid="column38" width="100"></column>
  
  <column name="fPageNO" xid="column40" width="100"></column>
  <column name="fBoxNO" xid="column41" width="100"></column></columns></div></div>
   </div>
  </div>