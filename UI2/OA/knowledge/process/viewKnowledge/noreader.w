<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:235px;top:340px;"><div component="$UI/system/components/justep/data/data" autoLoad="false" xid="noreader" idColumn="sID" onCustomRefresh="noreaderCustomRefresh"><column label="sID" name="sID" type="String" xid="default1"></column>
  <column label="姓名" name="sName" type="String" xid="default2"></column>
  <column label="路径" name="sFName" type="String" xid="default3"></column></div></div> 
<div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="noreader" style="height:99%;">
   <columns xid="columns1"><column name="sName" xid="column1"></column>
  <column name="sFName" xid="column2"></column></columns></div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver1" onReceive="windowReceiver1Receive"></span></div>