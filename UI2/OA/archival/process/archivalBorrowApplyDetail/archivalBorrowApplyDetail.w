<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:248px;top:1px;" onLoad="modelLoad"><div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" autoNew="false" concept="OA_AM_BorrowApplyM" orderBy="" columns="" isTree="false" confirmRefresh="false">
   <reader action="/OA/archival/logic/action/queryAMBorrowApplyMAction" xid="default1"></reader>
   <writer action="/OA/archival/logic/action/saveAMBorrowApplyMAction" xid="default2"></writer>
   <creator action="/OA/archival/logic/action/createAMBorrowApplyMAction" xid="default7"></creator>
   <rule xid="rule1">
   <col name="fCreatePsnName" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default3">true</expr></readonly> </col> 
   <col name="fCreateTime" xid="ruleCol2">
    <readonly xid="readonly2">
     <expr xid="default4">true</expr></readonly> </col> 
   <col name="fCreateDeptName" xid="ruleCol3">
    <readonly xid="readonly3">
     <expr xid="default5">true</expr></readonly> </col> 
   <col name="fReason" xid="ruleCol4">
    <required xid="required1">
     <expr xid="default6">true</expr></required> </col> 
   <readonly xid="readonly4">
    <expr xid="default11">true</expr></readonly> </rule>
  <master xid="default12"></master></div>
  <div component="$UI/system/components/justep/data/bizData" xid="detailData" directDelete="true" autoLoad="true" autoNew="false" concept="OA_AM_BorrowApplyD" orderBy="" columns="" isTree="false">
   <reader action="/OA/archival/logic/action/queryAMBorrowApplyDWithArchivalAction" xid="default8"></reader>
   <writer action="/OA/archival/logic/action/saveAMBorrowApplyDAction" xid="default9"></writer>
   <creator action="/OA/archival/logic/action/createAMBorrowApplyDAction" xid="default10"></creator>
   <master xid="default1" relation="fBorrowID" data="mainData"></master></div></div> 
<div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog" showTitle="true" status="normal" title="档案信息"></span><div xid="view">
   <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="processBar">
     
     
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="chartBtnClick" xid="button1" label="流程图" icon="icon-android-image">
      <i xid="i9" class="icon-android-image"></i>
      <span xid="span8">流程图</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="processBtn" xid="button2" label="流程记录" icon="icon-android-note">
      <i xid="i10" class="icon-android-note"></i>
      <span xid="span9">流程记录</span></a> 
     </div> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
     <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11">
   <h5 xid="h52" style="padding-top:10px;padding-bottom:10px;">基本信息</h5></div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
       <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fBorrowDeptName')"></label>
       <div class="x-edit" xid="div1">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="mainData.ref('fBorrowDeptName')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
       <label class="x-label" xid="label2" style="width:100px;" bind-text="mainData.label('fBorrowPsnName')"></label>
       <div class="x-edit" xid="div2">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="mainData.ref('fBorrowPsnName')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
       <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fBorrowTime')"></label>
       <div class="x-edit" xid="div3">
        <input xid="fBorrowTime" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fBorrowTime')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit6">
       <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fReason')"></label>
       <div class="x-edit" xid="div6">
        <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="mainData.ref('fReason')"></textarea></div> </div> </div> 
     <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
       <label class="x-label" xid="label5" style="width:100px;" bind-text="mainData.label('fDescription')"></label>
       <div class="x-edit" xid="div5">
        <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea2" bind-ref="mainData.ref('fDescription')"></textarea></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col5">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
       <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fEffect')"></label>
       <div class="x-edit" xid="div4">
        <input xid="fEffect" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fEffect')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit9">
       <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fBizStateName')"></label>
       <div class="x-edit" xid="div9">
        <input xid="fBizStateName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fBizStateName')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit8">
       <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fCreateDeptName')"></label>
       <div class="x-edit" xid="div8">
        <input xid="fCreateDeptName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fCreateDeptName')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit7">
       <label class="x-label" xid="label9" style="width:100px;" bind-text="mainData.label('fCreatePsnName')"></label>
       <div class="x-edit" xid="div7">
        <input xid="fCreatePsnName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fCreatePsnName')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit10">
       <label class="x-label" xid="label10" style="width:100px;" bind-text="mainData.label('fCreateTime')"></label>
       <div class="x-edit" xid="div10">
        <input xid="fCreateTime" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fCreateTime')"></input></div> </div> </div> 
  </div> <div xid="div11">
     
     <h5 xid="h51" style="padding-top:10px;padding-bottom:10px;">借阅明细</h5><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="detailData" onCellRender="dataTables1CellRender" onRowClick="dataTables1RowClick" showRowNumber="true">
      <columns xid="columns1">
       <column name="fTitle" xid="column10"></column>
       <column name="fArchivalNO" xid="column8"></column>
       <column name="fCarry" xid="column13"></column>
       <column name="fBorrowKind" xid="column4"></column>
       <column name="fCloseTime" xid="column7"></column>
       <column name="fAMYear" xid="column9"></column>
       <column name="fFileDeptName" xid="column11"></column>
       <column name="fResponsibleName" xid="column12"></column></columns> </div> 
  </div></div> 
   </div></div>