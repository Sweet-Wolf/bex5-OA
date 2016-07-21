<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:343px;top:300px;"><div component="$UI/system/components/justep/data/bizData" xid="dUseRecord" concept="OA_AS_UseRecord"><reader xid="default1" action="/OA/asset/logic/action/queryASUseRecordAction"></reader></div></div>  
  <div xid="div12" style="overflow:auto;width:100%;">
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="dUseRecord" showRowNumber="true" style="width:120%;">
     <columns xid="columns1">
      <column name="fDutyDeptName" xid="column2"></column>
      <column name="fDutyPsnName" xid="column1"></column>
      <column name="fBeginDate" xid="column3"></column>
      <column name="fEndDate" xid="column4"></column>
      <column name="fRemark" xid="column5"></column>
      </columns> </div> </div><span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/>
</div>