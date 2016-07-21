<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:654px;left:407px;height:auto;" onLoad="modelLoad" onModelConstruct="modelModelConstruct">
    <div component="$UI/system/components/justep/data/bizData" xid="LateAppealData"
      directDelete="true" autoLoad="false" orderBy=""
      columns="" autoNew="true" concept="OA_LateAppeal"> 
      <reader action="/OA/attendance/logic/action/queryOA_LateAppealAction"/>  
      <writer action="/OA/attendance/logic/action/saveOA_LateAppealAction"/>  
      <creator action="/OA/attendance/logic/action/createOA_LateAppealAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <rule xid="rule1">
   <col name="fApplicantTime" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default1">true</expr>
     <message xid="default2">请填写申诉时间</message></required> </col> 
   <col name="fAppealContent" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default3">true</expr>
     <message xid="default4">请填写申诉内容</message></required> </col> </rule></div>
    </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="LateAppealData" autoSave="true" autoStart="true"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="迟到/早退申诉"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">迟到/早退申诉</div>  
        <div class="x-titlebar-right reverse"> 
          <a class="btn btn-link" component="$UI/system/components/justep/button/button" icon="icon-android-more" onClick="moreBtnClick" xid="moreBtn">
   <i class="icon-android-more" xid="i11"></i>
   <span xid="span11"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="流转" xid="button2" onClick="{operation:'process.advance'}"> 
            <i xid="i12"/>  
            <span xid="span12">流转</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="详细信息"> 
     
         <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text='$model.LateAppealData.label("fApplicantName")' xid="fApplicantNameL"/>  
          <div class="x-edit">
            <span class="x-output" component="$UI/system/components/justep/output/output"
              xid="ComplainantInput" bind-ref='$model.LateAppealData.ref("fApplicantName")'/>
          </div> 
        </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text='$model.LateAppealData.label("fApplicantTime")' xid="fApplicantTimeL"/>  
          <div class="x-edit">
            <input class="form-control" component="$UI/system/components/justep/input/input"
              xid="appealTimeInput" bind-ref='$model.LateAppealData.ref("fApplicantTime")'/>
          </div> 
        </div> 
         
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text='$model.LateAppealData.label("fAppealWay")' xid="fAppealWayL"/>  
          <div class="x-edit">
            <span class="x-output" component="$UI/system/components/justep/output/output"
              xid="appealWaySelect" bind-ref='$model.LateAppealData.ref("fAppealWay")'/>
          </div> 
        </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text='$model.LateAppealData.label("fClockTime")' xid="fClockTimeL"/>  
          <div class="x-edit">
            <span class="x-output" component="$UI/system/components/justep/output/output"
              xid="ClockTime" bind-ref='$model.LateAppealData.ref("fClockTime")'/>
          </div> 
        </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text='$model.LateAppealData.label("fLateTimer")' xid="fLateTimerL"/>  
          <div class="x-edit">
            <span class="x-output" component="$UI/system/components/justep/output/output"
              xid="lateTimeInput" bind-ref='$model.LateAppealData.ref("fLateTimer")'/>
          </div> 
        </div>
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text='$model.LateAppealData.label("fAppealContent")' xid="fAppealContentL" />  
          <div class="x-edit">
            <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="appealContentText" bind-ref='$model.LateAppealData.ref("fAppealContent")' /> 
          </div> 
        </div></div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="保存" xid="saveButton" onClick="{operation:'LateAppealData.save'}"> 
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