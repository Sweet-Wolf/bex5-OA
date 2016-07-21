<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:521px;top:9px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_WM_repairApply" orderBy=""
      columns="" autoNew="true" onValueChanged="mainDataValueChanged" onBeforeSave="mainDataBeforeSave" onSaveCommit="mainDataSaveCommit"> 
      <reader action="/OA/workTime/logic/action/queryOA_WM_repairApplyAction"/>  
      <writer action="/OA/workTime/logic/action/saveOA_WM_repairApplyAction"/>  
      <creator action="/OA/workTime/logic/action/createOA_WM_repairApplyAction"/> 
    <rule xid="rule1">
     <col name="fTYPEID" xid="ruleCol10">
    <required xid="required7">
     <expr xid="default11">true</expr></required> </col>
   <col name="fTYPENAME" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default4">true</expr></required> </col> 
     <col name="fAPPLYPERSONID" xid="ruleCol11">
    <required xid="required8">
     <expr xid="default12">true</expr></required> </col> 
   <col name="fAPPLYPERSONNAME" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default5">true</expr></required> </col> 
   <col name="fAPPLYDATE" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default6">true</expr></required> </col> 
     <col name="fAPPLYDEPTID" xid="ruleCol12">
    <required xid="required9">
     <expr xid="default13">true</expr></required> </col>
     <col name="fAPPLYDEPTNAME" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default7">true</expr></required> </col>
     <col name="fCARDTIME" xid="ruleCol5">
    <required xid="required5">
     <expr xid="default8">true</expr></required> </col>
     <col name="fREASON" xid="ruleCol6">
    <required xid="required6">
     <expr xid="default9">true</expr></required> </col>
     
     <col name="fNO" xid="ruleCol7">
    <readonly xid="readonly1">
     <expr xid="default8">true</expr></readonly> </col>
     <col name="fCREATEPERNAME" xid="ruleCol8">
    <readonly xid="readonly2">
     <expr xid="default9">true</expr></readonly> </col>
   <col name="fCREATETIME" xid="ruleCol9">
    <readonly xid="readonly1">
     <expr xid="default10">true</expr></readonly> </col> 
     
     </rule></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="commData1" idColumn="typeCode"><column label="typeCode" name="typeCode" type="String" xid="xid1"></column>
  <column label="typeName" name="typeName" type="String" xid="xid2"></column>
  <data xid="default1">[{&quot;typeCode&quot;:&quot;qiantui&quot;,&quot;typeName&quot;:&quot;签退&quot;},{&quot;typeCode&quot;:&quot;qiandao&quot;,&quot;typeName&quot;:&quot;签到&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="commData2" idColumn="classCode"><column label="classCode" name="classCode" type="String" xid="xid3"></column>
  <column label="className" name="className" type="String" xid="xid4"></column>
  <data xid="default3">[{&quot;classCode&quot;:&quot;richangban&quot;,&quot;className&quot;:&quot;日常班&quot;},{&quot;classCode&quot;:&quot;erbandao&quot;,&quot;className&quot;:&quot;二班倒&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" onBeforeAdvance="processBeforeAdvance"/>  
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
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="advanceBtn" onClick="{operation:'process.advance'}"> 
          <i xid="i2"/>  
          <span xid="span2"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="saveBtn" onClick="{operation:'mainData.save'}"> 
          <i xid="i1"/>  
          <span xid="span1"/> 
        </a>  
         
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.showChart'}" xid="button1">
   <i xid="i6"></i>
   <span xid="span7"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.processRecord'}" xid="button2">
   <i xid="i7"></i>
   <span xid="span8"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label" label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
          <i xid="i15" class="icon-ios7-more" />  
          <span xid="span15">更多</span> 
        </a></div>  
    <div xid="content"> 
      <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col3">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
     <label class="x-label" xid="fApplyDeptNamell" title="基础信息" style="width:90px;">基础信息</label>
     <div class="x-edit" xid="div1"></div></div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col4"></div>
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
     <label class="x-label" xid="label3" title="NO:" style="width:100px;">NO:</label>
     <div class="x-edit" xid="div3">
      <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fNO')" xid="fNO"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
     <label class="x-label" xid="fAPPLYDEPTNAMEL" style="width:100px;" bind-text='mainData.label("fAPPLYDEPTNAME")'><![CDATA[所属部门]]></label>
     <div class="x-edit" xid="div6">
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC4" bind-ref="mainData.ref('fAPPLYDEPTID')" bind-labelRef="mainData.ref('fAPPLYDEPTNAME')" includeOrgKind="ogn,dpt">
       <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg"></div>
       <option xid="option4" value="sCode" label="sName">
        <columns xid="columns6">
         <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
     <label class="x-label" xid="fAPPLYPERSONNAMEL" style="width:100px;" bind-text="mainData.label('fAPPLYPERSONNAME')"><![CDATA[]]></label>
     <div class="x-edit" xid="div5">
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" bind-ref="mainData.ref('fAPPLYPERSONID')" bind-labelRef="mainData.ref('fAPPLYPERSONNAME')" includeOrgKind="psm" onShowOption="orgSelectPC3ShowOption" onHideOption="orgSelectPC3HideOption">
       <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
        <treeOption xid="default15" rootFilter="1=1"></treeOption></div> 
       <option xid="option5" value="sCode" label="sName">
        <columns xid="columns5">
         <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
     <label class="x-label" xid="fAPPLYDATEL" bind-text="mainData.label('fAPPLYDATE')" style="width:100px;"></label>
     <div class="x-edit" xid="div4">
      <input xid="fAPPLYDATE" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fAPPLYDATE')" format="yyyy-MM-dd hh:mm"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit8">
     <label class="x-label" xid="fCARDTIMEL" bind-text="mainData.label('fCARDTIME')" style="width:100px;"></label>
     <div class="x-edit" xid="div8" style="width:200px;">
      <input xid="fCARDTIME" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fCARDTIME')" format="yyyy-MM-dd hh:mm"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
     <label class="x-label" xid="fTYPENAMEL" style="width:100px;" bind-text="mainData.label('fTYPENAME')"></label>
     <div class="x-edit" xid="div9">
      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="grdSlfTYPENAME" bind-ref="mainData.ref('fTYPEID')" bind-labelRef="mainData.ref('fTYPENAME')">
       <option xid="option3" data="commData1" value="typeCode" label="typeName" ext="typeName"></option></div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col25">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit12">
     <label class="x-label" xid="fSQUADL" bind-text="mainData.label('fSQUAD')" style="width:100px;"></label>
     <div class="x-edit" xid="div12">
      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="mainData.ref('fSQUADID')" bind-labelRef="mainData.ref('fSQUAD')">
   <option xid="option1" data="commData2" value="classCode" label="className" ext="className"></option></div></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit15">
     <label class="x-label" xid="fREASONL" bind-text="mainData.label('fREASON')" style="width:100px;"></label>
     <div class="x-edit" xid="div15">
      <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fREASON')" xid="fREASON"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col38">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit21">
     <label class="x-label" xid="fREMARKL" bind-text="mainData.label('fREMARK')" style="width:100px;"></label>
     <div class="x-edit" xid="div21">
      <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fREMARK')" xid="fREMARK"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col1">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput1">
    <label class="x-label" xid="label1" title="制 单 人" style="width:100px;"><![CDATA[制 单 人]]></label>
    <div class="x-edit" xid="div2">
     <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fCREATEPERNAME')" xid="outfCREATEPERNAME"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col2">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput2">
    <label class="x-label" xid="label2" title="制单日期" style="width:100px;"><![CDATA[制单日期]]></label>
    <div class="x-edit" xid="div7">
     <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fCREATETIME')" xid="outfCREATETIME" format="yyyy-MM-dd hh:mm"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput3">
    <label class="x-label" xid="label4" title="状 态" style="width:100px;"><![CDATA[状 态]]></label>
    <div class="x-edit" xid="div10">
     <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fBizStateName')" xid="outfBizStateName" format="yyyy-MM-dd hh:mm"></output></div> </div> </div></div></div> 
    </div> 
  </div> 
</div>