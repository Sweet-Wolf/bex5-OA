<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile" xid="window" class="window container-fluid oa">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:119px;left:337px;height:auto;" onLoad="modelLoad" onModelConstructDone="modelModelConstructDone">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_WM_LeaveApply" orderBy=""
      columns="" autoNew="true" onValueChanged="mainDataValueChanged" onBeforeSave="mainDataBeforeSave" onSaveCommit="mainDataSaveCommit"> 
      <reader action="/OA/workTime/logic/action/queryOA_WM_LeaveApplyAction"/>  
      <writer action="/OA/workTime/logic/action/saveOA_WM_LeaveApplyAction"/>  
      <creator action="/OA/workTime/logic/action/createOA_WM_LeaveApplyAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <rule xid="rule1">
   <col name="fLeaveTypeName" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default8">true</expr>
     <message xid="default9">请选择请假类型！</message></required> </col> 
   
   
   
   <col name="fStartTime" xid="ruleCol5">
    <required xid="required5">
     <expr xid="default16">true</expr>
     <message xid="default17">请填写开始时间！</message></required> </col> 
   <col name="fEndTime" xid="ruleCol6">
    <required xid="required6">
     <expr xid="default18">true</expr>
     <message xid="default19">请填写结束时间！</message></required> </col> 
   <col name="fLeaveDays" xid="ruleCol7">
    <required xid="required7">
     <expr xid="default20">true</expr>
     <message xid="default21">请假时间不能为空！</message></required> </col> </rule></div>
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="typeData" concept="OA_WM_LeaveType" limit="-1">
   <reader xid="default1" action="/OA/workTime/logic/action/queryOA_WM_LeaveTypeAction"></reader>
   <writer xid="default2" action="/OA/workTime/logic/action/saveOA_WM_LeaveTypeAction"></writer>
   <creator xid="default3" action="/OA/workTime/logic/action/createOA_WM_LeaveTypeAction"></creator>
   <filter name="filter0" xid="filter1">OA_WM_LeaveType.fUseStatus=1</filter></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="vacationData" concept="OA_WM_Vacation">
   <reader xid="default4" action="/OA/workTime/logic/action/queryOA_WM_VacationAction"></reader>
   <writer xid="default5" action="/OA/workTime/logic/action/saveOA_WM_VacationAction"></writer>
   <creator xid="default6" action="/OA/workTime/logic/action/createOA_WM_VacationAction"></creator></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="isData" idColumn="value">
   <column label="值" name="value" type="String" xid="xid1"></column>
   <column label="名称" name="label" type="String" xid="xid2"></column>
   <data xid="default7">[{&quot;value&quot;:&quot;1&quot;,&quot;label&quot;:&quot;是&quot;},{&quot;value&quot;:&quot;0&quot;,&quot;label&quot;:&quot;否&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" onAdvanceCommit="processAdvanceCommit" onBackCommit="processBackCommit" onAbortCommit="processAbortCommit"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="请假申请"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">请假申请</div>  
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
    <div class="x-panel-content x-cards" xid="imgURL"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="详细信息"> 
<!--         <div class="x-control-group-title">详细信息</div>   -->
        <div xid="div14"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelInput13">
   <label class="x-label left" bind-text="mainData.label('fLeaveTypeName')" xid="fLeaveTypeNameL" style="width:100px;"></label>
   <div class="x-edit" xid="div35">
    <select component="$UI/system/components/justep/select/select" class="form-control text-right" xid="select1" bind-ref="mainData.ref('fLeaveTypeID')" bind-labelRef="mainData.ref('fLeaveTypeName')" bind-options="typeData" bind-optionsValue="fTypeCode" bind-optionsLabel="fTypeName"></select></div> </div>
  </div><div xid="div9"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20  oa-input-group-row" xid="labelInput8">
   <label class="x-label left" bind-text="mainData.label('fStartTime')" xid="fStartTimeL" style="width:100px;"></label>
   <div class="x-edit" xid="div30">
    <input class="form-control text-right" component="$UI/system/components/justep/input/input" xid="input8" bind-ref="mainData.ref('fStartTime')"></input></div> </div></div>
  <div xid="div10"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelInput9">
   <label class="x-label left" bind-text="mainData.label('fEndTime')" xid="fEndTimeL" style="width:100px;"></label>
   <div class="x-edit" xid="div31">
    <input class="form-control text-right" component="$UI/system/components/justep/input/input" xid="input9" bind-ref="mainData.ref('fEndTime')"></input></div> </div></div><div xid="div13"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit4">
   <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fLeaveTime')"></label>
   <div class="x-edit" xid="div58">
    <div class="form-control text-right" component="$UI/system/components/justep/output/output" bind-ref="mainData.ref('fLeaveDays')" xid="fLeaveDays" style="width:40px;float:left;"></div>
    <label xid="label19" style="float:left;line-height:35px;padding-left:5px;padding-right:5px;">天</label>
    <div class="form-control text-right" component="$UI/system/components/justep/output/output" bind-ref="mainData.ref('fLeaveHours')" xid="fLeaveHours" style="width:40px;float:left;"></div>
    <label xid="label20" style="float:left;line-height:35px;">小时</label></div> </div></div><div xid="div11"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit13">
   <label class="x-label" xid="label17" style="width:100px;">已休年假</label>
   <div class="x-edit" xid="div7">
    <div class="form-control text-right" component="$UI/system/components/justep/output/output" bind-ref="vacationData.ref('fAlreadyDay')" xid="output15" style="width:40px;float:left;"></div>
    <label xid="label22" style="float:left;line-height:35px;padding-left:5px;padding-right:5px;">天</label>
    <div class="form-control text-right" component="$UI/system/components/justep/output/output" bind-ref="vacationData.ref('fAlreadyHour')" xid="output14" style="width:40px;float:left;"></div>
    <label xid="label21" style="float:left;line-height:35px;">小时</label></div> </div></div><div xid="div12"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit12">
   <label class="x-label" xid="label18" style="width:100px;">剩余年假</label>
   <div class="x-edit" xid="div16">
    <div class="form-control text-right" component="$UI/system/components/justep/output/output" bind-ref="vacationData.ref('fLeavingsDay')" xid="output17" style="width:40px;float:left;"></div>
    <label xid="label24" style="float:left;line-height:35px;padding-left:5px;padding-right:5px;">天</label>
    <div class="form-control text-right" component="$UI/system/components/justep/output/output" bind-ref="vacationData.ref('fLeavingsHour')" xid="output16" style="width:40px;float:left;"></div>
    <label xid="label23" style="float:left;line-height:35px;">小时</label></div> </div></div>
  <div xid="div2">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20  oa-input-group-row" xid="labelEdit1">
    <label class="x-label left" bind-text='$model.mainData.label("fImageURL")' xid='label("imgURL")' style="width:100px;"></label>
    <div class="x-edit" xid="imgUrl" align="left">
     <div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="attachmentImage1" bind-ref='$model.mainData.ref("fImageURL")'>
   <div class="x-attachment x-attachment-image" xid="div3">
    <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div5">
     <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image1" style="width:20%;"></img>
     <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a1"></a></div> 
    <div class="x-doc-process" xid="div6">
     <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar1"></div></div> 
    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div8">
     <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div15"></div></div> </div> </div></div> </div> </div></div> 
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
</div>