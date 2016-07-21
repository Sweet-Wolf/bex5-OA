<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:230px;top:515px;" onLoad="modelLoad"><div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="archivalData" concept="OA_AM_Archival"><reader xid="default1" action="/OA/archival/logic/action/queryAMArchivalAction"></reader></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="treeData" concept="V_OA_AM_CategorySelect" isTree="true" limit="-1"><reader xid="default2" action="/OA/archival/logic/action/queryVAMCategorySelectAction"></reader>
  <treeOption xid="default3" parentRelation="fParentID" rootFilter="V_OA_AM_CategorySelect.fParentID='_is_root_' AND V_OA_AM_CategorySelect.fFondsName='c31'"></treeOption>
  <master xid="default4" data="treeData"></master></div></div> 

  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1" style="width:100%;">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-3" xid="col1"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid1" data="treeData" appearance="tree" expandColumn="fCategoryName" useVirtualRoot="true" virtualRootLabel="档案管理" onRowClick="grid1RowClick" width="100%" height="auto">
   <columns xid="columns2"><column name="fCategoryName" xid="column20"></column>
  </columns></div></div>
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-9" xid="col2" style="overflow:auto;"><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="gridTables" data="archivalData" height="auto" width="100%" showRowNumber="false" multiselect="true">
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
   </div></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'>
   <i xid="i2"></i>
   <span xid="span2">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="OKBtn" onClick="OKBtnClick">
   <i xid="i1"></i>
   <span xid="span1">确定</span></a></div></div></div>