<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:487px;top:11px;" onLoad="modelLoad">
   
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="mainData" concept="OA_AS_BuyApplyM"><reader xid="default8" action="/OA/asset/logic/action/queryASBuyApplyMAction"></reader>
  <writer xid="default9" action="/OA/asset/logic/action/saveASBuyApplyMAction"></writer>
  <creator xid="default10" action="/OA/asset/logic/action/createASBuyApplyMAction"></creator></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="detailData" concept="OA_AS_BuyApplyD"><reader xid="default11" action="/OA/asset/logic/action/queryASBuyApplyDetailAction"></reader>
  <writer xid="default12" action="/OA/asset/logic/action/saveASBuyApplyDAction"></writer>
  <creator xid="default13" action="/OA/asset/logic/action/createASBuyApplyDAction"></creator>
  <master xid="default1" data="mainData" relation="fMasterID"></master></div></div>
  <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button3" onClick='{"operation":"mainData.refresh"}' label="刷新">
    <i xid="i11"></i>
    <span xid="span9">刷新</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="chartBtnClick" xid="button1" label="流程图" icon="icon-android-image">
   <i xid="i1" class="icon-android-image"></i>
   <span xid="span1">流程图</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="processRecord" xid="button4" label="流程记录" icon="icon-android-note">
   <i xid="i2" class="icon-android-note"></i>
   <span xid="span2">流程记录</span></a></div><div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
   <div xid="div18">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4" style="float:right;">
     <label class="x-label" xid="label4" style="width:50px;">NO:</label>
     <div class="x-edit" xid="div19">
      <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output1" bind-ref="mainData.ref('fNO')"></div></div> </div> 
    <h5 xid="h51" style="line-height:36px;">基本信息</h5></div> 
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
      <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fApplyDeptName')"></label>
      <div class="x-edit" xid="div15">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output2" bind-ref="mainData.ref('fApplyDeptName')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
      <label class="x-label" xid="label2" style="width:100px;" bind-text="mainData.label('fApplyPsnName')"></label>
      <div class="x-edit" xid="div16">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output4" bind-ref="mainData.ref('fApplyPsnName')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
      <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fApplyDate')"></label>
      <div class="x-edit" xid="div17">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output5" bind-ref="mainData.ref('fApplyDate')"></div></div> </div> </div> 
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
    <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fAmount')"></label>
    <div class="x-edit" xid="div21">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output6" bind-ref="mainData.ref('fAmount')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
    <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fBizStateName')"></label>
    <div class="x-edit" xid="div20">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output8" bind-ref="mainData.ref('fBizStateName')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit10">
    <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fUpdatePsnName')"></label>
    <div class="x-edit" xid="div25">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output10" bind-ref="mainData.ref('fUpdatePsnName')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
    <label class="x-label" xid="label9" style="width:100px;" bind-text="mainData.label('fUpdateTime')"></label>
    <div class="x-edit" xid="div24">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output9" bind-ref="mainData.ref('fUpdateTime')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput4">
    <label class="x-label" xid="label12" style="width:100px;" bind-text="mainData.label('fApplyReason')"></label>
    <div class="x-edit" xid="div28">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output13" bind-ref="mainData.ref('fApplyReason')" style="height:60px;"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput3">
    <label class="x-label" xid="label13" style="width:100px;" bind-text="mainData.label('fRemark')"></label>
    <div class="x-edit" xid="div26">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output12" bind-ref="mainData.ref('fRemark')" style="height:60px;"></div></div> </div> </div></div> 
   <div xid="div30">
    <h5 xid="h52" style="line-height:36px;">采购列表</h5>
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter" xid="listBar">
     </div> 
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="detailData" showRowNumber="true">
     <columns xid="columns1">
      <column name="fKind" xid="column3"></column>
      <column name="fName" xid="column11"></column>
      <column name="fSpecType" xid="column4"></column>
      <column name="fUnit" xid="column5"></column>
      <column name="fBuyNum" xid="column7"></column>
      <column name="fPrice" xid="column8"></column>
      <column name="fAmount" xid="column9"></column>
      <column name="fInNum" xid="column6"></column>
      <column name="fRemark" xid="column10"></column></columns> </div> 
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="detailPagerBar" data="detailData">
     <div class="row" xid="div3">
      <div class="col-sm-3" xid="div9">
       <div class="x-pagerbar-length" xid="div10">
        <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect2">
         <span xid="span22">显示</span>
         <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select2">
          <option value="10" xid="default16">10</option>
          <option value="20" xid="default17">20</option>
          <option value="50" xid="default18">50</option>
          <option value="100" xid="default19">100</option></select> 
         <span xid="span23">条</span></label> </div> </div> 
      <div class="col-sm-3" xid="div11">
       <div class="x-pagerbar-info" xid="div12">当前显示0条，共0条</div></div> 
      <div class="col-sm-6" xid="div13">
       <div class="x-pagerbar-pagination" xid="div14">
        <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination2">
         <li class="prev" xid="li3">
          <a href="#" xid="a2">
           <span aria-hidden="true" xid="span24">«</span>
           <span class="sr-only" xid="span25">Previous</span></a> </li> 
         <li class="next" xid="li4">
          <a href="#" xid="a4">
           <span aria-hidden="true" xid="span26">»</span>
           <span class="sr-only" xid="span27">Next</span></a> </li> </ul> </div> </div> </div> </div> </div> </div>
  <div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div></div>