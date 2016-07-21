<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:224px;top:9px;"><div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dAssetCard" concept="OA_AS_Card"><reader xid="default1" action="/OA/asset/logic/action/queryASCardAction"></reader>
  <writer xid="default2" action="/OA/asset/logic/action/saveASCardAction"></writer>
  <creator xid="default3" action="/OA/asset/logic/action/createASCardAction"></creator></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-6 col-md-4" xid="col1">
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="dAssetCard" filterCols="fKind,fCode,fName,fSpecType,fUnit,fStatusName,fOriginValue,fRemainValue,fServiceYear">
     <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div> </div> 
   <div class="col col-xs-6 col-md-8" xid="col3">
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group pull-right" tabbed="true" xid="buttonGroup2">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="preBtn" onClick='{"operation":"dAssetCard.prevPage"}' icon="icon-ios7-arrow-back">
      <i xid="i5" class="icon-ios7-arrow-back"></i>
      <span xid="span5">上页</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="nextBtn" onClick='{"operation":"dAssetCard.nextPage"}' icon="icon-ios7-arrow-forward">
      <i xid="i6" class="icon-ios7-arrow-forward"></i>
      <span xid="span6">下页</span></a> </div> </div> </div></div><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="dAssetCard" onRowClick="dataTables1RowClick">
   <columns xid="columns1"><column name="fStatusName" xid="column3"></column><column name="fCode" xid="column1"></column>
  <column name="fKind" xid="column12"></column><column name="fName" xid="column2"></column>
  
  <column name="fSpecType" xid="column13"></column><column name="fUnit" xid="column14"></column><column name="fRemainValue" xid="column5"></column><column name="fServiceYear" xid="column6"></column>
  
  
  </columns></div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1" data="dAssetCard">
   <div class="row" xid="div1">
    <div class="col-sm-3" xid="div2">
     <div class="x-pagerbar-length" xid="div3">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span3">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default4">10</option>
        <option value="20" xid="default5">20</option>
        <option value="50" xid="default6">50</option>
        <option value="100" xid="default7">100</option></select> 
       <span xid="span4">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div4">
     <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div6">
     <div class="x-pagerbar-pagination" xid="div7">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li1">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span7">«</span>
         <span class="sr-only" xid="span8">Previous</span></a> </li> 
       <li class="next" xid="li2">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span9">»</span>
         <span class="sr-only" xid="span10">Next</span></a> </li> </ul> </div> </div> </div> </div>
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
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1" filterData="dAssetCard"></span><span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;"/>
</div>