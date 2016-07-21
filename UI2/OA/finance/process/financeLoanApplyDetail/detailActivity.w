<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:587px;top:20px;" onModelConstructDone="modelModelConstructDone"> 
    
  <div autoLoad="true" autoNew="false" columns="" component="$UI/system/components/justep/data/bizData" concept="OA_FC_LoanApply" directDelete="true" orderBy="" xid="dLoanApply" xui:update-mode="merge" confirmRefresh="false">
   <reader action="/OA/finance/logic/action/queryFCLoanApplyAction" xid="default25"></reader>
   <writer action="/OA/finance/logic/action/saveFCLoanApplyAction" xid="default26"></writer>
   <creator action="/OA/finance/logic/action/createFCLoanApplyAction" xid="default27"></creator>
   <rule xid="rule1">
    <col name="fNO" xid="ruleCol1">
     <readonly xid="readonly1">
      <expr xid="default22">true</expr></readonly> </col> 
    <col name="fLoanDeptName" xid="ruleCol2">
     <required xid="required1">
      <expr xid="default23" xui:update-mode="merge-and-replace"></expr></required> 
     <readonly parent="ruleCol2" update-mode="insert" xid="readonly1111" xui:parent="ruleCol2" xui:update-mode="insert">
      <expr xid="default1111">true</expr></readonly> </col> 
    <col name="fLoanPsnName" xid="ruleCol3">
     <required xid="required2">
      <expr xid="default24" xui:update-mode="merge-and-replace"></expr></required> 
     <readonly parent="ruleCol3" update-mode="insert" xid="readonly2111" xui:parent="ruleCol3" xui:update-mode="insert">
      <expr xid="default2111">true</expr></readonly> </col> 
    <col name="fLoanDate" xid="ruleCol4">
     <required xid="required3">
      <expr xid="default4" xui:update-mode="merge-and-replace"></expr></required> 
     <readonly parent="ruleCol4" update-mode="insert" xid="readonly3111" xui:parent="ruleCol4" xui:update-mode="insert">
      <expr xid="default3111">true</expr></readonly> </col> 
    <col name="fReturnDate" xid="ruleCol5">
     <required xid="required4">
      <expr xid="default5" xui:update-mode="merge-and-replace"></expr></required> 
     <readonly parent="ruleCol5" update-mode="insert" xid="readonly4111" xui:parent="ruleCol5" xui:update-mode="insert">
      <expr xid="default4111">true</expr></readonly> </col> 
    <col name="fLoanPurpose" xid="ruleCol6">
     <required xid="required5">
      <expr xid="default6" xui:update-mode="merge-and-replace"></expr></required> 
     <readonly parent="ruleCol6" update-mode="insert" xid="readonly5111" xui:parent="ruleCol6" xui:update-mode="insert">
      <expr xid="default5111">true</expr></readonly> </col> 
    <col name="fLoanAmt" xid="ruleCol7">
     <constraint xid="constraint1">
      <expr xid="default7" xui:update-mode="merge-and-replace"></expr>
      <message xid="default8" xui:update-mode="merge-and-replace"></message></constraint> 
     <readonly xid="readonly1211" xui:parent="ruleCol7" xui:update-mode="insert">
      <expr xid="default1211">true</expr></readonly> </col> 
    <col name="fLoanDeptID" parent="rule1" update-mode="insert" xid="ruleCol1111" xui:parent="rule1" xui:update-mode="insert">
     <readonly xid="readonly6111">
      <expr xid="default6111">true</expr></readonly> </col> 
    <col name="fLoanPsnID" parent="rule1" update-mode="insert" xid="ruleCol2111" xui:parent="rule1" xui:update-mode="insert">
     <readonly xid="readonly7111">
      <expr xid="default7111">true</expr></readonly> </col> 
    <col name="fLoanType" parent="rule1" update-mode="insert" xid="ruleCol3111" xui:parent="rule1" xui:update-mode="insert">
     <readonly xid="readonly8111">
      <expr xid="default8111">true</expr></readonly> </col> 
    <col name="fLoanTypeName" parent="rule1" update-mode="insert" xid="ruleCol3112" xui:parent="rule1" xui:update-mode="insert">
     <readonly xid="readonly8112">
      <expr xid="default8112">true</expr></readonly> </col> 
    <col name="fLoanTypeCode" parent="rule1" update-mode="insert" xid="ruleCol3113" xui:parent="rule1" xui:update-mode="insert">
     <readonly xid="readonly8113">
      <expr xid="default8113">true</expr></readonly> </col> 
    <col name="fLoanTypeName" parent="rule1" update-mode="insert" xid="ruleCol4111" xui:parent="rule1" xui:update-mode="insert">
     <readonly xid="readonly9111">
      <expr xid="default9111">true</expr></readonly> </col> 
    <col name="fRemark" parent="rule1" update-mode="insert" xid="ruleCol5111" xui:parent="rule1" xui:update-mode="insert">
     <readonly xid="readonly10111">
      <expr xid="default10111">true</expr></readonly> </col> </rule> </div><div component="$UI/system/components/justep/data/bizData" xid="taskData" concept="SA_Task">
   <reader xid="default19" action="/system/logic/action/queryTaskAction"></reader></div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process" data="dLoanApply" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div><div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chartBtn" label="流程图" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
    <i xid="i2"></i>
    <span xid="span2">流程图</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="processRecBtn" label="流程记录" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
    <i xid="i1"></i>
    <span xid="span1">流程记录</span></a> </div><div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="mainForm">
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
      <output class="form-control" component="$UI/system/components/justep/output/output" data="dLoanApply" bind-ref="dLoanApply.ref('fNO')" xid="fNO"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
     <label class="x-label" xid="fLoanDeptNameL" bind-text="dLoanApply.label('fLoanDeptName')" style="width:100px;"></label>
     <div class="x-edit" xid="div6">
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC4" bind-ref="dLoanApply.ref('fLoanDeptID')" bind-labelRef="dLoanApply.ref('fLoanDeptName')" includeOrgKind="ogn,dpt">
       <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg"></div>
       <option xid="option4" value="sCode" label="sName">
        <columns xid="columns6">
         <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
     <label class="x-label" xid="fLoanPsnNameL" bind-text="dLoanApply.label('fLoanPsnName')" style="width:100px;"></label>
     <div class="x-edit" xid="div5">
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" bind-ref="dLoanApply.ref('fLoanPsnID')" bind-labelRef="dLoanApply.ref('fLoanPsnName')" includeOrgKind="psm">
       <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
        <treeOption xid="default20" rootFilter="1=1"></treeOption></div> 
       <option xid="option5" value="sCode" label="sName">
        <columns xid="columns5">
         <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
     <label class="x-label" xid="fLoanDateL" bind-text="dLoanApply.label('fLoanDate')" style="width:100px;"></label>
     <div class="x-edit" xid="div4">
      <input xid="fLoanDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dLoanApply.ref('fLoanDate')"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit8">
     <label class="x-label" xid="fReturnDateL" bind-text="dLoanApply.label('fReturnDate')" style="width:100px;"></label>
     <div class="x-edit" xid="div8" style="width:200px;">
      <input xid="fReturnDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dLoanApply.ref('fReturnDate')" format="yyyy-MM-dd"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
     <label class="x-label" xid="fLoanTypeL" style="width:100px;" bind-text="dLoanApply.label('fLoanType')"></label>
     <div class="x-edit" xid="div9">
      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="grdSlfLoanType" bind-ref="dLoanApply.ref('fLoanTypeCode')" bind-labelRef="dLoanApply.ref('fLoanTypeName')">
       <option xid="option3" data="dLoanType" value="fCode" label="fName"></option></div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col25">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit12">
     <label class="x-label" xid="fLoanAmtL" bind-text="dLoanApply.label('fLoanAmt')" style="width:100px;"></label>
     <div class="x-edit" xid="div12">
      <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dLoanApply.ref('fLoanAmt')" xid="fLoanAmt"></input></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit15">
     <label class="x-label" xid="fLoanPurposeL" bind-text="dLoanApply.label('fLoanPurpose')" style="width:100px;"></label>
     <div class="x-edit" xid="div15">
      <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="dLoanApply.ref('fLoanPurpose')" xid="fLoanPurpose"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col38">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit21">
     <label class="x-label" xid="fRemarkL" bind-text="dLoanApply.label('fRemark')" style="width:100px;"></label>
     <div class="x-edit" xid="div21">
      <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="dLoanApply.ref('fRemark')" xid="fRemark"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col19">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput12">
     <label class="x-label" xid="attachmentL" style="width:100px;">附件</label>
     <div component="$UI/system/components/justep/attachment/attachment" access="duud" xid="fExtendStr1" style="width:100%;" bind-ref="dLoanApply.ref('fExtendStr9')" subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))">
      <div class="x-attachment" xid="div2">
       <div class="x-attachment-content x-card-border" xid="div14">
        <div class="x-doc-process" xid="div13">
         <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div11"></div></div> 
        <div data-bind="foreach:$attachmentItems" xid="div10">
         <div class="x-attachment-cell" xid="div7">
          <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div7">
           <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
        <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div2">
         <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div10"></div></div> 
        <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div11">
         <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div16"></div></div> 
        <div style="clear:both;" xid="div13"></div></div> </div> </div> </div> </div> </div></div></div>
