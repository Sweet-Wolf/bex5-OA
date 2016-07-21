<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="mdDoc" style="height:auto;left:125px;top:41px;"
    onLoad="mdDocLoad" onModelConstructDone="mdDocModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDoc" concept="OA_DC_Doc"
      onBeforeSave="dDocBeforeSave" onValueChanged="dDocValueChanged" limit="1" autoLoad="true"> 
      <reader xid="default1" action="/OA/doc/logic/action/queryOA_DC_DocAction"/>  
      <writer xid="default2" action="/OA/doc/logic/action/saveOA_DC_DocAction"/>  
      <creator xid="default3" action="/OA/doc/logic/action/createOA_DC_DocAction"/>  
      <rule xid="rule1">
   <col name="fTitle" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default7">js:true</expr>
     <message xid="default9">标题不能为空！</message></required> </col> 
   <col name="fKeyword" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default10">js:true</expr>
     <message xid="default11">主题词不能为空！</message></required> </col> 
   <col name="fDocNumber" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default12">js:true</expr>
     <message xid="default13">收文编号不能为空！</message></required> </col> 
   <col name="fSourceDocNumber" xid="ruleCol6">
    <required xid="required6">
     <expr xid="default18">js:true</expr>
     <message xid="default19">来文字号不能为空！</message></required> </col> 
   <col name="fIssueDate" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default14">js:true</expr>
     <message xid="default15">收文日期不能为空</message></required> </col> 
   <col name="fDocKind" xid="ruleCol5">
    <required xid="required5">
     <expr xid="default16">js:true</expr>
     <message xid="default17">公文种类不能为空</message></required> </col> 
   <col name="fTemplate" xid="ruleCol7">
    <required xid="required7">
     <expr xid="default29">js:true</expr>
     <message xid="default30">正文不能为空！</message></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocSecretLevel"
      concept="OA_Pub_BaseCode"> 
      <reader xid="default4" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="secretLevelFilter" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文密级']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocKind"
      concept="OA_Pub_BaseCode"> 
      <reader xid="default5" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="kindFilter" xid="filter2"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文文种']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocExigenceLevel"
      concept="OA_Pub_BaseCode"> 
      <reader xid="default6" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="exigenceLevelFilter" xid="filter3"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文紧急程度']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="OrgData" idColumn="fID"> 
      <column label="组织ID" name="fID" type="String" xid="column6"/>  
      <column label="名称" name="fName" type="String" xid="column7"/>  
      <column label="全路径" name="fFID" type="String" xid="column5"/> 
    </div> 
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
      label="打印" xid="printBtn" onClick="printBtnClick" bind-enable="$model.btnreadOnly(&quot;printBtn&quot;)" icon="icon-printer"> 
      <i xid="i4" class="icon-printer"/>  
      <span xid="span4">打印</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="文件关联" xid="trgViewRelevance" onClick="trgViewRelevanceClick" bind-visible="$model.btnvisible(&quot;trgViewRelevance&quot;)"> 
      <i xid="i5"/>  
      <span xid="span5">文件关联</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="传阅" xid="trgReaderRangeSet" onClick="trgReaderRangeSetClick"> 
      <i xid="i6"/>  
      <span xid="span6">传阅</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="传阅情况" xid="trgReadeOpinion" onClick="trgReadeOpinionClick"> 
      <i xid="i7"/>  
      <span xid="span7">传阅情况</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="文件发布" xid="trgDocPublish" onClick="trgDocPublishClick" bind-visible="$model.btnvisible(&quot;trgDocPublish&quot;)"> 
      <i xid="i8"/>  
      <span xid="span10">文件发布</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dDoc" style="height:24px;width:24px;left:0px;top:200px;" autoStart="true"
    autoSave="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgViewRelevance"
    src="$UI/OA/doc/process/dialog/viewRelevance/viewRelevance.w" title="查看文件关联" status="normal"
    onClose="dlgViewRelevanceClose"/>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="orgDialog" style="left:520px;top:186px;" selectFilter="js:$row.val('sOrgKindID')==='psm'"
    multiSelection="true" cascade="true" onReceive="orgDialogReceive" status="normal"
    width="60%" height="55%"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/system/components/justep/common/demo/dialog.w" style="left:522px;top:145px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgTreeMultiOrg"
    src="$UI/OA/doc/process/dialog/orgSelect/mainActivity.w" status="normal" width="40%"
    onReceive="dlgTreeMultiOrgReceive" title="选择来文单位" showTitle="true"/>  
  <div xid="content"> 
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="default8"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col9"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="fNOL" style="width:100px;"><![CDATA[公文标题]]></label>  
            <div class="x-edit" xid="div1"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="dDoc.ref('fTitle')" xid="fTitle"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit2"> 
            <label class="x-label" xid="orderDateL" style="width:100px;">主题词</label>  
            <div class="x-edit" xid="div2"> 
              <div class="input-group" xid="inputGroup1"> 
                <input type="text" class="form-control" xid="input2" bind-ref="dDoc.ref('fKeyword')"
                  style="border-right-style:none;" bind-value="dDoc.ref('fKeyword')"/>  
                <div class="input-group-addon" xid="span14" style="background-color:transparent;border-left-style:none;"
                  bind-click="KeyWordBtnClick"> 
                  <i xid="i11" class="icon-android-search"/> 
                </div> 
              </div> 
            </div>  
           
          </div>
        </div> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit3"> 
            <label class="x-label" xid="fSourceDeptL" style="width:100px;">来文单位</label>  
            <div class="x-edit" xid="div3"> 
              <div class="input-group" xid="inputGroup2"> 
                <input type="text" class="form-control" xid="inputunit" style="border-right-style:none;" bind-value="dDoc.ref('fSourceDept')" />  
                <div class="input-group-addon" xid="span15" style="background-color:transparent;border-left-style:none;" bind-click="SourceDeptBtnClick"> 
                  <i xid="i111" class="icon-android-search" /> 
                </div> 
              </div> 
            </div>  
            
          </div>
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit4"> 
            <label class="x-label" xid="fSourceDateL" style="width:100px;"><![CDATA[来文日期]]></label>  
            <div class="x-edit" xid="div4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="dDoc.ref('fSourceDate')" xid="fSourceDate" format="yyyy-MM-dd" /> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit5"> 
            <label class="x-label" xid="fSourceDocNumberL" style="width:100px;"><![CDATA[来文字号]]></label>  
            <div class="x-edit" xid="div5"> 
              <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="dDoc.ref('fSourceDocNumber')" xid="fSourceDocNumber" /> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit6"> 
            <label class="x-label" xid="fTemplateL" style="width:100px;"><![CDATA[正文]]></label>  
            <div class="x-edit" xid="div6"> 
              <div component="$UI/system/components/justep/attachment/attachment" access="duud" xid="AttachmentZW" bind-ref="dDoc.ref('fTemplate')" subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
                <div class="x-attachment" xid="div24"> 
                  <div class="x-attachment-content x-card-border" xid="div25"> 
                    <div class="x-doc-process" xid="layoutWizard1"> 
                      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="layoutWizard2" /> 
                    </div>  
                    <div data-bind="foreach:$attachmentItems" xid="div26"> 
                      <div class="x-attachment-cell" xid="div27"> 
                        <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div28"> 
                          <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a3" /> 
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div29"> 
                      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div30" /> 
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div31"> 
                      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div32" /> 
                    </div>  
                    <div style="clear:both;" xid="div33" /> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col27"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit7"> 
            <label class="x-label" xid="fDocNumberL" style="width:100px;"><![CDATA[收文编号]]></label>  
            <div class="x-edit" xid="div7"> 
              <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="dDoc.ref('fDocNumber')" xid="fDocNumber" /> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit8"> 
            <label class="x-label" xid="fDocKindL" style="width:100px;"><![CDATA[公文种类]]></label>  
            <div class="x-edit" xid="div8"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="selDocKind" bind-ref="dDoc.ref('fDocKind')" bind-labelRef="dDoc.ref('fDocKindName')">
   <option xid="option2" data="dDocKind" value="OA_Pub_BaseCode" label="fName"></option></div></div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col29"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit9"> 
            <label class="x-label" xid="fDocExigenceLevelL" style="width:100px;"><![CDATA[紧急程度]]></label>  
            <div class="x-edit" xid="div9"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="selDocExigence" bind-ref="dDoc.ref('fDocExigenceLevel')" bind-labelRef="dDoc.ref('fDocExigenceLevelName')">
   <option xid="option3" data="dDocExigenceLevel" value="OA_Pub_BaseCode" label="fName"></option></div></div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col30"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit10"> 
            <label class="x-label" xid="fDocSecretLevelL" style="width:100px;"><![CDATA[密级]]></label>  
            <div class="x-edit" xid="div10"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="selDocSecret" bind-ref="dDoc.ref('fDocSecretLevel')" bind-labelRef="dDoc.ref('fDocSecretLevelName')">
   <option xid="option4" data="dDocSecretLevel" value="OA_Pub_BaseCode" label="fName"></option></div></div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit12"> 
            <label class="x-label" xid="fkeepSecretL" style="width:100px;">保密期限</label>  
            <div class="x-edit" xid="div12"> 
              <div class="input-group" xid="inputGroup3"> 
                <input type="text" class="form-control" xid="inputYear" style="border-right-style:none;" bind-value="dDoc.ref('fYear')" />  
                <span class="input-group-addon" xid="span19" style="background-color:transparent;border-left-style:none;border-right-style:none;"><![CDATA[年]]></span>  
                <input type="text" class="form-control" xid="inputmonth" bind-value="dDoc.ref('fMonth')" style="border-right-style:none;" />  
                <span class="input-group-addon" xid="span20" style="background-color:transparent;border-left-style:none;"><![CDATA[月]]></span> 
              </div> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col38"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit11"> 
            <label class="x-label" xid="fPagesL" style="width:100px;"><![CDATA[页数]]></label>  
            <div class="x-edit" xid="div11"> 
              <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="dDoc.ref('fPages')" xid="fPages" /> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col43"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit15"> 
            <label class="x-label" xid="fCopiesL" style="width:100px;"><![CDATA[份数]]></label>  
            <div class="x-edit" xid="div15"> 
              <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="dDoc.ref('fCopies')" xid="fCopies" /> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col44"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit16"> 
            <label class="x-label" xid="fIssueDateL" style="width:100px;"><![CDATA[收文日期]]></label>  
            <div class="x-edit" xid="div16"> 
              <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="dDoc.ref('fIssueDate')" xid="fIssueDate" /> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col45"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit17"> 
            <label class="x-label" xid="label3" style="width:100px;"><![CDATA[拟办]]></label>  
            <div class="x-edit" xid="div17"> 
              <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="dDoc.ref('fDraftContent')" /> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit18"> 
            <label class="x-label" xid="label4" style="width:100px;"><![CDATA[内容]]></label>  
            <div class="x-edit" xid="div18"> 
              <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dDoc.ref('fContent')" /> 
            </div> 
          </div> 
        </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col5"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit19"> 
            <label class="x-label" xid="label5" style="width:100px;"><![CDATA[附件]]></label>  
            <div class="x-edit" xid="div19"> 
              <div component="$UI/system/components/justep/attachment/attachment" access="duud" xid="BizFile" bind-ref="dDoc.ref('fAttachment')" subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
                <div class="x-attachment" xid="layoutWizard14"> 
                  <div class="x-attachment-content x-card-border" xid="layoutWizard8"> 
                    <div class="x-doc-process" xid="layoutWizard5"> 
                      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="layoutWizard6" /> 
                    </div>  
                    <div data-bind="foreach:$attachmentItems" xid="layoutWizard9"> 
                      <div class="x-attachment-cell" xid="layoutWizard10"> 
                        <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="layoutWizard11"> 
                          <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1" /> 
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="layoutWizard7"> 
                      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="layoutWizard4" /> 
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="layoutWizard3"> 
                      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="layoutWizard12" /> 
                    </div>  
                    <div style="clear:both;" xid="layoutWizard13" /> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div></div>  
      </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgReadeOpinion"
    src="$UI/OA/doc/process/dialog/readerOpinionView/readerOpinionView.w" title="传阅情况"
    showTitle="true" status="normal" forceRefreshOnOpen="true" style="left:65px;top:60px;"
    width="60%" height="60%"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="dlgTreeMultiPsn"
    style="left:395px;top:301px;" title="选择范围设置" multiSelection="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgKeyWord"
    src="$UI/OA/common/process/keyWordSelect/keyWordSelect.w" title="主题词选择向导" showTitle="true"
    status="normal" height="80%" width="80%" onReceive="wDlgKeyWordReceive"/> 
</div>
