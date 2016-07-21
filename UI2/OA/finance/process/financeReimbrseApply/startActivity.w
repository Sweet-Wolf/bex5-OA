<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:510px;top:26px;" onLoad="modelLoad" onModelConstructDone="modelModelConstructDone">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" autoNew="true" concept="OA_FC_ReimbApplyM"
      orderBy="" columns="" isTree="false" onSaveCommit="mainDataSaveCommit" onValueChanged="mainDataValueChanged"> 
      <reader action="/OA/finance/logic/action/queryFCReimbApplyMAction"/>  
      <writer action="/OA/finance/logic/action/saveFCReimbApplyMAction"/>  
      <creator action="/OA/finance/logic/action/createFCReimbApplyMAction"/> 
    <rule xid="rule2">
   <col name="fNO" xid="ruleCol2">
    <readonly xid="readonly1">
     <expr xid="default7">true</expr></readonly> </col> 
   <col name="fLoanDate" xid="ruleCol3">
    <required xid="required2">
     <expr xid="default8">true</expr></required> </col> 
   <col name="fReimAmt" xid="ruleCol5">
    <readonly xid="readonly3">
     <expr xid="default9">true</expr></readonly> </col> 
   <col name="fReiAllowance" xid="ruleCol6">
    <required xid="required3">
     <expr xid="default10">true</expr></required> </col> 
   <col name="fIsPreLoan" xid="ruleCol7">
    <required xid="required4">
     <expr xid="default11">true</expr></required> </col> 
   <col name="fLoanAmt" xid="ruleCol8">
    <readonly xid="readonly5">
     <expr xid="default12">true</expr></readonly> </col> 
   <col name="fFactAmount" xid="ruleCol9">
    <readonly xid="readonly6">
     <expr xid="default13">true</expr></readonly> </col> </rule></div>
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" autoNew="false" concept="OA_FC_ReimbApplyD"
      orderBy="" columns="OA_FC_ReimbApplyD,version,fCostType,fCostTypeCode,fCostTypeName,fBeginTime,fEndTime,fCostBillNum,fSimpleDeclara,fCostAmt,fReimFID,fFactAmount,fReiAllowancem" isTree="false" onAfterDelete="detailDataAfterDelete" onValueChanged="detailDataValueChanged"> 
      <reader action="/OA/finance/logic/action/queryFCReimbApplyDAction"/>  
      <writer action="/OA/finance/logic/action/saveFCReimbApplyDAction"/>  
      <creator action="/OA/finance/logic/action/createFCReimbApplyDAction"/>  
      <master xid="default1" data="mainData" relation="fReimFID"/> 
    <aggregateRelation relation="reimbApplyNo" xid="aggregateRelation1"></aggregateRelation></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dCostType" concept="OA_Pub_BaseCode" limit="-1"><reader xid="default2" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
  <writer xid="default3"></writer>
  <creator xid="default4"></creator>
  <filter name="filter0" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='费用类型']]></filter></div>
  
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dBtnStatus" idColumn="fOughtReimbAmtCn"><column label="fOughtReimbAmtCn" name="fOughtReimbAmtCn" type="String" xid="xid1"></column>
  <column label="selectLoanApply" name="selectLoanApply" type="String" xid="xid2"></column>
  
  <rule xid="rule1">
   <col name="selectLoanApply" xid="ruleCol1">
    <readonly xid="readonly2">
     <expr xid="default5">true</expr></readonly> </col> </rule></div>
  </div>  
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
   <i xid="i5"></i>
   <span xid="span5"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.processRecord'}" xid="button2">
   <i xid="i9"></i>
   <span xid="span8"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
        <i xid="i15" />  
        <span xid="span15">更多</span> 
      </a></div>  
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
     <label class="x-label" xid="fLoanDeptNameL" bind-text="mainData.label('fLoanDeptName')" style="width:100px;"></label>
     <div class="x-edit" xid="div6">
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC4" bind-ref="mainData.ref('fLoanDeptID')" bind-labelRef="mainData.ref('fLoanDeptName')" includeOrgKind="ogn,dpt">
       <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg"></div>
       <option xid="option4" value="sCode" label="sName">
        <columns xid="columns6">
         <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
     <label class="x-label" xid="fLoanPsnNameL" bind-text="mainData.label('fLoanPsnName')" style="width:100px;"></label>
     <div class="x-edit" xid="div5">
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" bind-ref="mainData.ref('fLoanPsnID')" bind-labelRef="mainData.ref('fLoanPsnName')" includeOrgKind="psm">
       <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
        <treeOption xid="default15" rootFilter="1=1"></treeOption></div> 
       <option xid="option5" value="sCode" label="sName">
        <columns xid="columns5">
         <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
     <label class="x-label" xid="fLoanDateL" bind-text="mainData.label('fLoanDate')" style="width:100px;"></label>
     <div class="x-edit" xid="div4">
      <input xid="fLoanDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fLoanDate')" format="yyyy-MM-dd"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit8">
     <label class="x-label" xid="fMustReimAmtL" bind-text="mainData.label('fMustReimAmt')" style="width:100px;"></label>
     <div class="x-edit" xid="div8" style="width:200px;">
      <input xid="fMustReimAmt" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fMustReimAmt')"></input></div> </div> </div> 
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col18">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
     <label class="x-label" xid="fOughtReimbAmtCnL" style="width:100px;" bind-text="mainData.label('fOughtReimbAmtCn')"></label>
     <div class="x-edit" xid="div9">
      <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fOughtReimbAmtCn')" xid="fOughtReimbAmtCn"></output></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit15">
     <label class="x-label" xid="fReiEventL" bind-text="mainData.label('fReiEvent')" style="width:100px;"></label>
     <div class="x-edit" xid="div15">
      <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fReiEvent')" xid="fReiEvent"></textarea></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col20">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit7">
    <label class="x-label" xid="label10" title="如是出差报销，请在下面录入出差信息。" style="color:#3366FF;width:534px;"><![CDATA[如是出差报销，请在下面录入出差补助金额以及出差信息。]]></label>
    <div class="x-edit" xid="div20"></div></div> </div><div class="col col-xs-12 col-md-6 col-lg-4" xid="col25">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit12">
     <label class="x-label" xid="fReiAllowanceL" bind-text="mainData.label('fReiAllowance')" style="width:100px;"></label>
     <div class="x-edit" xid="div12">
      <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fReiAllowance')" xid="fReiAllowance"></input></div> </div> </div> 
    
   
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput1">
    <label class="x-label" xid="fReiBeginDateL" bind-text="mainData.label('fReiBeginDate')" style="width:100px;"></label>
    <div class="x-edit" xid="div2">
     <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fReiBeginDate')" xid="fReiBeginDate"></input></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col6">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput2">
    <label class="x-label" xid="fReiBackDateL" bind-text="mainData.label('fReiBackDate')" style="width:100px;"></label>
    <div class="x-edit" xid="div7">
     <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fReiBackDate')" xid="fReiBackDate"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col21">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit10">
    <label class="x-label" xid="label11" style="color:#3366FF;width:534px;"><![CDATA[如果报销有对应请款申请，请在下面选择对应申请。]]></label>
    <div class="x-edit" xid="div21"></div></div> </div><div class="col col-xs-12 col-md-6 col-lg-4" xid="col23">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput2">
    <label class="x-label" xid="fIsPreLoanLL" bind-text="mainData.label('fIsPreLoan')" style="width:100px;"></label>
    <div class="x-edit" xid="div23">
     
     
  <div class="input-group" xid="inputGroup2">
   <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fIsPreLoan')" xid="opfIsPreLoanL" style="border-right-style:none;"></output><div class="input-group-addon" xid="div10" style="background-color:transparent;border-left-style:none;" bind-click="trgSelectAssetDOMActivate">
    <i xid="i111" class="icon-android-search"></i></div> </div></div> </div> </div><div class="col col-xs-12 col-md-6 col-lg-4" xid="col8">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput4">
    <label class="x-label" xid="fLoanAmtL" bind-text="mainData.label('fLoanAmt')" style="width:100px;"></label>
    <div class="x-edit" xid="div11">
     <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fLoanAmt')" xid="outfLoanAmt" style="float:left;"></output></div> </div> </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col9">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput5">
    <label class="x-label" xid="fReimAmtL" bind-text="mainData.label('fReimAmt')" style="width:100px;"></label>
    <div class="x-edit" xid="div13">
     <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fReimAmt')" xid="outfReimAmt" style="float:left;"></output></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col19">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
    <label class="x-label" xid="label8" title="费用信息" style="width:90px;"><![CDATA[费用信息]]></label>
    <div class="x-edit" xid="div19"></div></div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col22">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit11">
    <label class="x-label" xid="label12" style="color:#3366FF;width:795.75px;"><![CDATA[请在下列录入报销单据信息，注意请在简要说明中录入报销单据，开始时间和结束时间用与描述旅店住宿费用、车票、机票等费用的时间区间。如无时间可不填写。]]></label>
    <div class="x-edit" xid="div22"></div></div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11">
   <div xid="div17">
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="detailBar">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-icon" xid="addBtn" icon="icon-android-add" onClick="{operation:'detailData.new'}">
      <i xid="i6" class="icon-android-add"></i>
      <span xid="span10"></span></a> 
     <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-icon" xid="deleteBtn" onClick="{operation:'detailData.delete'}" icon="icon-android-close">
      <i xid="i7" class="icon-android-close"></i>
      <span xid="span11"></span></a> </div> 
    <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" xid="detail" data="detailData" width="100%" height="auto" class="x-grid-no-bordered" showRowNumber="true">
     <columns xid="column">
      <column name="fCostType" label="费用类别" editable="true" xid="column11">
       <editor xid="fCostTypeE">
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="ref('fCostTypeCode')" bind-labelRef="ref('fCostTypeName')" style="width:106px;">
   <option xid="option1" data="dCostType" value="fCode" label="fName" autoLoad="false"></option></div></editor> </column> 
      
      <column name="fBeginTime" label="开始时间" editable="true" xid="column13">
       <editor xid="fBeginTimeE">
        <input xid="fBeginTimeI" component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fBeginTime')" format="yyyy-MM-dd"></input></editor> </column> 
      <column name="fEndTime" label="结束时间" editable="true" xid="column14">
       <editor xid="fEndTimeE">
        <input xid="fEndTimeI" component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fEndTime')" format="yyyy-MM-dd"></input></editor> </column> 
      <column name="fCostBillNum" label="单据张数" editable="true" xid="column15">
       <editor xid="fCostBillNumE">
        <input xid="fCostBillNumI" component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fCostBillNum')"></input></editor> </column> 
      <column name="fCostAmt" label="金额" editable="true" xid="column17">
       <editor xid="fCostAmtE">
        <input xid="fCostAmtI" component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fCostAmt')"></input></editor> </column>
      <column name="fSimpleDeclara" label="简要说明" editable="true" xid="column16">
       <editor xid="fSimpleDeclaraE">
        <input xid="fSimpleDeclaraI" component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fSimpleDeclara')"></input></editor> </column> 
       
      </columns> </div> </div> </div>
  
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col1">
   </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col2">
   </div>
  <div class="col col-xs-12 col-md-6 col-lg-4" xid="col7">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput4">
    <label class="x-label" xid="fFactAmountL" bind-text="mainData.label('fFactAmount')" style="width:100px;"></label>
    <div class="x-edit" xid="div16">
     <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fFactAmount')" xid="fFactAmount" style="float:left;"></output></div> </div> </div></div></div> 
        </div> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectLoanApplyInfo" title="借款单选择" showTitle="true" status="normal" width="60%" height="60%" onReceive="dlgSelectLoanApplyInfoReceive" src="$UI/OA/finance/process/dialog/selectLoanInfoDialog/selectLoanApplyInfoDialog.w"></span></div>