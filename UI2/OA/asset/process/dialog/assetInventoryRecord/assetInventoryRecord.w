<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model"><div component="$UI/system/components/justep/data/bizData" xid="dInventoryRecord" concept="OA_AS_InventoryD"><reader xid="default1" action="/OA/asset/logic/action/queryASInventoryRecordAction"></reader>
  </div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/>
<div xid="div" style="overflow:auto;width:100%;">
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="dInventoryRecord" showRowNumber="true" style="width:120%;">
    <columns xid="columns1">
     <column name="fInventoryNO" xid="column1"></column>
  <column name="fDeptName" xid="column2"></column>
  <column name="fPersonName" xid="column3"></column>
  <column name="fDate" xid="column4"></column>
  <column name="fDescription" xid="column5"></column>
  <column name="fRemark" xid="column6"></column></columns> </div> </div></div>