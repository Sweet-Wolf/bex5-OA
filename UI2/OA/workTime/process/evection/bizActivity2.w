<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" extends="bizActivity1.w" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div xid="ruleCol3" xui:update-mode="delete"/>  
  <div xid="ruleCol4" xui:update-mode="delete"/>  
  <div xid="ruleCol5" xui:update-mode="delete"/>  
  <div xid="ruleCol6" xui:update-mode="delete"/>  
  <div xid="ruleCol7" xui:update-mode="delete"/>  
  <div xid="dept" xui:update-mode="delete"/>  
  <div xid="orgSelectPC1" xui:update-mode="delete"/>  
 
  <col name="fNO" xid="ruleCol111_2" xui:parent="rule1" xui:update-mode="insert"> 
    <readonly xid="readonly141_2"> 
      <expr xid="default141_2">true</expr> 
    </readonly> 
  </col>  
  <readonly xid="readonly1_2" xui:parent="rule1" xui:update-mode="insert"> 
    <expr xid="default1_2">true</expr> 
  </readonly>  
  <input bind-ref="mainData.ref('fAPPLYDEPTNAME')" class="form-control" component="$UI/system/components/justep/input/input"
    xid="input1_2" xui:parent="div21" xui:update-mode="insert"/>  
  <input bind-ref="mainData.ref('fAPPLYPERSONNAME')" class="form-control" component="$UI/system/components/justep/input/input"
    xid="input2_2" xui:parent="div2" xui:update-mode="insert"/>  
  <input xid="input9" style="float:left;" xui:update-mode="merge"/> 
</div>
