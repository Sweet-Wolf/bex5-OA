<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:249px;top:365px;"
    onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AS_Card" limit="15" columns=""> 
      <reader action="/OA/asset/logic/action/queryASMyAssetAction" xid="default1"/>  
      <writer action="/OA/asset/logic/action/saveASCardAction" xid="default2"/>  
      <creator action="/OA/asset/logic/action/createASCardAction" xid="default3"/>  
      <calculateRelation relation="calcCheckBox" xid="calculateRelation1"/>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgAssetInRecord"
    style="left:237px;top:10px;" title="入库信息" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgCheck"
    style="left:287px;top:10px;" title="验收信息" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgUseRecord"
    style="left:337px;top:10px;" title="使用记录" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgRepair"
    style="left:387px;top:10px;" title="维修记录" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgInventory"
    style="left:437px;top:10px;" title="清查记录" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgBuyRecord"
    style="left:487px;top:10px;" title="采购信息" status="normal" showTitle="true"/>  
  <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar"
    class="x-toolbar x-toolbar-spliter form-inline"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="button5" onClick="{&quot;operation&quot;:&quot;mainData.refresh&quot;}"> 
      <i xid="i8"/>  
      <span xid="span12"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="入库信息" xid="trgAssetInRecord" onClick="trgAssetInRecordClick" icon="icon-android-system-windows"> 
      <i xid="i1" class="icon-android-system-windows"/>  
      <span xid="span1">入库信息</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="采购信息" xid="trgBuyRecord" onClick="trgBuyRecordClick" icon="icon-android-system-windows"> 
      <i xid="i10" class="icon-android-system-windows"/>  
      <span xid="span16">采购信息</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="验收信息" xid="trgCheck" onClick="trgCheckClick" icon="icon-android-system-windows"> 
      <i xid="i2" class="icon-android-system-windows"/>  
      <span xid="span11">验收信息</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="使用记录" xid="trgUseRecord" onClick="trgUseRecordClick" icon="icon-android-system-windows"> 
      <i xid="i3" class="icon-android-system-windows"/>  
      <span xid="span13">使用记录</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="维修记录" xid="trgRepair" onClick="trgRepairClick" icon="icon-android-system-windows"> 
      <i xid="i7" class="icon-android-system-windows"/>  
      <span xid="span14">维修记录</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="清查记录" xid="trgInventory" onClick="trgInventoryClick" icon="icon-android-system-windows"> 
      <i xid="i9" class="icon-android-system-windows"/>  
      <span xid="span15">清查记录</span>
    </a> 
  </div>  
  <div class="container-fluid" xid="div1"> 
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form">
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
      <label class="x-label" xid="label1" bind-text="mainData.label('fKind')" style="width:100px;"></label>
      <div class="x-edit" xid="div8">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fKind" bind-ref="mainData.ref('fKind')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
      <label class="x-label" xid="label2" bind-text="mainData.label('fCode')" style="width:100px;"></label>
      <div class="x-edit" xid="div9">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fCode" bind-ref="mainData.ref('fCode')"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
      <label class="x-label" xid="label3" bind-text="mainData.label('fName')" style="width:100px;"></label>
      <div class="x-edit" xid="div10">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fName" bind-ref="mainData.ref('fName')"></div></div> </div> </div> 
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
    <label class="x-label" xid="label4" bind-text="mainData.label('fSpecType')" style="width:100px;"></label>
    <div class="x-edit" xid="div13">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fSpecType" bind-ref="mainData.ref('fSpecType')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
    <label class="x-label" xid="label5" bind-text="mainData.label('fUnit')" style="width:100px;"></label>
    <div class="x-edit" xid="div12">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fUnit" bind-ref="mainData.ref('fUnit')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
    <label class="x-label" xid="label6" bind-text="mainData.label('fStatusName')" style="width:100px;"></label>
    <div class="x-edit" xid="div11">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fStatusName" bind-ref="mainData.ref('fStatusName')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelSelect1">
    <label class="x-label" xid="label9" bind-text="mainData.label('fDutyDeptName')" style="width:100px;"></label>
    <div class="x-edit" xid="div14">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fDutyDeptName" bind-ref="mainData.ref('fDutyDeptName')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput1">
    <label class="x-label" xid="label8" bind-text="mainData.label('fDutyPsnName')" style="width:100px;"></label>
    <div class="x-edit" xid="div15">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fDutyPsnName" bind-ref="mainData.ref('fDutyPsnName')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput2">
    <label class="x-label" xid="label7" bind-text="mainData.label('fSourceName')" style="width:100px;"></label>
    <div class="x-edit" xid="div16">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fSourceName" bind-ref="mainData.ref('fSourceName')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput3">
    <label class="x-label" xid="label11" style="width:100px;">存放位置</label>
    <div class="x-edit" xid="div19">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fExtendStr" bind-ref="mainData.ref('fExtendStr3')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col29">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelSelect10">
    <label class="x-label" xid="label31" bind-text="mainData.label('fOriginValue')" style="width:100px;"></label>
    <div class="x-edit" xid="div33">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fOriginValue" bind-ref="mainData.ref('fOriginValue')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput8">
    <label class="x-label" xid="label32" bind-text="mainData.label('fAddDepreValue')" style="width:100px;"></label>
    <div class="x-edit" xid="div32">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fAddDepreValue" bind-ref="mainData.ref('fAddDepreValue')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col30">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput7">
    <label class="x-label" xid="label33" bind-text="mainData.label('fRemainValue')" style="width:100px;"></label>
    <div class="x-edit" xid="div37">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fRemainValue" bind-ref="mainData.ref('fRemainValue')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col26">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput9">
    <label class="x-label" xid="label28" bind-text="mainData.label('fServiceYear')" style="width:100px;"></label>
    <div class="x-edit" xid="div34">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fServiceYear" bind-ref="mainData.ref('fServiceYear')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelSelect7">
    <label class="x-label" xid="label27" bind-text="mainData.label('fBgDepreYear')" style="width:100px;"></label>
    <div class="x-edit" xid="div35">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fBgDepreYear" bind-ref="mainData.ref('fBgDepreYear')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col25">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelSelect8">
    <label class="x-label" xid="label26" bind-text="mainData.label('fBgDepreMonth')" style="width:100px;"></label>
    <div class="x-edit" xid="div36">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output16" bind-ref="mainData.ref('fBgDepreMonth')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col33">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit14">
    <label class="x-label" xid="label29" bind-text="mainData.label('fFactory')" style="width:100px;"></label>
    <div class="x-edit" xid="div40">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fFactory" bind-ref="mainData.ref('fFactory')"></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit13">
    <label class="x-label" xid="label30" bind-text="mainData.label('fFactoryDate')" style="width:100px;"></label>
    <div class="x-edit" xid="div39">
     <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fFactoryDate" bind-ref="mainData.ref('fFactoryDate')"></div></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col34">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit15">
      <label class="x-label" xid="label34" style="width:100px;" bind-text="mainData.label('fSupplier')"></label>
      <div class="x-edit" xid="div41">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fSupplier" bind-ref="mainData.ref('fSupplier')"></div></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col35">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit16">
      <label class="x-label" xid="label35" style="width:100px;" bind-text="mainData.label('fDetailInfo')"></label>
      <div class="x-edit" xid="div42">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fDetailInfo" bind-ref="mainData.ref('fDetailInfo')" style="height:70px;"></div></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col36">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit17">
      <label class="x-label" xid="label36" style="width:100px;" bind-text="mainData.label('fRemark')"></label>
      <div class="x-edit" xid="div43">
       <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="fRemark" bind-ref="mainData.ref('fRemark')" style="height:70px;"></div></div> </div> </div></div> 
   </div></div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/>
</div>
