<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:319px;top:67px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dataMain" concept="OA_FC_ReimbApplyM"> 
      <reader xid="default1" action="/OA/finance/logic/action/queryFCReimbApplyMAction"/>  
      <writer xid="default2" action="/OA/finance/logic/action/saveFCReimbApplyMAction"/>  
      <creator xid="default3" action="/OA/finance/logic/action/createFCReimbApplyMAction"/> 
    </div> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="detail" concept="OA_FC_ReimbApplyD"><reader xid="default4" action="/OA/finance/logic/action/queryFCReimbApplyDAction"></reader>
  <writer xid="default5" action="/OA/finance/logic/action/saveFCReimbApplyDAction"></writer>
  <creator xid="default6" action="/OA/finance/logic/action/createFCReimbApplyDAction"></creator>
  <master xid="default7" data="dataMain" relation="fReimFID"></master></div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:72px;top:4px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="报销申请详细"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeBtn" onClick="closeBtnClick" icon="icon-chevron-left"> 
            <i xid="i4" class="icon-chevron-left"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">报销申请详细</div>  
        <div class="x-titlebar-right reverse" xid="div3" style="width:188px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="chartBtn" icon="icon-android-keypad" onClick="chartBtnClick"> 
            <i xid="i1" class="icon-android-keypad"/>  
            <span xid="span1"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="media"> 
        <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage" xid="orgImage3" orgKind="person" bind-ref="dataMain.ref('fLoanPsnID')"> 
            <div class="x-blob-bar" xid="div8"> 
              <i class="x-blob-edit icon-compose" xid="i9" />  
              <i class="x-blob-del icon-close-round" xid="i10" /> 
            </div>  
            <img class="x-blob-img media-object" xid="image3"/> 
          </div><div component="$UI/system/components/justep/output/output" class="media-heading oa-title-data"
          xid="outputName" bind-ref="dataMain.ref('fLoanPsnName')"/>  
        <div component="$UI/system/components/justep/output/output" xid="outputTime"
          bind-ref="dataMain.ref('fLoanDate')" format="yyyy-MM-dd hh:mm"/> 
      </div>  
      <div class="media-body"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fReiEventL" style="width:100px;"><![CDATA[报销事项]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output2" bind-ref="dataMain.ref('fReiEvent')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fReimAmtL" style="width:100px;"><![CDATA[报销金额]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output3" bind-ref="dataMain.ref('fReimAmt')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelOutput1">
   <label class="x-label left" xid="labelRemark" style="width:100px;"><![CDATA[报销明细]]></label>
   <div class="x-edit" xid="div4">
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fRemark" bind-ref='$model.dataMain.ref("fRemark")'></textarea></div> </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelOutput2">
   <label class="x-label left" xid="labelPicture" style="width:100px;"><![CDATA[图片]]></label>
   <div class="x-edit" xid="div5">
    <div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="attachmentImage1" bind-ref='$model.dataMain.ref("fExtendStr1")'>
   <div class="x-attachment x-attachment-image" xid="div7">
    <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div9">
     <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image1" style="width:20%;" height="20%"></img>
     <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a1"></a></div> 
    <div class="x-doc-process" xid="div10">
     <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar1"></div></div> 
    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div11">
     <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div12"></div></div> </div> </div></div> </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelOutput3">
   <label class="x-label left" xid="labelAccessory" style="width:100px;"><![CDATA[附件]]></label>
   <div class="x-edit" xid="div6">
    <div component="$UI/system/components/justep/attachment/attachmentSimple" actionUrl="/baas/justep/attachment/simpleFileStore" xid="attachmentSimple1" bind-ref='$model.dataMain.ref("fExtendStr2")'>
   <div class="x-attachment" xid="div13">
    <div class="x-attachment-content x-card-border" xid="div14">
     <div class="x-doc-process" xid="div15">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar2"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div16">
      <div class="x-attachment-cell" xid="div17">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div18">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a2"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'" xid="div19">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'" xid="div20"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div21">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')" xid="div22"></div></div> 
     <div style="clear:both;" xid="div23"></div></div> </div> </div></div> </div></div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dataMain" autoFilter="false" autoClose="false" autoStart="false" autoSave="false"/> 
</div>
