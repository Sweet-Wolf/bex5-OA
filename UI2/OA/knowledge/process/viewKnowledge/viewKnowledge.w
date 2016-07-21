<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="mdKnowledge"
    style="height:auto;left:113px;top:494px;" onLoad="mdKnowledgeLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dKnowledge"
      concept="OA_KM_Knowledge" limit="1"> 
      <reader xid="default1" action="/OA/knowledge/logic/action/queryKMKnowledgeAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dVisible" idColumn="windowcontainerIsSow">
      <column label="windowcontainerIsSow" name="windowcontainerIsSow" type="Boolean"
        xid="xid1"/>  
      <column label="iframeIsShow" name="iframeIsShow" type="Boolean" xid="xid2"/>  
      <data xid="default2">[{"windowcontainerIsSow":"true","iframeIsShow":"true"}]</data>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgReaded"
    src="$UI/OA/knowledge/process/viewKnowledge/readed.w" title="已阅人员" showTitle="true"
    status="normal" width="50%" height="50%"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgnoReader"
    src="$UI/OA/knowledge/process/viewKnowledge/noreader.w" status="normal" width="50%"
    height="70%" showTitle="true" title="未阅人员"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1" style="height:99%;"> 
    <div class="x-panel-content" xid="content1"> 
      <div class="form-horizontal container-fluid"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row3"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;" dir="ltr">主 栏 目:</label>  
              <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
                xid="output1" bind-ref="dKnowledge.ref('fFolderName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit2"> 
              <label class="x-label" xid="label2" style="width:100px;" dir="ltr">发布部门:</label>  
              <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
                xid="output2" bind-ref="dKnowledge.ref('fReleaseDeptName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput1"> 
              <label class="x-label" xid="label5" style="width:100px;" dir="ltr">发布人:</label>  
              <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
                xid="output5" bind-ref="dKnowledge.ref('fReleasePsnName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit3"> 
              <label class="x-label" xid="label3" style="width:100px;" dir="ltr">发布时间:</label>  
              <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
                xid="output3" bind-ref="dKnowledge.ref('fReleaseTime')"/> 
            </div> 
          </div>
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit4"> 
              <label class="x-label" xid="label4" style="width:100px;" dir="ltr">其他栏目:</label>  
              <div component="$UI/system/components/justep/output/output" class="x-output x-edit"
                xid="output4" bind-ref="dKnowledge.ref('fOtherFolders')"/> 
            </div> 
          </div>
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="添加关注" xid="btnAddAttention" onClick="btnAddAttentionClick"> 
              <i xid="i1"/>  
              <span xid="span3">添加关注</span> 
            </a> 
          </div>
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col8"
            style="height:auto;"> 
            <div xid="divIframe" style="width:100%;height:550px;"> 
              <iframe frameborder="1" name="staticIframe"  style="height:99%;width:100%;"
                xid="iframe1"/> 
            </div>  
            <div xid="contentLinkSpan"/>
            <div xid="attachmentDiv" style="display:none;"> 
              <div component="$UI/system/components/justep/attachment/attachmentPC"
                access="duud" xid="attachmentPC" bind-ref="dKnowledge.ref('fAttachment')"> 
                <div class="x-attachment-pc" xid="div47"> 
                  <div class="x-attachment-content x-card-border" xid="div48"> 
                    <div class="x-doc-process" xid="div49"> 
                      <div class="progress-bar x-doc-process-bar" role="progressbar"
                        style="width:0%;" xid="div50"/> 
                    </div>  
                    <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                      xid="div51"> 
                      <div class="x-attachment-cell x-attachment-item" xid="div52"> 
                        <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                          xid="div53"> 
                          <a data-bind="visible:$model.$state.get() == 'remove'"
                            class="x-remove-barget" xid="a9"/> 
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div54"> 
                      <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                        xid="div55"/> 
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div56"> 
                      <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                        xid="div57"/> 
                    </div>  
                    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                      xid="div58"> 
                      <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                        xid="div59"/> 
                    </div>  
                    <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?'flex':'none'}"
                      xid="div60"> 
                      <div class="x-item-name" xid="div61"> 
                        <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                          xid="a10"/>  
                        <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                          xid="span2"/> 
                      </div>  
                      <div class="x-item-edit" xid="div62"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                          xid="a11">编辑</a> 
                      </div>  
                      <div class="x-item-download" xid="div63"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                          xid="a12">历史</a> 
                      </div>  
                      <div class="x-item-download" xid="div64"> 
                        <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                          xid="a13">下载</a> 
                      </div>  
                      <div class="x-item-delete" xid="div65"> 
                        <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                          xid="a14">删除</a> 
                      </div> 
                    </div>  
                    <div style="clear:both;" xid="div66"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div>
          <div class="col col-xs-4 col-sm-4 col-md-4 col-lg-4" xid="col6"> 
            <label xid="label10" style="background-color:transparent;">附件</label>  
            <a xid="aAtachment" style="color:#0000FF;cursor:hand;" href="#"
              bind-click="aAtachmentClick">0</a>  
            <label xid="label6" style="background-color:transparent;">个</label> 
          </div>
          <div class="col col-xs-8 col-sm-8 col-md-8 col-lg-8" xid="col7"> 
            <div xid="div5" style="float:right;"> 
              <label xid="label11" style="background-color:transparent;">已阅</label>  
              <a xid="readedCounts" style="color:#0000FF;cursor:hand" href="#"
                bind-click="readedCountsClick">0</a>  
              <label xid="label7" style="width:24px;">人</label>  
              <label xid="label8">未阅</label>  
              <a xid="readingCounts" style="color:#0000FF;cursor:hand" href="#"
                bind-click="showNotReadedDialog">0</a>  
              <label xid="label9">人</label> 
            </div> 
          </div>
        </div> 
      </div> 
    </div> 
  </div> 
</div>
