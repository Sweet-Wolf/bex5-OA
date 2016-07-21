<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:119px;left:16px;" onLoad="modelLoad" onModelConstructDone="modelModelConstructDone"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="selectData" idColumn="value"><column name="value" type="String" xid="xid1"></column>
  <column name="name" type="String" xid="xid2"></column>
  <data xid="default36">[{&quot;value&quot;:&quot;1&quot;,&quot;name&quot;:&quot;固定班制(考勤时间固定)&quot;},{&quot;value&quot;:&quot;2&quot;,&quot;name&quot;:&quot;排班制(考勤时间都不固定)&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="mainData" concept="OA_AttendanceAdmin" updateMode="whereVersion" confirmDelete="true" autoNew="true"><creator xid="default37" action="/OA/attendance/logic/action/createOA_AttendanceAdminAction"></creator>
  <reader xid="default38" action="/OA/attendance/logic/action/queryOA_AttendanceAdminAction"></reader>
  <writer xid="default39" action="/OA/attendance/logic/action/saveOA_AttendanceAdminAction"></writer></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="weekData" concept="OA_AttendanceWeek" autoNew="true"><creator xid="default40" action="/OA/attendance/logic/action/createOA_AttendanceWeekAction"></creator>
  <reader xid="default41" action="/OA/attendance/logic/action/queryOA_AttendanceWeekAction"></reader>
  <writer xid="default42" action="/OA/attendance/logic/action/saveOA_AttendanceWeekAction"></writer></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="addrData" concept="OA_AttendanceMap" autoNew="true"><creator xid="default43" action="/OA/attendance/logic/action/createOA_AttendanceMapAction"></creator>
  <reader xid="default44" action="/OA/attendance/logic/action/queryOA_AttendanceMapAction"></reader>
  <writer xid="default45" action="/OA/attendance/logic/action/saveOA_AttendanceMapAction"></writer></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="attenData" concept="OA_AttendanceAdmin"><creator xid="default46" action="/OA/attendance/logic/action/createOA_AttendanceAdminAction"></creator>
  <reader xid="default47" action="/OA/attendance/logic/action/queryOA_AttendanceAdminAction"></reader>
  <writer xid="default48" action="/OA/attendance/logic/action/saveOA_AttendanceAdminAction"></writer></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="wifiData" concept="OA_AttendanceWifi" autoNew="true" confirmDelete="false" directDelete="true"><creator xid="default1" action="/OA/attendance/logic/action/createOA_AttendanceWifiAction"></creator>
  <reader xid="default2" action="/OA/attendance/logic/action/queryOA_AttendanceWifiAction"></reader>
  <writer xid="default3" action="/OA/attendance/logic/action/saveOA_AttendanceWifiAction"></writer></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="新增考勤组"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">新增考勤组</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1"><div xid="div1" style="border:1px solid #dddddd;margin:20px 0px;background-color:white;padding-left:10px;">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
    <label class="x-label" xid="fAttendanceGroupNameL" style="font-weight:bold;"><![CDATA[考勤组名称]]></label>
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit" xid="fAttendanceGroupNameInput" placeHolder="请输入考勤组名称" bind-ref='$model.mainData.ref("fAttendanceGroupName")'></input></div> </div>
  <div xid="div2" style="padding-left:10px;border:1px solid #dddddd;background-color:white;">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
    <label class="x-label" xid="label2" style="width:auto;font-weight:bold;">参与考勤人员</label>
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit x-right" xid="AttendancePerson" placeHolder="请选择" readonly="true" bind-click="AttendancePersonClick"></input></div> 
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
    <label class="x-label" xid="label3" style="width:auto;font-weight:bold;">考勤组负责人</label>
    <input component="$UI/system/components/justep/input/input" class="form-control x-edit x-right" xid="attendanceResponsiblePerson" placeHolder="请选择" readonly="true" bind-click="attendanceResponsiblePersonClick"></input></div> </div>
  <div xid="div7" style="padding:10px 15px;">
   <p xid="p1">管理本考勤组的排班统计,减轻管理员的考勤工作</p>
   <p xid="p2">这些人的考勤时间都一样吗?(选择后不可修改)</p></div>
  <div xid="div8" style="background-color:white;border:1px solid #dddddd;">
   <div xid="div3" style="padding:20px 10px;">
    <span component="$UI/system/components/justep/button/radio" class="x-radio" xid="radio1" name="banzhi" label="固定班制(考勤时间固定)" value="1" checkedValue="1" checked="true" bind-ref='$model.selectData.ref("value")'></span></div> 
   <div xid="div4" style="padding:20px 10px;">
    <span component="$UI/system/components/justep/button/radio" class="x-radio" xid="radio2" name="banzhi" label="排班制(考勤时间都不固定)" value="2" checkedValue="2" bind-ref='$model.selectData.ref("value")'></span></div> 
  
  </div>
  <div xid="div5" style="padding-top:10px;margin-top:15px;border:1px solid #dddddd;">
  
  <div xid="setAttenTime" bind-click="setAttenTimeClick"><h3 xid="h31" style="color:#262626;display:inline-block;margin-top:0px;"><![CDATA[考勤时间]]></h3><a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" xid="button1" icon="icon-chevron-right" style="padding-top:0px;">
   <i xid="i1" class="icon-chevron-right"></i>
   <span xid="span1"></span></a></div>
  <div xid="div9"><span xid="span2" bind-text='$model.weekData.val("fMonday")=="true" ?"一、":""'></span>
  <span xid="span3" bind-text='$model.weekData.val("fTuesday")=="true" ?"二、":""'></span>
  <span xid="span4" bind-text='$model.weekData.val("fWednesday")=="true" ?"三、":""'></span>
  <span xid="span5" bind-text='$model.weekData.val("fThursday")=="true" ?"四、":""'></span>
  <span xid="span6" bind-text='$model.weekData.val("fFriday")=="true" ?"五、":""'></span>
  <span xid="span7" bind-text='$model.weekData.val("fSaturday")=="true" ?"六、":""'></span>
  <span xid="span8" bind-text='$model.weekData.val("fSunday")=="true" ?"日、":""'></span>
  <span xid="span10" bind-text='"班次"+$model.weekData.val("fDepart")'></span>
  <span xid="span11" bind-text='$model.weekData.val("fDepartTime")'></span></div>
  <div xid="div11">
   <span xid="span12" bind-text='$model.weekData.val("fMonday")=="false" ?"一、":""'></span>
   <span xid="span13" bind-text='$model.weekData.val("fTuesday")=="false" ?"二、":""'></span>
   <span xid="span14" bind-text='$model.weekData.val("fWednesday")=="false" ?"三、":""'></span>
   <span xid="span15" bind-text='$model.weekData.val("fThursday")=="false" ?"四、":""'></span>
   <span xid="span16" bind-text='$model.weekData.val("fFriday")=="false" ?"五、":""'></span>
   <span xid="span17" bind-text='$model.weekData.val("fSaturday")=="false" ?"六、":""'></span>
   <span xid="span18" bind-text='$model.weekData.val("fSunday")=="false" ?"日、":""'></span>
   <span xid="span20"><![CDATA[休息]]></span>
   </div></div>
  
  <div xid="div16"><h5 xid="h52" style="color:#808080; margin-left:15px;">设置符合你企业要求的考勤方式</h5></div><div xid="div15" style="background-color:white;padding-left:15px;border-top:1px solid #dbdbdb;">
   <div xid="div14">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="根据办公地点" xid="button3" icon="round round-footprint">
     <i xid="i3" class="round round-footprint" style="display:inline-block;font-size:xx-large;"></i>
     <span xid="span22">根据办公地点</span></a> </div> 
   <div xid="div13">
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="addrData" limit="20">
     <ul class="x-list-template" xid="listTemplateUl1">
      <li xid="li1" style="position:relative;border-bottom:1px solid #dbdbdb;">
       <h4 xid="h43" bind-text='val("fAttenAddrName")' style="color:#000000;"></h4>
       <h5 xid="h53" bind-text='val("fAddressDetail")' style="color:#808080;"></h5>
       <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="removeAddrBtn" icon="icon-close-round" style="position:absolute;top:0px;right:0px;" onClick="removeAddrBtnClick">
        <i xid="i4" class="icon-close-round"></i>
        <span xid="span23"></span></a> </li> </ul> </div> </div> 
   <div xid="div12">
    <div xid="addAddr" bind-click="addAddrClick">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="添加办公地点" xid="button5" icon="dataControl dataControl-plus" style="font-size:medium;">
      <i xid="i5" class="dataControl dataControl-plus"></i>
      <span xid="span24">添加办公地点</span></a> </div> 
    <div xid="EffectiveRange" style="padding:10px 15px;">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit6">
      <label class="x-label" xid="label1" style="width:auto;font-weight:bold;">选择有效范围</label>
      <input component="$UI/system/components/justep/input/input" class="form-control x-edit x-right" xid="fEffectiveRange" placeHolder="请输入有效范围" dataType="Float" maxLength="3" bind-ref='$model.mainData.ref("fEffectiveRange")'></input>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="button6" style="padding:0px;font-size:large;color:#808080;" label="米">
       <i xid="i6"></i>
       <span xid="span25">米</span></a> </div> </div> </div> </div>
  <div xid="div6" style="background-color:white;padding-left:15px;border-top:1px solid #dbdbdb;"><div xid="div10">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="根据wifi精确定位" xid="button2" icon="icon-android-wifi">
    <i xid="i7" class="icon-android-wifi" style="display:inline-block;font-size:xx-large;"></i>
    <span xid="span21">根据wifi精确定位</span></a> </div>
  <div xid="div18"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="wifiData">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li2"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-7" xid="col1"><h4 xid="h41" bind-text='val("fWifiName")'><![CDATA[]]></h4>
  <span xid="span28" bind-text='val("fMacAddress")'></span></div>
   <div class="col col-xs-3" xid="col2"><span xid="span30"></span></div>
   <div class="col col-xs-2" xid="col4"><a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="removeWifi" icon="dataControl dataControl-closel" onClick="removeWifiClick">
   <i xid="i10" class="dataControl dataControl-closel"></i>
   <span xid="span29"></span></a></div></div></li></ul> </div></div>
  <div xid="div19"><div xid="addWifi" bind-click="addWifiClick">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="添加办公WIFI" xid="button4" icon="dataControl dataControl-plus" style="font-size:medium;">
    <i xid="i8" class="dataControl dataControl-plus"></i>
    <span xid="span27">添加办公WIFI</span></a> </div></div></div><div xid="div17"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block" label="保存" xid="saveBtn" onClick="saveBtnClick">
   <i xid="i2"></i>
   <span xid="span26">保存</span></a></div>
  </div>
  </div> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="mapDialog" src="$UI/OA/sign/process/sign/signMapActivity.m.w" onReceive="mapDialogReceive" width="80%" height="80%"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="setAddrDialog" src="$UI/OA/attendance/process/attendance/SetAddrActivity.m.w" onReceive="setAddrDialogReceive" status="normal" width="100%" height="40%"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="WeekDialog" src="$UI/OA/attendance/process/attendance/AttendanceWeekActivity.m.w" onReceive="WeekDialogReceive" process="/OA/attendance/process/attendance/attendanceProcess" activity="AttendanceWeekActivity"></span>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="replaceDialog" type="OKCancel"></span>
  <span component="$UI/system/components/justep/org/orgDialog" xid="perDialog" onReceive="perDialogReceive" includeOrgKind="psm" multiSelection="true"></span>
  <span component="$UI/system/components/justep/org/orgDialog" xid="manDialog" includeOrgKind="psm" onReceive="manDialogReceive" multiSelection="true"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wifiDialog" src="$UI/OA/attendance/process/attendance/AddWifiActivity.w" onReceive="wifiDialogReceive" forceRefreshOnOpen="true"></span></div>