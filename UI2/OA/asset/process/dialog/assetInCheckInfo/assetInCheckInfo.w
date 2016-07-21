<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:149px;top:15px;"><div component="$UI/system/components/justep/data/bizData" xid="mainData" concept="OA_AS_CheckM"><reader xid="default1" action="/OA/asset/logic/action/queryASCheckMAction"></reader></div>
  <div component="$UI/system/components/justep/data/bizData" xid="subData" concept="OA_AS_CheckD"><reader xid="default2" action="/OA/asset/logic/action/queryASCheckDAction"></reader></div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/>
<div xid="div10">
   <h5 xid="h51" style="line-height:36px;">基本信息</h5>
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
      <label class="x-label" xid="label1" bind-text="mainData.label('fDate')" style="width:100px;"></label>
      <div class="x-edit" xid="div1">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output1" bind-ref="mainData.ref('fDate')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
      <label class="x-label" xid="label2" bind-text="mainData.label('fNO')" style="width:100px;"></label>
      <div class="x-edit" xid="div2">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output2" bind-ref="mainData.ref('fNO')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput3">
      <label class="x-label" xid="label5" bind-text="mainData.label('fCheckDepts')" style="width:100px;"></label>
      <div class="x-edit" xid="div6">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output3" bind-ref="mainData.ref('fCheckDepts')"></div></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput2">
      <label class="x-label" xid="label10" bind-text="mainData.label('fCheckPsns')" style="width:100px;"></label>
      <div class="x-edit" xid="div7">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output4" style="height:60px;" bind-ref="mainData.ref('fCheckPsns')"></div></div> </div> </div><div class="col col-xs-12" xid="col3">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput1">
     <label class="x-label" xid="label3" bind-text="mainData.label('fRemark')" style="width:100px;"></label>
     <div class="x-edit" xid="div3">
      <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output5" style="height:60px;" bind-ref="mainData.ref('fRemark')"></div></div> </div> </div></div> 
   </div>
  <div xid="div11">
   <h5 xid="h52" style="line-height:36px;"><![CDATA[验收项]]></h5>
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="subData" showRowNumber="true" style="width:120%;">
     <columns xid="columns1">
      <column name="fCheckItem" xid="column2"></column>
      <column name="fCheckPsn" xid="column1"></column>
      <column name="fDescription" xid="column3"></column>
      <column name="fRemark" xid="column4"></column>
      </columns> </div></div></div>