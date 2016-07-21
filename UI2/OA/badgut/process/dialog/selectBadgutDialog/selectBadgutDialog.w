<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:224px;top:9px;">
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dBadgut" concept="OA_BG_BadgutD" orderBy="fYear desc">
  <reader xid="default1" action="/OA/badgut/logic/action/queryBGBadgutAction"></reader>
  </div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-6 col-md-4" xid="col1">
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="dBadgut" filterCols="fKind,fCode,fName,fSpecType,fUnit,fStatusName,fOriginValue,fRemainValue,fServiceYear">
     <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div> </div> 
   <div class="col col-xs-6 col-md-8" xid="col3">
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group pull-right" tabbed="true" xid="buttonGroup2">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="preBtn" onClick='{"operation":"dBadgut.prevPage"}' icon="icon-ios7-arrow-back">
      <i xid="i5" class="icon-ios7-arrow-back"></i>
      <span xid="span5">上页</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="nextBtn" onClick='{"operation":"dBadgut.nextPage"}' icon="icon-ios7-arrow-forward">
      <i xid="i6" class="icon-ios7-arrow-forward"></i>
      <span xid="span6">下页</span></a> </div> </div> </div></div><div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid" data="dBadgut" showRowNumber="true" directEdit="false" height="auto" multiselect="true" onRowDblClick="gridRowDblClick">
   <columns xid="columns2"><column width="100" name="fAccountCode" xid="column19"></column>
  <column width="100" name="fAccountName" xid="column20"></column>
  <column width="100" name="fCostCenterCode" xid="column34"></column><column width="100" name="fCostCenterName" xid="column35"></column><column width="100" name="fYear" xid="column36"></column><column width="100" name="fPlan1" xid="column21"></column>
  <column width="100" name="fPlan2" xid="column22"></column>
  <column width="100" name="fPlan3" xid="column23"></column>
  <column width="100" name="fPlan4" xid="column24"></column>
  <column width="100" name="fPlan5" xid="column25"></column>
  <column width="100" name="fPlan6" xid="column26"></column>
  <column width="100" name="fPlan7" xid="column27"></column>
  <column width="100" name="fPlan8" xid="column28"></column>
  <column width="100" name="fPlan9" xid="column29"></column>
  <column width="100" name="fPlan10" xid="column30"></column>
  <column width="100" name="fPlan11" xid="column31"></column>
  <column width="100" name="fPlan12" xid="column32"></column>
  <column width="100" name="fPlanall" xid="column33"></column>
  
  
  </columns></div></div>  
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
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1" filterData="dBadgut"></span><span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;"/>
</div>