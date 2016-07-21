<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:282px;top:229px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDoc" directDelete="true"
      autoLoad="false" concept="OA_DC_Doc" orderBy="" columns="" autoNew="true" limit="1" onValueChanged="dDocValueChanged" onBeforeSave="dDocBeforeSave"> 
      <reader action="/OA/doc/logic/action/queryReadDocAction"/>  
      <writer action="/OA/doc/logic/action/saveOA_DC_DocAction"/>  
      <creator action="/OA/doc/logic/action/createOA_DC_DocAction"/>  
      <rule xid="rule1">
   <readonly xid="readonly1">
    <expr xid="default4">$model.getContext().getRequestParameter('activity-pattern') == 'detail'</expr></readonly> 
   <col name="fTitle" xid="ruleCol1">
    <readonly xid="readonly4">
     <expr xid="default8">!$model.contains($model.getContext().getActivity(),['startActivity','draftActivity'])</expr></readonly> 
    <required xid="required1">
     <expr xid="default5">true</expr>
     <message xid="default9"></message></required> 
    <constraint xid="CfTitle">
     <expr xid="default10">$model.checkTitle() == 0</expr>
     <message xid="default11">标题不能重复且不能为空！</message></constraint> </col> 
   <col name="fKeyword" xid="ruleCol2">
    <readonly xid="required2">
     <expr xid="default17">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity'])</expr></readonly> </col> 
   <col name="fDocNumber" xid="ruleCol3">
    <readonly xid="readonly2">
     <expr xid="default19">!$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr></readonly> </col> 
   <col name="fSponsorDept" xid="ruleCol6">
    <readonly xid="readonly5">
     <expr xid="default12">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity'])</expr></readonly> </col> 
   <col name="fDocExigenceLevel" xid="ruleCol4">
    <readonly xid="readonly2">
     <expr xid="default22">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity'])</expr></readonly> </col> 
   <col name="fDocSecretLevel" xid="ruleCol5">
    <readonly xid="readonly3">
     <expr xid="default23">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity'])</expr></readonly> </col> 
   <col name="fOrgLetter" xid="ruleCol7">
    <readonly xid="readonly6">
     <expr xid="default13">!$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr></readonly> 
    <required xid="required3">
     <expr xid="default14">$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr>
     <message xid="default15">机构代字不能为空！</message></required> </col> 
   <col name="fIssueDate" xid="ruleCol8">
    <readonly xid="readonly7">
     <expr xid="default16">!$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr></readonly> </col> 
   <col name="fCopies" xid="ruleCol9">
    <readonly xid="readonly8">
     <expr xid="default18">!$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr></readonly> </col> 
   <col name="fMainDestDept" xid="ruleCol10">
    <readonly xid="readonly9">
     <expr xid="default20">$model.contains($model.getContext().getActivity(),['dispenseActivity'])</expr></readonly> 
    <required xid="required4">
     <expr xid="default21">true</expr>
     <message xid="default24">主送不能为空！</message></required> </col> 
   <col name="fCopyDestDept" xid="ruleCol11">
    <readonly xid="readonly10">
     <expr xid="default25">$model.contains($model.getContext().getActivity(),['dispenseActivity'])</expr></readonly> </col> 
   <col name="fDraftPerName" xid="ruleCol12">
    <readonly xid="readonly11">
     <expr xid="default26">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity'])</expr></readonly> </col> 
   <col name="fDraftPerPhone" xid="ruleCol13">
    <readonly xid="readonly12">
     <expr xid="default27">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity'])</expr></readonly> </col> 
   <col name="fDraftTime" xid="ruleCol14">
    <readonly xid="readonly13">
     <expr xid="default28">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity'])</expr></readonly> </col> 
   <col name="fSignOpinion" xid="ruleCol15">
    <readonly xid="readonly14">
     <expr xid="default29">true</expr></readonly> </col> 
   <col name="fTypePerName" xid="ruleCol16">
    <readonly xid="readonly15">
     <expr xid="default30">true</expr></readonly> </col> 
   <col name="fProofReader" xid="ruleCol17">
    <readonly xid="readonly16">
     <expr xid="default31">true</expr></readonly> </col> 
   <col name="fAttachment" xid="ruleCol18">
    <readonly xid="readonly17">
     <expr xid="default32">true</expr></readonly> </col> 
   <col name="fDocKind" xid="ruleCol19">
    <readonly xid="readonly18">
     <expr xid="default33">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity'])</expr></readonly> </col> 
   <col name="fYear" xid="ruleCol20">
    <readonly xid="readonly19">
     <expr xid="default34">!$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr></readonly> </col> 
   <col name="fMonth" xid="ruleCol21">
    <readonly xid="readonly20">
     <expr xid="default35">!$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr></readonly> </col> 
   <col name="fDay" xid="ruleCol22">
    <readonly xid="readonly21">
     <expr xid="default36">!$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr></readonly> </col> 
   <col name="fOrgYear" xid="ruleCol23">
    <readonly xid="readonly22">
     <expr xid="default37">!$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr></readonly> 
    <required xid="required5">
     <expr xid="default38">$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr>
     <message xid="default39">年份不能为空！</message></required> </col> 
   <col name="fOrgNum" xid="ruleCol24">
    <readonly xid="readonly23">
     <expr xid="default40">!$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr></readonly> 
    <required xid="required6">
     <expr xid="default41">$model.contains($model.getContext().getActivity(),['registerNumActivity'])</expr>
     <message xid="default42">编号不能为空且不能重复！</message></required> </col> 
   <col name="fAttachmentName" xid="ruleCol25">
    <readonly xid="readonly24">
     <expr xid="default43">true</expr></readonly> </col> 
   <col name="fSuperPrintPsnName" xid="ruleCol26">
    <readonly xid="readonly25">
     <expr xid="default44">!$model.contains($model.getContext().getActivity(),['dispenseActivity'])</expr></readonly> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocSecretLevel"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence asc"> 
      <reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="secretLevelFilter" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文密级']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocExigenceLevel"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence asc"> 
      <reader xid="default2" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="exigenceLevelFilter" xid="filter2"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文紧急程度']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dOrgLetter"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence asc"> 
      <reader xid="default3" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default6"/>  
      <creator xid="default7"/>  
      <filter name="orgFilter" xid="filter3"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='发文机关代字']]></filter> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dDoc"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      </ul> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="mainBar"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="advanceBtn" onClick="{operation:'process.advance'}"> 
      <i xid="i2"/>  
      <span xid="span2"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="saveBtn" onClick="{operation:'dDoc.save'}"> 
      <i xid="i1"/>  
      <span xid="span1"/> 
    </a>  
    <!--   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnPrint" icon="icon-android-printer"> -->  
    <!--    <i xid="i12" class="icon-android-printer"></i> -->  
    <!--    <span xid="span12"></span></a> -->  
    <!--   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnPrintView" icon="icon-android-image"> -->  
    <!--    <i xid="i13" class="icon-android-image"></i> -->  
    <!--    <span xid="span13"></span></a> -->  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="流程图" xid="chartBtn" onClick="{operation:'process.showChart'}">
   <i xid="i12"></i>
   <span xid="span12">流程图</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="流程记录" xid="RecordBtn" onClick="{operation:'process.processRecord'}">
   <i xid="i13"></i>
   <span xid="span13">流程记录</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label" label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
      <i xid="i15" class="icon-ios7-more" />  
      <span xid="span15">更多</span> 
    </a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="btnViewRelevance" label="文件关联" onClick="btnViewRelevanceClick" bind-visible='$model.btnvisible("btnViewRelevance")'> 
      <i xid="i14"/>  
      <span xid="span14">文件关联</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="阅文设置" xid="btnReaderRangeSet" onClick="btnReaderRangeSetClick" bind-visible='$model.btnvisible("btnReaderRangeSet")'> 
      <i xid="i16"/>  
      <span xid="span16">阅文设置</span> 
    </a>  
     
  </div>  
  <div component="$UI/system/components/justep/excelLayout/excelLayout" class="x-excel-layout"
    style="width:100%; height: 100%;" xid="excelLayout1" src="sendDocPaper.xml"> 
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
      xid="sltOrgLetter" bind-ref="dDoc.ref('fOrgLetter')" bind-labelRef="dDoc.ref('fOrgLetterName')"> 
      <option xid="option1" data="dOrgLetter" label="fName" value="OA_Pub_BaseCode"/> 
    </div>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptOrgYear" bind-ref="dDoc.ref('fOrgYear')"/>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptOrgNum" bind-ref="dDoc.ref('fOrgNum')"/>  
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
      xid="sltDocExigenceLevel" bind-ref="dDoc.ref('fDocExigenceLevel')" bind-labelRef="dDoc.ref('fDocExigenceLevelName')"> 
      <option xid="option2" data="dDocExigenceLevel" label="fName" value="OA_Pub_BaseCode"/> 
    </div>  
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
      xid="sltDocSecretLevel" bind-ref="dDoc.ref('fDocSecretLevel')" bind-labelRef="dDoc.ref('fDocSecretLevelName')"> 
      <option xid="option3" data="dDocSecretLevel" value="OA_Pub_BaseCode" label="fName"/> 
    </div>  
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
      xid="txtSignOpinion" bind-ref="dDoc.ref('fSignOpinion')"/>  
    <div component="$UI/system/components/justep/output/output" class="x-output"
      xid="optSignPerName" bind-ref="dDoc.ref('fSignPerName')"/>  
    <div component="$UI/system/components/justep/output/output" class="x-output"
      xid="optSignTime" bind-ref="dDoc.ref('fSignTime')"/>  
    <div xid="vMeetingText"> 
      <span xid="spanMeetingText"/> 
    </div>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptSponsorDept" bind-ref="dDoc.ref('fSponsorDept')"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
      label="" xid="trgSponsorDept" icon="icon-search" onClick="trgSponsorDeptClick"> 
      <i xid="i6" class="icon-search"/>  
      <span xid="span7"/> 
    </a>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptDraftPsn" bind-ref="dDoc.ref('fDraftPerName')"/>  
    <div component="$UI/system/components/justep/output/output" class="x-output"
      xid="optCheckPerName" bind-ref="dDoc.ref('fCheckPerName')"/>  
    <div component="$UI/system/components/justep/output/output" class="x-output"
      xid="optCheckTime" bind-ref="dDoc.ref('fCheckTime')"/>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptTitle" bind-ref="dDoc.ref('fTitle')"/>  
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
      xid="txtReason" bind-ref="dDoc.ref('fReason')"/>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptMainDestDept" bind-ref="dDoc.ref('fMainDestDept')"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="trgMainDestDept" icon="icon-search" onClick="trgMainDestDeptClick"> 
      <i xid="i7" class="icon-search"/>  
      <span xid="span8"/> 
    </a>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptCopyReportDept" bind-ref="dDoc.ref('fCopyReportDept')"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="trgCopyReportDept" icon="icon-search" onClick="trgCopyReportDeptClick"> 
      <i xid="i9" class="icon-search"/>  
      <span xid="span9"/> 
    </a>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptCopyDestDept" bind-ref="dDoc.ref('fCopyDestDept')"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="trgCopyDestDept" icon="icon-search" onClick="trgCopyDestDeptClick"> 
      <i xid="i10" class="icon-search"/>  
      <span xid="span10"/> 
    </a>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptInternalSendDept" bind-ref="dDoc.ref('fInternalSendDeptName')"/>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="trgInternalSendDept" icon="icon-search" onClick="trgInternalSendDeptClick"> 
      <i xid="i11" class="icon-search"/>  
      <span xid="span11"/> 
    </a>  
    <div component="$UI/system/components/justep/output/output" class="x-output"
      xid="optAttachmentName" bind-ref="dDoc.ref('fAttachmentName')"/>  
    <div component="$UI/system/components/justep/output/output" class="x-output"
      xid="optTypePerName" bind-ref="dDoc.ref('fTypePerName')"/>  
    <div component="$UI/system/components/justep/output/output" class="x-output"
      xid="optProofReader" bind-ref="dDoc.ref('fProofReader')"/>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptSuperPrintPsnName" bind-ref="dDoc.ref('fSuperPrintPsnName')"/>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptCopies" bind-ref="dDoc.ref('fCopies')"/>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptDraftTime" bind-ref="dDoc.ref('fDraftTime')"/>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptYear" bind-ref="dDoc.ref('fYear')"/>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptMonth" bind-ref="dDoc.ref('fMonth')"/>  
    <input component="$UI/system/components/justep/input/input" class="form-control"
      xid="iptDay" bind-ref="dDoc.ref('fDay')"/> 
  </div>  
  <div component="$UI/system/components/justep/attachment/attachmentPC" access="duud"
    xid="BizFile" bind-ref="dDoc.ref('fAttachment')" subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
    <div class="x-attachment-pc" xid="div1"> 
      <div class="x-attachment-content x-card-border" xid="div2"> 
        <div class="x-doc-process" xid="div3"> 
          <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;"
            xid="div4"/> 
        </div>  
        <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems"
          xid="div5"> 
          <div class="x-attachment-cell x-attachment-item" xid="div6"> 
            <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}"
              xid="div7"> 
              <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget"
                xid="a1"/> 
            </div> 
          </div> 
        </div>  
        <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
          xid="div8"> 
          <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
            xid="div9"/> 
        </div>  
        <!--         <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" -->  
        <!--           xid="div10">  -->  
        <!--           <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)" -->  
        <!--             xid="div11"/> -->  
        <!--         </div>   -->  
        <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
          xid="div12"> 
          <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
            xid="div13"/> 
        </div>  
        <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?'flex':'none'}"
          xid="div14"> 
          <div class="x-item-name" xid="div15"> 
            <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()"
              xid="a2"/>  
            <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())"
              xid="span17"/> 
          </div>  
          <div class="x-item-edit" xid="div16"> 
            <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())"
              xid="a3">编辑</a> 
          </div>  
          <div class="x-item-download" xid="div17"> 
            <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())"
              xid="a4">历史</a> 
          </div>  
          <div class="x-item-download" xid="div18"> 
            <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())"
              xid="a5">下载</a> 
          </div>  
          <div class="x-item-delete" xid="div19"> 
            <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())"
              xid="a6">删除</a> 
          </div> 
        </div>  
        <div style="clear:both;" xid="div20"/> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="dlgTreeMultiPsn" title="选择范围设置" status="normal" onReceive="dlgTreeMultiPsnReceive"
    includeOrgKind="ogn,dpt,pos,psm" multiSelection="true"/>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="dlgTreeMultiOrg" title="选择单位" status="normal" onReceive="dlgTreeMultiOrgReceive"
    multiSelection="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgViewRelevance"
    src="$UI/OA/doc/process/dialog/viewRelevance/viewRelevance.w" title="查看文件关联" showTitle="true"
    status="normal" onReceive="dlgViewRelevanceReceive"/> 
</div>
