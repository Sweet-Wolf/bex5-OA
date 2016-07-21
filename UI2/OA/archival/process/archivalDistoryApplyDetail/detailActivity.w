<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad" style="height:auto;left:339px;top:9px;"><div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dDistoryApplyM" concept="OA_AM_DistoryApplyM" confirmRefresh="false"><reader xid="default1" action="/OA/archival/logic/action/queryAMDistoryApplyMAction"></reader></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dDistoryApplyD" concept="OA_AM_DistoryApplyD"><reader xid="default2" action="/OA/archival/logic/action/queryAMDistoryApplyDWithArchivalAction"></reader>
  <master xid="default3" data="dDistoryApplyM" relation="fDistoryID"></master></div></div> 
<div component="$UI/system/components/justep/process/process" xid="process" data="dDistoryApplyM" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog" showTitle="true" status="normal" title="档案信息"></span><div xid="view">
   <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="processBar">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="chartBtnClick" xid="button1" label="流程图" icon="icon-android-image">
      <i xid="i9" class="icon-android-image"></i>
      <span xid="span8">流程图</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="processBtn" xid="button2" label="流程记录" icon="icon-android-note">
      <i xid="i10" class="icon-android-note"></i>
      <span xid="span9">流程记录</span></a> </div> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
     <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit6">
       <label class="x-label" xid="label4" style="width:100px;" bind-text="dDistoryApplyM.label('fDescription')"></label>
       <div class="x-edit" xid="div6">
        <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dDistoryApplyM.ref('fDescription')"></textarea></div> </div> </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
       <label class="x-label" xid="label1" style="width:100px;" bind-text="dDistoryApplyM.label('fDistoryDate')"></label>
       <div class="x-edit" xid="div1">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="dDistoryApplyM.ref('fDistoryDate')" format="yyyy-MM-dd"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
       <label class="x-label" xid="label2" style="width:100px;" bind-text="dDistoryApplyM.label('fBizStateName')"></label>
       <div class="x-edit" xid="div2">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="dDistoryApplyM.ref('fBizStateName')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
       <label class="x-label" xid="label3" style="width:100px;" bind-text="dDistoryApplyM.label('fCreateDeptName')"></label>
       <div class="x-edit" xid="div3">
        <input xid="fBorrowTime" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dDistoryApplyM.ref('fCreateDeptName')"></input></div> </div> </div> 
      
     
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col5">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
       <label class="x-label" xid="label6" style="width:100px;" bind-text="dDistoryApplyM.label('fCreatePsnName')"></label>
       <div class="x-edit" xid="div4">
        <input xid="fEffect" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dDistoryApplyM.ref('fCreatePsnName')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit9">
       <label class="x-label" xid="label7" style="width:100px;" bind-text="dDistoryApplyM.label('fCreateTime')"></label>
       <div class="x-edit" xid="div9">
        <input xid="fBizStateName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dDistoryApplyM.ref('fCreateTime')"></input></div> </div> </div> 
     
     
     </div> </div> 
   <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="借阅明细" collapsible="true" xid="detailCG">
    <div class="x-control-group-title" xid="controlGroupTitle1">
     <span xid="span7">借阅明细</span></div> 
    <div xid="div11">
     <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="dDistoryApplyD" onCellRender="dataTables1CellRender" onRowClick="dataTables1RowClick" showRowNumber="true">
      <columns xid="columns1">
       <column name="fTitle" xid="column3"></column><column name="fArchivalNO" xid="column2"></column><column name="fDistoryReason" xid="column1"></column>
  
  
  <column name="fCarry" xid="column6"></column><column name="fFileDeptName" xid="column4"></column>
  <column name="fResponsibleName" xid="column5"></column>
  </columns> </div> </div> </div> </div>
  
  </div>