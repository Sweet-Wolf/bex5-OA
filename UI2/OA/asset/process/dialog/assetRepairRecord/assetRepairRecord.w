<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:48px;top:294px;"><div component="$UI/system/components/justep/data/bizData" xid="dRepairRecord" concept="OA_AS_RepairApply"><reader xid="default1" action="/OA/asset/logic/action/queryASRepairApplyAction"></reader></div></div>  
  <div xid="div12" style="overflow:auto;width:100%;">
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="dRepairRecord" showRowNumber="true" style="width:120%;">
    <columns xid="columns1">
     <column name="fNO" xid="column6"></column>
  
  <column name="fRepairAmount" xid="column10"></column><column name="fRepairDate" xid="column8"></column>
  <column name="fReturnDate" xid="column9"></column>
  <column name="fDescription" xid="column7"></column></columns> </div> </div><span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/>
</div>