<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="mdKnowledge" style="height:auto;left:148px;top:145px;"><div component="$UI/system/components/justep/data/bizData" xid="dKnowledge" concept="OA_KM_BatchKW" limit="1" autoNew="true"><reader xid="default1" action="/OA/knowledge/logic/action/queryKMBatchKWAction"></reader>
  <writer xid="default2" action="/OA/knowledge/logic/action/saveKMBatchKWAction"></writer>
  <creator xid="default3" action="/OA/knowledge/logic/action/createKMBatchKWAction"></creator>
  <rule xid="rule1">
   <col name="fFolderID" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default6">$model.dKnowledge.val(&quot;fReleaseStatus&quot;) == '1'</expr></readonly> 
    <required xid="required1">
     <expr xid="default7">true</expr>
     <message xid="default8">'发布栏目不能为空'</message></required> </col> </rule></div>
  <div component="$UI/system/components/justep/data/bizData" xid="dFolder" concept="OA_KM_Folder" isTree="true"><reader xid="default4" action="/OA/knowledge/logic/action/queryFolderAction"></reader>
  <treeOption xid="default5" parentRelation="fParent" rootFilter="OA_KM_Folder.fParent = 'public'" nodeKindRelation="fName"></treeOption>
  <filter name="dataFilter" xid="filter1"><![CDATA[OA_KM_Folder.fUseStatus = 1]]></filter></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dKnowledge.save'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dKnowledge.new'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dKnowledge.refresh'}" xid="button3">
   <i xid="i3"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="批量发布" xid="btnRelase" onClick="relaseKnowledge">
   <i xid="i4"></i>
   <span xid="span4">批量发布</span></a></div></div>
   <div class="x-panel-content" xid="content1"><div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form(bootstrap)" xid="form1"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit1">
   <label class="x-label" xid="label1" style="width:100px;" bind-text="dKnowledge.label('fFolderName')"></label>
   <div class="x-edit" xid="div1"><div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="dKnowledge.ref('fFolderID')" bind-labelRef="dKnowledge.ref('fFolderName')">
   <option xid="option1" data="dFolder" appearance="tree" expandColumn="fName" value="OA_KM_Folder" label="fName"></option></div></div></div></div>
   </div></div>
  <div component="$UI/system/components/justep/attachment/attachmentPC" access="duud" xid="attachKnowledge" bind-ref="dKnowledge.ref('fDocument')">
   <div class="x-attachment-pc" xid="div4">
    <div class="x-attachment-content x-card-border" xid="div5">
     <div class="x-doc-process" xid="div6">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div7"></div></div> 
     <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems" xid="div8">
      <div class="x-attachment-cell x-attachment-item" xid="div9">
       <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}" xid="div10">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div11">
      <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div12"></div></div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div13">
      <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)" xid="div14"></div></div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div15">
      <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div16"></div></div> 
     <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?'flex':'none'}" xid="div17">
      <div class="x-item-name" xid="div18">
       <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()" xid="a2"></a>
       <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())" xid="span5"></span></div> 
      <div class="x-item-edit" xid="div19">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())" xid="a3">编辑</a></div> 
      <div class="x-item-download" xid="div20">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())" xid="a4">历史</a></div> 
      <div class="x-item-download" xid="div21">
       <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())" xid="a5">下载</a></div> 
      <div class="x-item-delete" xid="div22">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())" xid="a6">删除</a></div> </div> 
     <div style="clear:both;" xid="div23"></div></div> </div> </div></div>
   </div></div>