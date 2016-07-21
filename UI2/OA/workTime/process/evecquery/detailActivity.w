<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad" style="height:auto;left:303px;top:6px;"><div autoLoad="true" autoNew="false" columns="" component="$UI/system/components/justep/data/bizData" concept="OA_WM_EvecApply" directDelete="true" orderBy="" xid="mainData" xui:update-mode="merge">
   <reader action="/OA/workTime/logic/action/queryOA_WM_EvecApplyAction" xid="default3"></reader>
   <writer action="/OA/workTime/logic/action/saveOA_WM_EvecApplyAction" xid="default4"></writer>
   <creator action="/OA/workTime/logic/action/createOA_WM_EvecApplyAction" xid="default5"></creator>
   <rule xid="rule1">
   <col name="fAPPLYDATE" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default1">true</expr></readonly> </col> 
   <col name="fSTARTTIME" xid="ruleCol2">
    <required xid="required1">
     <expr xid="default2">true</expr></required> </col> 
   <col name="fNO" xid="ruleCol111">
    <readonly xid="readonly141">
     <expr xid="default141">true</expr></readonly> </col> 
   <col name="fCANCELHOLSDEPTNAME" xid="ruleCol3">
    <readonly xid="readonly2">
     <expr xid="default6">true</expr></readonly> </col> 
   <col name="fCANCELHOLSPERSONNAME" xid="ruleCol4">
    <readonly xid="readonly3">
     <expr xid="default7">true</expr></readonly> </col> 
   <col name="fCANCELHOLSDATE" xid="ruleCol5">
    <readonly xid="readonly4">
     <expr xid="default8">true</expr></readonly> </col> 
   <col name="fFACTDAYS" xid="ruleCol6">
    <readonly xid="readonly5">
     <expr xid="default9">true</expr></readonly> </col> 
   <col name="fFACTSTARTTIME" xid="ruleCol7">
    <readonly xid="readonly6">
     <expr xid="default10">true</expr></readonly> </col> 
   <col name="fFACTENDTIME" xid="ruleCol8">
    <readonly xid="readonly7">
     <expr xid="default11">true</expr></readonly> </col> 
   <col name="fBrefExplain" xid="ruleCol9">
    <readonly xid="readonly8">
     <expr xid="default12">true</expr></readonly> </col> 
   <readonly xid="readonly9">
    <expr xid="default13">true</expr></readonly> </rule></div></div> 
<div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div><div xid="view">
   <div class="x-toolbar x-toolbar-spliter form-inline" component="$UI/system/components/justep/toolBar/toolBar" xid="mainBar">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.refresh'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="chartBtnClick" xid="button2" label="流程图" icon="icon-android-image">
   <i xid="i2" class="icon-android-image"></i>
   <span xid="span2">流程图</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="processBtn" xid="button3" label="流程记录" icon="icon-android-note">
   <i xid="i3" class="icon-android-note"></i>
   <span xid="span3">流程记录</span></a></div> 
   <div xid="content">
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="mainForm">
     
     <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1">
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col1">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1">
        <label class="x-label" style="width:100px;" xid="label1">申请信息</label>
        <div class="x-edit" xid="div1"></div></div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit19">
        <label class="x-label" style="width:100px;" xid="label25">NO</label>
        <div class="x-edit" xid="div20">
         <div bind-ref="mainData.ref('fNO')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output1"></div></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit20">
        <label bind-text="mainData.label('fAPPLYDEPTNAME')" class="x-label" style="width:100px;" xid="label27"></label>
        <div class="x-edit" xid="div21">
         <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="mainData.ref('fAPPLYDEPTNAME')"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit2">
        <label bind-text="mainData.label('fAPPLYPERSONNAME')" class="x-label" style="width:100px;" xid="label2"></label>
        <div class="x-edit" xid="div2">
         <input component="$UI/system/components/justep/input/input" class="form-control" xid="input13" bind-ref="mainData.ref('fAPPLYPERSONNAME')"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit4">
        <label bind-text="mainData.label('fAPPLYDATE')" class="x-label" style="width:100px;" xid="label4"></label>
        <div class="x-edit" xid="div3">
         <input bind-ref="mainData.ref('fAPPLYDATE')" class="form-control" component="$UI/system/components/justep/input/input" xid="input2"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit3">
        <label bind-text="mainData.label('fSTARTTIME')" class="x-label" style="width:100px;" xid="label3"></label>
        <div class="x-edit" xid="div4">
         <input bind-ref="mainData.ref('fSTARTTIME')" class="form-control" component="$UI/system/components/justep/input/input" xid="input3"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit8">
        <label bind-text="mainData.label('fENDTIME')" class="x-label" style="width:100px;" xid="label7"></label>
        <div class="x-edit" xid="div6">
         <input bind-ref="mainData.ref('fENDTIME')" class="form-control" component="$UI/system/components/justep/input/input" xid="input4"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col15">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit7">
        <label bind-text="mainData.label('fDAYS')" class="x-label" style="width:100px;" xid="label5"></label>
        <div class="x-edit" xid="div8">
         <input bind-ref="mainData.ref('fDAYS')" class="form-control" component="$UI/system/components/justep/input/input" xid="input5"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5">
        <label bind-text="mainData.label('fPERSONNEL')" class="x-label" style="width:100px;" xid="label8"></label>
        <div class="x-edit" xid="div7">
         <input bind-ref="mainData.ref('fPERSONNEL')" class="form-control" component="$UI/system/components/justep/input/input" xid="input9"></input>
         </div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit6">
        <label bind-text="mainData.label('fPLACE')" class="x-label" style="width:100px;" xid="label6"></label>
        <div class="x-edit" xid="div5">
         <input bind-ref="mainData.ref('fPLACE')" class="form-control" component="$UI/system/components/justep/input/input" xid="input10"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col27">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit22">
        <label bind-text="mainData.label('fMODENAME')" class="x-label" style="width:100px;" xid="label19"></label>
        <div class="x-edit" xid="div18">
         <input bind-ref="mainData.ref('fMODENAME')" class="form-control" component="$UI/system/components/justep/input/input" xid="input11"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col29">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit21">
        <label bind-text="mainData.label('fNUMBER')" class="x-label" style="width:100px;" xid="label17"></label>
        <div class="x-edit" xid="div22">
         <input bind-ref="mainData.ref('fNUMBER')" class="form-control" component="$UI/system/components/justep/input/input" xid="input12"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit17">
        <label bind-text="mainData.label('fREASON')" class="x-label" style="width:100px;" xid="label20"></label>
        <div class="x-edit" xid="div19">
         <textarea bind-ref="mainData.ref('fREASON')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="textarea1"></textarea></div> </div> </div> 
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col30">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit18">
        <label bind-text="mainData.label('fRemark')" class="x-label" style="width:100px;" xid="label18"></label>
        <div class="x-edit" xid="div17">
         <textarea bind-ref="mainData.ref('fRemark')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="textarea2"></textarea></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit25">
        <label bind-text="mainData.label('fCreatePerName')" class="x-label" style="width:100px;" xid="label21"></label>
        <div class="x-edit" xid="div26">
         <input bind-ref="mainData.ref('fCreatePerName')" class="form-control" component="$UI/system/components/justep/input/input" xid="input8"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col32">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit23">
        <label bind-text="mainData.label('fCreateTime')" class="x-label" style="width:100px;" xid="label24"></label>
        <div class="x-edit" xid="div25">
         <input bind-ref="mainData.ref('fCreateTime')" class="form-control" component="$UI/system/components/justep/input/input" xid="input7"></input></div> </div> </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col34">
       <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit24">
        <label bind-text="mainData.label('fBizStateName')" class="x-label" style="width:100px;" xid="label22"></label>
        <div class="x-edit" xid="div23">
         <input bind-ref="mainData.ref('fBizStateName')" class="form-control" component="$UI/system/components/justep/input/input" xid="input6"></input></div> </div> </div> <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col511_3">
<div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit111_3">
<label class="x-label" style="width:100px;" xid="label411_3">

出差确认</label>
<div class="x-edit" xid="div511_3" />
</div>
</div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col411_3">
<div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput111_3">
<label bind-text="mainData.label('fFACTSTARTTIME')" class="x-label" style="width:100px;" xid="label311_3" />
<div class="x-edit" xid="div411_3">
<input bind-ref="mainData.ref('fFACTSTARTTIME')" class="form-control" component="$UI/system/components/justep/input/input" xid="input211_3" />
</div>
</div>
</div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col711_3">
<div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput211_3">
<label bind-text="mainData.label('fFACTENDTIME')" class="x-label" style="width:100px;" xid="label511_3" />
<div class="x-edit" xid="div311_3">
<input bind-ref="mainData.ref('fFACTENDTIME')" class="form-control" component="$UI/system/components/justep/input/input" xid="input111_3" />
</div>
</div>
</div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col611_3">
<div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput311_3">
<label bind-text="mainData.label('fFACTDAYS')" class="x-label" style="width:100px;" xid="label111_3" />
<div class="x-edit" xid="div211_3">
<input bind-ref="mainData.ref('fFACTDAYS')" class="form-control" component="$UI/system/components/justep/input/input" xid="input411_3" />
</div>
</div>
</div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col811_3">
<div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput411_3">
<label bind-text="mainData.label('fCANCELHOLSDEPTNAME')" class="x-label" style="width:100px;" xid="label211_3" />
<div class="x-edit" xid="div111_3">
<input bind-ref="mainData.ref('fCANCELHOLSDEPTNAME')" class="form-control" component="$UI/system/components/justep/input/input" xid="input311_3" />
</div>
</div>
</div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col911_3">
<div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput611_3">
<label bind-text="mainData.label('fCANCELHOLSPERSONNAME')" class="x-label" style="width:100px;" xid="label711_3" />
<div class="x-edit" xid="div811_3">
<input bind-ref="mainData.ref('fCANCELHOLSPERSONNAME')" class="form-control" component="$UI/system/components/justep/input/input" xid="input511_3" />
</div>
</div>
</div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1111_3">
<div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput711_3">
<label bind-text="mainData.label('fCANCELHOLSDATE')" class="x-label" style="width:100px;" xid="label811_3" />
<div class="x-edit" xid="div711_3">
<input bind-ref="mainData.ref('fCANCELHOLSDATE')" class="form-control" component="$UI/system/components/justep/input/input" xid="input711_3" />
</div>
</div>
</div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1011_3">
<div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput511_3">
<label bind-text="mainData.label('fBrefExplain')" class="x-label" style="width:100px;" xid="label611_3" />
<div class="x-edit" xid="div611_3">
<textarea bind-ref="mainData.ref('fBrefExplain')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="textarea11_3" />
</div>
</div>
</div></div> </div> </div> </div></div>