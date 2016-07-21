<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:419px;left:284px;height:auto;" onParamsReceive="modelParamsReceive"> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="AttendanceAdminData" concept="OA_AttendanceAdmin" autoNew="false" limit="-1"><creator xid="default1" action="/OA/attendance/logic/action/createOA_AttendanceAdminAction"></creator>
  <reader xid="default2" action="/OA/attendance/logic/action/queryOA_AttendanceAdminAction"></reader>
  <writer xid="default3" action="/OA/attendance/logic/action/saveOA_AttendanceAdminAction"></writer></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="修改人员"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">修改人员</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1" style="background-color:#ededed;"><div xid="div1" style="border:1px solid #dddddd;margin:20px 0px;background-color:white;padding-left:10px;"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="fAttendanceGroupNameL" bind-text='$model.AttendanceAdminData.label("fAttendanceGroupName")'></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="fAttendanceGroupNameInput" placeHolder="请输入考勤组名称"></input></div>
  </div>
  <div xid="div2" style="padding-left:10px;border:1px solid #dddddd;background-color:white;"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label" xid="label2" style="width:auto;"><![CDATA[参与考勤人员]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit x-right" xid="AttendancePerson" placeHolder="请选择" bind-click="AttendancePersonClick" readonly="true"></input></div>
  <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
   <label class="x-label" xid="label3" style="width:auto;"><![CDATA[考勤组负责人]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit x-right" xid="attendanceResponsiblePerson" placeHolder="请选择" readonly="true" bind-click="attendanceResponsiblePersonClick"></input></div></div>
  <div xid="div7" style="padding:10px 15px;"><p xid="p1"><![CDATA[管理本考勤组的排班统计,减轻管理员的考勤工作]]></p>
  <p xid="p2"><![CDATA[这些人的考勤时间都一样吗?(选择后不可修改)]]></p></div>
  <div xid="div8" style="background-color:white;border:1px solid #dddddd;">
  
  </div></div>
  <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block" label="保存" xid="saveBtn" onClick="saveBtnClick">
   <i xid="i1"></i>
   <span xid="span1">保存</span></a></div></div> 
<span component="$UI/system/components/justep/org/orgDialog" xid="AttendanceOrgDialog"  forceRefreshOnOpen="true" multiSelection="true" includeOrgKind="psm" includeDisabled="true" onReceive="AttendanceOrgDialogReceive"></span>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="messageDialog" type="OKCancel"></span>
  <span component="$UI/system/components/justep/org/orgDialog" xid="ManagersOrgDialog" forceRefreshOnOpen="true" multiSelection="true" includeOrgKind="psm" includeDisabled="true" onReceive="ManagersOrgDialogReceive"></span>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="replaceDialog" type="OKCancel"></span></div>