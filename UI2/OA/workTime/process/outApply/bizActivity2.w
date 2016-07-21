<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" extends="bizActivity1.w" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div xid="rule1" xui:update-mode="delete"/>  
  
  <rule xid="rule1" xui:parent="mainData" xui:update-mode="insert"> 
    <col name="fNO" xid="ruleCol1"> 
      <readonly xid="readonly1"> 
        <expr xid="default1">true</expr> 
      </readonly> 
    </col>  
    <col name="fCreatePerName" xid="ruleCol2"> 
      <readonly xid="readonly2"> 
        <expr xid="default2">true</expr> 
      </readonly> 
    </col>  
    <col name="fCreateTime" xid="ruleCol3"> 
      <readonly xid="readonly3"> 
        <expr xid="default3">true</expr> 
      </readonly> 
    </col>  
    <col name="fAPPLYPERSONNAME" xid="ruleCol4"> 
      <readonly xid="readonly4"> 
        <expr xid="default4">true</expr> 
      </readonly> 
    </col>  
    <col name="fAPPLYPERSONID" xid="ruleCol5"> 
      <readonly xid="readonly5"> 
        <expr xid="default5">true</expr> 
      </readonly> 
    </col>  
    <col name="fAPPLYDEPTID" xid="ruleCol6"> 
      <readonly xid="readonly6"> 
        <expr xid="default6">true</expr> 
      </readonly> 
    </col>  
    <col name="fAPPLYDEPTNAME" xid="ruleCol7"> 
      <readonly xid="readonly7"> 
        <expr xid="default1">true</expr> 
      </readonly> 
    </col>  
    <col name="fAPPLYDATE" xid="ruleCol8"> 
      <readonly xid="readonly8"> 
        <expr xid="default8">true</expr> 
      </readonly> 
    </col>  
    <col name="fDAYS" xid="ruleCol9"> 
      <readonly xid="readonly9"> 
        <expr xid="default9">true</expr> 
      </readonly> 
    </col>  
    <col name="fHOURS" xid="ruleCol10"> 
      <readonly xid="readonly10"> 
        <expr xid="default10">true</expr> 
      </readonly> 
    </col>  
    <col name="fSTARTTIME" xid="ruleCol11"> 
      <readonly xid="readonly11"> 
        <expr xid="default11">true</expr> 
      </readonly> 
    </col>  
    <col name="fENDTIME" xid="ruleCol12"> 
      <readonly xid="readonly12"> 
        <expr xid="default12">true</expr> 
      </readonly> 
    </col>  
    <col name="fPERSONNEL" xid="ruleCol13"> 
      <readonly xid="readonly13"> 
        <expr xid="default13">true</expr> 
      </readonly> 
    </col>  
    <col name="fNUMBER" xid="ruleCol14"> 
      <readonly xid="readonly14"> 
        <expr xid="default14">true</expr> 
      </readonly> 
    </col>  
    <col name="fREASON" xid="ruleCol15"> 
      <readonly xid="readonly15"> 
        <expr xid="default15">true</expr> 
      </readonly> 
    </col>  
    <col name="fRemark" xid="ruleCol16"> 
      <readonly xid="readonly16"> 
        <expr xid="default16">true</expr> 
      </readonly> 
    </col> 
  </rule>  
  <output xid="fPERSONNE" style="float:left;" xui:update-mode="merge"/> 
</div>
