<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:566px;top:0px;" onModelConstructDone="modelModelConstructDone">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" autoNew="true" concept="OA_BG_AlterM"
      orderBy="" columns="" isTree="false" onValueChanged="mainDataValueChanged" onSaveCommit="mainDataSaveCommit"> 
      <reader action="/OA/badgut/logic/action/queryBGAlterMAction"/>  
      <writer action="/OA/badgut/logic/action/saveBGAlterMAction"/>  
      <creator action="/OA/badgut/logic/action/createBGAlterMAction"/> 
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
      directDelete="true" autoLoad="true" autoNew="false" concept="OA_BG_AlterD"
      orderBy="" columns="OA_BG_AlterD,version,fAccountID,fAccountCode,fAccountName,fBGAlterID,fPlan1,fPlan2,fPlan3,fPlan4,fPlan5,fPlan6,fPlan7,fPlan8,fPlan9,fPlan10,fPlan11,fPlan12,fPlanall,fFact1,fFact2,fFact3,fFact4,fFact5,fFact6,fFact7,fFact8,fFact9,fFact10,fFact11,fFact12,fFactall,fAlter1,fAlter2,fAlter3,fAlter4,fAlter5,fAlter6,fAlter7,fAlter8,fAlter9,fAlter10,fAlter11,fAlter12,fAlterall,fBGDetailID" isTree="false" onValueChanged="detailDataValueChanged"> 
      <reader action="/OA/badgut/logic/action/queryBGAlterDAction"/>  
      <writer action="/OA/badgut/logic/action/saveBGAlterDAction"/>  
      <creator action="/OA/badgut/logic/action/createBGAlterDAction"/>  
      <master xid="default1" data="mainData" relation="fBGAlterID"/> 
    <rule xid="rule2">
   <col name="fPlan1" xid="ruleCol9">
    <constraint xid="constraint1">
     <expr xid="default10">$model.detailData.val(&quot;fAlter1&quot;)&gt;= $model.detailData.val(&quot;fFact1&quot;)</expr></constraint> </col> 
   <col name="fAlter2" xid="ruleCol10">
    <constraint xid="constraint2">
     <expr xid="default11">$model.detailData.val(&quot;fAlter2&quot;) &gt;= $model.detailData.val(&quot;fFact2&quot;)</expr></constraint> </col> 
   <col name="fAlter3" xid="ruleCol11">
    <constraint xid="constraint3">
     <expr xid="default12">$model.detailData.val(&quot;fAlter3&quot;) &gt;= $model.detailData.val(&quot;fFact3&quot;)</expr></constraint> </col>
   <col name="fAlter4" xid="ruleCol12">
    <constraint xid="constraint4">
     <expr xid="default13">$model.detailData.val(&quot;fAlter4&quot;) &gt;= $model.detailData.val(&quot;fFact4&quot;)</expr></constraint> </col>
   <col name="fAlter5" xid="ruleCol13">
    <constraint xid="constraint5">
     <expr xid="default14">$model.detailData.val(&quot;fAlter5&quot;) &gt;= $model.detailData.val(&quot;fFact5&quot;)</expr></constraint> </col>
   <col name="fAlter6" xid="ruleCol14">
    <constraint xid="constraint6">
     <expr xid="default15">$model.detailData.val(&quot;fAlter6&quot;) &gt;= $model.detailData.val(&quot;fFact6&quot;)</expr></constraint> </col>
   <col name="fAlter7" xid="ruleCol15">
    <constraint xid="constraint7">
     <expr xid="default16">$model.detailData.val(&quot;fAlter7&quot;) &gt;= $model.detailData.val(&quot;fFact7&quot;)</expr></constraint> </col>
   <col name="fAlter8" xid="ruleCol16">
    <constraint xid="constraint8">
     <expr xid="default17">$model.detailData.val(&quot;fAlter8&quot;) &gt;= $model.detailData.val(&quot;fFact8&quot;)</expr></constraint> </col>
   <col name="fAlter9" xid="ruleCol17">
    <constraint xid="constraint9">
     <expr xid="default18">$model.detailData.val(&quot;fAlter9&quot;) &gt;= $model.detailData.val(&quot;fFact9&quot;)</expr></constraint> </col>
   <col name="fAlter10" xid="ruleCol18">
    <constraint xid="constraint10">
     <expr xid="default19">$model.detailData.val(&quot;fAlter10&quot;) &gt;= $model.detailData.val(&quot;fFact10&quot;)</expr></constraint> </col>
   <col name="fAlter11" xid="ruleCol19">
    <constraint xid="constraint11">
     <expr xid="default20">$model.detailData.val(&quot;fAlter11&quot;) &gt;= $model.detailData.val(&quot;fFact11&quot;)</expr></constraint> </col>
   <col name="fAlter12" xid="ruleCol21">
    <constraint xid="constraint12">
     <expr xid="default21">$model.detailData.val(&quot;fAlter12&quot;) &gt;= $model.detailData.val(&quot;fFact12&quot;)</expr></constraint> </col>
         
      </rule></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dBtnStatus" idColumn="trgInsert"><column label="trgInsert" name="trgInsert" type="String" xid="xid2"></column>
  <column label="trgSelectCost" name="trgSelectCost" type="String" xid="xid1"></column></div></div>  
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
    <i xid="i111" class="icon-android-search"></i></div> </div></div> </div> 
  </div><div class="col col-xs-12 col-md-6 col-lg-4" xid="col8">
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
  </div> 
     <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" xid="detail" data="detailData" height="auto" class="x-grid-no-bordered" showRowNumber="true" width="100%" directEdit="true">
   <columns xid="column">
    <column width="100" name="fAccountCode" xid="column1" editable="false">
     <editor xid="editor1">
      <div component="$UI/system/components/justep/output/output" class="x-output" xid="output2" bind-ref="ref('fAccountCode')"></div></editor> </column> 
    <column width="100" name="fAccountName" xid="column2" editable="false">
     <editor xid="editor2">
      <div component="$UI/system/components/justep/output/output" class="x-output" xid="output3" bind-ref="ref('fAccountName')"></div></editor> </column> 
    <column width="100" name="fPlan1" xid="column3" editable="false">
     <editor xid="editor3"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output5" bind-ref="ref('fPlan1')"></div></editor></column> 
    <column width="100" name="fAlter1" xid="column31" editable="true"><editor xid="editor16">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="ref('fAlter1')"></input></editor></column>
    <column width="100" name="fFact1" xid="column18"><editor xid="editor41">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output30" bind-ref="ref('fFact1')"></div></editor></column>
    <column width="100" name="fPlan2" xid="column4" editable="false">
     <editor xid="editor4"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output6" bind-ref="ref('fPlan2')"></div></editor></column> 
    <column width="100" name="fAlter2" xid="column32" editable="true"><editor xid="editor17">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="ref('fAlter2')"></input></editor></column>
    <column width="100" name="fFact2" xid="column19" editable="true"><editor xid="editor40">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output29" bind-ref="ref('fFact2')"></div></editor></column>
    <column width="100" name="fPlan3" xid="column7" editable="false">
     <editor xid="editor5"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output28" bind-ref="ref('fPlan3')"></div></editor></column> 
    <column width="100" name="fAlter3" xid="column33" editable="true"><editor xid="editor18">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="ref('fAlter3')"></input></editor></column>
    <column width="100" name="fFact3" xid="column20" editable="true"><editor xid="editor39">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output27" bind-ref="ref('fFact3')"></div></editor></column>
    <column width="100" name="fPlan4" xid="column8" editable="true">
     <editor xid="editor6"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output26" bind-ref="ref('fPlan4')"></div></editor></column> 
    <column width="100" name="fAlter4" xid="column34" editable="true"><editor xid="editor19">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="ref('fAlter4')"></input></editor></column>
    <column width="100" name="fFact4" xid="column21" editable="true"><editor xid="editor38">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output25" bind-ref="ref('fFact4')"></div></editor></column>
    <column width="100" name="fPlan5" xid="column9" editable="true">
     <editor xid="editor7"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output24" bind-ref="ref('fPlan5')"></div></editor></column> 
    <column width="100" name="fAlter5" xid="column35" editable="true"><editor xid="editor20">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="ref('fAlter5')"></input></editor></column>
    <column width="100" name="fFact5" xid="column22" editable="true"><editor xid="editor37">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output23" bind-ref="ref('fFact5')"></div></editor></column>
    <column width="100" name="fPlan6" xid="column10" editable="true">
     <editor xid="editor8"><div component="$UI/system/components/justep/output/output" class="x-output" xid="output22" bind-ref="ref('fPlan6')"></div></editor></column> 
    <column width="100" name="fAlter6" xid="column36" editable="true"><editor xid="editor21">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="ref('fAlter6')"></input></editor></column>
    <column width="100" name="fFact6" xid="column23" editable="true"><editor xid="editor36">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output21" bind-ref="ref('fFact6')"></div></editor></column>
    <column width="100" name="fPlan7" xid="column11" editable="true">
     <editor xid="editor9">
      <div component="$UI/system/components/justep/output/output" class="x-output" xid="output20" bind-ref="ref('fPlan7')"></div></editor> </column> 
    <column width="100" name="fAlter7" xid="column37" editable="true"><editor xid="editor22">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref="ref('fAlter7')"></input></editor></column>
    <column width="100" name="fFact7" xid="column24" editable="true"><editor xid="editor35">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output19" bind-ref="ref('fFact7')"></div></editor></column>
    <column width="100" name="fPlan8" xid="column12" editable="true">
     <editor xid="editor10">
      <div component="$UI/system/components/justep/output/output" class="x-output" xid="output18" bind-ref="ref('fPlan8')"></div></editor> </column> 
    <column width="100" name="fAlter8" xid="column38" editable="true"><editor xid="editor23">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input8" bind-ref="ref('fAlter8')"></input></editor></column>
    <column width="100" name="fFact8" xid="column25" editable="true"><editor xid="editor34">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output17" bind-ref="ref('fFact8')"></div></editor></column>
    <column width="100" name="fPlan9" xid="column13" editable="true">
     <editor xid="editor11">
      <div component="$UI/system/components/justep/output/output" class="x-output" xid="output16" bind-ref="ref('fPlan9')"></div></editor> </column> 
    <column width="100" name="fAlter9" xid="column39" editable="true"><editor xid="editor24">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input9" bind-ref="ref('fAlter9')"></input></editor></column>
    <column width="100" name="fFact9" xid="column26" editable="true"><editor xid="editor33">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output15" bind-ref="ref('fFact9')"></div></editor></column>
    <column width="100" name="fPlan10" xid="column14" editable="true">
     <editor xid="editor12">
      <div component="$UI/system/components/justep/output/output" class="x-output" xid="output14" bind-ref="ref('fPlan10')"></div></editor> </column> 
    <column width="100" name="fAlter10" xid="column44" editable="true"><editor xid="editor25">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input10" bind-ref="ref('fAlter10')"></input></editor></column>
    <column width="100" name="fFact10" xid="column27" editable="true"><editor xid="editor32">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output13" bind-ref="ref('fFact10')"></div></editor></column>
    <column width="100" name="fPlan11" xid="column15" editable="true">
     <editor xid="editor13">
      <div component="$UI/system/components/justep/output/output" class="x-output" xid="output12" bind-ref="ref('fPlan11')"></div></editor> </column> 
    <column width="100" name="fAlter11" xid="column41" editable="true"><editor xid="editor26">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input11" bind-ref="ref('fAlter11')"></input></editor></column>
    <column width="100" name="fFact11" xid="column28" editable="true"><editor xid="editor31">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output11" bind-ref="ref('fFact11')"></div></editor></column>
    
    <column width="100" name="fPlan12" xid="column16" editable="true">
     <editor xid="editor14">
      <div component="$UI/system/components/justep/output/output" class="x-output" xid="output10" bind-ref="ref('fPlan12')"></div></editor> </column><column width="100" name="fAlter12" xid="column42" editable="true"><editor xid="editor30">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input12" bind-ref="ref('fAlter12')"></input></editor></column> 
    <column width="100" name="fFact12" xid="column29" editable="true"><editor xid="editor29">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output9" bind-ref="ref('fFact12')"></div></editor></column>
    <column width="100" name="fPlanall" xid="column17" editable="true">
     <editor xid="editor15">
      <div component="$UI/system/components/justep/output/output" class="x-output" xid="output4" bind-ref="ref('fPlanall')"></div></editor> </column> 
    <column width="100" name="fAlterall" xid="column43"><editor xid="editor27">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output7" bind-ref="ref('fAlterall')"></div></editor></column>
    <column width="100" name="fFactall" xid="column30"><editor xid="editor28">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output8" bind-ref="ref('fFactall')"></div></editor></column></columns> </div></div> </div> 
   </div></div> 
        </div> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectCostCenter" title="选择成本中心" status="normal" showTitle="true" src="$UI/OA/badgut/process/dialog/selectCostDialog/selectCostDialog.w" width="700px" height="500px" onReceive="dlgSelectCostCenterReceive"></span><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectBadgut" title="选择预算计划" showTitle="true" status="normal" width="700px" height="500px" style="left:48px;top:10px;" src="$UI/OA/badgut/process/dialog/selectBadgutDialog/selectBadgutDialog.w" onReceive="dlgSelectBadgutReceive" onLoad="dlgSelectBadgutLoad"></span></div>