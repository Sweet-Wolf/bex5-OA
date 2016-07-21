<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:170px;top:306px;" onModelConstructDone="modelModelConstructDone"><div component="$UI/system/components/justep/data/bizData" xid="dInventoryD" concept="OA_AS_InventoryD" limit="10">
   <reader xid="default1" action="/OA/asset/logic/action/queryASInventoryRecordAction"></reader></div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/>
<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="bar">
   <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="dInventoryD" filterCols="fInventoryNO,fDeptName,fPersonName,fDate,fDescription,fRemark" class="pull-right">
    <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div><a component="$UI/system/components/justep/button/button" label=" 新建" class="btn btn-link btn-icon-left" icon="icon-plus" xid="newBtn" onClick="newBtnClick">
    <i class="icon-plus" xid="i1"></i>
    <span xid="span1">新建</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="refreshBtn" onClick="{operation:'dInventoryD.refresh'}" label="刷新">
    <i xid="i2"></i>
    <span xid="span2">刷新</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}">
    <i xid="i5" class="icon-android-search"></i>
    <span xid="span8">查询</span></a> 
    </div><div xid="div" style="overflow:auto;width:100%;">
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dInventoryList" data="dInventoryD" showRowNumber="true" ordering="true" onCellRender="dInventoryListCellRender" onRowClick="dInventoryListRowClick">
    <columns xid="columns1">
     <column name="fInventoryNO" xid="column1"></column><column name="fDeptName" xid="column2"></column>
  <column name="fPersonName" xid="column3"></column>
  <column name="fDate" xid="column4"></column>
  <column name="fDescription" xid="column5"></column>
  <column name="fRemark" xid="column6"></column>
  <column name="inventory" xid="inventory" orderable="false" label="操作"></column>

  </columns> </div> </div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgInsertInventory" style="left:264px;top:12px;" title="添加清查记录" showTitle="true" status="normal" width="55%" height="70%" onReceive="wDlgInsertInventoryReceive"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgUpdateInventory" style="left:323px;top:11px;" title="修改清查记录" showTitle="true" status="normal" width="55%" height="70%" onReceive="wDlgUpdateInventoryReceive"></span>
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter" filterData="dAssetInventory" style="left:28px;top:290px;"></span>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1">
   <div class="row" xid="div1">
    <div class="col-sm-3" xid="div2">
     <div class="x-pagerbar-length" xid="div3">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span3">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default2">10</option>
        <option value="20" xid="default3">20</option>
        <option value="50" xid="default4">50</option>
        <option value="100" xid="default5">100</option></select> 
       <span xid="span4">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div4">
     <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div6">
     <div class="x-pagerbar-pagination" xid="div7">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li1">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span5">«</span>
         <span class="sr-only" xid="span6">Previous</span></a> </li> 
       <li class="next" xid="li2">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span7">»</span>
         <span class="sr-only" xid="span9">Next</span></a> </li> </ul> </div> </div> </div> </div></div>