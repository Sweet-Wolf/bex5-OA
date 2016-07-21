<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:587px;top:20px;" onModelConstructDone="modelModelConstructDone"> 
    
  <div autoLoad="true" autoNew="false" columns="" component="$UI/system/components/justep/data/bizData" concept="OA_WM_outApply" directDelete="true" orderBy="" xid="mainData" xui:update-mode="merge">
   <reader action="/OA/workTime/logic/action/queryOA_WM_outApplyAction" xid="default7"></reader>
   <writer action="/OA/workTime/logic/action/saveOA_WM_outApplyAction" xid="default17"></writer>
   <creator action="/OA/workTime/logic/action/createOA_WM_outApplyAction" xid="default18"></creator>
   <rule xid="rule1">
   <col name="fNO" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default1">true</expr></readonly> </col> 
   <col name="fCreatePerName" xid="ruleCol2">
    <readonly xid="readonly2">
     <expr xid="default2">true</expr></readonly> </col> 
   <col name="fCreateTime" xid="ruleCol3">
    <readonly xid="readonly3">
     <expr xid="default3">true</expr></readonly> </col> 
   <col name="fAPPLYPERSONNAME" xid="ruleCol4">
    <readonly xid="readonly4">
     <expr xid="default4">true</expr></readonly> </col> 
   <col name="fAPPLYPERSONID" xid="ruleCol5">
    <readonly xid="readonly5">
     <expr xid="default5">true</expr></readonly> </col> 
   <col name="fAPPLYDEPTID" xid="ruleCol6">
    <readonly xid="readonly6">
     <expr xid="default6">true</expr></readonly> </col> 
   <col name="fAPPLYDEPTNAME" xid="ruleCol7">
    <readonly xid="readonly7">
     <expr xid="default1">true</expr></readonly> </col> 
   <col name="fAPPLYDATE" xid="ruleCol8">
    <readonly xid="readonly8">
     <expr xid="default8">true</expr></readonly> </col> 
   <col name="fDAYS" xid="ruleCol9">
    <readonly xid="readonly9">
     <expr xid="default9">true</expr></readonly> </col> 
   <col name="fHOURS" xid="ruleCol10">
    <readonly xid="readonly10">
     <expr xid="default10">true</expr></readonly> </col> 
   <col name="fSTARTTIME" xid="ruleCol11">
    <readonly xid="readonly11">
     <expr xid="default11">true</expr></readonly> </col> 
   <col name="fENDTIME" xid="ruleCol12">
    <readonly xid="readonly12">
     <expr xid="default12">true</expr></readonly> </col> 
   <col name="fPERSONNEL" xid="ruleCol13">
    <readonly xid="readonly13">
     <expr xid="default13">true</expr></readonly> </col> 
   <col name="fNUMBER" xid="ruleCol14">
    <readonly xid="readonly14">
     <expr xid="default14">true</expr></readonly> </col> 
   <col name="fREASON" xid="ruleCol15">
    <readonly xid="readonly15">
     <expr xid="default1">true</expr></readonly> </col> 
   <col name="fRemark" xid="ruleCol16">
    <readonly xid="readonly16">
     <expr xid="default16">true</expr></readonly> </col> 
   <readonly xid="readonly17">
    <expr xid="default19">true</expr></readonly> </rule></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div><div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chartBtn" label="流程图" onClick="chartBtnClick">
    <i xid="i2"></i>
    <span xid="span2">流程图</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="processRecBtn" label="流程记录" onClick="processRecBtnClick">
    <i xid="i1"></i>
    <span xid="span1">流程记录</span></a> </div><div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="mainForm">
   <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col3">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1">
     <label class="x-label" style="width:90px;" title="基础信息" xid="fApplyDeptNamell">基础信息</label>
     <div class="x-edit" xid="div1"></div></div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit3">
     <label class="x-label" style="width:100px;" title="NO:" xid="label3">NO:</label>
     <div class="x-edit" xid="div3">
      <output bind-ref="mainData.ref('fNO')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="fNO"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit6">
     <label class="x-label" style="width:100px;" title="所属部门" xid="fLoanDeptNameL">所属部门</label>
     <div class="x-edit" xid="div6">
      <div bind-labelRef="mainData.ref('fAPPLYDEPTNAME')" bind-ref="mainData.ref('fAPPLYDEPTID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" includeOrgKind="ogn,dpt" xid="orgSelectPC4">
       <div autoLoad="true" component="$UI/system/components/justep/data/bizData" xid="dOrg"></div>
       <option label="sName" value="sCode" xid="option4">
        <columns xid="columns6">
         <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5">
     <label class="x-label" style="width:100px;" title="申请人" xid="fAPPLYPERSONNAMEL">申请人</label>
     <div class="x-edit" xid="div5">
      <div bind-labelRef="mainData.ref('fAPPLYPERSONNAME')" bind-ref="mainData.ref('fAPPLYPERSONID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" includeOrgKind="psm" xid="orgSelectPC3">
       <div autoLoad="true" component="$UI/system/components/justep/data/bizData" limit="-1" xid="dPsm">
        <treeOption rootFilter="1=1" xid="default15"></treeOption></div> 
       <option label="sName" value="sCode" xid="option5">
        <columns xid="columns5">
         <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit4">
     <label class="x-label" style="width:100px;" title="申请时间" xid="fAPPLYDATEL">申请时间</label>
     <div class="x-edit" xid="div4">
      <input bind-ref="mainData.ref('fAPPLYDATE')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd" xid="fAPPLYDATE"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit8">
     <label class="x-label" style="width:100px;" title="开始时间" xid="fFACTSTARTTIMEL">开始时间</label>
     <div class="x-edit" style="width:200px;" xid="div8">
      <input bind-ref="mainData.ref('fSTARTTIME')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd hh:mm" xid="fSTARTTIME"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit9">
     <label class="x-label" style="width:100px;" title="结束时间" xid="fFACTENDTIMEL">结束时间</label>
     <div class="x-edit" xid="div9">
      <input bind-ref="mainData.ref('fENDTIME')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd hh:mm" xid="fENDTIME"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col25">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit12">
     <label class="x-label" style="width:100px;" title="外出时长" xid="label11">外出时长</label>
     <div class="x-edit" xid="div12">
      <input bind-ref="mainData.ref('fDAYS')" class="form-control" component="$UI/system/components/justep/input/input" style="float:left;width:30%;" xid="fDAYS"></input>
      <label style="float:left;padding-left:10px;padding-right:10px;line-height:34px;" xid="label13">天</label>
      <input bind-ref="mainData.ref('fHOURS')" class="form-control" component="$UI/system/components/justep/input/input" style="width:30%;float:left;" xid="fHOURS"></input>
      <label style="float:left;padding-left:10px;padding-right:10px;line-height:34px;" xid="label14">小时</label></div> </div> </div> 
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col23">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput6">
     <label class="x-label" style="width:100px;" xid="fPERSONNEL" bind-text="mainData.label('fPERSONNEL')"></label>
     <div class="x-edit" xid="div23">
      <output bind-ref="mainData.ref('fPERSONNEL')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" style="float:left;" xid="fPERSONNE"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col8">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit2">
     <label class="x-label" style="width:100px;" xid="fNUMBERL" bind-text="mainData.label('fNUMBER')"></label>
     <div class="x-edit" xid="div14">
      <input bind-ref="mainData.ref('fNUMBER')" class="form-control" component="$UI/system/components/justep/input/input" style="width:80%;float:left;" xid="fNUMBER"></input>
      <label style="float:left;padding-left:10px;padding-right:10px;line-height:34px;" xid="label12">(人)</label></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit15">
     <label class="x-label" style="width:100px;" title="外出原因" xid="fREASONL">外出原因</label>
     <div class="x-edit" xid="div15">
      <textarea bind-ref="mainData.ref('fREASON')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="fREASON"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col38">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit21">
     <label class="x-label" style="width:100px;" title="备    注" xid="fRemarkL">备    注</label>
     <div class="x-edit" xid="div21">
      <textarea bind-ref="mainData.ref('fRemark')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="fRemark"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col1">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput1">
     <label class="x-label" style="width:100px;" title="制 单 人" xid="label1">制 单 人</label>
     <div class="x-edit" xid="div2">
      <output bind-ref="mainData.ref('fCreatePerName')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="outfCREATEPERNAME"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col2">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput2">
     <label class="x-label" style="width:100px;" title="制单日期" xid="label2">制单日期</label>
     <div class="x-edit" xid="div7">
      <output bind-ref="mainData.ref('fCreateTime')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" format="yyyy-MM-dd hh:mm" xid="outfCREATETIME"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col5">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput3">
     <label class="x-label" style="width:100px;" title="状 态" xid="label4">状 态</label>
     <div class="x-edit" xid="div10">
      <output bind-ref="mainData.ref('fBizStateName')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" format="yyyy-MM-dd hh:mm" xid="outfBizStateName"></output></div> </div> </div>
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col21">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit10">
     <label class="x-label" style="width:90px;" xid="label10">外出确认</label>
     <div class="x-edit" xid="div20"></div></div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col9">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput4">
     <label class="x-label" style="width:100px;" xid="label15" bind-text="mainData.label('fFACTSTARTTIME')"></label>
     <div class="x-edit" xid="div19">
      <input bind-ref="mainData.ref('fFACTSTARTTIME')" class="form-control" component="$UI/system/components/justep/input/input" data="mainData" xid="input1"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col20">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit11">
     <label class="x-label" style="width:100px;" xid="label16" bind-text="mainData.label('fFACTENDTIME')"></label>
     <div class="x-edit" xid="div16">
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="mainData.ref('fFACTENDTIME')"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col11">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit7">
     <label class="x-label" style="width:100px;" xid="label8">实际时长</label>
     <div class="x-edit" xid="div17">
      <input bind-ref="mainData.ref('fFACTDAYS')" class="form-control" component="$UI/system/components/justep/input/input" style="float:left;width:30%;" xid="input8"></input>
      <label style="float:left;padding-left:10px;padding-right:10px;line-height:34px;" xid="label20">天</label>
      <input bind-ref="mainData.ref('fFACTHOURS')" class="form-control" component="$UI/system/components/justep/input/input" style="width:30%;float:left;" xid="input9"></input>
      <label style="float:left;padding-left:10px;padding-right:10px;line-height:34px;" xid="label19">小时</label></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col19">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput1">
     <label class="x-label" style="width:100px;" xid="label17" bind-text="mainData.label('fCANCELHOLSDEPTNAME')"></label>
     <div class="x-edit" xid="div18">
      <input bind-ref="mainData.ref('fCANCELHOLSDEPTNAME')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd" xid="input2"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col13">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput3">
     <label class="x-label" style="width:100px;" xid="label18" bind-text="mainData.label('fCANCELHOLSPERSONNAME')"></label>
     <div class="x-edit" style="width:200px;" xid="div13">
      <input bind-ref="mainData.ref('fCANCELHOLSPERSONNAME')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd hh:mm" xid="input3"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col12">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput2">
     <label class="x-label" style="width:100px;" xid="label9" bind-text="mainData.label('fCANCELHOLSDATE')"></label>
     <div class="x-edit" xid="div11">
      <input bind-ref="mainData.ref('fCANCELHOLSDATE')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd hh:mm" xid="input1"></input></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col22">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput4">
     <label class="x-label" style="width:100px;" xid="label5" bind-text="mainData.label('fExplain')"></label>
     <div class="x-edit" xid="div22">
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="mainData.ref('fExplain')"></textarea></div> </div> </div> </div>
  </div></div>
