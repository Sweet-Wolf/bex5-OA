<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:482px;left:531px;height:auto;" onParamsReceive="modelParamsReceive" onModelConstruct="modelModelConstruct"> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="OA_AttendanceMap" concept="OA_AttendanceMap" autoNew="false" directDelete="false" confirmDelete="false"><creator xid="default1" action="/OA/attendance/logic/action/createOA_AttendanceMapAction"></creator>
  <reader xid="default2" action="/OA/attendance/logic/action/queryOA_AttendanceMapAction"></reader>
  <writer xid="default3" action="/OA/attendance/logic/action/saveOA_AttendanceMapAction"></writer></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="OA_AttendanceAdmin" concept="OA_AttendanceAdmin" limit="-1" autoNew="false"><creator xid="default4" action="/OA/attendance/logic/action/createOA_AttendanceAdminAction"></creator>
  <reader xid="default5" action="/OA/attendance/logic/action/queryOA_AttendanceAdminAction"></reader>
  <writer xid="default6" action="/OA/attendance/logic/action/saveOA_AttendanceAdminAction"></writer></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="DepartData" idColumn="fID"><column name="fID" type="String" xid="xid1"></column>
  <column name="fDepart" type="String" xid="xid2"></column>
  <column name="fEndAM" type="String" xid="xid3"></column>
  <column name="fStartAM" type="String" xid="xid4"></column>
  <column name="fTime" type="String" xid="xid5"></column>
  <data xid="default10">[{}]</data></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="wifiData" concept="OA_AttendanceWifi" confirmDelete="false" directDelete="true"><creator xid="default7" action="/OA/attendance/logic/action/createOA_AttendanceWifiAction"></creator>
  <reader xid="default8" action="/OA/attendance/logic/action/queryOA_AttendanceWifiAction"></reader>
  <writer xid="default9" action="/OA/attendance/logic/action/saveOA_AttendanceWifiAction"></writer></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="weekData" concept="OA_AttendanceWeek"><creator xid="default11" action="/OA/attendance/logic/action/createOA_AttendanceWeekAction"></creator>
  <reader xid="default12" action="/OA/attendance/logic/action/queryOA_AttendanceWeekAction"></reader>
  <writer xid="default13" action="/OA/attendance/logic/action/saveOA_AttendanceWeekAction"></writer></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="规则设置"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">规则设置</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1" style="background-color:#ededed;"><h5 xid="setGroup" style="color:#808080;font-weight:bold;"><![CDATA[]]></h5>
  <div xid="div1" style="border:1px solid #dbdbdb;padding:10px;background-color:white;"><div xid="AttendanceTime" class="clearfix"><div xid="setAttenTime" bind-click="setAttenTimeClick">
   <h3 xid="h31" style="color:#262626;display:inline-block;margin-top:0px;">考勤时间</h3>
   <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" xid="button1" icon="icon-chevron-right" style="padding-top:0px;">
    <i xid="i1" class="icon-chevron-right"></i>
    <span xid="span1"></span></a> </div>
  <div xid="div9">
   <span xid="span2" bind-text='$model.weekData.val("fMonday")=="true" ?"一、":""'></span>
   <span xid="span1" bind-text='$model.weekData.val("fTuesday")=="true" ?"二、":""'></span>
   <span xid="span2" bind-text='$model.weekData.val("fWednesday")=="true" ?"三、":""'></span>
   <span xid="span7" bind-text='$model.weekData.val("fThursday")=="true" ?"四、":""'></span>
   <span xid="span9" bind-text='$model.weekData.val("fFriday")=="true" ?"五、":""'></span>
   <span xid="span7" bind-text='$model.weekData.val("fSaturday")=="true" ?"六、":""'></span>
   <span xid="span10" bind-text='$model.weekData.val("fSunday")=="true" ?"日、":""'></span>
   <span xid="span10" bind-text='"班次"+$model.weekData.val("fDepart")'></span>
   <span xid="span14" bind-text='$model.weekData.val("fDepartTime")'></span></div>
  <div xid="div11">
   <span xid="span13" bind-text='$model.weekData.val("fMonday")=="false" ?"一、":""'></span>
   <span xid="span13" bind-text='$model.weekData.val("fTuesday")=="false" ?"二、":""'></span>
   <span xid="span14" bind-text='$model.weekData.val("fWednesday")=="false" ?"三、":""'></span>
   <span xid="span15" bind-text='$model.weekData.val("fThursday")=="false" ?"四、":""'></span>
   <span xid="span16" bind-text='$model.weekData.val("fFriday")=="false" ?"五、":""'></span>
   <span xid="span17" bind-text='$model.weekData.val("fSaturday")=="false" ?"六、":""'></span>
   <span xid="span18" bind-text='$model.weekData.val("fSunday")=="false" ?"日、":""'></span>
   <span xid="span20">休息</span></div></div>
  <div xid="div2"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="DepartData">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li2"><span xid="span11" bind-text='"班次"+val("fDepart")'></span>
  <span xid="span12" bind-text='"   :   " +val("fTime")'></span></li></ul> </div></div></div><h5 xid="h52" style="color:#808080;"><![CDATA[设置符合你企业要求的考勤方式]]></h5>
  <div xid="div4" style="background-color:white;padding-left:15px;border-top:1px solid #dbdbdb;"><div xid="div5"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="根据办公地点" xid="button3" icon="round round-footprint">
   <i xid="i3" class="round round-footprint" style="display:inline-block;font-size:xx-large;"></i>
   <span xid="span4">根据办公地点</span></a></div>
  <div xid="div6"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="OA_AttendanceMap">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" style="position:relative;border-bottom:1px solid #dbdbdb;"><h4 xid="h43" bind-text='val("fAttenAddrName")' style="color:#000000;"><![CDATA[]]></h4>
  <h5 xid="h53" bind-text='val("fAddressDetail")' style="color:#808080;"><![CDATA[]]></h5>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="removeAddrBtn" icon="icon-close-round" style="position:absolute;top:0px;right:0px;" onClick="removeAddrBtnClick">
   <i xid="i4" class="icon-close-round"></i>
   <span xid="span5"></span></a></li></ul> </div></div>
  <div xid="div7"><div xid="addAddr" bind-click="addAddrClick"><a component="$UI/system/components/justep/button/button" class="btn btn-link" label="添加办公地点" xid="button5" icon="dataControl dataControl-plus" style="font-size:medium;">
   <i xid="i5" class="dataControl dataControl-plus"></i>
   <span xid="span6">添加办公地点</span></a></div>
  <div xid="EffectiveRange" style="padding:10px 15px;"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1" style="width:auto;font-weight:bold;"><![CDATA[选择有效范围]]></label>
   <input component="$UI/system/components/justep/input/input" class="form-control x-edit x-right" xid="fEffectiveRange" placeHolder="请输入有效范围" dataType="Float" maxLength="2"></input><a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="button6" style="padding:0px;font-size:large;color:#808080;" label="米">
   <i xid="i6"></i>
   <span xid="span8">米</span></a></div></div></div></div>
  <div xid="div3" style="background-color:white;padding-left:15px;border-top:1px solid #dbdbdb;">
   <div xid="div10">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="根据wifi精确定位" xid="button2" icon="icon-android-wifi">
     <i xid="i7" class="icon-android-wifi" style="display:inline-block;font-size:xx-large;"></i>
     <span xid="span21">根据wifi精确定位</span></a> </div> 
   <div xid="div18">
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="wifiData">
     <ul class="x-list-template" xid="listTemplateUl3">
      <li xid="li3">
       <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
        <div class="col col-xs-7" xid="col1">
         <h4 xid="h41" bind-text='val("fWifiName")'></h4>
         <span xid="span28" bind-text='val("fMacAddress")'></span></div> 
        <div class="col col-xs-3" xid="col2">
         <span xid="span30"></span></div> 
        <div class="col col-xs-2" xid="col4">
         <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="removeWifi" icon="dataControl dataControl-closel" onClick="removeWifiClick">
          <i xid="i10" class="dataControl dataControl-closel"></i>
          <span xid="span29"></span></a> </div> </div> </li> </ul> </div> </div> 
   <div xid="div19">
    <div xid="addWifi" bind-click="addWifiClick">
     <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="添加办公WIFI" xid="button4" icon="dataControl dataControl-plus" style="font-size:medium;">
      <i xid="i8" class="dataControl dataControl-plus"></i>
      <span xid="span27">添加办公WIFI</span></a> </div> </div> </div></div>
  <div class="x-panel-bottom" xid="bottom1"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-block btn-" label="保存" xid="saveBtn" onClick="saveBtnClick">
   <i xid="i2"></i>
   <span xid="span3">保存</span></a></div></div> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="mapDialog" src="$UI/OA/sign/process/sign/signMapActivity.m.w" onReceive="mapDialogReceive"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="setAddrDialog" status="normal" src="$UI/OA/attendance/process/attendance/SetAddrActivity.m.w" height="40%" width="100%" onReceive="setAddrDialogReceive"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wifiDialog" src="$UI/OA/attendance/process/attendance/AddWifiActivity.w" onReceive="wifiDialogReceive" forceRefreshOnOpen="true"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="WeekDialog" src="$UI/OA/attendance/process/attendance/AttendanceWeekActivity.m.w" onReceive="WeekDialogReceive" process="/OA/attendance/process/attendance/attendanceProcess" activity="AttendanceWeekActivity"></span></div>