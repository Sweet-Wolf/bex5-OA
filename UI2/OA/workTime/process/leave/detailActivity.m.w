<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:319px;top:67px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dataMain" concept="OA_WM_LeaveApply"> 
      <reader xid="default1" action="/OA/workTime/logic/action/queryOA_WM_LeaveApplyAction"/>  
      <writer xid="default2" action="/OA/workTime/logic/action/saveOA_WM_LeaveApplyAction"/>  
      <creator xid="default3" action="/OA/workTime/logic/action/createOA_WM_LeaveApplyAction"/> 
    </div> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="vacationData" concept="OA_WM_Vacation">
   <reader xid="default4" action="/OA/workTime/logic/action/queryOA_WM_VacationAction"></reader>
   <writer xid="default5" action="/OA/workTime/logic/action/saveOA_WM_VacationAction"></writer>
   <creator xid="default6" action="/OA/workTime/logic/action/createOA_WM_VacationAction"></creator></div></div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:72px;top:4px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="请假申请详细"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeBtn" onClick="closeBtnClick" icon="icon-chevron-left"> 
            <i xid="i4" class="icon-chevron-left"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">请假申请详细</div>  
        <div class="x-titlebar-right reverse" xid="div3" style="width:188px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="chartBtn" icon="icon-android-keypad" onClick="chartBtnClick"> 
            <i xid="i1" class="icon-android-keypad"/>  
            <span xid="span1"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="media"> 
        <a class="pull-left content-head-pic " href="#" style="margin-right:0px;"
          xid="a2"> 
          <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
            xid="orgImage3" orgKind="person" bind-ref="dataMain.ref('fCurrentPersonID')"> 
            <div class="x-blob-bar" xid="div8"> 
              <i class="x-blob-edit icon-compose" xid="i9"/>  
              <i class="x-blob-del icon-close-round" xid="i10"/> 
            </div>  
            <img class="x-blob-img media-object" xid="image3"/> 
          </div> 
        </a>  
        <div component="$UI/system/components/justep/output/output" class="media-heading oa-title-data"
          xid="outputName" bind-ref="dataMain.ref('fApplyPersonName')"/>  
        <div component="$UI/system/components/justep/output/output" xid="outputTime"
          bind-ref="dataMain.ref('fApplyDate')" format="yyyy-MM-dd hh:mm"/> 
      </div>  
      <div class="media-body"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fMeetNameL" style="width:100px;"><![CDATA[请假类型]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output2" bind-ref="dataMain.ref('fLeaveTypeName')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fBeginTimeL" style="width:100px;"><![CDATA[开始时间]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output3" bind-ref="dataMain.ref('fStartTime')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fEndTimeL" style="width:100px;"><![CDATA[结束时间]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output4" bind-ref="dataMain.ref('fEndTime')"/>
          </div> 
        </div>  
        
        <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit4"> 
            <label class="x-label" xid="label6" style="width:100px;" bind-text="dataMain.label('fLeaveTime')"/>  
            <div class="x-edit" xid="div58"> 
              <div class="form-control text-right" component="$UI/system/components/justep/output/output"
                bind-ref="dataMain.ref('fLeaveDays')" xid="fLeaveDays" style="width:40px;float:left;"/>  
              <label xid="label19" style="float:left;line-height:35px;padding-left:5px;padding-right:5px;">天</label>  
              <div class="form-control text-right" component="$UI/system/components/justep/output/output"
                bind-ref="dataMain.ref('fLeaveHours')" xid="fLeaveHours" style="width:40px;float:left;"/>  
              <label xid="label20" style="float:left;line-height:35px;">小时</label>
            </div> 
          </div>
          
        <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit13"> 
            <label class="x-label" xid="label17" style="width:100px;">已休年假</label>  
            <div class="x-edit" xid="div7"> 
              <div class="form-control text-right" component="$UI/system/components/justep/output/output"
                bind-ref="vacationData.ref('fAlreadyDay')" xid="output15" style="width:40px;float:left;"/>  
              <label xid="label22" style="float:left;line-height:35px;padding-left:5px;padding-right:5px;">天</label>  
              <div class="form-control text-right" component="$UI/system/components/justep/output/output"
                bind-ref="vacationData.ref('fAlreadyHour')" xid="output14" style="width:40px;float:left;"/>  
              <label xid="label21" style="float:left;line-height:35px;">小时</label>
            </div> 
          </div>
          
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit12"> 
            <label class="x-label" xid="label18" style="width:100px;">剩余年假</label>  
            <div class="x-edit" xid="div16"> 
              <div class="form-control text-right" component="$UI/system/components/justep/output/output"
                bind-ref="vacationData.ref('fLeavingsDay')" xid="output17" style="width:40px;float:left;"/>  
              <label xid="label24" style="float:left;line-height:35px;padding-left:5px;padding-right:5px;">天</label>  
              <div class="form-control text-right" component="$UI/system/components/justep/output/output"
                bind-ref="vacationData.ref('fLeavingsHour')" xid="output16" style="width:40px;float:left;"/>  
              <label xid="label23" style="float:left;line-height:35px;">小时</label>
            </div> 
          </div>
          
     
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dataMain" autoFilter="false" autoClose="false" autoStart="false" autoSave="false"/> 
</div>
