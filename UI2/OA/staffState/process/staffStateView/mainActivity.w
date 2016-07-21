<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad" style="height:auto;left:224px;top:76px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="queryDateData" idColumn="dateArg">  
  <column label="a" name="dateArg" type="String" xid="xid1"></column>
  <column label="b" name="dateTrigger" type="String" xid="xid2"></column>
  <column label="部门名称" name="personName" type="String" xid="xid3"></column>
  <column label="人员" name="orgName" type="String" xid="xid4"></column></div>
  </div> 
<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="toolBar" style="clear:both;">
    
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput1" style="width:20%;float:left;padding-right:15px;">
   <label class="x-label" xid="label2"><![CDATA[日期]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="dateArg" bind-ref="queryDateData.ref('dateArg')" onChange="dateArgChange"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput2" style="width:20%;float:left;padding-right:15px;">
   <label class="x-label" xid="label1"><![CDATA[人员]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="personName" bind-ref="queryDateData.ref('personName')" onChange="personNameChange"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput3" style="width:20%;float:left;padding-right:15px;">
   <label class="x-label" xid="label3"><![CDATA[机构]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="orgName" bind-ref="queryDateData.ref('orgName')" onChange="orgNameChange"></input></div></div></div>
