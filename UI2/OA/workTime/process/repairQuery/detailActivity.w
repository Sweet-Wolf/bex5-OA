<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:587px;top:20px;" onModelConstructDone="modelModelConstructDone"> 
    
  <div autoLoad="true" autoNew="false" columns="" component="$UI/system/components/justep/data/bizData" concept="OA_WM_repairApply" directDelete="true" orderBy="" xid="mainData" xui:update-mode="merge">
   <reader action="/OA/workTime/logic/action/queryOA_WM_repairApplyAction" xid="default1"></reader>
   <writer action="/OA/workTime/logic/action/saveOA_WM_repairApplyAction" xid="default2"></writer>
   <creator action="/OA/workTime/logic/action/createOA_WM_repairApplyAction" xid="default3"></creator>
   <rule xid="rule1" xui:parent="mainData" xui:update-mode="insert">
    <col name="fNO" xid="ruleCol11">
     <readonly xid="readonly11">
      <expr xid="default11">true</expr></readonly> </col> 
    <col name="fTYPEID" xid="ruleCol21">
     <readonly xid="readonly21">
      <expr xid="default21">true</expr></readonly> </col> 
    <col name="fTYPENAME" xid="ruleCol31">
     <readonly xid="readonly31">
      <expr xid="default31">true</expr></readonly> </col> 
    <col name="fAPPLYPERSONID" xid="ruleCol41">
     <readonly xid="readonly41">
      <expr xid="default41">true</expr></readonly> </col> 
    <col name="fAPPLYPERSONNAME" xid="ruleCol42">
     <readonly xid="readonly42">
      <expr xid="default42">true</expr></readonly> </col> 
    <col name="fAPPLYDEPTID" xid="ruleCol51">
     <readonly xid="readonly51">
      <expr xid="default51">true</expr></readonly> </col> 
    <col name="fAPPLYDEPTNAME" xid="ruleCol52">
     <readonly xid="readonly52">
      <expr xid="default52">true</expr></readonly> </col> 
    <col name="fCARDTIME" xid="ruleCol61">
     <readonly xid="readonly61">
      <expr xid="default61">true</expr></readonly> </col> 
    <col name="fSQUADID" xid="ruleCol71">
     <readonly xid="readonly71">
      <expr xid="default71">true</expr></readonly> </col> 
    <col name="fCREATEPERNAME" xid="ruleCol81">
     <readonly xid="readonly81">
      <expr xid="default81">true</expr></readonly> </col> 
    <col name="fCREATETIME" xid="ruleCol82">
     <readonly xid="readonly82">
      <expr xid="default82">true</expr></readonly> </col> 
    <col name="fCREATEPERID" xid="ruleCol83">
     <readonly xid="readonly83">
      <expr xid="default83">true</expr></readonly> </col> 
    <col name="fBizStateName" xid="ruleCol91">
     <readonly xid="readonly91">
      <expr xid="default91">true</expr></readonly> </col> 
    <col name="fBizState" xid="ruleCol101">
     <readonly xid="readonly101">
      <expr xid="default101">true</expr></readonly> </col> 
    <col name="fREASON" xid="ruleCol102">
     <readonly xid="readonly102">
      <expr xid="default102">true</expr></readonly> </col> 
    <col name="fREMARK" xid="ruleCol103">
     <readonly xid="readonly103">
      <expr xid="default103">true</expr></readonly> </col> 
    <col name="fAPPLYDATE" xid="ruleCol104">
     <readonly xid="readonly104">
      <expr xid="default104">true</expr></readonly> </col> </rule> </div><div component="$UI/system/components/justep/data/bizData" xid="taskData" concept="SA_Task">
   <reader xid="default19" action="/system/logic/action/queryTaskAction"></reader></div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div><div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chartBtn" label="流程图" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
    <i xid="i2"></i>
    <span xid="span2">流程图</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="processRecBtn" label="流程记录" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
    <i xid="i1"></i>
    <span xid="span1">流程记录</span></a> </div><div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="mainForm">
   <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1">
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col3">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1">
     <label class="x-label" style="width:90px;" title="基础信息" xid="fApplyDeptNamell">基础信息</label>
     <div class="x-edit" xid="div1"></div></div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col4"></div>
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit3">
     <label class="x-label" style="width:100px;" title="NO:" xid="label3">NO:</label>
     <div class="x-edit" xid="div3">
      <output bind-ref="mainData.ref('fNO')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="fNO"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit6">
     <label bind-text='mainData.label("fAPPLYDEPTNAME")' class="x-label" style="width:100px;" xid="fAPPLYDEPTNAMEL">所属部门</label>
     <div class="x-edit" xid="div6">
      <div bind-labelRef="mainData.ref('fAPPLYDEPTNAME')" bind-ref="mainData.ref('fAPPLYDEPTID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" includeOrgKind="ogn,dpt" xid="orgSelectPC4">
       <div autoLoad="true" component="$UI/system/components/justep/data/bizData" xid="dOrg"></div>
       <option label="sName" value="sCode" xid="option4">
        <columns xid="columns6">
         <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5">
     <label bind-text="mainData.label('fAPPLYPERSONNAME')" class="x-label" style="width:100px;" xid="fAPPLYPERSONNAMEL"></label>
     <div class="x-edit" xid="div5">
      <div bind-labelRef="mainData.ref('fAPPLYPERSONNAME')" bind-ref="mainData.ref('fAPPLYPERSONID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" includeOrgKind="psm" xid="orgSelectPC3">
       <div autoLoad="true" component="$UI/system/components/justep/data/bizData" limit="-1" xid="dPsm">
        <treeOption rootFilter="1=1" xid="default15"></treeOption></div> 
       <option label="sName" value="sCode" xid="option5">
        <columns xid="columns5">
         <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit4">
     <label bind-text="mainData.label('fAPPLYDATE')" class="x-label" style="width:100px;" xid="fAPPLYDATEL"></label>
     <div class="x-edit" xid="div4">
      <input bind-ref="mainData.ref('fAPPLYDATE')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd hh:mm" xid="fAPPLYDATE"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit8">
     <label bind-text="mainData.label('fCARDTIME')" class="x-label" style="width:100px;" xid="fCARDTIMEL"></label>
     <div class="x-edit" style="width:200px;" xid="div8">
      <input bind-ref="mainData.ref('fCARDTIME')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd hh:mm" xid="fCARDTIME"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit9">
     <label bind-text="mainData.label('fTYPENAME')" class="x-label" style="width:100px;" xid="fTYPENAMEL"></label>
     <div class="x-edit" xid="div9">
      <div bind-labelRef="mainData.ref('fTYPENAME')" bind-ref="mainData.ref('fTYPEID')" class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="grdSlfTYPENAME">
       <option data="commData1" ext="typeName" label="typeName" value="typeCode" xid="option3"></option></div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col25">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit12">
     <label bind-text="mainData.label('fSQUAD')" class="x-label" style="width:100px;" xid="fSQUADL"></label>
     <div class="x-edit" xid="div12">
      <div bind-labelRef="mainData.ref('fSQUAD')" bind-ref="mainData.ref('fSQUADID')" class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1">
       <option data="commData2" ext="className" label="className" value="classCode" xid="option1"></option></div> </div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit15">
     <label bind-text="mainData.label('fREASON')" class="x-label" style="width:100px;" xid="fREASONL"></label>
     <div class="x-edit" xid="div15">
      <textarea bind-ref="mainData.ref('fREASON')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="fREASON"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col38">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit21">
     <label bind-text="mainData.label('fREMARK')" class="x-label" style="width:100px;" xid="fREMARKL"></label>
     <div class="x-edit" xid="div21">
      <textarea bind-ref="mainData.ref('fREMARK')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="fREMARK"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col1">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput1">
     <label class="x-label" style="width:100px;" title="制 单 人" xid="label1">制 单 人</label>
     <div class="x-edit" xid="div2">
      <output bind-ref="mainData.ref('fCREATEPERNAME')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="outfCREATEPERNAME"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col2">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput2">
     <label class="x-label" style="width:100px;" title="制单日期" xid="label2">制单日期</label>
     <div class="x-edit" xid="div7">
      <output bind-ref="mainData.ref('fCREATETIME')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" format="yyyy-MM-dd hh:mm" xid="outfCREATETIME"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col5">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput3">
     <label class="x-label" style="width:100px;" title="状 态" xid="label4">状 态</label>
     <div class="x-edit" xid="div10">
      <output bind-ref="mainData.ref('fBizStateName')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" format="yyyy-MM-dd hh:mm" xid="outfBizStateName"></output></div> </div> </div> </div></div></div>
