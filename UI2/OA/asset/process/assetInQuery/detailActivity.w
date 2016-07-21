<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:354px;top:11px;" onLoad="modelLoad"><div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_AS_InM" columns="" autoNew="false" onSaveCommit="DataSaveCommit">
   <reader action="/OA/asset/logic/action/queryASInMAction" xid="default1"></reader>
   <writer action="/OA/asset/logic/action/saveASInMAction" xid="default2"></writer>
   <creator action="/OA/asset/logic/action/createASInMAction" xid="default3"></creator></div>
  <div component="$UI/system/components/justep/data/bizData" xid="detailData" directDelete="true" autoLoad="true" concept="OA_AS_InD" columns="" autoNew="false">
   <reader action="/OA/asset/logic/action/queryASInDetailAction" xid="default4"></reader>
   <writer action="/OA/asset/logic/action/saveASInDAction" xid="default5"></writer>
   <creator action="/OA/asset/logic/action/createASInDAction" xid="default6"></creator>
   <master data="mainData" relation="fMasterID" xid="default7"></master></div></div> 
<div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button3" onClick='{"operation":"mainData.refresh"}' label="刷新">
    <i xid="i11"></i>
    <span xid="span9">刷新</span></a> 
   
   </div>
  <div xid="div17">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput1" style="float:right;">
    <label class="x-label" xid="fNOL" style="text-align:right;width:50px;">NO:</label>
    <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output1" bind-ref="mainData.ref('fNO')"></div></div> 
   <h5 xid="h51" style="line-height:36px;padding-left:15px;">基本信息</h5></div>
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form">
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
      <label class="x-label" xid="label1" bind-text="mainData.label('fDutyDeptName')" style="width:100px;"></label>
      <div class="x-edit" xid="div3">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output2" bind-ref="mainData.ref('fDutyDeptName')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
      <label class="x-label" xid="label2" bind-text="mainData.label('fDutyPsnName')" style="width:100px;"></label>
      <div class="x-edit" xid="div9">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output3" bind-ref="mainData.ref('fDutyPsnName')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
      <label class="x-label" xid="label3" bind-text="mainData.label('fDate')" style="width:100px;"></label>
      <div class="x-edit" xid="div10">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output4" bind-ref="mainData.ref('fDate')"></div></div> </div> </div> 
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
    <label class="x-label" xid="label4" bind-text="mainData.label('fMode')" style="width:100px;"></label>
    <div class="x-edit" xid="div12">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output7" bind-ref="mainData.ref('fMode')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
    <label class="x-label" xid="label5" bind-text="mainData.label('fAmount')" style="width:100px;"></label>
    <div class="x-edit" xid="div11">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output6" bind-ref="mainData.ref('fAmount')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
    <label class="x-label" xid="label6" bind-text="mainData.label('fStateName')" style="width:100px;"></label>
    <div class="x-edit" xid="div13">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output5" bind-ref="mainData.ref('fStateName')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col8">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput4">
    <label class="x-label" xid="label9" bind-text="mainData.label('fRemark')" style="width:100px;"></label>
    <div class="x-edit" xid="div15">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output8" bind-ref="mainData.ref('fRemark')"></div></div> </div> </div></div> 
   </div>
  <div xid="div18">
   <h5 xid="h52" style="line-height:36px;padding-left:15px;">资产明细</h5></div>
  <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
   <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="detailData" showRowNumber="true" onCellRender="dataTables1CellRender" onRowClick="dataTables1RowClick">
    <columns xid="columns2">
     <column name="fCode" xid="column15"></column>
     <column name="fKind" xid="column18"></column>
     <column name="fName" xid="column17"></column>
     <column name="fSpecType" xid="column20"></column>
     <column name="fUnit" xid="column19"></column>
     <column name="fAmount" xid="column24"></column>
     <column name="fDate" xid="column14"></column>
     <column name="fIsCheckName" xid="column21"></column>
     <column name="fIsInName" xid="column13"></column>
     <column name="fBuyApplyNO" xid="column1"></column>
     <column name="fCheckNO" xid="column2"></column>
     <column name="fRemark" xid="column16"></column></columns> </div> </div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgBuyRecord" title="采购信息" showTitle="true" style="left:405px;top:428px;" status="normal"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgCheck" title="验收信息" showTitle="true" style="left:474px;top:430px;" status="normal"></span>
  </div>