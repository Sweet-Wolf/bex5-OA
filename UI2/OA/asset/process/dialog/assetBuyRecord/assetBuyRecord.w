<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:283px;top:388px;"><div component="$UI/system/components/justep/data/bizData" xid="mainData" concept="OA_AS_BuyApplyM"><reader xid="default2" action="/OA/asset/logic/action/queryASBuyApplyMAction"></reader></div>
  <div component="$UI/system/components/justep/data/bizData" xid="subData" concept="OA_AS_BuyApplyD"><reader xid="default1" action="/OA/asset/logic/action/queryASBuyApplyDAction"></reader></div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/>
<div xid="mainDiv">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4" style="float:right;">
   <label class="x-label" xid="label4" style="width:50px;"><![CDATA[NO:]]></label>
   <div class="x-edit" xid="div4"><div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output6" bind-ref="mainData.ref('fNO')"></div></div></div><h5 xid="h51" style="line-height:36px;"><![CDATA[申请信息]]>
  </h5>
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
      <label class="x-label" xid="label1" bind-text="mainData.label('fApplyDeptName')" style="width:100px;"></label>
      <div class="x-edit" xid="div1">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output1" bind-ref="mainData.ref('fApplyDeptName')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
      <label class="x-label" xid="label2" bind-text="mainData.label('fApplyPsnName')" style="width:100px;"></label>
      <div class="x-edit" xid="div2">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output2" bind-ref="mainData.ref('fApplyPsnName')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
      <label class="x-label" xid="label3" bind-text="mainData.label('fApplyDate')" style="width:100px;"></label>
      <div class="x-edit" xid="div3">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output3" bind-ref="mainData.ref('fApplyDate')"></div></div> </div> </div> <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput3">
      <label class="x-label" xid="label5" bind-text="mainData.label('fApplyReason')" style="width:100px;"></label>
      <div class="x-edit" xid="div6">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output4" bind-ref="mainData.ref('fApplyReason')" style="height:60px;"></div></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput2">
      <label class="x-label" xid="label10" bind-text="mainData.label('fRemark')" style="width:100px;"></label>
      <div class="x-edit" xid="div7">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output5" bind-ref="mainData.ref('fRemark')" style="height:60px;"></div></div> </div> </div></div> 
   </div>
  <div xid="subDiv">
   <h5 xid="h52" style="line-height:36px;">资产明细</h5>
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="subData" showRowNumber="true" style="width:120%;">
    <columns xid="columns1">
     <column name="fKind" xid="column1"></column>
  <column name="fName" xid="column9"></column><column name="fSpecType" xid="column2"></column>
  <column name="fUnit" xid="column3"></column>
  
  <column name="fBuyNum" xid="column5"></column>
  <column name="fPrice" xid="column6"></column>
  <column name="fAmount" xid="column7"></column>
  <column name="fInNum" xid="column4"></column><column name="fRemark" xid="column8"></column>
  </columns> </div> </div>
  <div xid="amountDiv"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput1" style="float:right;">
   <label class="x-label" xid="fAmountL" bind-text="mainData.label('fAmount')" style="width:100px;"></label>
   <div class="x-edit" xid="div5" style="width:100px;">
    <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fAmount" bind-ref="mainData.ref('fAmount')"></div></div> </div></div></div>