<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:328px;top:356px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDoc" concept="OA_DC_Doc"
      onBeforeSave="dDocBeforeSave" onValueChanged="dDocValueChanged" limit="1" autoLoad="false"
      autoNew="true"> 
      <reader xid="default1" action="/OA/doc/logic/action/queryOA_DC_DocAction"/>  
      <writer xid="default2" action="/OA/doc/logic/action/saveOA_DC_DocAction"/>  
      <creator xid="default3" action="/OA/doc/logic/action/createOA_DC_DocAction"/>  
      <rule xid="rule1"> 
        <col name="fTitle" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default7">js:true</expr>  
            <message xid="default9">标题不能为空！</message> 
          </required> 
        </col>  
        <col name="fTemplate" xid="ruleCol7"> 
          <required xid="required7"> 
            <expr xid="default29">js:true</expr>  
            <message xid="default30">正文不能为空！</message> 
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocSecretLevel"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence asc"> 
      <reader xid="default4" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="secretLevelFilter" xid="filter1">OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文密级'</filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocKind"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence asc"> 
      <reader xid="default5" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="kindFilter" xid="filter2">OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文文种'</filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocExigenceLevel"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence asc"> 
      <reader xid="default6" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="exigenceLevelFilter" xid="filter3">OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文紧急程度'</filter> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dDoc" style="height:24px;width:24px;left:533px;top:432px;" autoStart="true"
    autoSave="true"/>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="mainBar"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="saveBtn" onClick="{operation:'dDoc.save'}"> 
      <i xid="i1"/>  
      <span xid="span1"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="advanceBtn" onClick="{operation:'process.advance'}"> 
      <i xid="i2"/>  
      <span xid="span2">流转</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="chartBtn" onClick="{operation:'process.showChart'}" label="流程图"> 
      <i xid="i11"/>  
      <span xid="span12">流程图</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="流程记录" xid="recordBtn" onClick="{operation:'process.processRecord'}"> 
      <i xid="i12"/>  
      <span xid="span13">流程记录</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link"
      label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
      <i xid="i16"/>  
      <span xid="span16">更多</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="文件关联" xid="trgViewRelevance" bind-visible="$model.btnvisible(&quot;trgViewRelevance&quot;)"
      onClick="trgViewRelevanceClick"> 
      <i xid="i5"/>  
      <span xid="span5">文件关联</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="transferItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="转发" xid="transferBtn" onClick="{operation:'process.transfer'}"> 
          <i xid="i3"/>  
          <span xid="span3">转发</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="暂停" xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i9"/>  
          <span xid="span8">暂停</span> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="终止" xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i10"/>  
          <span xid="span9">终止</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div xid="content"/>  
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="default8"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="default10"> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelEdit1"> 
          <label class="x-label" xid="DocSecretLevelL" style="width:100px;"><![CDATA[密级]]></label>  
          <div class="x-edit" xid="div1"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
              xid="fDocSecretLevel" bind-ref="dDoc.ref('fDocSecretLevel')" bind-labelRef="dDoc.ref('fDocSecretLevelName')"> 
              <option xid="option1" data="dDocSecretLevel" value="OA_Pub_BaseCode"
                label="fName"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4 pull-right" xid="col3"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelEdit2"> 
          <label class="x-label" xid="DocExigenceLevelL" style="width:100px;"><![CDATA[快慢等级]]></label>  
          <div class="x-edit" xid="div2"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
              xid="DocExigenceLevel" bind-ref="dDoc.ref('fDocExigenceLevel')" bind-labelRef="dDoc.ref('fDocExigenceLevelName')"> 
              <option xid="option2" data="dDocExigenceLevel" value="OA_Pub_BaseCode"
                label="fName"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit4"> 
          <label class="x-label" xid="titleL" style="width:100px;"><![CDATA[文件标题]]></label>  
          <div class="x-edit" xid="div4"> 
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="iptTitle" bind-ref="dDoc.ref('fTitle')" /> 
          </div> 
        </div> 
      </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col5"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit3"> 
          <label class="x-label" xid="keywordL" style="width:100px;">主题词</label>  
          <div class="x-edit" xid="div3"> 
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="iptKeyword" bind-ref="dDoc.ref('fKeyword')" /> 
          </div> 
        </div> 
      </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col14"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit8"> 
          <label class="x-label" xid="ZWL" style="width:100px;"><![CDATA[正文]]></label>  
          <div class="x-edit" xid="div8"> 
            <div component="$UI/system/components/justep/attachment/attachmentPC" access="duud" xid="AttachmentZW" bind-ref="dDoc.ref('fTemplate')" subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))" onOfficeLoaded="AttachmentZWOfficeLoaded"> 
              <div class="x-attachment-pc" xid="div14"> 
                <div class="x-attachment-content x-card-border" xid="div15"> 
                  <div class="x-doc-process" xid="div16"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div17" /> 
                  </div>  
                  <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems" xid="div18"> 
                    <div class="x-attachment-cell x-attachment-item" xid="div19"> 
                      <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}" xid="div20"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a2" /> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div21"> 
                    <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div22" /> 
                  </div>  
                  <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div23"> 
                    <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)" xid="div24" /> 
                  </div>  
                  <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div25"> 
                    <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div26" /> 
                  </div>  
                  <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?'flex':'none'}" xid="div27"> 
                    <div class="x-item-name" xid="div28"> 
                      <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()" href="javascript:void(0)" xid="a3" />  
                      <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())" xid="span4" /> 
                    </div>  
                    <div class="x-item-edit" xid="div29"> 
                      <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())" href="javascript:void(0)" xid="a4">编辑</a> 
                    </div>  
                    <div class="x-item-download" xid="div30"> 
                      <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())" href="javascript:void(0)" xid="a5">历史</a> 
                    </div>  
                    <div class="x-item-download" xid="div31"> 
                      <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())" href="javascript:void(0)" xid="a6">下载</a> 
                    </div>  
                    <div class="x-item-delete" xid="div32"> 
                      <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())" href="javascript:void(0)" xid="a7">删除</a> 
                    </div> 
                  </div>  
                  <div style="clear:both;" xid="div33" /> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit5"> 
          <label class="x-label" xid="docKindL" style="width:100px;"><![CDATA[公文种类]]></label>  
          <div class="x-edit" xid="div5"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="fDocKind" bind-ref="dDoc.ref('fDocKind')" bind-labelRef="dDoc.ref('fDocKindName')"> 
              <option xid="option3" data="dDocKind" value="OA_Pub_BaseCode" label="fName" />
            </div>
          </div> 
        </div> 
      </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit6"> 
          <label class="x-label" xid="DocNumberL" style="width:100px;"><![CDATA[签报号]]></label>  
          <div class="x-edit" xid="div6"> 
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="iptDocNumber" bind-ref="dDoc.ref('fDocNumber')" /> 
          </div> 
        </div> 
      </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit7"> 
          <label class="x-label" xid="IssueDateL" style="width:100px;"><![CDATA[签报日期]]></label>  
          <div class="x-edit" xid="div7"> 
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="iptIssueDate" bind-ref="dDoc.ref('fIssueDate')" /> 
          </div> 
        </div> 
      </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col17"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit9"> 
          <label class="x-label" xid="ContentL" style="width:100px;"><![CDATA[备注]]></label>  
          <div class="x-edit" xid="div9"> 
            <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="iptContent" bind-ref="dDoc.ref('fContent')" /> 
          </div> 
        </div> 
      </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col20"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit10"> 
          <label class="x-label" xid="DraftPerNameL" style="width:100px;"><![CDATA[拟办人]]></label>  
          <div class="x-edit" xid="div10"> 
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="optDraftPerName" bind-ref="dDoc.ref('fDraftPerName')" /> 
          </div> 
        </div> 
      </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col21"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit11"> 
          <label class="x-label" xid="DraftPerPhoneL" style="width:100px;"><![CDATA[拟办人电话]]></label>  
          <div class="x-edit" xid="div11"> 
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="iptDraftPerPhone" bind-ref="dDoc.ref('fDraftPerPhone')" /> 
          </div> 
        </div> 
      </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col22"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit12"> 
          <label class="x-label" xid="DraftTimeL" style="width:100px;"><![CDATA[拟办日期]]></label>  
          <div class="x-edit" xid="div12"> 
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="iptDraftTime" bind-ref="dDoc.ref('fDraftTime')" /> 
          </div> 
        </div> 
      </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col23"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit13"> 
          <label class="x-label" xid="label13" style="width:100px;"><![CDATA[附件]]></label>  
          <div class="x-edit" xid="div13"> 
            <div component="$UI/system/components/justep/attachment/attachment" access="duud" xid="BizFile" bind-ref="dDoc.ref('fAttachment')" subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
              <div class="x-attachment" xid="div54"> 
                <div class="x-attachment-content x-card-border" xid="div55"> 
                  <div class="x-doc-process" xid="div56"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div57" /> 
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div58"> 
                    <div class="x-attachment-cell" xid="div59"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div60"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a14" /> 
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div61"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div62" /> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div63"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div64" /> 
                  </div>  
                  <div style="clear:both;" xid="div65" /> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div></div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgViewRelevance"
    src="$UI/OA/doc/process/dialog/viewRelevance/viewRelevance.w" title="查看文件关联" onClose="dlgViewRelevanceClose"
    status="normal"/>  
  </div>
