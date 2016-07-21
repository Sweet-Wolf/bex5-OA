<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:517px;top:14px;" onLoad="modelLoad"><div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_AS_InM" columns="" autoNew="false" onSaveCommit="DataSaveCommit" onAfterDelete="mainDataAfterDelete" confirmRefresh="false">
   <reader action="/OA/asset/logic/action/queryASInMAction" xid="default1"></reader>
   <writer action="/OA/asset/logic/action/saveASInMAction" xid="default2"></writer>
   <creator action="/OA/asset/logic/action/createASInMAction" xid="default3"></creator></div>
  <div component="$UI/system/components/justep/data/bizData" xid="detailData" directDelete="true" autoLoad="true" concept="OA_AS_InD" columns="" autoNew="false">
   <reader action="/OA/asset/logic/action/queryASInDetailAction" xid="default6"></reader>
   <writer action="/OA/asset/logic/action/saveASInDAction" xid="default7"></writer>
   <creator action="/OA/asset/logic/action/createASInDAction" xid="default8"></creator>
   <master data="mainData" relation="fMasterID" xid="default9"></master></div>
  <div component="$UI/system/components/justep/data/bizData" xid="modeData" concept="OA_Pub_BaseCode">
   <reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default2" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
   <creator xid="default3" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
   <filter name="filter" xid="filter2">OA_Pub_BaseCode.fScope='资产入库类型' and OA_Pub_BaseCode.fUseStatusName='启用'</filter></div>
  <div component="$UI/system/components/justep/data/bizData" xid="kindData" concept="OA_Pub_BaseCode">
   <reader xid="default12" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default13" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
   <creator xid="default20" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
   <filter name="filter" xid="filter1">OA_Pub_BaseCode.fScope='固定资产类别' and OA_Pub_BaseCode.fUseStatusName='启用'</filter></div>
  <div component="$UI/system/components/justep/data/bizData" xid="unitData" concept="OA_Pub_BaseCode">
   <reader xid="default21" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default22" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
   <creator xid="default23" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
   <filter name="filter" xid="filter3">OA_Pub_BaseCode.fScope='办公用品计量单位' and OA_Pub_BaseCode.fUseStatusName='启用'</filter></div></div> 
<div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="saveBtn2" onClick="{operation:'mainData.save'}" label="保存">
    <i xid="i10"></i>
    <span xid="span6">保存</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button2" onClick="{operation:'mainData.delete'}">
    <i xid="i13"></i>
    <span xid="span14"></span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button3" onClick="{operation:'mainData.refresh'}" label="刷新">
    <i xid="i11"></i>
    <span xid="span9">刷新</span></a> 
   
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="preBtn" onClick="{operation:'mainData.prevRow'}">
   <i xid="i3"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="nextBtn" onClick="{operation:'mainData.nextRow'}">
   <i xid="i5"></i>
   <span xid="span4"></span></a></div>
  <div xid="div17">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput1" style="float:right;">
    <label class="x-label" xid="label1" style="text-align:right;width:50px;">NO:</label>
    <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output1" bind-ref="mainData.ref('fNO')"></div></div> 
   <h5 xid="h51" style="line-height:36px;padding-left:15px;">基本信息</h5></div>
  <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form">
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
      <label class="x-label" xid="label2" style="width:100px;" bind-text="mainData.label('fDutyDeptName')"></label>
      <div class="x-edit" xid="div16">
       <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelect" bind-ref="mainData.ref('fDutyDeptID')" bind-labelRef="mainData.ref('fDutyDeptName')" includeOrgKind="ogn,dpt">
        <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg" limit="-1"></div>
        <option xid="option6" label="sName" value="SA_OPOrg" appearance="tree">
         <columns xid="columns5">
          <column name="sName" xid="column16"></column></columns> </option> </div> </div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
      <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fDutyPsnName')"></label>
      <div class="x-edit" xid="div18">
       <div component="$UI/system/components/justep/org/orgSelectPC" bind-labelRef="mainData.ref('fDutyPsnName')" bind-ref="mainData.ref('fDutyPsnID')" _onTreeIconRender="orgTreeTreeIconRender" class="x-gridSelect" xid="psmSelect" includeOrgKind="psm">
        <div component="$UI/system/components/justep/data/bizData" xid="dPsm" concept="SA_OPOrg" relations="sName,sFName,sOrgKindID,sSequence,sParent,sPersonID,sNodeKind" offset="0" limit="-1" autoLoad="false" isTree="true">
         <reader xid="default4" action="/system/logic/action/queryOrgAction"></reader>
         <treeOption parentRelation="sParent" nodeKindRelation="sNodeKind" xid="default5" rootFilter="1=1"></treeOption>
         <filter name="filter0" xid="filter4"></filter></div> 
        <option data="orgData" appearance="tree" expandColumn="sName" value="SA_OPOrg" label="sName" xid="option7">
         <columns xid="columns6">
          <column name="sName" xid="column17"></column></columns> </option> </div> </div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
      <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fDate')"></label>
      <div class="x-edit" xid="div19">
       <input xid="fDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fDate')"></input></div> </div> </div> 
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
    <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fMode')"></label>
    <div class="x-edit" xid="div20">
     <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="fAmount" bind-ref="mainData.ref('fModeID')" bind-labelRef="mainData.ref('fMode')">
   <option xid="option1" data="modeData" value="OA_Pub_BaseCode" label="fName"></option></div></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
    <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fAmount')"></label>
    <div class="x-edit" xid="div22">
     <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fAmount')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
    <label class="x-label" xid="label5" style="width:100px;" bind-text="mainData.label('fStateName')"></label>
    <div class="x-edit" xid="div21">
     <input xid="fStateName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fStateName')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
    <label class="x-label" xid="label9" style="width:100px;" bind-text="mainData.label('fRemark')"></label>
    <div class="x-edit" xid="div23">
     <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fRemark" bind-ref="mainData.ref('fRemark')"></textarea></div> </div> </div></div> 
   </div>
  <div xid="div26">
   <h5 xid="h53" style="line-height:36px;padding-left:15px;">资产明细</h5></div>
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="detailForm">
   <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter" xid="listBar">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="addBtn" icon="icon-plus" label="添加" onClick="{operation:'detailData.new'}">
     <i xid="i6" class="icon-plus"></i>
     <span xid="span10">添加</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="deleteBtn" onClick="deleteBtnClick" icon="icon-android-remove">
     <i xid="i7" class="icon-android-remove"></i>
     <span xid="span11">删除</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="trgInsertBtn" label="选择采购信息" icon="icon-android-checkmark" onClick="trgInsertBtnClick">
     <i xid="i9" class="icon-android-checkmark"></i>
     <span xid="span13">选择采购信息</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="trgCheck" label="验收" icon="icon-android-checkmark" onClick="trgCheckClick">
     <i xid="i14" class="icon-android-checkmark"></i>
     <span xid="span28">验收</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="trgIn" label="入库" icon="icon-android-checkmark" onClick="trgInClick">
     <i xid="i15" class="icon-android-checkmark"></i>
     <span xid="span29">入库</span></a> </div> 
   <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" xid="detailGrid" data="detailData" height="auto" class="x-grid-no-bordered" showRowNumber="false" multiselect="true" onCellRender="detailGridCellRender" onRowClick="detailGridRowClick">
    <columns xid="columns">
     <column name="fKind" editable="true" xid="column1">
      <editor xid="editor4">
       <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="kindSelect" bind-labelRef="ref('fKind')" bind-ref="ref('fKindID')" bind-extRef="ref('fCode')">
        <option xid="option3" data="kindData" value="OA_Pub_BaseCode" label="fName" ext="fCode"></option></div> </editor> </column> 
     <column name="fCode" editable="true" xid="column14">
      <editor xid="editor11">
       <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fCode')" xid="input12"></input></editor> </column> 
     <column name="fName" editable="true" xid="column13">
      <editor xid="editor10">
       <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fName')" xid="input11"></input></editor> </column> 
     <column name="fSpecType" editable="true" xid="column12">
      <editor xid="editor9">
       <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fSpecType')" xid="input10"></input></editor> </column> 
     <column name="fUnit" editable="true" xid="column11">
      <editor xid="editor8">
       <select component="$UI/system/components/justep/select/select" class="form-control" xid="select3" bind-labelRef="ref('fUnit')" bind-ref="ref('fUnitID')" bind-options="$model.unitData" bind-optionsValue="OA_Pub_BaseCode" bind-optionsLabel="fName"></select></editor> </column> 
     <column name="fAmount" editable="true" xid="column9">
      <editor xid="editor6">
       <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fAmount')" xid="input7"></input></editor> </column> 
     <column name="fDate" editable="true" xid="column5">
      <editor xid="editor2">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output2" bind-ref="ref('fDate')"></div></editor> </column> 
     <column name="fIsCheckName" editable="true" xid="column8">
      <editor xid="editor5">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output3" bind-ref="ref('fIsCheckName')"></div></editor> </column> 
     <column name="fIsInName" editable="true" xid="column6">
      <editor xid="editor3">
       <div component="$UI/system/components/justep/output/output" class="x-output" xid="output4" bind-ref="ref('fIsInName')"></div></editor> </column> 
     <column name="fBuyApplyNO" editable="true" xid="column10"></column>
     <column name="fCheckNO" editable="true" xid="column7"></column>
     <column name="fRemark" editable="true" xid="column4">
      <editor xid="editor1">
       <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fRemark')" xid="input1"></input></editor> </column> </columns> </div> </div>
  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgBuyApply"
    style="left:227px;top:454px;" title="选择资产采购信息" showTitle="true" status="normal"
    onReceive="dlgBuyApplyReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgInCheck"
    title="资产验收单" showTitle="true" status="normal" style="left:319px;top:455px;" onReceive="dlgInCheckReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgInDate"
    title="填写入库日期" showTitle="true" status="normal" width="50%" height="50%" style="left:404px;top:456px;"
    onReceive="dlgInDateReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgInCheckInfo"
    title="资产验收单查看" showTitle="true" status="normal" width="80%" height="80%" style="top:456px;left:473px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgInBuyInfo"
    style="left:535px;top:457px;" showTitle="true" status="normal" title="采购单查看"/>
  
  </div>