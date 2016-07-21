<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:21px;left:627px;height:auto;" onParamsReceive="modelParamsReceive" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="mainData" concept="OA_Sign" autoNew="false" onAfterSave="mainDataAfterSave" confirmRefresh="false"><creator xid="default1" action="/OA/sign/logic/action/createOA_SignAction"></creator>
  <reader xid="default2" action="/OA/sign/logic/action/queryOA_SignAction"></reader>
  <writer xid="default3" action="/OA/sign/logic/action/saveOA_SignAction"></writer>
  </div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar1" title="外勤签到">
   <div class="x-titlebar-left" xid="left1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="closeBtn" icon="icon-chevron-left" onClick="{operation:'window.close'}">
   <i xid="i1" class="icon-chevron-left"></i>
   <span xid="span1"></span></a></div>
   <div class="x-titlebar-title" xid="title1">外勤签到</div>
   <div class="x-titlebar-right reverse" xid="right1"></div></div></div>
   <div class="x-panel-content" xid="content3" style="background-color:#ddd;display:none;">
  <div xid="div2" style="margin-bottom:10px;padding:20px 20px 0px 20px;background-color:white;">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
    <label class="x-label" xid="fSignTimeL" bind-text='$model.mainData.label("fSignTime")' style="font-weight:bold;"></label>
    <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="fSignTime" bind-ref='$model.mainData.ref("fSignTime")'></div></div> 
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
    <label xid="fSignAddressL" bind-text='$model.mainData.label("fSignAddress")' style="font-weight:bold;" class="x-label"></label>
    <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="fSignAddress" bind-ref='$model.mainData.ref("fSignAddress")'></div></div> </div><div xid="div3" style="padding:20px;margin-bottom:10px;background-color:white;">
   <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit" xid="fRemark" bind-ref='$model.mainData.ref("fRemark")' placeHolder="请填写签到备注" style="margin-bottom:10px;"></textarea><div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="fImgURL" bind-ref='$model.mainData.ref("fImgURL")'>
      <div class="x-attachment x-attachment-image" xid="div10">
       <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div11">
        <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image2"></img>
        <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a2"></a></div> 
       <div class="x-doc-process" xid="div12">
        <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar2"></div></div> 
       <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div13">
        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div14"></div></div> </div> </div></div>
  <div xid="div15" style="padding:20px;background-color:white;">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit7">
    <label class="x-label" xid="fDeptNameL" bind-text='$model.mainData.label("fDeptName")' style="font-weight:bold;"></label>
    <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="fDeptName1" bind-ref='$model.mainData.ref("fDeptName")'></div></div> 
  <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1" style="padding:0 20px;margin-top:20px;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="提交" xid="subBtn" onClick="{operation:'mainData.save'}">
   
   <span xid="span2">提交</span></a></div></div>
  <div xid="div1" style="height:100%;background-color:white;"></div></div>
   </div>
  <div xid="waitDiv" style="position:relative;height:200px;">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button2" style="position:absolute;font-size:30px;top:42%;left:42%;" icon="icon-loading-a">
    <i xid="i5" class="icon-loading-a"></i>
    <span xid="span5"></span></a> </div></div>