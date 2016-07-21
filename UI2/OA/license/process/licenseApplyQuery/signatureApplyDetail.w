<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:431px;top:134px;" onModelConstructDone="modelModelConstructDone">
   <div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="false" autoNew="false" concept="OA_LS_LicenseApplyM" columns="">
    <reader action="/OA/license/logic/action/queryLSLicenseApplyMAction" xid="default2"></reader>
    <writer action="/OA/license/logic/action/saveLSLicenseApplyMAction" xid="default3"></writer>
    <creator action="/OA/license/logic/action/createLSLicenseApplyMAction" xid="default4"></creator></div> 
   <div component="$UI/system/components/justep/data/bizData" xid="detailData" directDelete="true" autoLoad="true" autoNew="false" concept="OA_LS_LicenseApplyD" limit="-1" columns="">
    <reader action="/OA/license/logic/action/queryLSLicenseApplyDAction" xid="default5"></reader>
    <writer action="/OA/license/logic/action/saveLSLicenseApplyDAction" xid="default6"></writer>
    <creator action="/OA/license/logic/action/createLSLicenseApplyDAction" xid="default7"></creator>
    <master xid="default1" data="mainData" relation="fApplyID"></master>
    <rule xid="rule4">
     <readonly xid="readonly3">
      <expr xid="default12">js:true</expr></readonly> </rule> </div> </div>
  <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
   <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="detailBar">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chart2Btn" onClick="showChart" label="流程图" icon="icon-image">
     <i xid="i9" class="icon-image"></i>
     <span xid="span9">流程图</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="preBtn" onClick="{operation:'mainData.prevRow'}">
     <i xid="i3"></i>
     <span xid="span3"></span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="nextBtn" onClick="{operation:'mainData.nextRow'}">
     <i xid="i5"></i>
     <span xid="span4"></span></a> </div> 
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit1">
      <label class="x-label" xid="label1" bind-text="mainData.label('fRetDate')" style="width:100px"></label>
      <div class="x-edit" xid="div5">
       <output component="$UI/system/components/justep/output/output" class="form-control" xid="fRetDate" bind-ref="mainData.ref('fRetDate')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit2">
      <label class="x-label" xid="label2" style="width:100px" bind-text="mainData.label('fRemark')"></label>
      <div class="x-edit" xid="div6">
       <output xid="fRemark" component="$UI/system/components/justep/output/output" class="form-control" bind-ref="mainData.ref('fRemark')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit3">
      <label class="x-label" xid="label3" style="width:100px" bind-text="mainData.label('fCreateDeptName')"></label>
      <div class="x-edit" xid="div7">
       <output component="$UI/system/components/justep/output/output" class="form-control" xid="fCreateDeptName" bind-ref="mainData.ref('fCreateDeptName')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit4">
      <label class="x-label" xid="label4" style="width:100px" bind-text="mainData.label('fCreatePsnName')"></label>
      <div class="x-edit" xid="div8">
       <output xid="fCreatePsnName" component="$UI/system/components/justep/output/output" class="form-control" bind-ref="mainData.ref('fCreatePsnName')"></output></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit5">
      <label class="x-label" xid="label5" style="width:100px" bind-text="mainData.label('fCreateTime')"></label>
      <div class="x-edit" xid="div13">
       <output component="$UI/system/components/justep/output/output" class="form-control" xid="fCreateTime" bind-ref="mainData.ref('fCreateTime')"></output></div> </div> </div> </div> 
   <div component="$UI/system/components/bootstrap/accordion/accordion" class="panel-group" xid="accordion2" tabbed="false">
    <div class="panel panel-default " component="$UI/system/components/bootstrap/panel/panel" xid="productPanel">
     <div class="panel-heading" xid="heading5">
      <h4 class="panel-title" xid="h45">
       <a href="javascript:void(0)" xid="a2">详细信息</a></h4> </div> 
     <div class="panel-collapse in" xid="div3">
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false" rowActiveClass="active" class="table table-hover hidder-xs" xid="detailTable" data="detailData" pagingType="simple" responsive="true">
       <columns xid="column">
        <column name="fSerialNumber" xid="fSerialNumber" label="编号"></column>
        <column name="fLicenseName" xid="fLicenseName" label="证照名称"></column>
        <column name="fLicenseNo" xid="fLicenseNo" label="证照号"></column>
        <column name="fCrossPer" xid="fCrossPer" label="经办人"></column>
        <column name="fRetDate" xid="fRetDate" label="归还日期"></column></columns> </div> </div> </div> </div> </div>
  <div component="$UI/system/components/justep/process/process" xid="process" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div></div>