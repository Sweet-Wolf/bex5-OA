<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad" style="height:auto;left:354px;top:214px;"><div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_WM_LeaveApply" columns="" limit="20">
   <reader action="/OA/workTime/logic/action/queryOA_WM_LeaveApplyAction" xid="default4"></reader>
   <writer action="/OA/workTime/logic/action/saveOA_WM_LeaveApplyAction" xid="default5"></writer>
   <creator action="/OA/workTime/logic/action/createOA_WM_LeaveApplyAction" xid="default6"></creator>
   <calculateRelation relation="calcCheckBox" xid="calculateRelation1"></calculateRelation>
   <rule xid="rule1">
    <col name="fFactEndTime" xid="ruleCol1">
     <calculate xid="calculate1">
      <expr xid="default1"></expr></calculate> 
     <constraint xid="constraint1">
      <expr xid="default2">$row.val(&quot;fFactEndTime&quot;)&gt;$row.val(&quot;fFactStartTime&quot;)</expr></constraint> 
     <required xid="required1">
      <expr xid="default3">true</expr></required> </col> 
    <col name="fFactStartTime" xid="ruleCol2">
     <required xid="required2">
      <expr xid="default7">true</expr></required> </col> 
    <col name="fCancelHolsDeptName" xid="ruleCol3">
     <required xid="required3">
      <expr xid="default8"></expr></required> </col> 
    <col name="fCancelHolsPersonName" xid="ruleCol4">
     <required xid="required4">
      <expr xid="default9"></expr></required> </col> 
    <col name="fCancelHolsDate" xid="ruleCol5">
     <required xid="required5">
      <expr xid="default10"></expr></required> </col> </rule> </div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="vacationData" concept="OA_WM_Vacation">
   <reader xid="default4" action="/OA/workTime/logic/action/queryOA_WM_VacationAction"></reader>
   <writer xid="default5" action="/OA/workTime/logic/action/saveOA_WM_VacationAction"></writer>
   <creator xid="default6" action="/OA/workTime/logic/action/createOA_WM_VacationAction"></creator></div></div> 
<div component="$UI/system/components/justep/process/process" xid="process" style="height:24px;width:24px;left:54px;top:138px;" autoClose="false" autoStart="false" autoSave="false" autoFilter="false" data="mainData"></div>
  <div xid="view">
   <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="bar">
    
    
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="refreshBtn" onClick='{"operation":"mainData.refresh"}' label="刷新">
     <i xid="i2"></i>
     <span xid="span2">刷新</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="chartBtnClick" xid="chartBtn" label="流程图" icon="icon-android-image">
   <i xid="i1" class="icon-android-image"></i>
   <span xid="span1">流程图</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="processBtnClick" xid="processBtn" label="流程记录" icon="icon-android-note">
   <i xid="i3" class="icon-android-note"></i>
   <span xid="span3">流程记录</span></a></div> 
    
    
   <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row3">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5">
      <label class="x-label" style="width:100px;" xid="label16">申请信息</label>
      <div class="x-edit" xid="div15"></div></div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit20">
      <label class="x-label" style="width:100px;" xid="label27"></label>
      <div class="x-edit" xid="div21"></div></div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput1">
      <label class="x-label" style="width:100px;" xid="label14">NO</label>
      <div class="x-edit" xid="div10">
       <div bind-ref="mainData.ref('fNO')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output1"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelOutput1">
      <label bind-text="mainData.label('fLeaveTypeName')" class="x-label" style="width:100px;" xid="label14"></label>
      <div class="x-edit" xid="div16">
       <div bind-ref="mainData.ref('fLeaveTypeName')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output111" xui:parent="div16" xui:update-mode="insert"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit2">
      <label bind-text="mainData.label('fApplyDeptName')" class="x-label" style="width:100px;" xid="label2"></label>
      <div class="x-edit" xid="div2">
       <div bind-ref="mainData.ref('fApplyDeptName')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output211" xui:parent="div2" xui:update-mode="insert"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit3">
      <label bind-text="mainData.label('fApplyPersonName')" class="x-label" style="width:100px;" xid="label3"></label>
      <div class="x-edit" xid="div3">
       <div bind-ref="mainData.ref('fApplyPersonName')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output311" xui:parent="div3" xui:update-mode="insert"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit6">
      <label bind-text="mainData.label('fStartTime')" class="x-label" style="width:100px;" xid="label4"></label>
      <div class="x-edit" xid="div14">
       <div bind-ref="mainData.ref('fStartTime')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output411" xui:parent="div14" xui:update-mode="insert"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5">
      <label bind-text="mainData.label('fEndTime')" class="x-label" style="width:100px;" xid="label12"></label>
      <div class="x-edit" xid="div5">
       <div bind-ref="mainData.ref('fEndTime')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output511" xui:parent="div5" xui:update-mode="insert"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit4">
      <label bind-text="mainData.label('fLeaveTime')" class="x-label" style="width:100px;" xid="label11"></label>
      <div class="x-edit" xid="div4">
       <div bind-ref="mainData.ref('fLeaveDays')" class="form-control" component="$UI/system/components/justep/output/output" style="width:40px;float:left;" xid="output4"></div>
       <label style="float:left;line-height:35px;padding-left:5px;padding-right:5px;" xid="label9">天</label>
       <div bind-ref="mainData.ref('fLeaveHours')" class="form-control" component="$UI/system/components/justep/output/output" style="width:40px;float:left;" xid="output3"></div>
       <label style="float:left;line-height:35px;" xid="label15">小时</label></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit9">
      <label bind-text="mainData.label('fApplyDate')" class="x-label" style="width:100px;" xid="label10"></label>
      <div class="x-edit" xid="div11">
       <div bind-ref="mainData.ref('fApplyDate')" class="x-output form-control" component="$UI/system/components/justep/output/output" format="yyyy-MM-dd" xid="output2"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit8">
      <label bind-text="mainData.label('fTransport')" class="x-label" style="width:100px;" xid="label13"></label>
      <div class="x-edit" xid="div12">
       <div bind-ref="mainData.ref('fTransport')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output611" xui:parent="div12" xui:update-mode="insert"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col15">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit7">
      <label bind-text="mainData.label('fRelationTel')" class="x-label" style="width:100px;" xid="label22"></label>
      <div class="x-edit" xid="div13">
       <div bind-ref="mainData.ref('fRelationTel')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output711" xui:parent="div13" xui:update-mode="insert"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col18">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit14">
      <label bind-text="vacationData.label('fHoliday')" class="x-label" style="width:100px;" xid="label21"></label>
      <div class="x-edit" xid="div18">
       <div bind-ref="vacationData.ref('fHoliday')" class="form-control" component="$UI/system/components/justep/output/output" xid="output11"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col20">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit13">
      <label class="x-label" style="width:100px;" xid="label17">已休年假</label>
      <div class="x-edit" xid="div17">
       <div bind-ref="vacationData.ref('fAlreadyDay')" class="form-control" component="$UI/system/components/justep/output/output" style="width:40px;float:left;" xid="output15"></div>
       <label style="float:left;line-height:35px;padding-left:5px;padding-right:5px;" xid="label22">天</label>
       <div bind-ref="vacationData.ref('fAlreadyHour')" class="form-control" component="$UI/system/components/justep/output/output" style="width:40px;float:left;" xid="output14"></div>
       <label style="float:left;line-height:35px;" xid="label21">小时</label></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col19">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit12">
      <label class="x-label" style="width:100px;" xid="label18">剩余年假</label>
      <div class="x-edit" xid="div12">
       <div bind-ref="vacationData.ref('fLeavingsDay')" class="form-control" component="$UI/system/components/justep/output/output" style="width:40px;float:left;" xid="output17"></div>
       <label style="float:left;line-height:35px;padding-left:5px;padding-right:5px;" xid="label24">天</label>
       <div bind-ref="vacationData.ref('fLeavingsHour')" class="form-control" component="$UI/system/components/justep/output/output" style="width:40px;float:left;" xid="output16"></div>
       <label style="float:left;line-height:35px;" xid="label23">小时</label></div> </div> </div> 
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col15">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit18">
      <label bind-text="mainData.label('fPLACE')" class="x-label" style="width:100px;" xid="label13"></label>
      <div class="x-edit" xid="div13">
       <div bind-ref="mainData.ref('fPLACE')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output811" xui:parent="div13" xui:update-mode="insert"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col17">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit10">
      <label bind-text="mainData.label('fLeaveReason')" class="x-label" style="width:100px;" xid="label13"></label>
      <div class="x-edit" xid="div17">
       <div bind-ref="mainData.ref('fLeaveReason')" class="x-output form-control" component="$UI/system/components/justep/output/output" style="height:60px;" xid="output911" xui:parent="div17" xui:update-mode="insert"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit11">
      <label bind-text="mainData.label('fIsReducHoliday')" class="x-label" style="width:100px;" xid="label10"></label>
      <div class="x-edit" xid="div13">
       <div bind-ref="mainData.ref('fIsReducHoliday')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="fIsReducHoliday" id="fIsReducHoliday" xui:parent="div13" xui:update-mode="insert"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit15">
      <label bind-text="mainData.label('fCreatePerName')" class="x-label" style="width:100px;" xid="label10"></label>
      <div class="x-edit" xid="div11">
       <div bind-ref="mainData.ref('fCreatePerName')" class="form-control" component="$UI/system/components/justep/output/output" xid="output9"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col25">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit16">
      <label bind-text="mainData.label('fBizStateName')" class="x-label" style="width:100px;" xid="label18"></label>
      <div class="x-edit" xid="div11">
       <div bind-ref="mainData.ref('fBizStateName')" class="form-control" component="$UI/system/components/justep/output/output" xid="output8"></div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col26">
     <div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit17">
      <label bind-text="mainData.label('fRemark')" class="x-label" style="width:100px;" xid="label17"></label>
      <div class="x-edit" xid="div12">
       <div bind-ref="mainData.ref('fRemark')" class="x-output form-control" component="$UI/system/components/justep/output/output" style="height:60px;" xid="output1011" xui:parent="div12" xui:update-mode="insert"></div></div> </div> </div>
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
      <label class="x-label" xid="label1" style="width:100px;">销假确认</label>
      <div class="x-edit" xid="div1"></div></div> </div>
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit19">
      <label class="x-label" xid="label25" style="width:100px;" bind-text="mainData.label('fFactStartTime')"></label>
      <div class="x-edit" xid="div20">
       <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="mainData.ref('fFactStartTime')"></input></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit19">
      <label class="x-label" xid="label25" style="width:100px;" bind-text="mainData.label('fFactEndTime')"></label>
      <div class="x-edit" xid="div19">
       <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="mainData.ref('fFactEndTime')"></input></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput1">
      <label class="x-label" xid="label5" style="width:100px;">实际天数</label>
      <div class="x-edit" xid="div6">
       <div class="form-control" component="$UI/system/components/justep/output/output" bind-ref="mainData.ref('fFactDays')" xid="fLeaveDays" style="width:40px;float:left;"></div>
       <label xid="label19" style="float:left;line-height:35px;padding-left:5px;padding-right:5px;">天</label>
       <div class="form-control" component="$UI/system/components/justep/output/output" bind-ref="mainData.ref('fFactHours')" xid="fLeaveHours" style="width:40px;float:left;"></div>
       <label xid="label20" style="float:left;line-height:35px;">小时</label></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput3">
      <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fCancelHolsDeptName')"></label>
      <div class="x-edit" xid="div7">
       <input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="mainData.ref('fCancelHolsDeptName')"></input></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput3">
      <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fCancelHolsPersonName')"></label>
      <div class="x-edit" xid="div9">
       <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="mainData.ref('fCancelHolsPersonName')"></input></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelInput2">
      <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fCancelHolsDate')"></label>
      <div class="x-edit" xid="div8">
       <input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref="mainData.ref('fCancelHolsDate')"></input></div> </div> </div> </div></div></div>