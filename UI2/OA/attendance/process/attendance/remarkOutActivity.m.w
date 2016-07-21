<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:407px;left:83px;height:auto;" onParamsReceive="modelParamsReceive" onModelConstruct="modelModelConstructDone" onLoad="modelLoad"><div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="checkInOutDataDOut" concept="OA_ChekInOut" autoNew="false">
   <creator xid="default4" action="/OA/attendance/logic/action/createOA_ChekInOutAction"></creator>
   <reader xid="default5" action="/OA/attendance/logic/action/queryOA_ChekInOutAction"></reader>
   <writer xid="default6" action="/OA/attendance/logic/action/saveOA_ChekInOutAction"></writer></div></div> 
<div xid="waitDiv" style="position:relative;height:200px;">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button2" style="position:absolute;font-size:30px;top:42%;left:42%;" icon="icon-loading-a">
    <i xid="i4" class="icon-loading-a"></i>
    <span xid="span6"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1" style="display:none;">
   <div class="x-panel-content" xid="content1">
    <div xid="InfomaD">
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
      <div class="x-col x-col-fixed x-col-center" xid="col1" style="width:auto;font-weight:bold;">
       <span xid="span3">打卡时间：</span></div> 
      <div class="x-col x-col-center" xid="col2">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="checkTimeD" bind-ref='$model.checkInOutDataDOut.ref("fCheckOutPM")'></div></div> </div> 
     <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" bind-if="!$model.params.data.wifi">
      <div class="x-col x-col-fixed x-col-center" xid="col4" style="width:auto;font-weight:bold;">
       <span xid="span5">打卡地点：</span></div> 
      <div class="x-col x-col-center" xid="col5">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="checkAddressD" bind-ref='$model.checkInOutDataDOut.ref("fCheckAreaPM")'></div></div> </div> 
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row3" bind-if="$model.params.data.wifi">
   <div class="x-col x-col-fixed x-col-center" xid="col3" style="width:auto;font-weight:bold;">
    <span xid="span4"><![CDATA[WIFI：]]></span></div> 
   <div class="x-col x-col-center" xid="col6">
    <div component="$UI/system/components/justep/output/output" class="x-output" xid="output1" bind-ref='$model.checkInOutDataDOut.ref("fCheckAreaPM")'></div></div> </div></div> 
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="remarkTextD" style="height:100px;" placeHolder="请填写打卡备注（选填）" bind-ref='$model.checkInOutDataDOut.ref("fIsLeavingRemark")'></textarea>
    <div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="fImgURLD" bind-ref='$model.checkInOutDataDOut.ref("fLeavingImg")' style="height:10%;width:80%;">
     <div class="x-attachment x-attachment-image" xid="div10">
      <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div11">
       <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image2"></img>
       <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a2"></a></div> 
      <div class="x-doc-process" xid="div12">
       <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar2"></div></div> 
      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div13">
       <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div14"></div></div> </div> </div> 
  </div> 
   <div class="x-panel-bottom" xid="bottom1">
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="false" xid="buttonGroup1">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-label" label="取消" xid="button1" onClick="{operation:'window.close'}" style="border-right:1px solid #ddd;">
      <i xid="i1"></i>
      <span xid="span1">取消</span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-label" label="确定" xid="commitBtn" onClick="commitBtnClick">
      <i xid="i2"></i>
      <span xid="span2">确定</span></a> </div> </div> </div></div>