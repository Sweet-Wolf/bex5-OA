<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:245px;top:296px;"
    onModelConstructDone="modelModelConstructDone" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dKnowledge"
      concept="OA_KM_Knowledge" limit="1" directDelete="true" onBeforeNew="dKnowledgeBeforeNew"
      onValueChanged="dKnowledgeValueChanged" onSaveCreateParam="dKnowledgeSaveCreateParam"
      onBeforeSave="dKnowledgeBeforeSave" onSaveCommit="dKnowledgeSaveCommit" onAfterSave="dKnowledgeAfterSave"
      autoLoad="false" onDataChange="dKnowledgeDataChange"> 
      <reader xid="default1" action="/OA/knowledge/logic/action/queryKMKnowledgeAction"/>  
      <writer xid="default2" action="/OA/knowledge/logic/action/saveKMKnowledgeAction1"/>  
      <creator xid="default3" action="/OA/knowledge/logic/action/createKMKnowledgeAction"/>  
      <rule xid="rule1"> 
        <readonly xid="readonly3"> 
          <expr xid="default16">getCurrentRow() &amp;&amp; $model.conceptIsReadonly()</expr> 
        </readonly>  
        <col name="fTitle" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default12">true</expr>  
            <message xid="default13">'标题不能为空'</message> 
          </required> 
        </col>  
        <col name="fFolderID" xid="ruleCol2"> 
          <readonly xid="readonly1"> 
            <expr xid="default14">$model.dKnowledge.val("fReleaseStatus") == '1'</expr> 
          </readonly> 
        </col>  
        <col name="fOtherFolders" xid="ruleCol3"> 
          <readonly xid="readonly2"> 
            <expr xid="default15">$model.dKnowledge.val("fReleaseStatus") == '1'</expr> 
          </readonly> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dFolder"
      concept="OA_KM_Folder" isTree="true"> 
      <reader xid="default10" action="/OA/knowledge/logic/action/queryFolderAction"/>  
      <treeOption xid="default11" parentRelation="fParent" delayLoad="true" rootFilter="OA_KM_Folder.fParent = 'public'"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_KM_Folder.fUseStatus = 1]]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="IsInherit" idColumn="value"> 
      <column label="value" name="value" type="Integer" xid="default18"/>  
      <column label="lable" name="lable" type="String" xid="default19"/>  
      <data xid="default20">[{"value":1,"lable":"是"},{"value":0,"lable":"否"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dImportant" idColumn="value"> 
      <column label="label" name="label" type="String" xid="default21"/>  
      <column label="value" name="value" type="String" xid="default22"/>  
      <data xid="default23">[{"label":"高","value":"high"},{"label":"中","value":"middle"},{"label":"低","value":"low"}]</data> 
    </div> 
  </div>  
  <div class="x-toolbar form-inline x-toolbar-spliter" component="$UI/system/components/justep/toolBar/toolBar"
    xid="toolBar1"> 
    <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
      xid="button2" onClick="button2Click" label="新增" icon="icon-android-add"> 
      <i xid="i2" class="icon-android-add"/>  
      <span xid="span2">新增</span> 
    </a>  
    <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
      onClick="{'operation':'dKnowledge.save'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/> 
    </a>  
    <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
      onClick="{'operation':'dKnowledge.refresh'}" xid="button3"> 
      <i xid="i3"/>  
      <span xid="span3"/> 
    </a>  
    <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
      label="知识权限" onClick="openRightsSetDialog" xid="button4" bind-enable="canOpenRightsSet"> 
      <i xid="i4"/>  
      <span xid="span4">知识权限</span> 
    </a>  
    <a class="btn btn-link btn-icon-left"
      component="$UI/system/components/justep/button/button" label="缩略图" onClick="btnThumbnailClick"
      xid="btnThumbnail" bind-enable="canOpenRightsSet"> 
      <i xid="i5"/>  
      <span xid="span5">缩略图</span> 
    </a>  
    <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
      label="预览" onClick="previewStaticPage" xid="btnPreviewStaticPage"> 
      <i xid="i9"/>  
      <span xid="span9">预览</span> 
    </a> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" height="50%"
    onReceive="dlgSmallpicReceive" showTitle="true" src="$UI/OA/knowledge/process/dialog/knowledgeSmallpicSet/knowledgeSmallpicSet.w"
    status="normal" title="缩略图" width="40%" xid="dlgSmallpic" style="left:89px;top:140px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgRights"
    height="90%" showTitle="true" src="$UI/OA/knowledge/process/dialog/knowledgeRightsSet/knowledgeRightsSet.w"
    status="normal" title="知识权限" width="90%" onReceive="dlgRightsReceive" style="left:61px;top:145px;"/>  
  <!--  复制过来的额 -->  
  <div component="$UI/system/components/justep/process/process" xid="processKW"
    data="dKnowledge"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="栏目信息" xid="controlGroup1" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span10"><![CDATA[栏目信息]]></span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form1"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;"><![CDATA[继承栏目权限]]></label>  
            <div class="x-edit" xid="div39"> 
              <span component="$UI/system/components/justep/select/radioGroup"
                class="x-radio-group" xid="fIsInherit" bind-ref="dKnowledge.ref('fIsInheritRights')"
                bind-itemset="IsInherit" bind-itemsetValue="ref('value')" bind-itemsetLabel="ref('lable')"/> 
            </div> 
          </div> 
        </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit2"> 
            <label class="x-label" xid="label2" style="width:100px;" bind-text="dKnowledge.label('fFolderName')" />  
            <div class="x-edit" xid="div40"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="fFolder" bind-ref="dKnowledge.ref('fFolderID')" bind-labelRef="dKnowledge.ref('fFolderName')" onHideOption="fFolderHideOption"> 
                <option xid="option1" data="dFolder" value="OA_KM_Folder" label="fName" expandColumn="fName" appearance="tree" /> 
              </div> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit3"> 
            <label class="x-label" xid="label3" style="width:100px;" bind-text="dKnowledge.label('fOtherFolders')" />  
            <div class="x-edit" xid="div41"> 
               
            <div class="input-group" xid="inputGroup2">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="dKnowledge.ref('fOtherFolders')" style="border-right-style:none;"/><div class="input-group-addon" xid="div72" style="background-color:transparent;border-left-style:none;" bind-click="btnOtherFoldersClick">
    <i xid="i111" class="icon-android-search"></i></div> </div></div>  
            </div> 
        </div></div>  
      </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgOtherFolders"
    style="left:362px;top:86px;" src="$UI/OA/knowledge/process/dialog/selectFolder/selectFolder.w"
    title="其他栏目" showTitle="true" status="normal" width="85%" height="80%" onReceive="dlgOtherFoldersReceive"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="基本信息" xid="controlGroup2" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span12"><![CDATA[基本信息]]></span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form2"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row3"> 
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col35"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit5"> 
            <label class="x-label" xid="label4" style="width:100px;" bind-text="dKnowledge.label('fTitle')"/>  
            <div class="x-edit" xid="div42"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input2" bind-ref="dKnowledge.ref('fTitle')"/> 
            </div> 
          </div> 
        </div> 
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit4"> 
            <label class="x-label" xid="label6" style="width:100px;" bind-text="dKnowledge.label('fKeyword')" />  
            <div class="x-edit" xid="div44"> 
               
            <div class="input-group" xid="div74">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="dKnowledge.ref('fKeyword')" style="border-right-style:none;"/><div class="input-group-addon" xid="div73" style="background-color:transparent;border-left-style:none;" bind-click="btnKeyWordClick">
    <i xid="i6" class="icon-android-search"></i></div> </div></div>  
            </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelRadioGroup1"> 
            <label class="x-label" xid="label5" style="width:100px;" bind-text="dKnowledge.label('fImportantName')" />  
            <div class="x-edit" xid="div43"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="fImportant" bind-ref="dKnowledge.ref('fImportant')" bind-labelRef="dKnowledge.ref('fImportantName')"> 
                <option xid="option2" data="dImportant" value="value" label="label" /> 
              </div> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelRadioGroup2"> 
            <label class="x-label" xid="label7" style="width:100px;" bind-text="dKnowledge.label('fDocNumber')" />  
            <div class="x-edit" xid="div45"> 
              <input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref="dKnowledge.ref('fDocNumber')" /> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label8" style="width:100px;" bind-text="dKnowledge.label('fWriter')" />  
            <div class="x-edit" xid="div46"> 
              <input component="$UI/system/components/justep/input/input" class="form-control" xid="input10" bind-ref="dKnowledge.ref('fWriter')" /> 
            </div> 
          </div> 
        </div></div>  
      </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="内容" xid="controlGroup3" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle3"> 
      <span xid="span14"><![CDATA[内容]]></span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form3"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row5"> 
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="formGroup6"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit7"> 
            <label class="x-label" xid="label9" style="width:100px;" bind-text="dKnowledge.label('fDocument')"/>  
            <div class="x-edit" xid="div47"> 
              <div component="$UI/system/components/justep/attachment/attachmentPC"
                access="duud" xid="fDocument" bind-ref="dKnowledge.ref('fDocument')"
                subPath="concat('业务附件/OA/知识中心',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
                <div class="x-attachment-pc" xid="div1"> 
                  <div class="x-attachment-content x-card-border" xid="div2"> 
                    <div class="x-doc-process" xid="div3"> 
                      <div class="progress-bar x-doc-process-bar" role="progressbar"
                        style="width:0%;" xid="div4"/> 
                    </div>  
                    <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                      xid="div5"> 
                      <div class="x-attachment-cell x-attachment-item" xid="div6"> 
                        <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                          xid="div7"> 
                          <a data-bind="visible:$model.$state.get() == 'remove'"
                            class="x-remove-barget" xid="a1"/> 
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div8"> 
                      <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                        xid="div9"/> 
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div10"> 
                      <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                        xid="div11"/> 
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                      xid="div12"> 
                      <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                        xid="div31"/> 
                    </div>  
                    <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?'flex':'none'}"
                      xid="div32"> 
                      <div class="x-item-name" xid="div33"> 
                        <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                          xid="a5"/>  
                        <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                          xid="span15"/> 
                      </div>  
                      <div class="x-item-edit" xid="div34"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                          xid="a6">编辑</a> 
                      </div>  
                      <div class="x-item-download" xid="div35"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                          xid="a7">历史</a> 
                      </div>  
                      <div class="x-item-download" xid="div36"> 
                        <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                          xid="a8">下载</a> 
                      </div>  
                      <div class="x-item-delete" xid="div37"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                          xid="a9">删除</a> 
                      </div> 
                    </div>  
                    <div style="clear:both;" xid="div38"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="formGroup7"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelRadioGroup3"> 
            <label class="x-label" xid="label10" style="width:100px;" bind-text="dKnowledge.label('fLinkURL')"/>  
            <div class="x-edit" xid="div48"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input8" bind-ref="dKnowledge.ref('fLinkURL')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="formGroup8"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit8"> 
            <label class="x-label" xid="label12" style="width:100px;" bind-text="dKnowledge.label('fTemplateName')"/>  
            <div class="x-edit" xid="div50"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input9" bind-ref="dKnowledge.ref('fTemplateName')" readonly="true"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="formGroup9"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput2"> 
            <label class="x-label" xid="label13" style="width:100px;" bind-text="dKnowledge.label('fContent')"/>  
            <div class="x-edit" xid="div51"> 
              <div component="$UI/system/components/justep/richTextarea/richTextarea" class="x-richTextarea" xid="richTextarea1" bind-ref="dKnowledge.ref('fContent')" style="height:300px;"></div></div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="formGroup10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput3"> 
            <label class="x-label" xid="label14" style="width:100px;"><![CDATA[模板图片]]></label>  
            <div class="x-edit" xid="div52"> 
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row7"> 
                <div class="col col-xs-4" xid="col54"> 
                  <div component="$UI/system/components/justep/attachment/attachmentImage"
                    access="duud" xid="fPicture1" bind-ref="dKnowledge.ref('fPicture1')"
                    subPath="concat('业务附件/OA/知识中心',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"
                    style="height:200px;"> 
                    <div class="x-attachment x-attachment-image" xid="div13"
                      style="height:200px;"> 
                      <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}"
                        xid="div14"> 
                        <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)"
                          xid="image1"/>  
                        <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2"
                          class="x-remove-barget" xid="a2"/> 
                      </div>  
                      <div class="x-doc-process" xid="div15"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="div16"/> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)"
                        xid="div17"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div18"/> 
                      </div> 
                    </div> 
                  </div> 
                </div>  
                <div class="col col-xs-4" xid="col55"> 
                  <div component="$UI/system/components/justep/attachment/attachmentImage"
                    access="duud" xid="fPicture2" bind-ref="dKnowledge.ref('fPicture2')"
                    subPath="concat('业务附件/OA/知识中心',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"
                    style="height:200px;"> 
                    <div class="x-attachment x-attachment-image" xid="div19"
                      style="height:200px;"> 
                      <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}"
                        xid="div20"> 
                        <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)"
                          xid="image2"/>  
                        <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2"
                          class="x-remove-barget" xid="a3"/> 
                      </div>  
                      <div class="x-doc-process" xid="div21"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="div22"/> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)"
                        xid="div23"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div24"/> 
                      </div> 
                    </div> 
                  </div> 
                </div>  
                <div class="col col-xs-4" xid="col56"> 
                  <div component="$UI/system/components/justep/attachment/attachmentImage"
                    access="duud" xid="fPicture3" bind-ref="dKnowledge.ref('fPicture3')"
                    subPath="concat('业务附件/OA/知识中心',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"
                    style="height:200px;"> 
                    <div class="x-attachment x-attachment-image" xid="div25"
                      style="height:200px;"> 
                      <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}"
                        xid="div26"> 
                        <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)"
                          xid="image3"/>  
                        <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2"
                          class="x-remove-barget" xid="a4"/> 
                      </div>  
                      <div class="x-doc-process" xid="div27"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="div28"/> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)"
                        xid="div29"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div30"/> 
                      </div> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgKeyWord"
    onReceive="wDlgKeyWordReceive" status="normal" width="80%" height="80%" src="$UI/OA/common/process/keyWordSelect/keyWordSelect.w"
    title="主题词选择向导" showTitle="true" style="left:45px;top:132px;"/>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="附件" xid="controlGroup4" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle4"> 
      <span xid="span6">title</span> 
    </div>  
    <div component="$UI/system/components/justep/attachment/attachmentPC" access="duud"
      xid="attachKnowledge" bind-ref="dKnowledge.ref('fAttachment')" subPath="concat('业务附件/OA/知识中心',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
      <div class="x-attachment-pc" xid="div49"> 
        <div class="x-attachment-content x-card-border" xid="div53"> 
          <div class="x-doc-process" xid="div54"> 
            <div class="progress-bar x-doc-process-bar" role="progressbar"
              style="width:0%;" xid="div55"/> 
          </div>  
          <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
            xid="div56"> 
            <div class="x-attachment-cell x-attachment-item" xid="div57"> 
              <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                xid="div58"> 
                <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget"
                  xid="a10"/> 
              </div> 
            </div> 
          </div>  
          <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
            xid="div59"> 
            <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
              xid="div60"/> 
          </div>  
          <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
            xid="div61"> 
            <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
              xid="div62"/> 
          </div>  
          <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
            xid="div63"> 
            <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
              xid="div64"/> 
          </div>  
          <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?'flex':'none'}"
            xid="div65"> 
            <div class="x-item-name" xid="div66"> 
              <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                xid="a11"/>  
              <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                xid="span7"/> 
            </div>  
            <div class="x-item-edit" xid="div67"> 
              <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                xid="a12">编辑</a> 
            </div>  
            <div class="x-item-download" xid="div68"> 
              <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                xid="a13">历史</a> 
            </div>  
            <div class="x-item-download" xid="div69"> 
              <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                xid="a14">下载</a> 
            </div>  
            <div class="x-item-delete" xid="div70"> 
              <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                xid="a15">删除</a> 
            </div> 
          </div>  
          <div style="clear:both;" xid="div71"/> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
