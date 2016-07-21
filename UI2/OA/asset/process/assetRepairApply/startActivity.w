<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:539px;top:2px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_AS_RepairApply" orderBy=""
      columns="" autoNew="true"> 
      <reader action="/OA/asset/logic/action/queryASRepairApplyAction"/>  
      <writer action="/OA/asset/logic/action/saveASRepairApplyAction"/>  
      <creator action="/OA/asset/logic/action/createASRepairApplyAction"/>  
      <rule xid="rule1"> 
        <col name="fApplyDeptName" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default2">true</expr>  
            <message xid="default3">申请部门不能为空！</message>
          </required> 
        </col>  
        <col name="fApplyPsnName" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default4">true</expr>  
            <message xid="default5">申请人不能为空！</message>
          </required> 
        </col>  
        <col name="fApplyDate" xid="ruleCol3"> 
          <required xid="required3"> 
            <expr xid="default6">true</expr>  
            <message xid="default7">申请时间不能为空！</message>
          </required> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dRepairType"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fSequence:asc">
      <reader xid="default15" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default16"/>  
      <creator xid="default17"/>  
      <filter name="repairTypeFilter" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='资产维修类型']]></filter>  
      <master xid="default19" data="mainData"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dSelectTrg" idColumn="selectAssetCard">
      <column label="selectAssetCard" name="selectAssetCard" type="String" xid="default18"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" style="height:24px;width:24px;left:699px;top:18px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgAssetCard" src="$UI/OA/asset/process/dialog/singleSelectCard/singleSelectCard.w" title="选择资产" width="80%" height="422px" showTitle="true" status="normal" onReceive="wDlgAssetCardReceive">
    
  </span><div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
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
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.showChart'}" xid="button5"> 
        <i xid="i11"/>  
        <span xid="span11"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.processRecord'}" xid="button6"> 
        <i xid="i12"/>  
        <span xid="span12"/>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
          label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
          <i xid="i15"/>  
          <span xid="span15">更多</span> 
        </a>
    </div>  
    <div xid="content"> 
      <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col7"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
   <label class="x-label" xid="label4"><![CDATA[基础信息]]></label>
   <div class="x-edit" xid="div1"></div></div></div>
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col8"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
   <label class="x-label" xid="label5"></label>
   <div class="x-edit" xid="div2"></div></div></div>
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col9"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
   <label class="x-label" xid="outfNOL" style="width:100px;"><![CDATA[NO：]]></label>
   <div class="x-edit" xid="div3"><output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fNO')" xid="outfNO"></output></div></div></div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
    <label class="x-label" xid="outfApplyDeptNameL" bind-text="mainData.label('fApplyDeptName')" style="width:100px;"></label>
    <div class="x-edit" xid="div4">
     <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelect" bind-ref="mainData.ref('fApplyDeptID')" bind-labelRef="mainData.ref('fApplyDeptName')" includeOrgKind="ogn,dpt">
      <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg" limit="-1"></div>
      <option xid="treeSltDept" value="sCode" label="sName">
       <columns xid="columns1">
        <column name="sName" xid="column1"></column></columns> </option> </div> </div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
    <label class="x-label" xid="outfApplyPsmName" bind-text="mainData.label('fApplyPsnName')" style="width:100px;"></label>
    <div class="x-edit" xid="div5">
     <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="psmSelect" bind-ref="mainData.ref('fApplyPsnID')" bind-labelRef="mainData.ref('fApplyPsnName')" includeOrgKind="dpt,psm">
      <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
       <treeOption xid="default1" rootFilter="1=1"></treeOption></div> 
      <option xid="treeSltPsm" value="sCode" label="sName">
       <columns xid="columns2">
        <column name="sName" xid="column2"></column></columns> </option> </div> </div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
    <label class="x-label" xid="outfApplyDateL" bind-text="mainData.label('fApplyDate')" style="width:100px;"></label>
    <div class="x-edit" xid="div6">
     <input xid="fApplyDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fApplyDate')"></input></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col19">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit7">
    <label class="x-label" xid="outfCodeL" bind-text="mainData.label('fCode')" style="width:100px;"></label>
    <div class="x-edit" xid="div7">
     
     
  <div class="input-group" xid="inputGroup2">
   <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fCode')" xid="optCode" style="border-right-style:none;"></output><div class="input-group-addon" xid="div12" style="background-color:transparent;border-left-style:none;" bind-click="trgSelectAssetDOMActivate">
    <i xid="i111" class="icon-android-search"></i></div> </div></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col27">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit8">
    <label class="x-label" xid="outfKindL" bind-text="mainData.label('fKind')" style="width:100px;"></label>
    <div class="x-edit" xid="div8">
     <output xid="fKind" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fKind')"></output>
  </div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col20">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
    <label class="x-label" xid="label12" bind-text="mainData.label('fName')" style="width:100px;"></label>
    <div class="x-edit" xid="div9">
     <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fName')" xid="fName"></output></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col28">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit10">
    <label class="x-label" xid="outfSpecTypeL" bind-text="mainData.label('fSpecType')" style="width:100px;"></label>
    <div class="x-edit" xid="div10">
     <output xid="fSpecType" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fSpecType')"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col30">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit11">
    <label class="x-label" xid="outfRepairTypeL" bind-text="mainData.label('fRepairType')" style="width:100px;"></label>
    <div class="x-edit" xid="div11">
     <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="grdSltRepairType" bind-ref="mainData.ref('fRepairTypeID')" bind-labelRef="mainData.ref('fRepairType')">
      <option xid="option1" data="dRepairType" value="fCode" label="fName"></option></div> </div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col37">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit13">
    <label class="x-label" xid="outfServiceYearL" bind-text="mainData.label('fServiceYear')" style="width:100px;"></label>
    <div class="x-edit" xid="div13">
     <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fServiceYear')" xid="fServiceYear"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col39">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit14">
    <label class="x-label" xid="outfUsedYearL" bind-text="mainData.label('fUsedYear')" style="width:100px;"></label>
    <div class="x-edit" xid="div14">
     <output xid="fUsedYear" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fUsedYear')"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col38">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit15">
    <label class="x-label" bind-text="mainData.label('fRemainValue')" style="width:100px;" xid="outfRemainValueL1"></label>
    <div class="x-edit" xid="div15">
     <output xid="fRemainValue" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fRemainValue')"></output></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col40">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit16">
    <label class="x-label" xid="outfDescriptionL" bind-text="mainData.label('fDescription')" style="width:100px;"></label>
    <div class="x-edit" xid="div16">
     <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fDescription')" xid="fDescription"></textarea></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col47">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit24">
    <label class="x-label" xid="outfRemarkL1" bind-text="mainData.label('fRemark')" style="width:100px;"></label>
    <div class="x-edit" xid="div24">
     <textarea xid="fRemark" class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fRemark')"></textarea></div> </div> </div></div></div> 
    </div> 
  </div> 
</div>
