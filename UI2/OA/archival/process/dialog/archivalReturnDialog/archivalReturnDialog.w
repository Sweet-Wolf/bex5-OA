<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:554px;top:285px;"><div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_AM_History" columns="" limit="20" onAfterSave="mainDataAfterSave" confirmRefresh="false">
   <reader action="/OA/archival/logic/action/queryAMHistoryWithArchivalAction" xid="default1"></reader>
   <writer action="/OA/archival/logic/action/saveAMHistoryAction" xid="default2"></writer>
   <creator action="/OA/archival/logic/action/createAMHistoryAction" xid="default3"></creator>
   <calculateRelation relation="calcCheckBox" xid="calculateRelation1"></calculateRelation></div></div> 

  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   
   <div class="x-panel-content container-fluid" xid="content1">
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit6">
    <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fReturnPsnName')"></label>
    <div class="x-edit" xid="div6">
     <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="mainData.ref('fReturnPsnName')"></input></div> </div> </div>
  <div xid="col6" class="col col-xs-12 col-sm-6 col-md-6 col-lg-4">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
    <label class="x-label" xid="label5" style="width:100px;" bind-text="mainData.label('fReturnTime')"></label>
    <div class="x-edit" xid="div5">
     <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="mainData.ref('fReturnTime')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
    <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fBorrowPsnName')"></label>
    <div class="x-edit" xid="div4">
     <input xid="fEffect" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fBorrowPsnName')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit9">
    <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fBorrowTime')"></label>
    <div class="x-edit" xid="div9">
     <input xid="fBizStateName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fBorrowTime')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit8">
    <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fBorrowKind')"></label>
    <div class="x-edit" xid="div8">
     <input xid="fCreateDeptName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fBorrowKind')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit7">
    <label class="x-label" xid="label9" style="width:100px;" bind-text="mainData.label('fCrosserName')"></label>
    <div class="x-edit" xid="div7">
     <input xid="fCreatePsnName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fCrosserName')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit10">
    <label class="x-label" xid="label10" style="width:100px;" bind-text="mainData.label('fRemark')"></label>
    <div class="x-edit" xid="div10">
     <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="mainData.ref('fRemark')" style="height:100px;"></textarea></div> </div> </div></div></div> 
   <div class="x-panel-bottom" xid="bottom1" height="42">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button" label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'>
     <i xid="i2"></i>
     <span xid="span2">取消</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="OKBtn" onClick="OKBtnClick">
     <i xid="i1"></i>
     <span xid="span1">确定</span></a> </div> </div></div>