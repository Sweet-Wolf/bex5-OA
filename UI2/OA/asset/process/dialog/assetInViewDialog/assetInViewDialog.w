<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:424px;top:235px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="OA_AS_InM"> 
      <reader xid="default1" action="/OA/asset/logic/action/queryASInMAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      concept="OA_AS_InD">
      <reader xid="default2" action="/OA/asset/logic/action/queryASInDAction"/>
    </div>
  </div>  
  <div xid="div10">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput1" style="float:right;">
   <label class="x-label" xid="fNOL" style="text-align:right;width:50px;">NO:</label>
   <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output1" bind-ref="mainData.ref('fNO')"></div></div><h5 xid="h51" style="line-height:36px;padding-left:15px;"><![CDATA[基本信息]]>
  </h5>
    </div>
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form">
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row4">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
      <label class="x-label" xid="label9" bind-text="mainData.label('fDutyDeptName')" style="width:100px;"></label>
      <div class="x-edit" xid="div8">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output2" bind-ref="mainData.ref('fDutyDeptName')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
      <label class="x-label" xid="label11" bind-text="mainData.label('fDutyPsnName')" style="width:100px;"></label>
      <div class="x-edit" xid="div9">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output3" bind-ref="mainData.ref('fDutyPsnName')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
      <label class="x-label" xid="label12" bind-text="mainData.label('fDate')" style="width:100px;"></label>
      <div class="x-edit" xid="div12">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output4" bind-ref="mainData.ref('fDate')"></div></div> </div> </div> <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
      <label class="x-label" xid="label4" bind-text="mainData.label('fMode')" style="width:100px;"></label>
      <div class="x-edit" xid="div12">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output7" bind-ref="mainData.ref('fMode')"></div></div> </div> </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
      <label class="x-label" xid="label8" bind-text="mainData.label('fAmount')" style="width:100px;"></label>
      <div class="x-edit" xid="div9">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output6" bind-ref="mainData.ref('fAmount')"></div></div> </div> </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
      <label class="x-label" xid="label4" bind-text="mainData.label('fStateName')" style="width:100px;"></label>
      <div class="x-edit" xid="div13">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output5" bind-ref="mainData.ref('fStateName')"></div></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput4">
      <label class="x-label" xid="label9" bind-text="mainData.label('fRemark')" style="width:100px;"></label>
      <div class="x-edit" xid="div15">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output8" bind-ref="mainData.ref('fRemark')"></div></div> </div> </div></div> 
   </div><div xid="div11">
    <h5 xid="h52" style="line-height:36px;padding-left:15px;"><![CDATA[资产明细]]></h5>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="detailData" showRowNumber="true" onCellRender="dataTables1CellRender" onRowClick="dataTables1RowClick"> 
        <columns xid="columns1">
          <column name="fKind" xid="column2" />
          <column name="fCode" xid="column1" />  
          <column name="fName" xid="column3" />  
          <column name="fSpecType" xid="column4" />  
          <column name="fUnit" xid="column5" />  
          <column name="fAmount" xid="column7" />  
          <column name="fDate" xid="column11" />
          <column name="fIsInName" xid="column10" />
          <column name="fIsCheckName" xid="column8" />  
          
        <column name="fBuyApplyNO" xid="column6"></column>
  <column name="fCheckNO" xid="column9"></column><column name="fRemark" xid="column13" /></columns>
      </div>
  
  </div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:404px;top:440px;" onReceive="wReceiverReceive"/> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgBuyRecord" title="采购信息" showTitle="true" style="left:438px;top:333px;" status="normal" width="70%" height="70%"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgCheck" title="验收信息" showTitle="true" style="left:491px;top:334px;" status="normal" width="70%" height="70%"></span></div>
