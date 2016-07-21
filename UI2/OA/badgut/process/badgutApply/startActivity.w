<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:566px;top:0px;" onModelConstructDone="modelModelConstructDone">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" autoNew="true" concept="OA_BG_ApplyM"
      orderBy="" columns="" isTree="false" onValueChanged="mainDataValueChanged" onSaveCommit="mainDataSaveCommit"> 
      <reader action="/OA/badgut/logic/action/queryBGApplyMAction"/>  
      <writer action="/OA/badgut/logic/action/saveBGApplyMAction"/>  
      <creator action="/OA/badgut/logic/action/createBGApplyMAction"/> 
    <rule xid="rule1">
   <col name="fCostCenterCode" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default2">true</expr></required> </col> 
   <col name="fCostCenterName" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default3">true</expr></required> </col> 
   <col name="fYear" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default4">true</expr></required> </col> 
   <col name="fCreateDeptID" xid="ruleCol4">
    <readonly xid="readonly1">
     <expr xid="default5">true</expr></readonly> </col> 
   <col name="fCreateDeptName" xid="ruleCol5">
    <readonly xid="readonly2">
     <expr xid="default6">true</expr></readonly> </col> 
   <col name="fCreatePsnID" xid="ruleCol6">
    <readonly xid="readonly3">
     <expr xid="default7">true</expr></readonly> </col> 
   <col name="fCreatePsnName" xid="ruleCol7">
    <readonly xid="readonly4">
     <expr xid="default8">true</expr></readonly> </col> 
   <col name="fCreateTime" xid="ruleCol8">
    <readonly xid="readonly5">
     <expr xid="default9">true</expr></readonly> </col> </rule></div>
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" autoNew="false" concept="OA_BG_ApplyD"
      orderBy="" columns="OA_BG_ApplyD,version,fAccountID,fAccountCode,fAccountName,fBGApplyID,fPlan1,fPlan2,fPlan3,fPlan4,fPlan5,fPlan6,fPlan7,fPlan8,fPlan9,fPlan10,fPlan11,fPlan12,fPlanall" isTree="false" onValueChanged="detailDataValueChanged"> 
      <reader action="/OA/badgut/logic/action/queryBGApplyDAction"/>  
      <writer action="/OA/badgut/logic/action/saveBGApplyDAction"/>  
      <creator action="/OA/badgut/logic/action/createBGApplyDAction"/>  
      <master xid="default1" data="mainData" relation="fBGApplyID"/> 
    </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="constData" idColumn="selectCost"><column label="selectCost" name="selectCost" type="String" xid="xid1"></column>
  <column label="insertBtn" name="insertBtn" type="String" xid="xid2"></column>
  <column label="appBtn" name="appBtn" type="String" xid="xid3"></column></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" style="width:24px;height:5px;left:184px;top:769px;" onBeforeAdvanceQuery="processBeforeAdvanceQuery"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      </ul> 
  </div>  
  <div xid="view"> 
  <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="processBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2">流转</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'mainData.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
       
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.showChart'}" xid="button1">
   <i xid="i9"></i>
   <span xid="span8"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.processRecord'}" xid="button2">
   <i xid="i10"></i>
   <span xid="span9"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
        <i xid="i15" />  
        <span xid="span15">更多</span> 
      </a></div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col3">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
     <label class="x-label" xid="fApplyDeptNamell" title="基础信息" style="width:90px;">基础信息</label>
     <div class="x-edit" xid="div1"></div></div> </div> 
   
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit8">
     <label class="x-label" style="width:100px;" title="成本编码"><![CDATA[成本编码]]></label>
     <div class="x-edit" xid="div8" style="width:200px;">
      <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fCostCenterCode')" xid="fCostCenterCode"></output></div> </div> </div><div class="col col-xs-12 col-md-6 col-lg-4" xid="col23">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput2">
     <label class="x-label" xid="fIsPreLoanLL" style="width:100px;" title="成本中心"><![CDATA[成本中心]]></label>
     <div class="x-edit" xid="div23">
      
      
  <div class="input-group" xid="inputGroup2">
   <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fCostCenterName')" xid="fCostCenterName" style="border-right-style:none;"></output><div class="input-group-addon" xid="div2" style="background-color:transparent;border-left-style:none;" bind-click="trgSelectAssetDOMActivate">
    <i xid="i111" class="icon-android-search"></i></div> </div></div> </div> </div><div class="col col-xs-12 col-md-6 col-lg-4" xid="col8">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput4">
     <label class="x-label" xid="fLoanAmtL" style="width:100px;" title="年 度"><![CDATA[年 度]]></label>
     <div class="x-edit" xid="div11">
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="fYear" bind-ref="mainData.ref('fYear')"></input></div> </div> </div><div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
     <label class="x-label" xid="fLoanDeptNameL" style="width:100px;" title="提交部门"><![CDATA[提交部门]]></label>
     <div class="x-edit" xid="div6">
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC4" bind-ref="mainData.ref('fCreateDeptID')" bind-labelRef="mainData.ref('fCreateDeptName')" includeOrgKind="ogn,dpt">
       <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg"></div>
       <option xid="option4" value="sCode" label="sName">
        <columns xid="columns6">
         <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
     <label class="x-label" xid="fLoanPsnNameL" style="width:100px;" title="提 交 人"><![CDATA[提 交 人]]></label>
     <div class="x-edit" xid="div5">
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" bind-ref="mainData.ref('fCreatePsnID')" bind-labelRef="mainData.ref('fCreatePsnName')" includeOrgKind="psm">
       <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
        <treeOption xid="default15" rootFilter="1=1"></treeOption></div> 
       <option xid="option5" value="sCode" label="sName">
        <columns xid="columns5">
         <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
     <label class="x-label" xid="fLoanDateL" style="width:100px;" title="提交时间"><![CDATA[提交时间]]></label>
     <div class="x-edit" xid="div4">
      <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fCreateTime')" xid="output1"></output></div> </div> </div> 
    
   
   
   
   
   
   
   
    
    
   
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col2">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit15">
    <label class="x-label" xid="fRemarkL" style="width:100px;" title="备      注"><![CDATA[备      注]]></label>
    <div class="x-edit" xid="div15">
     <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fRemark')" xid="fRemark"></textarea></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28"></div><div xid="col19" class="col col-xs-12 col-sm-12 col-md-12 col-lg-12">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
     <label class="x-label" xid="label8" title="详细信息" style="width:90px;"><![CDATA[详细信息]]></label>
     <div class="x-edit" xid="div19"></div></div> </div> 
   
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11">
    <div xid="div17">
     <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="detailBar">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-icon" xid="addBtn" icon="icon-android-add" onClick="addBtnClick">
       <i xid="i6" class="icon-android-add"></i>
       <span xid="span10"></span></a> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-icon" xid="deleteBtn" onClick="{operation:'detailData.delete'}" icon="icon-android-close">
       <i xid="i7" class="icon-android-close"></i>
       <span xid="span11"></span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="应用科目模板" xid="trgApplication" onClick="trgApplicationClick">
   <i xid="i5"></i>
   <span xid="span5">应用科目模板</span></a></div> 
     <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" xid="detail" data="detailData" height="auto" class="x-grid-no-bordered" showRowNumber="true" width="100%">
   <columns xid="column">
    
    
    
    
    
    <column width="100" name="fAccountCode" xid="column1" editable="false"><editor xid="editor1">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output2" bind-ref="ref('fAccountCode')"></div></editor></column>
  <column width="100" name="fAccountName" xid="column2" editable="false"><editor xid="editor2">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output3" bind-ref="ref('fAccountName')"></div></editor></column>
  <column width="100" name="fPlan1" xid="column3" editable="true"><editor xid="editor3">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="ref('fPlan1')"></input></editor></column>
  <column width="100" name="fPlan2" xid="column4" editable="true"><editor xid="editor4">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="ref('fPlan2')"></input></editor></column>
  <column width="100" name="fPlan3" xid="column7" editable="true"><editor xid="editor5">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="ref('fPlan3')"></input></editor></column>
  <column width="100" name="fPlan4" xid="column8" editable="true"><editor xid="editor6">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="ref('fPlan4')"></input></editor></column>
  <column width="100" name="fPlan5" xid="column9" editable="true"><editor xid="editor7">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="ref('fPlan5')"></input></editor></column>
  <column width="100" name="fPlan6" xid="column10" editable="true"><editor xid="editor8">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref="ref('fPlan6')"></input></editor></column>
  <column width="100" name="fPlan7" xid="column11" editable="true"><editor xid="editor9">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input8" bind-ref="ref('fPlan7')"></input></editor></column>
  <column width="100" name="fPlan8" xid="column12" editable="true"><editor xid="editor10">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input9" bind-ref="ref('fPlan8')"></input></editor></column>
  <column width="100" name="fPlan9" xid="column13" editable="true"><editor xid="editor11">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input10" bind-ref="ref('fPlan9')"></input></editor></column>
  <column width="100" name="fPlan10" xid="column14" editable="true"><editor xid="editor12">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input11" bind-ref="ref('fPlan10')"></input></editor></column>
  <column width="100" name="fPlan11" xid="column15" editable="true"><editor xid="editor13">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input12" bind-ref="ref('fPlan11')"></input></editor></column>
  <column width="100" name="fPlan12" xid="column16" editable="true"><editor xid="editor14">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input13" bind-ref="ref('fPlan12')"></input></editor></column>
  <column width="100" name="fPlanall" xid="column17" editable="true"><editor xid="editor15">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output4" bind-ref="ref('fPlanall')"></div></editor></column></columns> </div></div> </div> 
   </div></div> 
        </div> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgAccount" title="选择总账科目" status="normal" showTitle="true" src="$UI/OA/badgut/process/dialog/selectAccountDialog/selectAccountDialog.w" width="700px" height="500px" onReceive="dlgAccountReceive"></span><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgCost" title="选择成本中心" showTitle="true" status="normal" width="700px" height="500px" onReceive="dlgCostReceive" src="$UI/OA/badgut/process/dialog/selectCostDialog/selectCostDialog.w"></span></div>