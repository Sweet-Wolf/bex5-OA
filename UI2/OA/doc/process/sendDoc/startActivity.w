<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc"
  xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:114px;top:248px;"
    onModelConstructDone="modelModelConstructDone" onModelConstruct="modelModelConstruct"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDoc" directDelete="true"
      autoLoad="false" concept="OA_DC_Doc" orderBy="" columns="" autoNew="false" limit="1"
      onValueChanged="dDocValueChanged" onBeforeSave="dDocBeforeSave"> 
      <reader action="/OA/doc/logic/action/queryReadDocAction"/>  
      <writer action="/OA/doc/logic/action/saveOA_DC_DocAction"/>  
      <creator action="/OA/doc/logic/action/createOA_DC_DocAction"/>  
      <rule xid="rule1">
   <readonly xid="readonly1">
    <expr xid="default4">$model.getContext().getRequestParameter('activity-pattern') == 'detail'</expr></readonly> 
   <col name="fTitle" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default5">$model.contains($model.getContext().getActivity(),['startActivity','signActivity','draftActivity','deptApproveActivity','drafterActivity','secretaryDealActivity','dispenseActivity','registerNumActivity'])</expr>
     <message xid="default6">标题不能为空！</message></required> </col> 
   <col name="fKeyword" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default17">$model.contains($model.getContext().getActivity(),['startActivity','draftActivity','dispenseActivity'])</expr>
     <message xid="default18">主题词不能为空！</message></required> </col> 
   <col name="fDocNumber" xid="ruleCol3">
    <readonly xid="readonly2">
     <expr xid="default19">!$model.contains($model.getContext().getActivity(),['registerNumActivity','dispenseActivity'])</expr></readonly> 
    <constraint xid="constraint1">
     <expr xid="default20">$model.checkDocNumber() == '0'</expr>
     <message xid="default21">发文编号不能重复且不能为空！</message></constraint> </col> 
   <col name="fSponsorDept" xid="xid3">
    <readonly xid="readonly4">
     <expr xid="default24">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity'])</expr></readonly> </col> 
   <col name="fDocExigenceLevel" xid="ruleCol4">
    <readonly xid="readonly2">
     <expr xid="default22">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity'])</expr></readonly> </col> 
   <col name="fDocSecretLevel" xid="ruleCol5">
    <readonly xid="readonly3">
     <expr xid="default23">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity'])</expr></readonly> </col> 
   <col name="fOrgLetter" xid="xid4">
    <readonly xid="readonly5">
     <expr xid="default25">!$model.contains($model.getContext().getActivity(),['registerNumActivity','dispenseActivity'])</expr></readonly> </col> 
   <col name="fIssueDate" xid="xid5">
    <readonly xid="readonly6">
     <expr xid="default26">!$model.contains($model.getContext().getActivity(),['startActivity','draftActivity','deptApproveActivity','drafterActivity','registerNumActivity','dispenseActivity','stampActivity'])</expr></readonly> 
    <required xid="required3">
     <expr xid="default27">$model.contains($model.getContext().getActivity(),['stampActivity'])</expr>
     <message xid="default28">发文日期不能为空</message></required> </col> 
   <col name="fCopies" xid="xid6">
    <readonly xid="readonly7">
     <expr xid="default29">!$model.contains($model.getContext().getActivity(),['startActivity','draftActivity','deptApproveActivity','drafterActivity','registerNumActivity','dispenseActivity', 'stampActivity', 'dispenseActivity'])</expr></readonly> 
    <required xid="required4">
     <expr xid="default30">$model.contains($model.getContext().getActivity(),['startActivity','draftActivity','stampActivity'])</expr>
     <message xid="default31">份数不能为空！</message></required> </col> 
   <col name="fDraftPerName" xid="xid7">
    <readonly xid="readonly8">
     <expr xid="default32">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity'])</expr></readonly> </col> 
   <col name="fDraftPerPhone" xid="xid8">
    <readonly xid="readonly9">
     <expr xid="default33">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity'])</expr></readonly> </col> 
   <col name="fDraftTime" xid="xid9">
    <readonly xid="readonly10">
     <expr xid="default34">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','dispenseActivity','stampActivity'])</expr></readonly> </col> 
   <col name="fCheckPerName" xid="xid10">
    <readonly xid="readonly11">
     <expr xid="default35">!$model.contains($model.getContext().getActivity(),['checkActivity'])</expr></readonly> </col> 
   <col name="fCheckTime" xid="xid11">
    <readonly xid="readonly12">
     <expr xid="default36">!$model.contains($model.getContext().getActivity(),['dispenseActivity'])</expr></readonly> </col> 
   <col name="fTypePerName" xid="xid12">
    <readonly xid="readonly13">
     <expr xid="default37">true</expr></readonly> </col> 
   <col name="fProofReader" xid="xid13">
    <readonly xid="readonly14">
     <expr xid="default38">true</expr></readonly> </col> 
   <col name="fAttachment" xid="xid14">
    <readonly xid="readonly15">
     <expr xid="default39"></expr></readonly> </col> 
   <col name="fDocKind" xid="xid15">
    <readonly xid="readonly16">
     <expr xid="default40">!$model.contains($model.getContext().getActivity(),['startActivity', 'draftActivity','deptApproveActivity','drafterActivity','dispenseActivity','stampActivity'])</expr></readonly> 
    <required xid="required5">
     <expr xid="default41">$model.contains($model.getContext().getActivity(),['startActivity','draftActivity','stampActivity'])</expr>
     <message xid="default42">公文种类不能为空！</message></required> </col> 
   <col name="fTemplate" xid="xid16">
    <required xid="required6">
     <expr xid="default43">true</expr>
     <message xid="default44">正文不能为空！</message></required> </col> 
   <col name="fSuperPrintPsnName" xid="xid17">
    <readonly xid="readonly17">
     <expr xid="default45">!$model.contains($model.getContext().getActivity(),['dispenseActivity'])</expr></readonly> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocSecretLevel"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence asc"> 
      <reader xid="default3" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文密级']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocKind"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence asc"> 
      <reader xid="default7" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default8"/>  
      <creator xid="default9"/>  
      <filter name="kindFilter" xid="filter2"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文文种']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocExigenceLevel"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence asc"> 
      <reader xid="default10" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="exigenceLevelFilter" xid="filter3"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='公文紧急程度']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dOrgLetter"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence asc"> 
      <reader xid="default11" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="orgFilter" xid="filter4"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='发文机关代字']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocView"
      concept="OA_DC_Doc" limit="-1" orderBy="fIssueDate desc"> 
      <reader xid="default12" action="/OA/doc/logic/action/queryReadDocAction"/>  
      <writer xid="default13"/>  
      <creator xid="default14"/>  
      <filter name="filterData" xid="filter5"/> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rDoc"> 
      <source xid="default1"> 
        <action xid="default15" name="sendDocFlowTrackAction" type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rDocDetail"> 
      <source xid="default2"> 
        <action xid="default16" name="sendDocDetailFlowTrackAction" type="action"/> 
      </source> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dTemp" idColumn="fCreatePsnName"><column label="fCreatePsnName" name="fCreatePsnName" type="String" xid="xid1"></column>
  <column label="fUpdateTime" name="fUpdateTime" type="String" xid="xid2"></column></div></div>  
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
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="orgDialogPC" title="选择公文发送单位" multiSelection="true" includeOrgKind="ogn,dpt,pos" status="normal" width="60%" height="55%" onReceive="orgDialogPCReceive"></span><div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="tabDocDetail"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[详细]]></a> 
      </li>  
      <li role="presentation" xid="tabReport" bind-click="tabReportClick"> 
        <a content="tabContent2" xid="tabItem2"><![CDATA[公文流转状态跟踪]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1"> 
        <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
            xid="mainBar"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="saveBtn" onClick="{operation:'dDoc.save'}"> 
              <i xid="i1" />  
              <span xid="span1" /> 
            </a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              xid="advanceBtn" onClick="{operation:'process.advance'}"> 
              <i xid="i2"/>  
              <span xid="span2"/> 
            </a>  
              
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="流程图" xid="button1" onClick="{operation:'process.showChart'}">
   <i xid="i16"></i>
   <span xid="span16">流程图</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="流程记录" xid="button2" onClick="{operation:'process.processRecord'}">
   <i xid="i17"></i>
   <span xid="span17">流程记录</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label"
              label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
              <i xid="i15" class="icon-ios7-more"/>  
              <span xid="span15">更多</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              xid="btnPrint" icon="icon-printer" onClick="btnPrintClick" label="打印"> 
              <i xid="i11" class="icon-printer"/>  
              <span xid="span11">打印</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="文件关联" xid="btnViewRelevance" onClick="btnViewRelevanceClick" bind-visible='$model.btnvisible("btnViewRelevance")'> 
              <i xid="i12"/>  
              <span xid="span12">文件关联</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="传阅" xid="btnReaderRangeSet" onClick="btnReaderRangeSetClick"> 
              <i xid="i13"/>  
              <span xid="span13">传阅</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              label="传阅情况" xid="btnReadeOpinion" onClick="btnReadeOpinionClick"> 
              <i xid="i14"/>  
              <span xid="span14">传阅情况</span> 
            </a> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="公文发送" xid="trgDocSend" bind-visible='$model.btnvisible("trgDocSend")' onClick="trgDocSendClick">
   <i xid="i19"></i>
   <span xid="span19">公文发送</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="文件发布" xid="trgDocPublish" bind-visible='$model.btnvisible("trgDocPublish")' onClick="trgDocPublishClick">
   <i xid="i18"></i>
   <span xid="span18">文件发布</span></a></div>  
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelSelect1">
   <label class="x-label" xid="label1" style="width:100px">快慢等级</label>
   <div class="x-gridSelect x-edit" component="$UI/system/components/justep/gridSelect/gridSelect" xid="sltDocExigenceLevel" bind-ref="dDoc.ref('fDocExigenceLevel')" bind-labelRef="dDoc.ref('fDocExigenceLevelName')">
    <option xid="option1" data="dDocExigenceLevel" label="fName" value="OA_Pub_BaseCode"></option></div> </div></div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4"/>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelOutput1"> 
                <label class="x-label" xid="label5" style="width:100px"><![CDATA[流水号]]></label>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control x-edit" xid="fExtendStr1" bind-ref="dDoc.ref('fExtendStr1')"/> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelSelect2">
   <label class="x-label" xid="label2" style="width:100px">机密程度</label>
   <div class="x-gridSelect x-edit" component="$UI/system/components/justep/gridSelect/gridSelect" xid="sltDocSecretLevel" bind-ref="dDoc.ref('fDocSecretLevel')" bind-labelRef="dDoc.ref('fDocSecretLevelName')">
    <option xid="option2" data="dDocSecretLevel" value="OA_Pub_BaseCode" label="fName"></option></div> </div></div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelSelect3">
   <label class="x-label" xid="label3" style="width:100px">机关代字</label>
   <div class="x-gridSelect x-edit" component="$UI/system/components/justep/gridSelect/gridSelect" xid="sltOrgLetter" bind-ref="dDoc.ref('fOrgLetter')" bind-labelRef="dDoc.ref('fOrgLetterName')">
    <option xid="option3" data="dOrgLetter" label="fName" value="OA_Pub_BaseCode"></option></div> </div></div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput1">
   <label class="x-label" xid="label4" style="width:100px">发文编号</label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="iptDocNum" bind-ref="dDoc.ref('fDocNumber')"></input></div></div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput2"> 
                <label class="x-label" xid="iptTitle" style="width:100px"><![CDATA[文件标题]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="fTitleL" bind-ref="dDoc.ref('fTitle')"/> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col7"> 
               
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit1">
   <label class="x-label" xid="fKeywordL" style="width:100px"><![CDATA[主题词]]></label><div class="x-edit" xid="div14"><div class="input-group" xid="inputGroup2">
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="fKeyword" bind-ref="dDoc.ref('fKeyword')" style="border-right-style:none;"/><div class="input-group-addon" xid="div15" style="background-color:transparent;border-left-style:none;" bind-click="selectKeywordClick">
    <i xid="i111" class="icon-android-search"></i></div></div></div></div></div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput4"> 
                <label class="x-label" xid="fDocKindL" style="width:100px;"><![CDATA[公文种类]]></label>  
                <div class="x-gridSelect x-edit" component="$UI/system/components/justep/gridSelect/gridSelect"
                  xid="fDocKind" bind-ref="dDoc.ref('fDocKind')" bind-labelRef="dDoc.ref('fDocKindName')"> 
                  <option xid="option4" data="dDocKind" value="OA_Pub_BaseCode"
                    label="fName"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col9"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit2">
   <label class="x-label" xid="fSponsorDeptL" style="width:100px;"><![CDATA[拟办单位]]></label><div class="x-edit" xid="div17">
    <div class="input-group" xid="div18">
     <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="fSponsorDept" bind-ref="dDoc.ref('fSponsorDept')" style="border-right-style:none;"/><div class="input-group-addon" xid="div16" style="background-color:transparent;border-left-style:none;" bind-click="trgSponsorDeptClick">
      <i xid="i5" class="icon-android-search"></i></div> </div> </div> </div></div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelTextarea1"> 
                <label class="x-label" xid="fReasonL" style="width:100px;"><![CDATA[事由]]></label>  
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="fReason" bind-ref="dDoc.ref('fReason')"/> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput3">
   
   <label class="x-label" xid="fMainDestDeptL" style="width:100px;"><![CDATA[主送]]></label><div class="x-edit" xid="div19">
    <div class="input-group" xid="div21">
     <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit" xid="fMainDestDept" bind-ref="dDoc.ref('fMainDestDept')" style="border-right-style:none;"/><div class="input-group-addon" xid="div20" style="background-color:transparent;border-left-style:none;" bind-click="trgMainDestDeptClick">
      <i xid="i6" class="icon-android-search"></i></div> </div> </div> </div></div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput5">
   
   <label class="x-label" xid="fCopyDestDeptL" style="width:100px;"><![CDATA[抄送]]></label><div class="x-edit" xid="div22">
    <div class="input-group" xid="div24">
     <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit" xid="fCopyDestDept" bind-ref="dDoc.ref('fCopyDestDept')" style="border-right-style:none;"/><div class="input-group-addon" xid="div23" style="background-color:transparent;border-left-style:none;" bind-click="btnCopyDestDeptClick">
      <i xid="i7" class="icon-android-search"></i></div> </div> </div> </div></div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput6"> 
                <label class="x-label" xid="fDraftPerNameL" style="width:100px;"><![CDATA[拟办人]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="fDraftPerName" bind-ref="dDoc.ref('fDraftPerName')"/> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput7"> 
                <label class="x-label" xid="fDraftTimeL" style="width:100px;"><![CDATA[拟办日期]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="fDraftTime" bind-ref="dDoc.ref('fDraftTime')"/> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col15"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelInput8"> 
                <label class="x-label" xid="fDraftPerPhoneL" style="width:100px;"><![CDATA[拟办人电话]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="fDraftPerPhone" bind-ref="dDoc.ref('fDraftPerPhone')"/> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput9"> 
                <label class="x-label" xid="fCopiesL" style="width:100px;"><![CDATA[份数]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="fCopies" bind-ref="dDoc.ref('fCopies')"/> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col17"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelInput10"> 
                <label class="x-label" style="width:100px;" xid="fIssueDateL"><![CDATA[发文日期]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="fIssueDate" bind-ref="dDoc.ref('fIssueDate')"/> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col18"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput11"> 
                <label class="x-label" xid="fTemplateL" style="width:100px;"><![CDATA[正文]]></label>  
                <div component="$UI/system/components/justep/attachment/attachmentPC" access="duud" xid="fTemplate" bind-ref="dDoc.ref('fTemplate')" subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))" style="width:100%;" onOfficeLoaded="fTemplateOfficeLoaded">
   <div class="x-attachment-pc" xid="div26">
    <div class="x-attachment-content x-card-border" xid="div27">
     <div class="x-doc-process" xid="div28">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div29"></div></div> 
     <div class="x-attachment-cell-tpl" data-bind="foreach:$attachmentItems" xid="div30">
      <div class="x-attachment-cell x-attachment-item" xid="div31">
       <div class="x-item-other x-item-icon" data-bind="event:{mouseover:function(){if($model.$state.get()!='upload'){return;} $model.$activeDoc.set($object)}},click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()},css:{'x-doc-item-active':$model.$activeDoc.get() == $object}" xid="div32">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a3"></a></div> </div> </div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div33">
      <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div34"></div></div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div35">
      <div class="x-item-icon x-item-new-tpl" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256,click:$model.newFormTemplate.bind($model)" xid="div36"></div></div> 
     <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div37">
      <div class="x-item-icon x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div38"></div></div> 
     <div class="x-attachment-toolbar" data-bind="if:$model.$activeDoc.get(),style:{display:$model.$activeDoc.get()?($('html').hasClass('flexboxlegacy')?'flex':'inline-block'):'none'}" xid="div39">
      <div class="x-item-name" xid="div40">
       <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 4 &gt;= 2),click:$model.previewOrRemoveItem.bind($model,$model.$activeDoc.get()),text:$model.$activeDoc.get().docName.get()" xid="a4"></a>
       <span class="btn btn-link" data-bind="enable:false,text:$model.getFormatSize($model.$activeDoc.get())" xid="span5"></span></div> 
      <div class="x-item-edit" xid="div41">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.editDoc.bind($model,$model.$activeDoc.get())" xid="a5">编辑</a></div> 
      <div class="x-item-download" xid="div42">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 1024 &gt;= 512,click:$model.showHistory.bind($model,$model.$activeDoc.get())" xid="a6">历史</a></div> 
      <div class="x-item-download" xid="div43">
       <a class="btn btn-link" data-bind="enable:($model.$activeDoc.get().fileID.get() &amp;&amp; $model.$access.get() % 8 &gt;= 4),click:$model.downloadDoc.bind($model,$model.$activeDoc.get())" xid="a7">下载</a></div> 
      <div class="x-item-delete" xid="div44">
       <a class="btn btn-link" data-bind="enable:$model.$access.get() % 2048 &gt;= 1024,click:$model.deleteDoc.bind($model,$model.$activeDoc.get())" xid="a8">删除</a></div> </div> 
     <div style="clear:both;" xid="div45"></div></div> </div> </div></div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col19"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput12"> 
                <label class="x-label" xid="attachmentL" style="width:100px;"><![CDATA[附件]]></label>  
                <div component="$UI/system/components/justep/attachment/attachment"
                  access="duud" xid="fAttachment" style="width:100%;" bind-ref="dDoc.ref('fAttachment')"
                  subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
                  <div class="x-attachment" xid="div2"> 
                    <div class="x-attachment-content x-card-border" xid="div3"> 
                      <div class="x-doc-process" xid="div4"> 
                        <div class="progress-bar x-doc-process-bar" role="progressbar"
                          style="width:0%;" xid="div5"/> 
                      </div>  
                      <div data-bind="foreach:$attachmentItems" xid="div6"> 
                        <div class="x-attachment-cell" xid="div7"> 
                          <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                            xid="div8"> 
                            <a data-bind="visible:$model.$state.get() == 'remove'"
                              class="x-remove-barget" xid="a1"/> 
                          </div> 
                        </div> 
                      </div>  
                      <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                        xid="div9"> 
                        <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                          xid="div10"/> 
                      </div>  
                      <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                        xid="div11"> 
                        <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                          xid="div12"/> 
                      </div>  
                      <div style="clear:both;" xid="div13"/> 
                    </div> 
                  </div> 
                </div></div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent2">
        <div component="$UI/system/components/justep/report/report" src="readerReport.xml"
          reportName="report" autoLoad="false" dataList="" class="x-report x-scroll-h"
          xid="report"/>
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    title="选择范围设置" xid="dlgTreeMultiPsn" status="normal" onReceive="dlgTreeMultiPsnReceive"
    includeOrgKind="ogn,dpt,pos,psm" width="60%" height="55%" multiSelection="true" style="left:375px;top:143px;"></span>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgReadeOpinion"
    title="传阅情况" showTitle="true" status="normal" src="$UI/OA/doc/process/dialog/readerOpinionView/readerOpinionView.w" width="60%" height="55%" style="left:256px;top:211px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgViewRelevance"
    src="$UI/OA/doc/process/dialog/viewRelevance/viewRelevance.w" onReceive="dlgViewRelevanceReceive"
    onClose="dlgViewRelevanceClose" status="normal" title="文件关联" showTitle="true" width="60%" height="55%" style="left:38px;top:173px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgTreeMultiOrg"
    src="$UI/OA/doc/process/dialog/orgSelect/mainActivity.w" title="选择单位" showTitle="true"
    status="normal" forceRefreshOnOpen="true" onReceive="dlgTreeMultiOrgReceive" width="50%" height="80%" style="left:32px;top:221px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgKeyWord"
    src="$UI/OA/common/process/keyWordSelect/keyWordSelect.w" title="主题词选择向导" showTitle="true"
    status="normal" forceRefreshOnOpen="true" onReceive="wDlgKeyWordReceive" width="80%" height="80%" style="left:87px;top:405px;"/> 
</div>
