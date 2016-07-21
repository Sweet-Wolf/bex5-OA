<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:259px;top:378px;" onModelConstructDone="modelModelConstructDone">
    <div component="$UI/system/components/justep/data/bizData" xid="dSignature"
      concept="OA_SL_Signature" autoNew="false" limit="1" autoLoad="false">
      <reader xid="default1" action="/OA/signature/logic/action/querySLSignatureAction"/>  
      <writer xid="default2"/>  
      <creator xid="default3"/>
    <rule xid="rule1">
   <readonly xid="readonly1">
    <expr xid="default4">true</expr></readonly> 
   <col name="fNO" xid="ruleCol1">
    <readonly xid="readonly2">
     <expr xid="default5">true</expr></readonly> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="taskData" concept="SA_Task">
   <reader xid="default7" action="/system/logic/action/queryTaskAction"></reader></div></div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="chart2Btn" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}" label="流程图" icon="icon-image">
   <i xid="i9" class="icon-image"></i>
   <span xid="span9">流程图</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}" xid="button3">
   <i xid="i3"></i>
   <span xid="span3"></span></a></div><div xid="view"> 
    <div xid="content">
      <h1 xid="title" class="text-center"><![CDATA[印章使用详情]]></h1>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="申请信息" xid="controlGroup2"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span4">title</span>
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelOutput1">
     <label class="x-label" xid="label1" style="width:100px;" bind-text="dSignature.label('fNO')"></label>
     <div component="$UI/system/components/justep/output/output" class="form-control x-edit" xid="output1" bind-ref="dSignature.ref('fNO')"></div></div> </div> 
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit1">
     <label class="x-label" xid="label2" bind-text="dSignature.label('fApplyDeptName')" style="width:100px;"></label>
     <div class="x-edit" xid="div1">
      <div component="$UI/system/components/justep/output/output" class="form-control" xid="output2" bind-ref="dSignature.ref('fApplyDeptName')"></div></div> </div> </div> 
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col23">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit2">
     <label class="x-label" xid="label3" bind-text="dSignature.label('fApplyPsnName')" style="width:100px;"></label>
     <div class="x-edit" xid="div2">
      <div component="$UI/system/components/justep/output/output" class="form-control" xid="output3" bind-ref="dSignature.ref('fApplyPsnName')"></div></div> </div> </div> 
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col24">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit3">
     <label class="x-label" xid="label4" bind-text="dSignature.label('fUseDate')" style="width:100px;"></label>
     <div class="x-edit" xid="div3">
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="dSignature.ref('fUseDate')" format="yyyy-MM-dd hh:mm"></input></div> </div> </div> 
   
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col27">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput2">
     <label class="x-label" xid="label7" bind-text="dSignature.label('fApplyDate')" style="width:100px;"></label>
     <div class="x-edit" xid="div6">
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="iptApplyDate" bind-ref="dSignature.ref('fApplyDate')" format="yyyy-MM-dd hh:mm"></input></div> </div> </div> 
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelRadioGroup1">
     <label class="x-label" xid="label8" bind-text="dSignature.label('fSignatureTypeName')" style="width:100px;"></label>
     <div class="x-edit" xid="div7">
      <div component="$UI/system/components/justep/output/output" class="form-control" xid="output5" bind-ref="dSignature.ref('fSignatureTypeName')"></div></div> </div> </div> 
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col29">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput3">
     <label class="x-label" xid="label9" bind-text="dSignature.label('fIndianName')" style="width:100px;"></label>
     <div class="x-edit" xid="div8">
      <div component="$UI/system/components/justep/output/output" class="form-control" xid="output6" bind-ref="dSignature.ref('fIndianName')"></div></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col30">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit5">
     <label class="x-label" xid="label10" bind-text="dSignature.label('fSake')" style="width:100px;"></label>
     <div class="x-edit" xid="div9">
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dSignature.ref('fSake')"></textarea></div> </div> </div> 
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit6">
     <label class="x-label" xid="label11" bind-text="dSignature.label('fRemark')" style="width:100px;"></label>
     <div class="x-edit" xid="div10">
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dSignature.ref('fRemark')"></textarea></div> </div> </div> </div></div>  
          
          
          
        
      </div>  
      </div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process" style="height:24px;width:24px;left:173px;top:108px;" data="dSignature" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"></div><span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver"></span></div>
