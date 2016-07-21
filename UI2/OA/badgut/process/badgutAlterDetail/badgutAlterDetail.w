<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:587px;top:20px;" onModelConstructDone="modelModelConstructDone"> 
    
  
  <div component="$UI/system/components/justep/data/bizData" xid="taskData" concept="SA_Task">
   <reader xid="default19" action="/system/logic/action/queryTaskAction"></reader></div>
  <div autoLoad="true" autoNew="false" columns="" component="$UI/system/components/justep/data/bizData" concept="OA_BG_AlterM" directDelete="true" isTree="false" orderBy="" xid="mainData" xui:update-mode="merge">
   <reader action="/OA/badgut/logic/action/queryBGAlterMAction" xid="default3"></reader>
   <writer action="/OA/badgut/logic/action/saveBGAlterMAction" xid="default10"></writer>
   <creator action="/OA/badgut/logic/action/createBGAlterMAction" xid="default11"></creator>
   <rule xid="rule1">
    <col name="fCostCenterCode" xid="ruleCol1">
     <readonly xid="readonly6" xui:parent="ruleCol1" xui:update-mode="insert">
      <expr xid="default111111">true</expr></readonly> </col> 
    <col name="fCostCenterName" xid="ruleCol2">
     <readonly xid="readonly7" xui:parent="ruleCol2" xui:update-mode="insert">
      <expr xid="default211">true</expr></readonly> </col> 
    <col name="fYear" xid="ruleCol3">
     <required xid="required3">
      <expr xid="default4"></expr></required> 
     <readonly xid="readonly8" xui:parent="ruleCol3" xui:update-mode="insert">
      <expr xid="default31">true</expr></readonly> </col> 
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
      <expr xid="default9">true</expr></readonly> </col> 
    <col name="fRemark" xid="ruleCol11" xui:parent="rule1" xui:update-mode="insert">
     <readonly xid="readonly9">
      <expr xid="default41">true</expr></readonly> </col> </rule> </div>
  <div autoLoad="true" autoNew="false" columns="OA_BG_AlterD,version,fAccountID,fAccountCode,fAccountName,fBGAlterID,fPlan1,fPlan2,fPlan3,fPlan4,fPlan5,fPlan6,fPlan7,fPlan8,fPlan9,fPlan10,fPlan11,fPlan12,fPlanall,fFact1,fFact2,fFact3,fFact4,fFact5,fFact6,fFact7,fFact8,fFact9,fFact10,fFact11,fFact12,fFactall,fAlter1,fAlter2,fAlter3,fAlter4,fAlter5,fAlter6,fAlter7,fAlter8,fAlter9,fAlter10,fAlter11,fAlter12,fAlterall,fBGDetailID" component="$UI/system/components/justep/data/bizData" concept="OA_BG_AlterD" directDelete="true" isTree="false" orderBy="" xid="detailData">
   <reader action="/OA/badgut/logic/action/queryBGAlterDAction" xid="default22"></reader>
   <writer action="/OA/badgut/logic/action/saveBGAlterDAction" xid="default23"></writer>
   <creator action="/OA/badgut/logic/action/createBGAlterDAction" xid="default24"></creator>
   <master data="mainData" relation="fBGAlterID" xid="default1"></master>
   </div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process" data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div><div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chartBtn" label="流程图" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
    <i xid="i2"></i>
    <span xid="span2">流程图</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="processRecBtn" label="流程记录" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}">
    <i xid="i1"></i>
    <span xid="span1">流程记录</span></a> </div><div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="mainForm">
   <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1">
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col3">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1">
     <label class="x-label" style="width:90px;" title="基础信息" xid="fApplyDeptNamell">基础信息</label>
     <div class="x-edit" xid="div1"></div></div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit8">
     <label class="x-label" style="width:100px;" title="成本编码" xid="label1">成本编码</label>
     <div class="x-edit" style="width:200px;" xid="div8">
      <output bind-ref="mainData.ref('fCostCenterCode')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="fCostCenterCode"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col23">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput2">
     <label class="x-label" style="width:100px;" title="成本中心" xid="fIsPreLoanLL">成本中心</label>
     <div class="x-edit" xid="div23">
      <output bind-ref="mainData.ref('fCostCenterName')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="fCostCenterName"></output></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col8">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput4">
     <label class="x-label" style="width:100px;" title="年 度" xid="fLoanAmtL">年 度</label>
     <div class="x-edit" xid="div11">
      <input bind-ref="mainData.ref('fYear')" class="form-control" component="$UI/system/components/justep/input/input" xid="fYear"></input></div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit6">
     <label class="x-label" style="width:100px;" title="提交部门" xid="fLoanDeptNameL">提交部门</label>
     <div class="x-edit" xid="div6">
      <div bind-labelRef="mainData.ref('fCreateDeptName')" bind-ref="mainData.ref('fCreateDeptID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" includeOrgKind="ogn,dpt" xid="orgSelectPC4">
       <div autoLoad="true" component="$UI/system/components/justep/data/bizData" xid="dOrg"></div>
       <option label="sName" value="sCode" xid="option4">
        <columns xid="columns6">
         <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5">
     <label class="x-label" style="width:100px;" title="提 交 人" xid="fLoanPsnNameL">提 交 人</label>
     <div class="x-edit" xid="div5">
      <div bind-labelRef="mainData.ref('fCreatePsnName')" bind-ref="mainData.ref('fCreatePsnID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" includeOrgKind="psm" xid="orgSelectPC3">
       <div autoLoad="true" component="$UI/system/components/justep/data/bizData" limit="-1" xid="dPsm">
        <treeOption rootFilter="1=1" xid="default15"></treeOption></div> 
       <option label="sName" value="sCode" xid="option5">
        <columns xid="columns5">
         <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
   <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit4">
     <label class="x-label" style="width:100px;" title="提交时间" xid="fLoanDateL">提交时间</label>
     <div class="x-edit" xid="div4">
      <output bind-ref="mainData.ref('fCreateTime')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output1"></output></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col2">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit15">
     <label class="x-label" style="width:100px;" title="备      注" xid="fRemarkL">备      注</label>
     <div class="x-edit" xid="div15">
      <textarea bind-ref="mainData.ref('fRemark')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="fRemark"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28"></div>
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col19">
    <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit2">
     <label class="x-label" style="width:90px;" title="详细信息" xid="label8">详细信息</label>
     <div class="x-edit" xid="div19"></div></div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11">
    <div xid="div17">
     <div class="x-grid-no-bordered" component="$UI/system/components/justep/grid/grid" data="detailData" directEdit="true" height="auto" hiddenCaptionbar="true" showRowNumber="true" width="100%" xid="detail">
      <columns xid="column">
       <column editable="false" name="fAccountCode" width="100" xid="column1">
        <editor xid="editor1">
         <div bind-ref="ref('fAccountCode')" class="x-output" component="$UI/system/components/justep/output/output" xid="output2"></div></editor> </column> 
       <column editable="false" name="fAccountName" width="100" xid="column2">
        <editor xid="editor2">
         <div bind-ref="ref('fAccountName')" class="x-output" component="$UI/system/components/justep/output/output" xid="output3"></div></editor> </column> 
       <column editable="false" name="fPlan1" width="100" xid="column3">
        <editor xid="editor3">
         <div bind-ref="ref('fPlan1')" class="x-output" component="$UI/system/components/justep/output/output" xid="output5"></div></editor> </column> 
       <column editable="false" name="fAlter1" width="100" xid="column31">
        <editor xid="editor16">
         <input bind-ref="ref('fAlter1')" class="form-control" component="$UI/system/components/justep/input/input" xid="input1"></input></editor> </column> 
       <column name="fFact1" width="100" xid="column18">
        <editor xid="editor41">
         <div bind-ref="ref('fFact1')" class="x-output" component="$UI/system/components/justep/output/output" xid="output30"></div></editor> </column> 
       <column editable="false" name="fPlan2" width="100" xid="column4">
        <editor xid="editor4">
         <div bind-ref="ref('fPlan2')" class="x-output" component="$UI/system/components/justep/output/output" xid="output6"></div></editor> </column> 
       <column editable="false" name="fAlter2" width="100" xid="column32">
        <editor xid="editor17">
         <input bind-ref="ref('fAlter2')" class="form-control" component="$UI/system/components/justep/input/input" xid="input2"></input></editor> </column> 
       <column editable="false" name="fFact2" width="100" xid="column19">
        <editor xid="editor40">
         <div bind-ref="ref('fFact2')" class="x-output" component="$UI/system/components/justep/output/output" xid="output29"></div></editor> </column> 
       <column editable="false" name="fPlan3" width="100" xid="column7">
        <editor xid="editor5">
         <div bind-ref="ref('fPlan3')" class="x-output" component="$UI/system/components/justep/output/output" xid="output28"></div></editor> </column> 
       <column editable="false" name="fAlter3" width="100" xid="column33">
        <editor xid="editor18">
         <input bind-ref="ref('fAlter3')" class="form-control" component="$UI/system/components/justep/input/input" xid="input3"></input></editor> </column> 
       <column editable="false" name="fFact3" width="100" xid="column20">
        <editor xid="editor39">
         <div bind-ref="ref('fFact3')" class="x-output" component="$UI/system/components/justep/output/output" xid="output27"></div></editor> </column> 
       <column editable="false" name="fPlan4" width="100" xid="column8">
        <editor xid="editor6">
         <div bind-ref="ref('fPlan4')" class="x-output" component="$UI/system/components/justep/output/output" xid="output26"></div></editor> </column> 
       <column editable="false" name="fAlter4" width="100" xid="column34">
        <editor xid="editor19">
         <input bind-ref="ref('fAlter4')" class="form-control" component="$UI/system/components/justep/input/input" xid="input4"></input></editor> </column> 
       <column editable="false" name="fFact4" width="100" xid="column21">
        <editor xid="editor38">
         <div bind-ref="ref('fFact4')" class="x-output" component="$UI/system/components/justep/output/output" xid="output25"></div></editor> </column> 
       <column editable="false" name="fPlan5" width="100" xid="column9">
        <editor xid="editor7">
         <div bind-ref="ref('fPlan5')" class="x-output" component="$UI/system/components/justep/output/output" xid="output24"></div></editor> </column> 
       <column editable="false" name="fAlter5" width="100" xid="column35">
        <editor xid="editor20">
         <input bind-ref="ref('fAlter5')" class="form-control" component="$UI/system/components/justep/input/input" xid="input5"></input></editor> </column> 
       <column editable="false" name="fFact5" width="100" xid="column22">
        <editor xid="editor37">
         <div bind-ref="ref('fFact5')" class="x-output" component="$UI/system/components/justep/output/output" xid="output23"></div></editor> </column> 
       <column editable="false" name="fPlan6" width="100" xid="column10">
        <editor xid="editor8">
         <div bind-ref="ref('fPlan6')" class="x-output" component="$UI/system/components/justep/output/output" xid="output22"></div></editor> </column> 
       <column editable="false" name="fAlter6" width="100" xid="column36">
        <editor xid="editor21">
         <input bind-ref="ref('fAlter6')" class="form-control" component="$UI/system/components/justep/input/input" xid="input6"></input></editor> </column> 
       <column editable="false" name="fFact6" width="100" xid="column23">
        <editor xid="editor36">
         <div bind-ref="ref('fFact6')" class="x-output" component="$UI/system/components/justep/output/output" xid="output21"></div></editor> </column> 
       <column editable="false" name="fPlan7" width="100" xid="column11">
        <editor xid="editor9">
         <div bind-ref="ref('fPlan7')" class="x-output" component="$UI/system/components/justep/output/output" xid="output20"></div></editor> </column> 
       <column editable="false" name="fAlter7" width="100" xid="column37">
        <editor xid="editor22">
         <input bind-ref="ref('fAlter7')" class="form-control" component="$UI/system/components/justep/input/input" xid="input7"></input></editor> </column> 
       <column editable="false" name="fFact7" width="100" xid="column24">
        <editor xid="editor35">
         <div bind-ref="ref('fFact7')" class="x-output" component="$UI/system/components/justep/output/output" xid="output19"></div></editor> </column> 
       <column editable="false" name="fPlan8" width="100" xid="column12">
        <editor xid="editor10">
         <div bind-ref="ref('fPlan8')" class="x-output" component="$UI/system/components/justep/output/output" xid="output18"></div></editor> </column> 
       <column editable="false" name="fAlter8" width="100" xid="column38">
        <editor xid="editor23">
         <input bind-ref="ref('fAlter8')" class="form-control" component="$UI/system/components/justep/input/input" xid="input8"></input></editor> </column> 
       <column editable="false" name="fFact8" width="100" xid="column25">
        <editor xid="editor34">
         <div bind-ref="ref('fFact8')" class="x-output" component="$UI/system/components/justep/output/output" xid="output17"></div></editor> </column> 
       <column editable="false" name="fPlan9" width="100" xid="column13">
        <editor xid="editor11">
         <div bind-ref="ref('fPlan9')" class="x-output" component="$UI/system/components/justep/output/output" xid="output16"></div></editor> </column> 
       <column editable="false" name="fAlter9" width="100" xid="column39">
        <editor xid="editor24">
         <input bind-ref="ref('fAlter9')" class="form-control" component="$UI/system/components/justep/input/input" xid="input9"></input></editor> </column> 
       <column editable="false" name="fFact9" width="100" xid="column26">
        <editor xid="editor33">
         <div bind-ref="ref('fFact9')" class="x-output" component="$UI/system/components/justep/output/output" xid="output15"></div></editor> </column> 
       <column editable="false" name="fPlan10" width="100" xid="column14">
        <editor xid="editor12">
         <div bind-ref="ref('fPlan10')" class="x-output" component="$UI/system/components/justep/output/output" xid="output14"></div></editor> </column> 
       <column editable="false" name="fAlter10" width="100" xid="column44">
        <editor xid="editor25">
         <input bind-ref="ref('fAlter10')" class="form-control" component="$UI/system/components/justep/input/input" xid="input10"></input></editor> </column> 
       <column editable="false" name="fFact10" width="100" xid="column27">
        <editor xid="editor32">
         <div bind-ref="ref('fFact10')" class="x-output" component="$UI/system/components/justep/output/output" xid="output13"></div></editor> </column> 
       <column editable="false" name="fPlan11" width="100" xid="column15">
        <editor xid="editor13">
         <div bind-ref="ref('fPlan11')" class="x-output" component="$UI/system/components/justep/output/output" xid="output12"></div></editor> </column> 
       <column editable="false" name="fAlter11" width="100" xid="column41">
        <editor xid="editor26">
         <input bind-ref="ref('fAlter11')" class="form-control" component="$UI/system/components/justep/input/input" xid="input11"></input></editor> </column> 
       <column editable="false" name="fFact11" width="100" xid="column28">
        <editor xid="editor31">
         <div bind-ref="ref('fFact11')" class="x-output" component="$UI/system/components/justep/output/output" xid="output11"></div></editor> </column> 
       <column editable="false" name="fPlan12" width="100" xid="column16">
        <editor xid="editor14">
         <div bind-ref="ref('fPlan12')" class="x-output" component="$UI/system/components/justep/output/output" xid="output10"></div></editor> </column> 
       <column editable="false" name="fAlter12" width="100" xid="column42">
        <editor xid="editor30">
         <input bind-ref="ref('fAlter12')" class="form-control" component="$UI/system/components/justep/input/input" xid="input12"></input></editor> </column> 
       <column editable="false" name="fFact12" width="100" xid="column29">
        <editor xid="editor29">
         <div bind-ref="ref('fFact12')" class="x-output" component="$UI/system/components/justep/output/output" xid="output9"></div></editor> </column> 
       <column editable="false" name="fPlanall" width="100" xid="column17">
        <editor xid="editor15">
         <div bind-ref="ref('fPlanall')" class="x-output" component="$UI/system/components/justep/output/output" xid="output4"></div></editor> </column> 
       <column name="fAlterall" width="100" xid="column43">
        <editor xid="editor27">
         <div bind-ref="ref('fAlterall')" class="x-output" component="$UI/system/components/justep/output/output" xid="output7"></div></editor> </column> 
       <column name="fFactall" width="100" xid="column30">
        <editor xid="editor28">
         <div bind-ref="ref('fFactall')" class="x-output" component="$UI/system/components/justep/output/output" xid="output8"></div></editor> </column> </columns> </div> </div> </div> </div></div></div>
