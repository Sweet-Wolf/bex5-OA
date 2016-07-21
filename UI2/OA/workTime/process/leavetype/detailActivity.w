<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad" style="height:auto;left:455px;top:403px;"><div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_WM_LeaveType" columns="" onSaveCommit="saveCommit" limit="20" onValueChanged="mainDataValueChanged">
   <reader action="/OA/workTime/logic/action/queryOA_WM_LeaveTypeAction" xid="default1"></reader>
   <writer action="/OA/workTime/logic/action/saveOA_WM_LeaveTypeAction" xid="default2"></writer>
   <creator action="/OA/workTime/logic/action/createOA_WM_LeaveTypeAction" xid="default3"></creator>
   <calculateRelation relation="calcCheckBox" xid="calculateRelation1"></calculateRelation>
   <rule xid="rule1">
   <col name="fSalaryRule" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default6"></expr></calculate> </col> 
   <col name="fIsReducHoliday" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default7"></expr></calculate> </col> 
   <col name="fIsSalary" xid="ruleCol3">
    <calculate xid="calculate3">
     <expr xid="default8"></expr></calculate> </col> 
   <col name="fCreatePerName" xid="ruleCol4">
    <readonly xid="readonly1">
     <expr xid="default5">true</expr></readonly> </col> 
   <col name="fCreateTime" xid="ruleCol5">
    <readonly xid="readonly2">
     <expr xid="default9">true</expr></readonly> </col> </rule></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="statusData" idColumn="value"><column label="值" name="value" type="String" xid="xid1"></column>
  <column label="名" name="label" type="String" xid="xid2"></column>
  <data xid="default4">[{&quot;value&quot;:&quot;1&quot;,&quot;label&quot;:&quot;启用&quot;},{&quot;value&quot;:&quot;0&quot;,&quot;label&quot;:&quot;未启用&quot;}]</data></div></div> 
<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="bar">
   
   <a component="$UI/system/components/justep/button/button" label=" 新建" class="btn btn-link btn-icon-left" icon="icon-plus" xid="newBtn" onClick="{operation:'mainData.new'}">
    <i class="icon-plus" xid="i8"></i>
    <span xid="span1">新建</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="保存" xid="saveBtn" onClick='{"operation":"mainData.save"}'>
    <i xid="i3"></i>
    <span xid="label7">保存</span></a> 
   
   
   
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="启用" xid="btnStartUse" onClick="btnStartUseClick">
    <i xid="i1"></i>
    <span xid="span10">启用</span></a> 
   
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="停用" xid="btnStopUse" onClick="btnStopUseClick">
    <i xid="i7"></i>
    <span xid="span12">停用</span></a> </div>
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fTypeCode')"></label>
   <div class="x-edit" xid="div1"><input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="mainData.ref('fTypeCode')"></input></div></div></div>
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label" xid="label2" style="width:100px;" bind-text="mainData.label('fTypeName')"></label>
   <div class="x-edit" xid="div2">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="mainData.ref('fTypeName')"></input></div> </div></div>
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput1">
    <label class="x-label" xid="label11" style="width:100px;" bind-text="mainData.label('fUseStatusName')"></label>
    <div class="x-edit" xid="div10">
     <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" bind-labelRef="mainData.ref('fUseStatusName')" bind-ref="mainData.ref('fUseStatus')">
   <option xid="option2" data="statusData" value="value" label="label"></option></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
    <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fIsSalary')"></label>
    <div class="x-edit" xid="div3">
     <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="fIsSalary" bind-ref="mainData.ref('fIsSalary')" checkedValue="1"></span></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit6">
    <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fIsReducHoliday')"></label>
    <div class="x-edit" xid="div6">
     <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="fIsReducHoliday" bind-ref="mainData.ref('fIsReducHoliday')" checkedValue="1"></span></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
    <label class="x-label" xid="label5" style="width:100px;" bind-text="mainData.label('fSequence')"></label>
    <div class="x-edit" xid="div5">
     <input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="mainData.ref('fSequence')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
    <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fSalaryRule')"></label>
    <div class="x-edit" xid="div4">
     <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="mainData.ref('fSalaryRule')"></textarea></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit9">
    <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fRemark')"></label>
    <div class="x-edit" xid="div9">
     <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea2" bind-ref="mainData.ref('fRemark')"></textarea></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit8">
    <label class="x-label" xid="label9" style="width:100px;" bind-text="mainData.label('fCreatePerName')"></label>
    <div class="x-edit" xid="div8">
     <input component="$UI/system/components/justep/input/input" class="form-control" xid="input8" bind-ref="mainData.ref('fCreatePerName')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit7">
    <label class="x-label" xid="label10" style="width:100px;" bind-text="mainData.label('fCreateTime')"></label>
    <div class="x-edit" xid="div7">
     <input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref="mainData.ref('fCreateTime')"></input></div> </div> </div></div></div>