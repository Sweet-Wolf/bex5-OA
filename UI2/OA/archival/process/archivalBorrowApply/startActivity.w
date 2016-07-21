<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:380px;top:216px;" onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" autoNew="true" concept="OA_AM_BorrowApplyM"
      orderBy="" columns="" isTree="false" onValueChanged="mainDataValueChanged"> 
      <reader action="/OA/archival/logic/action/queryAMBorrowApplyMAction"/>  
      <writer action="/OA/archival/logic/action/saveAMBorrowApplyMAction"/>  
      <creator action="/OA/archival/logic/action/createAMBorrowApplyMAction"/> 
    <rule xid="rule1">
   <col name="fCreatePsnName" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default3">true</expr></readonly> </col> 
   <col name="fCreateTime" xid="ruleCol2">
    <readonly xid="readonly2">
     <expr xid="default4">true</expr></readonly> </col> 
   <col name="fCreateDeptName" xid="ruleCol3">
    <readonly xid="readonly3">
     <expr xid="default5">true</expr></readonly> </col> 
   <col name="fReason" xid="ruleCol4">
    <required xid="required1">
     <expr xid="default6">true</expr></required> </col> </rule></div>
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" autoNew="false" concept="OA_AM_BorrowApplyD"
      orderBy="" columns="" isTree="false"> 
      <reader action="/OA/archival/logic/action/queryAMBorrowApplyDWithArchivalAction"/>  
      <writer action="/OA/archival/logic/action/saveAMBorrowApplyDAction"/>  
      <creator action="/OA/archival/logic/action/createAMBorrowApplyDAction"/>  
      <master xid="default1" data="mainData" relation="fBorrowID"/> 
    </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="btnState"></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dBorrowKind" idColumn="label"><column label="名" name="label" type="String" xid="xid1"></column>
  <column label="值" name="value" type="String" xid="xid2"></column>
  <data xid="default2">[{&quot;label&quot;:&quot;查阅&quot;,&quot;value&quot;:&quot;查阅&quot;},{&quot;label&quot;:&quot;原件&quot;,&quot;value&quot;:&quot;原件&quot;},{&quot;label&quot;:&quot;复制&quot;,&quot;value&quot;:&quot;复制&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" style="width:24px;height:5px;left:184px;top:769px;"/>  
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog" onReceive="dlgSelectArchivalReceive" status="normal" showTitle="true" title="选择档案"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="archivalDialog" title="案卷信息" showTitle="true" status="normal"></span><div xid="view"> 
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
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11">
   <h5 xid="h52" style="padding-top:10px;padding-bottom:10px;"><![CDATA[基本信息]]></h5></div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fBorrowDeptName')"></label>
   <div class="x-edit" xid="div1"><div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC4" bind-ref="mainData.ref('fBorrowDeptID')" bind-labelRef="mainData.ref('fBorrowDeptName')" includeOrgKind="ogn,dpt">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg"></div>
   <option xid="option4" value="sCode" label="sName">
    <columns xid="columns6">
     <column name="sName" xid="column5"></column></columns> </option> </div></div></div></div>
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label" xid="label2" style="width:100px;" bind-text="mainData.label('fBorrowPsnName')"></label>
   <div class="x-edit" xid="div2"><div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" bind-ref="mainData.ref('fBorrowPsnID')" bind-labelRef="mainData.ref('fBorrowPsnName')" includeOrgKind="psm" onShowOption="orgSelectPC3ShowOption">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
    <treeOption xid="default15" rootFilter="1=1"></treeOption></div> 
   <option xid="option5" value="sCode" label="sName">
    <columns xid="columns5">
     <column name="sName" xid="column6"></column></columns> </option> </div></div></div></div>
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
   <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fBorrowTime')"></label>
   <div class="x-edit" xid="div3"><input xid="fBorrowTime" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fBorrowTime')"></input></div></div></div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit6">
    <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fReason')"></label>
    <div class="x-edit" xid="div6">
  <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="mainData.ref('fReason')"></textarea></div></div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
    <label class="x-label" xid="label5" style="width:100px;" bind-text="mainData.label('fDescription')"></label>
    <div class="x-edit" xid="div5"><textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea2" bind-ref="mainData.ref('fDescription')"></textarea></div></div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
    <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fEffect')"></label>
    <div class="x-edit" xid="div4"><input xid="fEffect" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fEffect')"></input></div></div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit9">
    <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fBizStateName')"></label>
    <div class="x-edit" xid="div9"><input xid="fBizStateName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fBizStateName')"></input></div></div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit8">
    <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fCreateDeptName')"></label>
    <div class="x-edit" xid="div8"><input xid="fCreateDeptName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fCreateDeptName')"></input></div></div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit7">
    <label class="x-label" xid="label9" style="width:100px;" bind-text="mainData.label('fCreatePsnName')"></label>
    <div class="x-edit" xid="div7"><input xid="fCreatePsnName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fCreatePsnName')"></input></div></div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit10">
    <label class="x-label" xid="label10" style="width:100px;" bind-text="mainData.label('fCreateTime')"></label>
    <div class="x-edit" xid="div10"><input xid="fCreateTime" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fCreateTime')"></input></div></div> </div>
  </div>
  </div> 
        <div> 
            <h5 xid="h51" style="padding-top:10px;padding-bottom:10px;"><![CDATA[借阅明细]]>
  </h5><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="detailBar"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="addBtn" icon="icon-plus" onClick="insertFiledDOMActivate" label="添加"> 
                <i xid="i6" class="icon-plus" />  
                <span xid="span10">添加</span> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="deleteBtn" onClick="{operation:'detailData.delete'}"> 
                <i xid="i7" />  
                <span xid="span11" /> 
              </a> 
            </div>  
            <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="detailData" showRowNumber="false" onCellRender="dataTables1CellRender" onRowClick="dataTables1RowClick">
   <columns xid="columns1"><column name="fTitle" xid="column10"></column><column name="fArchivalNO" xid="column8"></column><column name="fCarry" xid="column13"></column><column name="fBorrowKind" xid="column4"></column>
  <column name="fCloseTime" xid="column7"></column>
  
  <column name="fAMYear" xid="column9"></column>
  
  <column name="fFileDeptName" xid="column11"></column>
  <column name="fResponsibleName" xid="column12"></column>
  </columns></div></div></div> 
</div>