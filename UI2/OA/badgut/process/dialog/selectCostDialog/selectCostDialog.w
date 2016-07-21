<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:224px;top:9px;">
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dCost" concept="OA_BG_CostCenter" orderBy="fCostCenterCode desc">
  <reader xid="default1" action="/OA/common/logic/action/queryBGCostCenterAction"></reader>
  <filter name="statusFilter" xid="filter1"><![CDATA[OA_BG_CostCenter.fUseStatus='1']]></filter></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-6 col-md-4" xid="col1">
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="dCost" filterCols="fKind,fCode,fName,fSpecType,fUnit,fStatusName,fOriginValue,fRemainValue,fServiceYear">
     <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div> </div> 
   <div class="col col-xs-6 col-md-8" xid="col3">
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group pull-right" tabbed="true" xid="buttonGroup2">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="preBtn" onClick='{"operation":"dCost.prevPage"}' icon="icon-ios7-arrow-back">
      <i xid="i5" class="icon-ios7-arrow-back"></i>
      <span xid="span5">上页</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="nextBtn" onClick='{"operation":"dCost.nextPage"}' icon="icon-ios7-arrow-forward">
      <i xid="i6" class="icon-ios7-arrow-forward"></i>
      <span xid="span6">下页</span></a> </div> </div> </div></div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables" data="dCost" showRowNumber="true" onRowDblClick="dataTablesRowDblClick">
   <columns xid="columns1"><column name="fCostCenterCode" xid="column2"></column><column name="fCostCenterName" xid="column1"></column>
  </columns></div>
  </div>  
    <div class="x-panel-bottom" xid="bottom1">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"wReceiver.windowCancel"}'> 
        <i xid="i2"/>  
        <span xid="span2">取消</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span>
      </a>
    </div>
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1" filterData="dCost"></span><span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;"/>
</div>