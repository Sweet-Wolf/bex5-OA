<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:184px;top:203px;"><div component="$UI/system/components/justep/data/data" autoLoad="false" xid="tempData" idColumn="fName" autoNew="true"><column label="名称" name="fName" type="String" xid="xid1"></column>
  <column label="类型ID" name="fLeaveTypeID" type="String" xid="xid2"></column>
  <column label="类型" name="fLeaveTypeName" type="String" xid="xid3"></column>
  <column label="状态ID" name="fState" type="String" xid="xid4"></column>
  <column label="状态" name="fStateName" type="String" xid="xid5"></column>
  <column label="开始时间" name="fBeginDate" type="Date" xid="xid6"></column>
  <column label="结束时间" name="fEndDate" type="Date" xid="xid7"></column>
  <rule xid="rule1">
   <col name="fLeaveTypeID" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default5">true</expr></required> </col> 
   <col name="fLeaveTypeName" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default7">true</expr></required> </col> 
   <col name="fState" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default8">true</expr></required> </col> 
   <col name="fStateName" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default9">true</expr></required> </col> 
   <col name="fBeginDate" xid="ruleCol5">
    <required xid="required5">
     <expr xid="default10">true</expr></required> </col> 
   <col name="fEndDate" xid="ruleCol6">
    <required xid="required6">
     <expr xid="default11">true</expr></required> </col> 
   <col name="name" xid="ruleCol7">
    <required xid="required7">
     <expr xid="default12">true</expr></required> </col> 
   <col name="fName" xid="ruleCol8">
    <required xid="required8">
     <expr xid="default13">true</expr></required> </col> </rule></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="leaveTypeData" idColumn="value">
   <column label="值" name="value" type="String" xid="default1"></column>
   <column label="显示名称" name="label" type="String" xid="default2"></column>
   <data xid="default1">[{&quot;value&quot;:&quot;1&quot;,&quot;label&quot;:&quot;法定假日&quot;},{&quot;value&quot;:&quot;2&quot;,&quot;label&quot;:&quot;正常上班&quot;},{&quot;value&quot;:&quot;3&quot;,&quot;label&quot;:&quot;休息日&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="stateData" idColumn="value">
   <column label="值" name="value" type="String" xid="default3"></column>
   <column label="显示名称" name="label" type="String" xid="default4"></column>
   <data xid="default6">[{&quot;value&quot;:&quot;1&quot;,&quot;label&quot;:&quot;休息&quot;},{&quot;value&quot;:&quot;2&quot;,&quot;label&quot;:&quot;上班&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1" style="width:100px;" bind-text="tempData.label('fName')"></label>
   <div class="x-edit" xid="div1"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="tempData.ref('fName')"></input></div></div></div>
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col2"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label" xid="label3" style="width:100px;" bind-text="tempData.label('fLeaveTypeName')"></label>
   <div class="x-edit" xid="div2">
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="tempData.ref('fLeaveTypeID')" bind-labelRef="tempData.ref('fLeaveTypeName')">
   <option xid="option1" data="leaveTypeData" value="value" label="label"></option></div></div> </div></div>
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col3"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
   <label class="x-label" xid="label4" style="width:100px;" bind-text="tempData.label('fStateName')"></label>
   <div class="x-edit" xid="div3">
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" bind-ref="tempData.ref('fState')" bind-labelRef="tempData.ref('fStateName')">
   <option xid="option2" data="stateData" value="value" label="label"></option></div></div> </div></div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
    <label class="x-label" xid="label6" style="width:100px;" bind-text="tempData.label('fBeginDate')"></label>
    <div class="x-edit" xid="div5">
     <input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="tempData.ref('fBeginDate')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
    <label class="x-label" xid="label5" style="width:100px;" bind-text="tempData.label('fEndDate')"></label>
    <div class="x-edit" xid="div4">
     <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="tempData.ref('fEndDate')"></input></div> </div> </div></div></div>  
    <div class="x-panel-bottom" xid="bottom1">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"wReceiver.windowCancel"}'> 
        <i xid="i2"/>  
        <span xid="span2">取消</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span>
      </a>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;"/>
</div>