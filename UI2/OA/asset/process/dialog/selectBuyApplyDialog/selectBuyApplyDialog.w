<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:248px;top:267px;"><div component="$UI/system/components/justep/data/bizData" xid="mainData" concept="OA_AS_BuyApplyD" autoLoad="true"><reader xid="default1" action="/OA/asset/logic/action/queryASSelectBuyApplyAction"></reader></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="toolBar1" style="height:50px;">
   <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="mainData" filterCols="fName,fKind,fBuyNum,fInNum,fPrice,fAmount,fNO,fApplyDeptName,fApplyPsnName,fApplyDate" class="pull-right">
    <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input2"></input></div> 
   
   </div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="mainTables" data="mainData" multiSelect="true" showRowNumber="true">
   <columns xid="columns1">
    <column name="fKind" xid="column2"></column>
    <column name="fName" xid="column1"></column>
    
    <column name="fBuyNum" xid="column4"></column><column name="fPrice" xid="column6"></column>
    <column name="fAmount" xid="column7"></column>
    <column name="fNO" xid="column8"></column>
    <column name="fUnit" xid="column3"></column>
    <column name="fApplyDeptName" xid="column9"></column>
    <column name="fApplyPsnName" xid="column10"></column>
    <column name="fApplyDate" xid="column11"></column>
    <column name="fInNum" xid="column5"></column>
  
  </columns> </div></div>
   <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancelBtn" onClick='{"operation":"wReceiver.windowCancel"}'>
   <i xid="i2"></i>
   <span xid="span2">取消</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="OKBtn" onClick="OKBtnClick">
   <i xid="i4"></i>
   <span xid="span4">确定</span></a></div></div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="wReceiver" style="left:258px;top:16px;"></span></div>