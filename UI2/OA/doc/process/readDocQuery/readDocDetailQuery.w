<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="mdDoc" style="height:auto;left:496px;top:424px;" onModelConstructDone="mdDocModelConstructDone" onLoad="mdDocLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDoc" concept="OA_DC_Doc"
      limit="1" orderBy="fCreateTime:desc"> 
      <reader xid="default1" action="/OA/doc/logic/action/queryOA_DC_DocAction"/>  
      <rule xid="rule1">
   <col name="fContent" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default3">true</expr></readonly> </col> 
   <col name="fDraftContent" xid="ruleCol2">
    <readonly xid="readonly2">
     <expr xid="default4">true</expr></readonly> </col> 
   <col name="fAttachment" xid="ruleCol3">
    <readonly xid="readonly3">
     <expr xid="default5">true</expr></readonly> </col> 
   <col name="fAttachmentName" xid="ruleCol4">
    <readonly xid="readonly4">
     <expr xid="default6">true</expr></readonly> </col> 
   <col name="fTemplate" xid="ruleCol5">
    <readonly xid="readonly5">
     <expr xid="default2">true</expr></readonly> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="meetingData" idColumn="fCreatePsnID"> 
      <column label="fCreatePsnID" name="fCreatePsnID" type="String" xid="default11"/>  
      <column label="fCreatePsnName" name="fCreatePsnName" type="String" xid="default12"/>  
      <column label="fUpdateTime" name="fUpdateTime" type="String" xid="default13"/> 
    </div> 
  <div component="$UI/system/components/justep/data/bizData" xid="taskData" concept="SA_Task">
   <reader xid="default7" action="/system/logic/action/queryTaskAction"></reader></div></div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgProcessInfo"
    src="$UI/OA/doc/process/dialog/readerOpinion/readerOpinionSet.w" title="阅文意见"
    showTitle="true" status="normal" width="40%" height="60%"/>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'dDoc.refresh'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="btnReaderOpnionDOMActivate" xid="btnReaderOpnion" label="传阅处理"> 
      <i xid="i4"/>  
      <span xid="span4">传阅处理</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}" xid="button3">
   <i xid="i3"></i>
   <span xid="span3"></span></a></div>  
  <div xid="vSendDoc" style="display:none;"> 
    <h1 xid="h11" class="text-center"><![CDATA[发文审批单]]></h1>  
    <div component="$UI/system/components/justep/controlGroup/controlGroup"
      class="x-control-group" title="发文信息" xid="cgSendDocInfo"> 
      <div class="x-control-group-title" xid="controlGroupTitle2"> 
        <span xid="span6">title</span> 
      </div>  
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form1"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput1"> 
              <label class="x-label" xid="label1" style="width:100px;" bind-text="dDoc.label('fExtendStr1')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output1" bind-ref="dDoc.ref('fExtendStr1')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput2"> 
              <label class="x-label" xid="label2" style="width:100px;" bind-text="dDoc.label('fDocSecretLevelName')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output2" bind-ref="dDoc.ref('fDocSecretLevelName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput3"> 
              <label class="x-label" xid="label3" style="width:100px;" bind-text="dDoc.label('fDocExigenceLevelName')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output3" bind-ref="dDoc.ref('fDocExigenceLevelName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput6"> 
              <label class="x-label" xid="label4" style="width:100px;" bind-text="dDoc.label('fOrgLetterName')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output6" bind-ref="dDoc.ref('fOrgLetterName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput5"> 
              <label class="x-label" xid="label5" style="width:100px;" bind-text="dDoc.label('fDocNumber')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output5" bind-ref="dDoc.ref('fDocNumber')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput4"> 
              <label class="x-label" xid="label6" style="width:100px;" bind-text="dDoc.label('fIssueDate')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output4" bind-ref="dDoc.ref('fIssueDate')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col5"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput4"> 
              <label class="x-label" xid="label6" style="width:100px;" bind-text="dDoc.label('fTitle')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output4" bind-ref="dDoc.ref('fTitle')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col5"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput4"> 
              <label class="x-label" xid="label6" style="width:100px;" bind-text="dDoc.label('fKeyword')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output4" bind-ref="dDoc.ref('fKeyword')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput4"> 
              <label class="x-label" xid="label6" style="width:100px;" bind-text="dDoc.label('fDocKindName')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output4" bind-ref="dDoc.ref('fDocKindName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col5"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput4"> 
              <label class="x-label" xid="label6" style="width:100px;" bind-text="dDoc.label('fSponsorDept')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output4" bind-ref="dDoc.ref('fSponsorDept')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit1"> 
              <label class="x-label" xid="label8" style="width:100px;" bind-text="dDoc.label('fTemplate')"/>  
              <div class="x-edit" xid="div23"> 
                <div component="$UI/system/components/justep/attachment/attachmentPC"
                  access="duud" xid="attachmentPC2" bind-ref="dDoc.ref('fTemplate')"
                  subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
                  <div class="x-attachment-pc" xid="div24"> 
                    <div class="x-attachment-content x-card-border" xid="div25"> 
                      <div class="x-doc-process" xid="div26"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="div27"/> 
                      </div>  
                      <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                        xid="div28"> 
                        <div class="x-attachment-cell x-attachment-item" xid="div29"> 
                          <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                            xid="div30"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a7"/> 
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div31"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div32"/> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div33"> 
                        <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                          xid="div34"/> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div35"> 
                        <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div36"/> 
                      </div>  
                      <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?'flex':'none'}"
                        xid="div37"> 
                        <div class="x-item-name" xid="div38"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                            xid="a8"/>  
                          <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                            xid="span9"/> 
                        </div>  
                        <div class="x-item-edit" xid="div39"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                            xid="a9">编辑</a> 
                        </div>  
                        <div class="x-item-download" xid="div40"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                            xid="a10">历史</a> 
                        </div>  
                        <div class="x-item-download" xid="div41"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                            xid="a11">下载</a> 
                        </div>  
                        <div class="x-item-delete" xid="div42"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                            xid="a12">删除</a> 
                        </div> 
                      </div>  
                      <div style="clear:both;" xid="div43"/> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit2"> 
              <label class="x-label" xid="label9" style="width:100px;" bind-text="dDoc.label('fReason')"/>  
              <div class="x-edit" xid="div53"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea1" bind-ref="dDoc.ref('fReason')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit3"> 
              <label class="x-label" xid="label10" style="width:100px;" bind-text="dDoc.label('fMainDestDept')"/>  
              <div class="x-edit" xid="div65"> 
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="output10" bind-ref="dDoc.ref('fMainDestDept')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelTextarea1"> 
              <label class="x-label" xid="label12" style="width:100px;" bind-text="dDoc.label('fCopyDestDept')"/>  
              <div class="x-edit" xid="div67"> 
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="output11" bind-ref="dDoc.ref('fCopyDestDept')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput8"> 
              <label class="x-label" xid="label13" style="width:100px;" bind-text="dDoc.label('fDraftPerName')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output12" bind-ref="dDoc.ref('fDraftPerName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput9"> 
              <label class="x-label" xid="label14" style="width:100px;" bind-text="dDoc.label('fDraftPerPhone')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output13" bind-ref="dDoc.ref('fDraftPerPhone')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput10"> 
              <label class="x-label" xid="label15" style="width:100px;" bind-text="dDoc.label('fDraftTime')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output14" bind-ref="dDoc.ref('fDraftTime')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col17"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput11"> 
              <label class="x-label" xid="label16" style="width:100px;" bind-text="dDoc.label('fCheckPerName')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output15" bind-ref="dDoc.ref('fCheckPerName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput12"> 
              <label class="x-label" xid="label17" style="width:100px;" bind-text="dDoc.label('fCheckTime')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output16" bind-ref="dDoc.ref('fCheckTime')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col15"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput13"> 
              <label class="x-label" xid="label18" style="width:100px;" bind-text="dDoc.label('fSuperPrintPsnName')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output17" bind-ref="dDoc.ref('fSuperPrintPsnName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col20"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput14"> 
              <label class="x-label" xid="label19" style="width:100px;" bind-text="dDoc.label('fCopies')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output18" bind-ref="dDoc.ref('fCopies')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col19"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput15"> 
              <label class="x-label" xid="label20" style="width:100px;" bind-text="dDoc.label('fProofReader')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output19" bind-ref="dDoc.ref('fProofReader')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col18"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput16"> 
              <label class="x-label" xid="label21" style="width:100px;" bind-text="dDoc.label('fTypePerName')"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output20" bind-ref="dDoc.ref('fTypePerName')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    
  </div>  
  
  <div xid="vSendDocPaper" style="display:none;"> 
    <h1 xid="h12" class="text-center"><![CDATA[发文稿纸]]></h1>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form3"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row3"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit4"> 
            <label class="x-label" xid="label30" style="width:100px;" bind-text="dDoc.label('fOrgLetterName')"/>  
            <div class="x-edit" xid="div3"> 
              <div component="$UI/system/components/justep/output/output" class="form-control"
                xid="output24" bind-ref="dDoc.ref('fOrgLetterName')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col24"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit8"> 
            <label class="x-label" xid="label31" style="width:100px;" bind-text="dDoc.label('fOrgYear')"/>  
            <div class="x-edit" xid="div4"> 
              <div component="$UI/system/components/justep/output/output" class="form-control"
                xid="output25" bind-ref="dDoc.ref('fOrgYear')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col25"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit9"> 
            <label class="x-label" xid="label32" style="width:100px;" bind-text="dDoc.label('fOrgNum')"/>  
            <div class="x-edit" xid="div5"> 
              <div component="$UI/system/components/justep/output/output" class="form-control"
                xid="output26" bind-ref="dDoc.ref('fOrgNum')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col25"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit9"> 
            <label class="x-label" xid="label32" style="width:100px;" bind-text="dDoc.label('fDocExigenceLevelName')"/>  
            <div class="x-edit" xid="div5"> 
              <div component="$UI/system/components/justep/output/output" class="form-control"
                xid="output26" bind-ref="dDoc.ref('fDocExigenceLevelName')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col25"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit9"> 
            <label class="x-label" xid="label32" style="width:100px;" bind-text="dDoc.label('fDocSecretLevelName')"/>  
            <div class="x-edit" xid="div5"> 
              <div component="$UI/system/components/justep/output/output" class="form-control"
                xid="output26" bind-ref="dDoc.ref('fDocSecretLevelName')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col25"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit9"> 
            <label class="x-label" xid="label32" style="width:100px;" bind-text="dDoc.label('fDocSecretLevelName')"/>  
            <div class="x-edit" xid="div5"> 
              <div component="$UI/system/components/justep/output/output" class="form-control"
                xid="output26" bind-ref="dDoc.ref('fDocSecretLevelName')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col29"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row4"> 
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col26"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelTextarea2"> 
                <label class="x-label" xid="label33" bind-text="dDoc.label('fSignOpinion')"
                  style="width:100px;"/>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textarea2" bind-ref="dDoc.ref('fSignOpinion')"/> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col27"> 
              <div xid="div2" style="margin-left:100px;"> 
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="output27" bind-ref="dDoc.ref('fSignPerName')"/>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="output28" bind-ref="dDoc.ref('fSignTime')"/> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col30"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit10"> 
            <label class="x-label" xid="label34" style="width:100px;"><![CDATA[会签]]></label>  
            <div class="x-edit" xid="div6"> 
              <div xid="vMeetingText"> 
                <span xid="spanMeetingText"/> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fSponsorDept')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fSponsorDept')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fDraftPerName')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fDraftPerName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fCheckPerName')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fCheckPerName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fCheckTime')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fCheckTime')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fTitle')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fTitle')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col32"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelTextarea3"> 
            <label class="x-label" xid="label36" bind-text="dDoc.label('fReason')"
              style="width:100px;"/>  
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control x-edit" xid="textarea3" bind-ref="dDoc.ref('fReason')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fMainDestDept')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fMainDestDept')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fCopyReportDept')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fCopyReportDept')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fCopyDestDept')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fCopyDestDept')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fInternalSendDeptName')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fInternalSendDeptName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fAttachmentName')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fAttachmentName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fTypePerName')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fTypePerName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fProofReader')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fProofReader')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fSuperPrintPsnName')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fSuperPrintPsnName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fCopies')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fCopies')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label35" bind-text="dDoc.label('fDraftTime')"
              style="width:100px;"/>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output29" bind-ref="dDoc.ref('fDraftTime')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row5"> 
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit11"> 
                <label class="x-label" xid="label37"><![CDATA[拟办日期]]></label>  
                <div class="x-edit" xid="div8"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="form-control" xid="output30" bind-ref="dDoc.ref('fDraftTime')"/> 
                </div> 
              </div> 
            </div>  
            <!--  
                  <div class="col col-xs-3" xid="col33"> 
                    <div component="$UI/system/components/justep/labelEdit/labelEdit"
                      class="x-label-edit" xid="labelEdit11"> 
                      <div class="x-edit" xid="div8"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="form-control" xid="output30" bind-ref="dDoc.ref('fYear')"/> 
                      </div>  
                      <label class="x-label" xid="label37"><![CDATA[年]]></label> 
                    </div> 
                  </div>  
                  <div class="col col-xs-3" xid="col33"> 
                    <div component="$UI/system/components/justep/labelEdit/labelEdit"
                      class="x-label-edit" xid="labelEdit11"> 
                      <div class="x-edit" xid="div8"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="form-control" xid="output30" bind-ref="dDoc.ref('fMonth')"/> 
                      </div>  
                      <label class="x-label" xid="label37"><![CDATA[月]]></label> 
                    </div> 
                  </div>  
                  <div class="col col-xs-3" xid="col33"> 
                    <div component="$UI/system/components/justep/labelEdit/labelEdit"
                      class="x-label-edit" xid="labelEdit11"> 
                      <div class="x-edit" xid="div8"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="form-control" xid="output30" bind-ref="dDoc.ref('fDay')"/> 
                      </div>  
                      <label class="x-label" xid="label37"><![CDATA[日]]></label> 
                    </div> 
                  </div> 
                --> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div xid="vReceiveDoc" style="display:none;"> 
    <h1 xid="h13" class="text-center"><![CDATA[收文审批]]></h1>  
    <div component="$UI/system/components/justep/controlGroup/controlGroup"
      class="x-control-group" title="收文信息" xid="controlGroup1"> 
      <div class="x-control-group-title" xid="controlGroupTitle5"> 
        <span xid="span8">title</span> 
      </div>  
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form4"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row6"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput17"> 
              <label class="x-label" xid="label38" bind-text="dDoc.label('fExtendStr1')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output31" bind-ref="dDoc.ref('fExtendStr1')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fTitle')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fTitle')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fKeyword')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fKeyword')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fSourceDept')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fSourceDept')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fSourceDate')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fSourceDate')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit12"> 
              <label class="x-label" xid="label40" bind-text="dDoc.label('fTemplate')"
                style="width:100px;"/>  
              <div class="x-edit" xid="div50"> 
                <div component="$UI/system/components/justep/attachment/attachmentPC"
                  access="duud" xid="attachmentPC1" bind-ref="dDoc.ref('fTemplate')"
                  subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
                  <div class="x-attachment-pc" xid="div9"> 
                    <div class="x-attachment-content x-card-border" xid="div10"> 
                      <div class="x-doc-process" xid="div11"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="div12"/> 
                      </div>  
                      <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                        xid="div13"> 
                        <div class="x-attachment-cell x-attachment-item" xid="div14"> 
                          <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                            xid="div15"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a1"/> 
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div16"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div17"/> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div18"> 
                        <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                          xid="div19"/> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div20"> 
                        <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div21"/> 
                      </div>  
                      <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?'flex':'none'}"
                        xid="div22"> 
                        <div class="x-item-name" xid="div44"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                            xid="a2"/>  
                          <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                            xid="span10"/> 
                        </div>  
                        <div class="x-item-edit" xid="div45"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                            xid="a3">编辑</a> 
                        </div>  
                        <div class="x-item-download" xid="div46"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                            xid="a4">历史</a> 
                        </div>  
                        <div class="x-item-download" xid="div47"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                            xid="a5">下载</a> 
                        </div>  
                        <div class="x-item-delete" xid="div48"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                            xid="a6">删除</a> 
                        </div> 
                      </div>  
                      <div style="clear:both;" xid="div49"/> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fSourceDocNumber')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fSourceDocNumber')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDocNumber')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDocNumber')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDocKindName')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDocKindName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDocExigenceLevelName')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDocExigenceLevelName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDocSecretLevelName')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDocSecretLevelName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
            <div component="$UI/system/components/bootstrap/row/row" class="row"
              xid="row5"> 
              <div class="col col-xs-3" xid="col33"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit11"> 
                  <label class="x-label" xid="label37"><![CDATA[保密期限]]></label> 
                </div> 
              </div>  
              <div class="col col-xs-3" xid="col33"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit11"> 
                  <div class="x-edit" xid="div8"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="form-control" xid="output30" bind-ref="dDoc.ref('fYear')"/> 
                  </div>  
                  <label class="x-label" xid="label37"><![CDATA[年]]></label> 
                </div> 
              </div>  
              <div class="col col-xs-3" xid="col33"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit11"> 
                  <div class="x-edit" xid="div8"> 
                    <div component="$UI/system/components/justep/output/output"
                      class="form-control" xid="output30" bind-ref="dDoc.ref('fMonth')"/> 
                  </div>  
                  <label class="x-label" xid="label37"><![CDATA[月]]></label> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fPages')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fPages')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fCopies')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fCopies')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fIssueDate')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fIssueDate')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit2"> 
              <label class="x-label" xid="label9" style="width:100px;" bind-text="dDoc.label('fContent')"/>  
              <div class="x-edit" xid="div53"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea1" bind-ref="dDoc.ref('fContent')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit2"> 
              <label class="x-label" xid="label9" style="width:100px;" bind-text="dDoc.label('fDraftContent')"/>  
              <div class="x-edit" xid="div53"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea1" bind-ref="dDoc.ref('fDraftContent')"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div xid="vSignReport" style="display:none;"> 
    <div component="$UI/system/components/justep/controlGroup/controlGroup"
      class="x-control-group" title="签报信息" xid="controlGroup5"> 
      <div class="x-control-group-title" xid="controlGroupTitle7"> 
        <span xid="span13">title</span> 
      </div>  
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form6"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row8"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDocSecretLevelName')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDocSecretLevelName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDocExigenceLevelName')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDocExigenceLevelName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fTitle')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fTitle')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fKeyword')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fKeyword')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="attSignTemplate"> 
              <label class="x-label" xid="label40" bind-text="dDoc.label('fTemplate')"
                style="width:100px;"/>  
              <div class="x-edit" xid="div50"> 
                <div component="$UI/system/components/justep/attachment/attachmentPC"
                  access="duud" xid="attachmentPC3" bind-ref="dDoc.ref('fTemplate')"
                  subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
                  <div class="x-attachment-pc" xid="div9"> 
                    <div class="x-attachment-content x-card-border" xid="div10"> 
                      <div class="x-doc-process" xid="div11"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="div12"/> 
                      </div>  
                      <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                        xid="div13"> 
                        <div class="x-attachment-cell x-attachment-item" xid="div14"> 
                          <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                            xid="div15"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a1"/> 
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div16"> 
                        <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div17"/> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div18"> 
                        <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)"
                          xid="div19"/> 
                      </div>  
                      <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div20"> 
                        <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div21"/> 
                      </div>  
                      <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?'flex':'none'}"
                        xid="div22"> 
                        <div class="x-item-name" xid="div44"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                            xid="a2"/>  
                          <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                            xid="span10"/> 
                        </div>  
                        <div class="x-item-edit" xid="div45"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                            xid="a3">编辑</a> 
                        </div>  
                        <div class="x-item-download" xid="div46"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                            xid="a4">历史</a> 
                        </div>  
                        <div class="x-item-download" xid="div47"> 
                          <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                            xid="a5">下载</a> 
                        </div>  
                        <div class="x-item-delete" xid="div48"> 
                          <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                            xid="a6">删除</a> 
                        </div> 
                      </div>  
                      <div style="clear:both;" xid="div49"/> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDocKindName')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDocKindName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDocNumber')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDocNumber')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fIssueDate')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fIssueDate')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit2"> 
              <label class="x-label" xid="label9" style="width:100px;" bind-text="dDoc.label('fContent')"/>  
              <div class="x-edit" xid="div53"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea1" bind-ref="dDoc.ref('fContent')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDraftPerName')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDraftPerName')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDraftPerPhone')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDraftPerPhone')"/> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelOutput18"> 
              <label class="x-label" xid="label39" bind-text="dDoc.label('fDraftTime')"
                style="width:100px;"/>  
              <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
                xid="output32" bind-ref="dDoc.ref('fDraftTime')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div xid="vBizFile"> 
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="form5">
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row7"> 
      <div class="col col-xs-12 col-lg-12" xid="col28">
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelEdit13"> 
          <label class="x-label" xid="label7" style="width:100px;"><![CDATA[附件]]></label>  
          <div class="x-edit" xid="div1">
            <div component="$UI/system/components/justep/attachment/attachmentPC"
              access="duud" xid="BizFile" bind-ref="dDoc.ref('fAttachment')" subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"
              style="height:100%;width:100%;"> 
              <div class="x-attachment-pc" xid="div51"> 
                <div class="x-attachment-content x-card-border" xid="div52"> 
                  <div class="x-doc-process" xid="div54"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="div55"/>
                  </div>  
                  <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
                    xid="div56"> 
                    <div class="x-attachment-cell x-attachment-item" xid="div57"> 
                      <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
                        xid="div58"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a13"/>
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
                    xid="div66"> 
                    <div class="x-item-name" xid="div71"> 
                      <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
                        xid="a14"/>  
                      <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
                        xid="span14"/>
                    </div>  
                    <div class="x-item-edit" xid="div72"> 
                      <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
                        xid="a15">编辑</a>
                    </div>  
                    <div class="x-item-download" xid="div73"> 
                      <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
                        xid="a16">历史</a>
                    </div>  
                    <div class="x-item-download" xid="div74"> 
                      <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
                        xid="a17">下载</a>
                    </div>  
                    <div class="x-item-delete" xid="div75"> 
                      <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
                        xid="a18">删除</a>
                    </div> 
                  </div>  
                  <div style="clear:both;" xid="div76"/>
                </div> 
              </div> 
            </div>
          </div>
        </div>
      </div> 
    </div> 
    </div>
    
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:106px;top:144px;"/>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dDoc" autoFilter="false" autoSave="false" autoStart="false" autoClose="false"/> 
</div>
