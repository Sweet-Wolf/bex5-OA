<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:629px;top:286px;"><div component="$UI/system/components/justep/data/bizData" xid="dKnowledge" concept="OA_KM_Knowledge" limit="1"><reader xid="default1" action="/OA/knowledge/logic/action/queryKMKnowledgeAction"></reader>
  <writer xid="default2" action="/OA/knowledge/logic/action/saveKMKnowledgeAction"></writer>
  <creator xid="default3" action="/OA/knowledge/logic/action/createKMKnowledgeAction"></creator></div></div> 

  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive" style="left:203px;top:23px;"></span>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="attachmentImage" bind-ref="dKnowledge.ref('fSmallPic')">
   <div class="x-attachment x-attachment-image" xid="div2">
    <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div3">
     <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image1"></img>
     <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a1"></a></div> 
    <div class="x-doc-process" xid="div4">
     <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div5"></div></div> 
    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div6">
     <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div7"></div></div> </div> </div></div>
   <div class="x-panel-bottom" xid="bottom2">
   <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取    消" style="margin-left:30px;width:80px;" xid="cancelBtn" onClick="{operation:'windowReceiver.windowCancel'}">
    <i xid="i41"></i>
    <span xid="span41">取 消</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="OKBtn" onClick="OKBtnClick">
    <i xid="i5"></i>
    <span xid="span5">确定</span></a> </div></div></div>