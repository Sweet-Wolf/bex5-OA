<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:192px;top:329px;"><div component="$UI/system/components/justep/data/bizData" xid="dReaded" concept="OA_KM_READERS"><reader xid="default1" action="/OA/knowledge/logic/action/queryKMREADERSAction"></reader>
  <calculateRelation relation="recNo" xid="calculateRelation1" type="Integer"></calculateRelation>
  <rule xid="rule1">
   <col name="recNo" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default2">$row.index() + 1</expr></calculate> </col> </rule></div></div> 
<div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dtReaded" data="dReaded">
   <columns xid="columns1"><column name="recNo" xid="column3"></column><column name="fReaderName" xid="column1"></column>
  <column name="fReadTime" xid="column2"></column>
  </columns></div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span></div>