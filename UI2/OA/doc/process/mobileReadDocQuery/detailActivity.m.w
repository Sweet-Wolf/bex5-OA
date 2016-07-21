<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:155px;top:396px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDoc" concept="OA_DC_Doc"
      orderBy="fCreateTime:desc" autoLoad="true" confirmDelete="false" confirmRefresh="false"> 
      <reader xid="default1" action="/OA/doc/logic/action/queryReadDocAction"/>  
      <calculateRelation relation="recNO" xid="calculateRelation1" type="Integer"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="taskData" concept="SA_Task"><reader xid="default2" action="/system/logic/action/queryTaskAction"></reader></div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:80px;top:128px;"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu" anchor="moreBtn"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="流程记录" xid="showRec" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}"> 
          <i xid="i7"/>  
          <span xid="span7">流程记录</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgOpinion"
    src="$UI/OA/doc/process/mobileReadDocQuery/readOpinionSet.m.w"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeBtn" style="width:40px;" icon="icon-chevron-left" onClick="closeBtnClick"> 
            <i xid="i11" class="icon-chevron-left"/>  
            <span xid="span5"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2"/>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="moreBtn" onClick="moreBtnClick" icon="icon-android-more"> 
            <i xid="i1" class="icon-android-more"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="dealBtn" onClick="dealBtnClick" icon="icon-edit"> 
            <i xid="i3" class="icon-edit"/>  
            <span xid="span3"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="media"> 
        <a class="pull-left content-head-pic " href="#" style="margin-right:0px;"
          xid="a2"> 
          <div class="media-object x-blob" component="$UI/system/components/justep/org/orgImage"
            xid="orgImage1" bind-ref="dDoc.ref('fCreatePsnID')" orgKind="person"> 
            <div class="x-blob-bar" xid="div18" title="7"> 
              <i class="x-blob-edit icon-compose" xid="i71"/>  
              <i class="x-blob-del icon-close-round" xid="i8"/> 
            </div>  
            <img class="x-blob-img x-autofill" xid="image1"/> 
          </div> 
        </a>  
        <div class="media-body" xid="div8"> 
          <div xid="divName" class="content-first-row"> 
            <div component="$UI/system/components/justep/output/output" class="x-output title-data"
              xid="outputName" bind-ref="dDoc.ref('fCreatePsnName')"/> 
          </div>  
          <div component="$UI/system/components/justep/output/output" class="x-output content-data content-row"
            xid="outputTime" bind-ref="dDoc.ref('fCreateTime')"/>  
            
     
          
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20 oa-input-group-row" xid="labelEdit1"> 
            <label class="x-label" xid="label1"><![CDATA[标题：]]></label>  
            <div class="x-edit" xid="div1_1"> 
              <div component="$UI/system/components/justep/output/output" class="form-control x-output text-right"
                xid="output2" bind-ref="dDoc.ref('fTitle')" /> 
            </div> 
          </div>
          
           
          <div _component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20 oa-input-group-row" xid="startLabelInput"> 
        
            <label class="x-label" xid="label2"><![CDATA[正文：]]></label> 
            <div class="x-edit" xid="div50"> 
            <div component="$UI/system/components/justep/attachment/attachment"
              access="d" xid="AttachmentZW" bind-ref="dDoc.ref('fTemplate')" style="height:43px;"> 
              <div class="x-attachment" xid="div5"> 
                <div class="x-attachment-content x-card-border" xid="div6"> 
                  <div class="x-doc-process" xid="div7"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="progressBar1"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div9"> 
                    <div class="x-attachment-cell" xid="div10"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div11"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a1"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                    xid="div12"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                      xid="div13"/> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div14"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                      xid="div15"/> 
                  </div>  
                  <div style="clear:both;" xid="div16"/> 
                </div> 
              </div> 
            </div> 
            </div>
          </div>  
          <div _component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20 oa-input-group-row" xid="endLabelInput"> 
            <label class="x-label" xid="label3"><![CDATA[附件：]]></label>
            <div class="x-edit" xid="div51"> 
            <div component="$UI/system/components/justep/attachment/attachment"
              access="d" xid="AttachmentFJ" bind-ref="dDoc.ref('fAttachment')"> 
              <div class="x-attachment" xid="div17"> 
                <div class="x-attachment-content x-card-border" xid="div19"> 
                  <div class="x-doc-process" xid="div20"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="progressBar2"/> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div21"> 
                    <div class="x-attachment-cell" xid="div22"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div23"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a3"/> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                    xid="div24"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                      xid="div25"/> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div26"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                      xid="div27"/> 
                  </div>  
                  <div style="clear:both;" xid="div28"/> 
                </div> 
              </div> 
            </div> 
            </div>
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dDoc" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"/> 
</div>
