<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:378px;left:440px;" onLoad="modelLoad"> 
  <div autoLoad="false" component="$UI/system/components/justep/data/bizData" concept="OA_KM_Knowledge" directDelete="true" limit="1" xid="dKnowledge" autoNew="true" isTree="false" onSaveCreateParam="dKnowledgeSaveCreateParam" onSaveCommit="dKnowledgeSaveCommit" onBeforeSave="dKnowledgeBeforeSave" onAfterSave="dKnowledgeAfterSave" onDataChange="dKnowledgeDataChange" onValueChanged="dKnowledgeValueChanged" onBeforeNew="dKnowledgeBeforeNew">
   <reader action="/OA/knowledge/logic/action/queryKMKnowledgeAction" xid="default1"></reader>
   <writer action="/OA/knowledge/logic/action/saveKMKnowledgeAction1" xid="default2"></writer>
   <creator action="/OA/knowledge/logic/action/createKMKnowledgeAction" xid="default3"></creator>
   <rule xid="rule1">
   <readonly xid="readonly3">
    <expr xid="default16"></expr></readonly> 
   <col name="fTitle" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default12">true</expr>
     <message xid="default13">'标题不能为空'</message></required> </col> 
   <col name="fFolderID" xid="ruleCol2">
    <readonly xid="readonly1">
     <expr xid="default14">$model.dKnowledge.val(&quot;fReleaseStatus&quot;) == '1'</expr></readonly> </col> 
   <col name="fOtherFolders" xid="ruleCol3">
    <readonly xid="readonly2">
     <expr xid="default15">$model.dKnowledge.val(&quot;fReleaseStatus&quot;) == '1'</expr></readonly> </col> </rule></div>
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="value" xid="IsInherit" autoNew="false">
   <column label="value" name="value" type="Integer" xid="default18"></column>
   <column label="lable" name="lable" type="String" xid="default19"></column>
   <data xid="default20">[{&quot;value&quot;:1,&quot;lable&quot;:&quot;是&quot;},{&quot;value&quot;:0,&quot;lable&quot;:&quot;否&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/bizData" concept="OA_KM_Folder" isTree="true" xid="dFolder" autoLoad="false" autoNew="false">
   <reader action="/OA/knowledge/logic/action/queryFolderAction" xid="default10"></reader>
   <treeOption delayLoad="true" parentRelation="fParent" rootFilter="OA_KM_Folder = 'notice'" xid="default11" xui:update-mode="merge"></treeOption>
   <filter name="filter0" xid="filter1">OA_KM_Folder.fUseStatus = 1</filter></div>
  <div autoLoad="false" autoNew="true" component="$UI/system/components/justep/data/data" idColumn="canRelease" xid="dTemp" xui:parent="model" xui:update-mode="insert">
   <column label="canRelease" name="canRelease" type="String" xid="default111"></column>
   <column label="canUnrelease" name="canUnrelease" type="String" xid="default211"></column>
   <column label="needApprove" name="needApprove" type="String" xid="default311"></column>
   <rule xid="rule11111">
    <col name="canRelease" xid="ruleCol11111">
     <calculate xid="calculate11111">
      <expr xid="default51111">$model.dKnowledge.val(&quot;fReleaseStatus&quot;) ==1 || $model.dKnowledge.val(&quot;fIsNeedApprove&quot;) == '1'</expr></calculate> </col> </rule> </div>
  <div autoLoad="true" component="$UI/system/components/justep/data/data" idColumn="value" xid="dImportant">
   <column label="label" name="label" type="String" xid="default21"></column>
   <column label="value" name="value" type="String" xid="default22"></column>
   <data xid="default23">[{&quot;label&quot;:&quot;高&quot;,&quot;value&quot;:&quot;high&quot;},{&quot;label&quot;:&quot;中&quot;,&quot;value&quot;:&quot;middle&quot;},{&quot;label&quot;:&quot;低&quot;,&quot;value&quot;:&quot;low&quot;}]</data></div></div>  
  <div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert">
   <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button2">
    <i class="icon-loading-a" xid="i4"></i>
    <span xid="span511"></span></a> </div><div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="发布公告"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">发布公告</div>  
          <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="直接发布" xid="publishBtn" icon="icon-android-checkmark" bind-disable=' $model.dTemp.val("canRelease")' onClick="publishBtnClick">
   <i xid="i1" class="icon-android-checkmark"></i>
   <span xid="span2">直接发布</span></a>
  </div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1" style="display:none;"><div class="x-control-group" collapsible="false" component="$UI/system/components/justep/controlGroup/controlGroup" title="栏目信息" xid="controlGroup1" style="display:none;">
   <div class="x-control-group-title" xid="controlGroupTitle1">
    <span xid="span10">栏目信息</span></div> 
   <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1">
    <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1">
     <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6" xui:update-mode="merge">
      <div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit11" xui:parent="col6" xui:update-mode="insert">
       <label class="x-label" style="width:100px;" xid="label11">继承栏目权限</label>
       <div class="x-edit" xid="div11">
        <span bind-itemset="IsInherit" bind-itemsetLabel="ref('lable')" bind-itemsetValue="ref('value')" bind-ref="dKnowledge.ref('fIsInheritRights')" class="x-radio-group" component="$UI/system/components/justep/select/radioGroup" xid="fIsInherit"></span></div> </div> </div> 
     <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1">
      <div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit2">
       <label class="x-label" style="width:100px;" xid="labelFolder" xui:update-mode="merge-and-replace">发布栏目</label>
       <div class="x-edit" xid="div40">
        <div bind-labelRef="dKnowledge.ref('fFolderName')" bind-ref='$model.dKnowledge.ref("fFolderID")' class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" onHideOption="fFolderHideOption" xid="fFolder" multiselect="false" inputFilterable="true" defaultLabel=' $model.dKnowledge.val("fFolderName")'>
   <option data="dFolder" expandColumn="fName" label="fName" value="OA_KM_Folder" xid="option1" useVirtualRoot="true"></option></div>
  </div> </div> </div> 
     </div> </div> </div>
  <div class="x-control-group" collapsible="false" component="$UI/system/components/justep/controlGroup/controlGroup" title="基本信息" xid="controlGroup2">
   <div class="x-control-group-title" xid="controlGroupTitle2">
    <span xid="span12">基本信息</span></div> 
   <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form2">
    <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row3">
     <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col35">
      <div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5">
       <label bind-text="dKnowledge.label('fTitle')" class="x-label" style="width:100px;" xid="label4"></label>
       <div class="x-edit" xid="div42">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref='$model.dKnowledge.ref("fTitle")'></input></div> </div> </div> 
     
     
     
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7">
      <div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput1">
       <label bind-text="dKnowledge.label('fWriter')" class="x-label" style="width:100px;" xid="labelFWriter"></label>
       <div class="x-edit" xid="div46">
        <input bind-ref="dKnowledge.ref('fWriter')" class="form-control" component="$UI/system/components/justep/input/input" xid="input10"></input></div> </div> </div> 
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col2">
   <div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit3">
    <label bind-text='$model.dKnowledge.label("fContent")' class="x-label" style="width:100px;" xid="labelFContent"></label>
    <div class="x-edit" xid="div1">
     <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea2" bind-ref='$model.dKnowledge.ref("fContent")'></textarea></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4">
   <div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit4">
    <label bind-text='$model.dKnowledge.label("fAttachment")' class="x-label" style="width:100px;" xid="labelFAttachment"></label>
    <div class="x-edit" xid="div2">
     <div access="duud" bind-ref="dKnowledge.ref('fAttachment')" component="$UI/system/components/justep/attachment/attachmentPC" subPath="concat('业务附件/OA/知识中心',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))" xid="attachmentMobile">
   <div class="x-attachment-pc" xid="div16">
    <div class="x-attachment-content x-card-border" xid="div10">
     <div class="x-doc-process" xid="div5">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar1"></div></div> 
     <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems" xid="div3">
      <div class="x-attachment-cell x-attachment-item" xid="div4">
       <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}" xid="div6">
        <a class="x-remove-barget" data-bind="visible:$model.$state.get() == 'remove'" xid="a2"></a></div> </div> </div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div7">
      <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div18"></div></div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div19">
      <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div20"></div></div> 
     <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?'flex':'none'}" xid="div14">
      <div class="x-item-name" xid="div15">
       <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()" xid="a1"></a>
       <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())" xid="span1"></span></div> 
      <div class="x-item-edit" xid="div12">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())" xid="a4">编辑</a></div> 
      <div class="x-item-download" xid="div13">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())" xid="a3">历史</a></div> 
      <div class="x-item-download" xid="div17">
       <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())" xid="a6">下载</a></div> 
      <div class="x-item-delete" xid="div8">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())" xid="a5">删除</a></div> </div> 
     <div style="clear:both;" xid="div9"></div></div> </div> </div></div> </div> </div></div> </div> </div>
  </div>
  </div> 
</div>