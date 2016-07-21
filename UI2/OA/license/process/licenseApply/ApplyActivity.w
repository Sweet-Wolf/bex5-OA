<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="startActivity.w"
  xid="window" class="window" design="device:pc;">  
  <div xid="detailBar" xui:update-mode="delete"/>  
  <div xid="mainData" autoLoad="true" autoNew="false" xui:update-mode="merge"/>  
  <readonly xid="readonly1_1" xui:parent="rule1" xui:update-mode="insert"> 
    <expr xid="default1_1">true</expr> 
  </readonly>  
  <rule xid="rule1_1" xui:parent="detailData" xui:update-mode="insert"> 
    <readonly xid="readonly2_1"> 
      <expr xid="default2_1">true</expr> 
    </readonly> 
  </rule> 
</div>
