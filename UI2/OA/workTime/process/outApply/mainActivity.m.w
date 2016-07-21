<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile" xid="window" class="window container-fluid oa">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:266px;top:396px;" onLoad="modelLoad">
    
  <div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="false" concept="OA_WM_outApply" orderBy="" columns="" autoNew="true" onValueChanged="mainDataValueChanged" onSaveCommit="mainDataSaveCommit">
   <reader action="/OA/workTime/logic/action/queryOA_WM_outApplyAction" xid="default17"></reader>
   <writer action="/OA/workTime/logic/action/saveOA_WM_outApplyAction" xid="default18"></writer>
   <creator action="/OA/workTime/logic/action/createOA_WM_outApplyAction" xid="default19"></creator>
   <rule xid="rule1">
    
    
    
    
    
    
    
    
    
    
    <col name="fSTARTTIME" xid="ruleCol9">
     <required xid="required8">
      <expr xid="default12">true</expr></required> </col> 
    <col name="fENDTIME" xid="ruleCol10">
     <required xid="required9">
      <expr xid="default13">true</expr></required> </col> </rule> </div><div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOutMember" concept="OA_WM_outMember" confirmDelete="false" directDelete="true">
   <reader xid="default1" action="/OA/workTime/logic/action/queryOA_WM_outMemberAction"></reader>
   <writer xid="default2" action="/OA/workTime/logic/action/saveOA_WM_outMemberAction"></writer>
   <creator xid="default3" action="/OA/workTime/logic/action/createOA_WM_outMemberAction"></creator></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" onAdvanceCommit="processAdvanceCommit" onBackCommit="processBackCommit" onAbortCommit="processAbortCommit"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="外出申请"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">外出申请</div>  
        <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="" xid="moreBtn" icon="icon-android-more" onClick="moreBtnClick">
   <i xid="i1" class="icon-android-more"></i>
   <span xid="span1"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="流转" xid="button2" onClick="{operation:'process.advance'}"> 
            <i xid="i12"/>  
            <span xid="span12">流转</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="详细信息"> 
<!--         <div class="x-control-group-title">详细信息</div>   -->
        <div xid="div9"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit1">
   <label class="x-label" xid="fSTARTTIMEL" style="width:100px;"><![CDATA[开始时间]]></label>
   <div class="x-edit" xid="div3"><input component="$UI/system/components/justep/input/input" class="form-control text-right" xid="fSTARTTIME" bind-ref="mainData.ref('fSTARTTIME')"></input></div></div></div>
  <div xid="div10"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit2">
   <label class="x-label" style="width:100px;" xid="fENDTIMEL"><![CDATA[结束时间]]></label>
   <div class="x-edit" xid="div8">
    <input component="$UI/system/components/justep/input/input" class="form-control text-right" xid="fENDTIME" bind-ref="mainData.ref('fENDTIME')"></input></div> </div></div><div xid="div13">
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit12">
   <label class="x-label" xid="label11" style="width:100px;" title="外出时长">外出时长</label>
   <div class="x-edit" xid="div18" style="text-align:right;">
    
    
    
    <label xid="label14" style="float:right;padding-left:10px;padding-right:10px;line-height:34px;">小时</label><input xid="fHOURS" class="form-control pull-right text-right" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fHOURS')" style="float:left;width:10%;"></input><label xid="label13" style="float:right;padding-left:10px;padding-right:10px;line-height:34px;">天</label><input xid="fDAYS" class="form-control pull-right text-right" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fDAYS')" style="float:left;width:12%;"></input></div> </div></div><div xid="div14">
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelOutput6">
   <label class="x-label" xid="fPERSONNEL" style="width:100px;" title="外出人员">外出人员</label>
   <div class="x-edit" xid="div5">
   <div class="input-group" xid="inputGroup2">
   <output class="form-control text-right" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fPERSONNEL')" xid="fPERSONNE" style="border-right-style:none;"></output>
   <div class="input-group-addon" xid="div11" style="background-color:transparent;border-left-style:none;" bind-click="button1Click">
    <i xid="i111" class="icon-android-search"></i></div> </div></div></div></div>
  <div xid="div15">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit3">
   <label class="x-label" xid="fNUMBERL" style="width:100px;"><![CDATA[外出人数]]></label>
   <div class="x-edit" xid="div16"><div class="input-group" xid="div19">
   <input class="form-control text-right" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fNUMBER')" xid="fNUMBER" style="border-right-style:none;"></input>
   <div class="input-group-addon" xid="div17" style="background-color:transparent;border-left-style:none;">
    (人)</div> </div></div></div></div></div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu" anchor="processMenu"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="保存" xid="saveButton" onClick="{operation:'mainData.save'}"> 
          <i xid="i5"/>  
          <span xid="span5">保存</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"/>  
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="回退" xid="backButton" onClick="{operation:'process.back'}"> 
          <i xid="i2"/>  
          <span xid="span2">回退</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider2"/>  
      <li class="x-menu-item" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="终止" xid="abortButton" onClick="{operation:'process.abort'}"> 
          <i xid="i6"/>  
          <span xid="span6">终止</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider3"/>  
      <li class="x-menu-item" xid="item4"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="流程图" xid="showChart" onClick="{operation:'process.showChart'}"> 
          <i xid="i7"/>  
          <span xid="span7">流程图</span> 
        </a> 
      </li> 
    </ul> 
  </div> 
<span component="$UI/system/components/justep/org/orgDialog" xid="psmDialog" title="选择人员" multiSelection="true" includeOrgKind="psm" onReceive="psmDialogReceive" style="top:24px;left:124px;"></span></div>