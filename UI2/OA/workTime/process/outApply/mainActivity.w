<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_WM_outApply" orderBy=""
      columns="" autoNew="true" onValueChanged="mainDataValueChanged" onSaveCommit="mainDataSaveCommit"> 
      <reader action="/OA/workTime/logic/action/queryOA_WM_outApplyAction"/>  
      <writer action="/OA/workTime/logic/action/saveOA_WM_outApplyAction"/>  
      <creator action="/OA/workTime/logic/action/createOA_WM_outApplyAction"/> 
    <rule xid="rule1">
   <col name="fNO" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default4">true</expr></readonly> </col> 
   <col name="fCreatePerName" xid="ruleCol2">
    <readonly xid="readonly2">
     <expr xid="default4">true</expr></readonly> </col> 
   <col name="fCreateTime" xid="ruleCol3">
    <readonly xid="readonly3">
     <expr xid="default4">true</expr></readonly> </col> 
   <col name="fAPPLYPERSONNAME" xid="ruleCol2">
    <required xid="required1">
     <expr xid="default5">true</expr></required> </col> 
   <col name="fAPPLYPERSONID" xid="ruleCol3">
    <required xid="required2">
     <expr xid="default6">true</expr></required> </col> 
   <col name="fAPPLYDEPTID" xid="ruleCol4">
    <required xid="required3">
     <expr xid="default7">true</expr></required> </col> 
   <col name="fAPPLYDEPTNAME" xid="ruleCol5">
    <required xid="required4">
     <expr xid="default8">true</expr></required> </col> 
   <col name="fAPPLYDATE" xid="ruleCol6">
    <required xid="required5">
     <expr xid="default9">true</expr></required> </col> 
   <col name="fREASON" xid="ruleCol7">
    <required xid="required6">
     <expr xid="default10">true</expr></required> </col> 
   <col name="fDAYS" xid="ruleCol8">
    <required xid="required7">
     <expr xid="default11">true</expr></required> </col> 
   <col name="fSTARTTIME" xid="ruleCol9">
    <required xid="required8">
     <expr xid="default12">true</expr></required> </col> 
   <col name="fENDTIME" xid="ruleCol10">
    <required xid="required9">
     <expr xid="default13">true</expr></required> </col> </rule></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOutMember" concept="OA_WM_outMember" confirmDelete="false" directDelete="true"><reader xid="default1" action="/OA/workTime/logic/action/queryOA_WM_outMemberAction"></reader>
  <writer xid="default2" action="/OA/workTime/logic/action/saveOA_WM_outMemberAction"></writer>
  <creator xid="default3" action="/OA/workTime/logic/action/createOA_WM_outMemberAction"></creator></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData"/>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="orgDialogPC" onReceive="orgDialogPCReceive" title="选择人员" multiSelection="true"></span><div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
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
   <i xid="i5"></i>
   <span xid="span5"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.processRecord'}" xid="button2">
   <i xid="i6"></i>
   <span xid="span7"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label" label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
          <i xid="i15" class="icon-ios7-more" />  
          <span xid="span15">更多</span> 
        </a></div>  
    <div xid="content"> 
      <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
   
   
   
   
   
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col3">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
     <label class="x-label" xid="fApplyDeptNamell" title="基础信息" style="width:90px;">基础信息</label>
     <div class="x-edit" xid="div1"></div></div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
     <label class="x-label" xid="label3" title="NO:" style="width:100px;">NO:</label>
     <div class="x-edit" xid="div3">
      <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fNO')" xid="fNO"></output></div> </div> </div> 
   
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
    <label class="x-label" xid="fLoanDeptNameL" style="width:100px;" title="所属部门"><![CDATA[所属部门]]></label>
    <div class="x-edit" xid="div6">
     <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC4" bind-ref="mainData.ref('fAPPLYDEPTID')" bind-labelRef="mainData.ref('fAPPLYDEPTNAME')" includeOrgKind="ogn,dpt">
      <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg"></div>
      <option xid="option4" value="SA_OPOrg" label="sName">
       <columns xid="columns6">
        <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div><div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
     <label class="x-label" xid="fAPPLYPERSONNAMEL" style="width:100px;" title="申请人"><![CDATA[申请人]]></label>
     <div class="x-edit" xid="div5">
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" bind-ref="mainData.ref('fAPPLYPERSONID')" bind-labelRef="mainData.ref('fAPPLYPERSONNAME')" includeOrgKind="psm" onShowOption="orgSelectPC3ShowOption" bind-extRef="mainData.ref('fURL')">
       <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
        <treeOption xid="default15" rootFilter="1=1"></treeOption></div> 
       <option xid="option5" value="SA_OPOrg" label="sName" ext="sFID">
        <columns xid="columns5">
         <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
     <label class="x-label" xid="fAPPLYDATEL" style="width:100px;" title="申请时间"><![CDATA[申请时间]]></label>
     <div class="x-edit" xid="div4">
      <input xid="fAPPLYDATE" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fAPPLYDATE')" format="yyyy-MM-dd"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit8">
     <label class="x-label" xid="fFACTSTARTTIMEL" style="width:100px;" title="开始时间"><![CDATA[开始时间]]></label>
     <div class="x-edit" xid="div8" style="width:200px;">
      <input xid="fSTARTTIME" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fSTARTTIME')" format="yyyy-MM-dd hh:mm"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
     <label class="x-label" xid="fFACTENDTIMEL" style="width:100px;" title="结束时间"><![CDATA[结束时间]]></label>
     <div class="x-edit" xid="div9">
      <input xid="fENDTIME" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fENDTIME')" format="yyyy-MM-dd hh:mm"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col25">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit12">
     <label class="x-label" xid="label11" style="width:100px;" title="外出时长"><![CDATA[外出时长]]></label>
     <div class="x-edit" xid="div12">
      <input xid="fDAYS" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fDAYS')" style="float:left;width:30%;"></input>
  <label xid="label13" style="float:left;padding-left:10px;padding-right:10px;line-height:34px;"><![CDATA[天]]></label>
  <input xid="fHOURS" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fHOURS')" style="width:30%;float:left;"></input>
  <label xid="label14" style="float:left;padding-left:10px;padding-right:10px;line-height:34px;"><![CDATA[小时]]></label></div> </div> </div> 
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col23">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput6">
    <label class="x-label" xid="fPERSONNEL" style="width:100px;" title="外出人员"><![CDATA[外出人员]]></label>
    <div class="x-edit" xid="div23">
     
     
  <div class="input-group" xid="inputGroup2">
    <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fPERSONNEL')" xid="fPERSONNE" style="border-right-style:none;"></output><div class="input-group-addon" xid="div11" style="background-color:transparent;border-left-style:none;" bind-click="trgSelectAssetDOMActivate">
    <i xid="i111" class="icon-android-search"></i></div></div></div> </div> </div><div class="col col-xs-12 col-md-6 col-lg-4" xid="col8">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
    <label class="x-label" xid="fNUMBERL" style="width:100px;" title="外出人数"><![CDATA[外出人数]]></label>
    <div class="x-edit" xid="div14">
     <input xid="fNUMBER" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fNUMBER')" style="width:80%;float:left;"></input>
  <label xid="label12" style="float:left;padding-left:10px;padding-right:10px;line-height:34px;">(人)</label></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit15">
     <label class="x-label" xid="fREASONL" style="width:100px;" title="外出原因"><![CDATA[外出原因]]></label>
     <div class="x-edit" xid="div15">
      <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fREASON')" xid="fREASON"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col38">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit21">
     <label class="x-label" xid="fRemarkL" style="width:100px;" title="备    注"><![CDATA[备    注]]></label>
     <div class="x-edit" xid="div21">
      <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fRemark')" xid="fRemark"></textarea></div> </div> 
  </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col1">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput1">
     <label class="x-label" xid="label1" title="制 单 人" style="width:100px;">制 单 人</label>
     <div class="x-edit" xid="div2">
      <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fCreatePerName')" xid="outfCREATEPERNAME"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col2">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput2">
     <label class="x-label" xid="label2" title="制单日期" style="width:100px;">制单日期</label>
     <div class="x-edit" xid="div7">
      <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fCreateTime')" xid="outfCREATETIME" format="yyyy-MM-dd hh:mm"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col5">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput3">
     <label class="x-label" xid="label4" title="状 态" style="width:100px;">状 态</label>
     <div class="x-edit" xid="div10">
      <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fBizStateName')" xid="outfBizStateName" format="yyyy-MM-dd hh:mm"></output></div> </div> </div> 
  </div></div></div> 
  </div> 
</div>