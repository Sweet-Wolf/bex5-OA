<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:649px;top:4px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_AS_UseApplyM" orderBy="" columns=""
      autoNew="true" onValueChanged="mainDataValueChanged" onSaveCommit="mainDataSaveCommit"> 
      <reader action="/OA/asset/logic/action/queryASUseApplyMAction"/>  
      <writer action="/OA/asset/logic/action/saveASUseApplyMAction"/>  
      <creator action="/OA/asset/logic/action/createASUseApplyMAction"/>  
      <rule xid="rule1"> 
        <col name="fApplyDeptName" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default1">true</expr>  
            <message xid="default2">申请部门不能为空！</message>
          </required> 
        </col>  
        <col name="fApplyPsnName" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default3">true</expr>  
            <message xid="default4">申请人不能为空！</message>
          </required> 
        </col>  
        <col name="fApplyDate" xid="ruleCol3"> 
          <required xid="required3"> 
            <expr xid="default5">true</expr>  
            <message xid="default6">申请时间不能为空！</message>
          </required> 
        </col>  
        <col name="fApplyReason" xid="ruleCol4"> 
          <required xid="required4"> 
            <expr xid="default7">true</expr>  
            <message xid="default8">申请原因不能为空！</message>
          </required> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dKind"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fCode asc">
      <reader xid="default9" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default10"/>  
      <creator xid="default11"/>
    <filter name="fUseStatusFilter" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='固定资产类别']]></filter></div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData"/>  
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgAssetCard"
    src="$UI/OA/asset/process/dialog/singleSelectCard/singleSelectCard.w" title="选择资产"
    width="80%" height="500px" showTitle="true" status="normal"> 
    <result concept="mainData" operation="new" origin="dialogData" xid="default14"> 
      <mapping from="fKind" to="fKind" xid="default20"/>  
      <mapping from="fCode" to="fCode" xid="default21"/>  
      <mapping from="fName" to="fName" xid="default22"/>  
      <mapping from="fSpecType" to="fSpecType" xid="default23"/>  
      <mapping from="fRemainValue" to="fRemainValue" xid="default24"/> 
    </result> 
  </span>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'mainData.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.showChart'}" xid="button1"> 
        <i xid="i6"/>  
        <span xid="span7"/>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.processRecord'}" xid="button2"> 
        <i xid="i7"/>  
        <span xid="span8"/>
      </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}">
   <i xid="i15"></i>
   <span xid="span15">更多</span></a></div>  
    <div xid="content"> 
      <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-md-6 col-lg-4" xid="col3">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit1"> 
              <label class="x-label" xid="fApplyDeptNamell" title="基础信息" style="width:90px;"><![CDATA[基础信息]]></label>  
              <div class="x-edit" xid="div1"/>
            </div>
          </div>  
          <div class="col col-xs-12 col-md-6 col-lg-4" xid="col4"/>  
          <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit3"> 
              <label class="x-label" xid="label3" title="NO:" style="width:100px;"><![CDATA[NO:]]></label>  
              <div class="x-edit" xid="div3">
                <output class="form-control" component="$UI/system/components/justep/output/output"
                  data="mainData" bind-ref="mainData.ref('fNO')" xid="fNO"/>
              </div>
            </div>
          </div>
        <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
    <label class="x-label" xid="label4" bind-text="mainData.label('fApplyDeptName')" style="width:100px;"></label>
    <div class="x-edit" xid="div6">
     <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC4" bind-ref="mainData.ref('fApplyDeptID')" bind-labelRef="mainData.ref('fApplyDeptName')" includeOrgKind="ogn,dpt">
      <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg"></div>
      <option xid="option4" value="sCode" label="sName">
       <columns xid="columns6">
        <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
    <label class="x-label" xid="label5" bind-text="mainData.label('fApplyPsnName')" style="width:100px;"></label>
    <div class="x-edit" xid="div5">
     <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" bind-ref="mainData.ref('fApplyPsnID')" bind-labelRef="mainData.ref('fApplyPsnName')" includeOrgKind="psm">
      <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
       <treeOption xid="default15" rootFilter="1=1"></treeOption></div> 
      <option xid="option5" value="sCode" label="sName">
       <columns xid="columns5">
        <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
    <label class="x-label" xid="label6" bind-text="mainData.label('fApplyDate')" style="width:100px;"></label>
    <div class="x-edit" xid="div4">
     <input xid="input1" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fApplyDate')"></input></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
    <label class="x-label" xid="fKindL" style="width:100px;" bind-text="mainData.label('fKind')"></label>
    <div class="x-edit" xid="div9">
     <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="grdSltKind" bind-ref="mainData.ref('fKindID')" bind-labelRef="mainData.ref('fKind')">
      <option xid="option3" data="dKind" value="fCode" label="fName"></option></div> </div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col17">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit8">
    <label class="x-label" xid="fNameL" bind-text="mainData.label('fName')" style="width:100px;"></label>
    <div class="x-edit" xid="div8" style="width:200px;">
     <input xid="fName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fName')"></input></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col25">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit12">
    <label class="x-label" xid="fDemandDateL" bind-text="mainData.label('fDemandDate')" style="width:100px;"></label>
    <div class="x-edit" xid="div12">
     <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fDemandDate')" xid="fDemandDate"></input></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col20">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit11">
    <label class="x-label" xid="label11" bind-text="mainData.label('fReturnDate')" style="width:100px;"></label>
    <div class="x-edit" xid="div11">
     <input xid="fReturnDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fReturnDate')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit15">
    <label class="x-label" xid="fRequireL" bind-text="mainData.label('fRequire')" style="width:100px;"></label>
    <div class="x-edit" xid="div15">
     <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fRequire')" xid="fRequire"></textarea></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col35">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit18">
    <label class="x-label" xid="fApplyReasonL" bind-text="mainData.label('fApplyReason')" style="width:100px;"></label>
    <div class="x-edit" xid="div18">
     <textarea xid="fApplyReason" class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fApplyReason')"></textarea></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col38">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit21">
    <label class="x-label" xid="fRemarkL" bind-text="mainData.label('fRemark')" style="width:100px;"></label>
    <div class="x-edit" xid="div21">
     <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fRemark')" xid="fRemark"></textarea></div> </div> </div></div>
        </div> 
    </div> 
  </div> 
</div>
