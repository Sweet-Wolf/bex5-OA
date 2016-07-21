<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:327px;left:488px;" onLoad="modelLoad" onInactive="modelInactive" onParamsReceive="modelParamsReceive" onModelConstruct="modelModelConstruct"> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="checkInOutData" concept="OA_ChekInOut" autoNew="false"><creator xid="default4" action="/OA/attendance/logic/action/createOA_ChekInOutAction"></creator>
  <reader xid="default5" action="/OA/attendance/logic/action/queryOA_ChekInOutAction"></reader>
  <writer xid="default6" action="/OA/attendance/logic/action/saveOA_ChekInOutAction"></writer></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="TimeData" idColumn="id"><column label="ID" name="id" type="String" xid="xid7"></column>
  <column label="班制" name="fAttendanceClass" type="String" xid="xid8"></column>
  <column label="班次" name="fDeparting" type="String" xid="xid9"></column>
  <column label="上午上班时间" name="fStartAM" type="String" xid="xid10"></column>
  <column label="上午下班时间" name="fEndAM" type="String" xid="xid11"></column>
  <column label="下午上班时间" name="fStartPM" type="String" xid="xid12"></column>
  <column label="下午下班时间" name="fEndPM" type="String" xid="xid13"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="mainData" idColumn="fID" onCustomRefresh="mainDataCustomRefresh"><column name="fID" type="String" xid="xid1"></column>
  <column label="上下班时间" name="fAMPM" type="String" xid="xid2"></column>
  <column label="考勤地址" name="fAttenAddrName" type="String" xid="xid3"></column>
  <column label="考勤班制" name="fAttendanceClass" type="String" xid="xid4"></column>
  <column label="考勤组名称" name="fAttendanceGroupName" type="String" xid="xid5"></column>
  <column label="班次" name="fDepart" type="String" xid="xid6"></column>
  <column label="参与考勤人数" name="fPersonNameJ" type="String" xid="xid14"></column>
  <column label="参与考勤人数ID" name="fPersonNameJID" type="String" xid="xid15"></column>
  <column label="考勤组负责人" name="fPersonNameS" type="String" xid="xid16"></column>
  <column label="考勤组负责人ID" name="fPersonNameSID" type="String" xid="xid17"></column>
  <column label="考勤星期" name="fWeek" type="String" xid="xid18"></column>
  <column label="考勤Wifi信息" name="wifiName" type="String" xid="xid19"></column>
  <column label="考勤wifi地址" name="wifiAddr" type="String" xid="xid20"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="考勤打卡"
          class="x-titlebar" style="background-color:#3399F3;">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              xid="backBtn" onClick="{operation:'window.close'}"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">考勤打卡</div>  
          <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="设置" xid="AttendanceAdminBtn" onClick="AttendanceAdminBtnClick">
   <i xid="i9"></i>
   <span xid="span9">设置</span></a></div>
        </div> 
      </div>  
    <div xid="waitDiv" style="position:relative;height:200px;">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button7" style="position:absolute;font-size:30px;top:42%;left:42%;" icon="icon-loading-a">
    <i xid="i8" class="icon-loading-a"></i>
    <span xid="span11"></span></a> </div><div class="x-panel-content x-cards no-padding" xid="content1" style="display:none;">
  
  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full" active="0" xid="attenContents" wrap="false" swipe="false" onActiveChange="attenContentsActiveChange" slidable="false">
   <div class="x-contents-content" xid="check"><div component="$UI/system/components/justep/row/row" class="x-row" xid="selPicker" style="border-bottom:1px solid #ddd;" bind-click="selPickerClick">
   <div class="x-col x-col-fixed x-col-center" xid="col1" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon no-padding" label="button" xid="button1" icon="icon-ios7-calendar-outline" style="font-size:2em;">
   <i xid="i1" class="icon-ios7-calendar-outline"></i>
   <span xid="span1"></span></a></div>
   <div class="x-col x-col-center" xid="col2"><span xid="weekSpan"></span><span xid="dateSpanc"></span>
  </div>
   <div class="x-col x-col-fixed x-col-center" xid="col3" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-link btn-only-icon" label="button" xid="button2" icon="icon-chevron-down">
   <i xid="i2" class="icon-chevron-down"></i>
   <span xid="span2"></span></a></div></div>
  <div component="$UI/system/components/bootstrap/row/row" class="row atten_row" xid="checkIn" bind-style=" $model.checkInOutData.val(&quot;fCheckInAM&quot;)?{'background':'white','border-bottom':'1px solid #ddd'}:{&quot;background&quot;:&quot;none&quot;,&quot;border&quot;:&quot;none&quot;}">
   <div class="col col-xs-12" xid="col10" style="margin-bottom:25px;"><span xid="tipSpan" bind-visible=' !$model.checkInOutData.val("fCheckInAM")' bind-text="$model.getStartTime()"><![CDATA[]]></span>
  
  <div xid="div9" bind-visible=' $model.checkInOutData.val("fCheckInAM")' style="margin-top:15px;"><div xid="div7">
  
  
  <p xid="p2" style="padding-boottom:10px;color:#999;" bind-text='"调整心情，开启美好心情开始工作"'><![CDATA[]]></p><div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="checkInOutData">
   <ul class="x-list-template" xid="listTemplateUl2">
    <li xid="li2"><span xid="span12" bind-text='$object.val("fCheckInAM")?"打卡时间: " + justep.Date.toString($object.val("fCheckInAM"),"hh:mm:ss"):""' class="check_listText"><![CDATA[]]></span><span xid="IntimeSpan" bind-text='$($model.getElementByXid("tipSpan")).html().split("：")[1]!=undefined?"(上班时间："+$($model.getElementByXid("tipSpan")).html().split("：")[1]+")":""'></span></li></ul> </div>
  </div><div xid="div4"><a component="$UI/system/components/justep/button/button" class="btn btn-link locaBtn" xid="button6" icon="linear linear-bicycle">
   <i xid="i3" class="linear linear-bicycle"></i>
   <span xid="span3"></span></a><span xid="checkInArea" bind-text='$model.checkInOutData.val("fCheckAreaAM")'></span></div>
  <div xid="div5" style="display:inline-block;"><span xid="statuSpanAM" bind-text=' $model.checkInOutData.val("fIsLate")? $model.checkInOutData.val("fIsLate"):"正常"' bind-style=' $model.checkInOutData.val("fIsLate")?{"color":"orange"}:{"color":"green"}'></span></div></div></div>
   <div class="col col-xs-4 col-xs-offset-4" xid="col11" bind-visible='!$model.checkInOutData.val("fCheckInAM") '>
  
  <div xid="buttonCheck" bind-click="buttonCheckInClick" class="btnCheck"><span xid="stateSpan" class="stateText"><![CDATA[上班打卡]]></span><span xid="systemTime" class="timeText"><![CDATA[]]></span>
  </div>
  </div>
   <div component="$UI/system/components/justep/row/row" class="x-row tipRow" xid="tipInfoRow">
   <div class="x-col" xid="col4"><span xid="span7" class="lateText"><![CDATA[对不起,暂无数据]]></span></div>
   </div></div><div component="$UI/system/components/bootstrap/row/row" class="row" xid="checkOut" bind-visible=' $model.checkInOutData.val("fCheckInAM")' style="margin:0;margin-top:10px;background:rgb(255,255,255);display:none;">
   <div class="col col-xs-12" xid="col23" style="padding-top:15px;">
    <span xid="EndTimeSpan" bind-visible=' !$model.checkInOutData.val("fCheckOutPM")' bind-text="$model.getEndTime()"><![CDATA[]]></span>
  <div xid="div10" bind-visible=' $model.checkInOutData.val("fCheckOutPM")' style="margin-top:15px;"><div xid="div11">
   
   
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="checkInOutData">
   <ul class="x-list-template" xid="listTemplateUl3">
    <li xid="li3"><span xid="span16" bind-text='$object.val("fCheckOutPM")?"打卡时间: " +  justep.Date.toString($object.val("fCheckOutPM"),"hh:mm:ss"):""' class="check_listText"></span><span xid="span15" bind-text='$($model.getElementByXid("EndTimeSpan")).html().split("：")[1]!=undefined?"(下班时间"+$($model.getElementByXid("EndTimeSpan")).html().split("：")[1]+")":""'></span></li></ul> </div></div>
  
  
  <div xid="div6"><a component="$UI/system/components/justep/button/button" class="btn btn-link locaBtn" xid="button8" icon="linear linear-bicycle">
   <i xid="i7" class="linear linear-bicycle"></i>
   <span xid="span10"></span></a><span xid="checkOutArea" bind-text='$model.checkInOutData.val("fCheckAreaPM")'></span>
  </div>
  <span xid="statuSpanPM" bind-text=' $model.checkInOutData.val("fIsLeaving")? $model.checkInOutData.val("fIsLeaving"):"正常"' bind-style=' $model.checkInOutData.val("fIsLeaving")?{"color":"orange"}:{"color":"green"}' style="display:block;"></span><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-icon-left" label="更换打卡状态" xid="changeStatus" bind-click="changeStatusClick" icon="linear linear-redo" style="padding-left:0;">
   <i xid="i6" class="linear linear-redo"></i>
   <span xid="span8">更换打卡状态</span></a><div xid="div8">
  <p xid="p1" style="color:#999;"><![CDATA[一天工作辛苦了，好好休息]]></p></div>
  </div></div> 
   <div class="col col-xs-4 col-xs-offset-4" xid="col22" bind-visible='!$model.checkInOutData.val("fCheckOutPM")'>
    <div xid="buttonCheckOut" bind-click="buttonCheckOutClick" class="btnCheck">
     <span xid="span4" style="display:block;" class="stateText"><![CDATA[下班打卡]]></span><span xid="systemTime2" class="timeText"></span>
  </div> </div> 
  </div>
  
  
  <div component="$UI/system/components/justep/row/row" class="x-row tipRow" xid="tipOutRow">
   <div class="x-col" xid="col5"><span xid="tipOutSpan" class="tipOutText"><![CDATA[对不起,暂无数据]]></span></div>
   </div></div>
  <div class="x-contents-content" xid="statistics"><div component="$UI/system/components/justep/windowContainer/windowContainer" class="x-window-container" xid="navContainer" src="$UI/OA/attendance/process/attendance/CountAttendanceActivity.w" autoLoad="false"></div></div></div>
  </div>
  <div class="x-panel-bottom" xid="bottom1"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="true" xid="buttonGroup1" selected="button4"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="打卡" xid="button4" target="check">
   <i xid="i4" class="icon-android-checkmark"></i>
   <span xid="span5">打卡</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default btn-icon-top" label="统计" xid="button5" icon="icon-android-note" target="statistics">
   <i xid="i5" class="icon-android-note"></i>
   <span xid="span6">统计</span></a></div></div></div> 
<div component="$UI/system/components/justep/datePicker/datePicker" class="x-popPicker" xid="datePicker" type="date" onOK="datePickerOK" style="top:9px;left:753px;">
   <div class="x-popPicker-overlay" xid="div1"></div>
   <div class="x-popPicker-content" xid="div2">
    <div class="x-poppicker-header" xid="div3">
     <button class="btn btn-default x-btn-ok" xid="button3">确定</button></div> </div> </div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="remarkDialog" status="normal" width="80%" height="60%" src="$UI/OA/attendance/process/attendance/remarkActivity.m.w" showTitle="true" forceRefreshOnOpen="true" onReceived="remarkDialogReceived"></span><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="remarkOutDialog" status="normal" width="80%" height="60%" src="$UI/OA/attendance/process/attendance/remarkOutActivity.m.w" showTitle="true" forceRefreshOnOpen="true" onReceived="remarkOutDialogReceived"></span>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="successDialog" message='打卡成功'></span><span component="$UI/system/components/justep/messageDialog/messageDialog" xid="successOutDialog" message="打卡成功"></span>
  <span component="$UI/system/components/justep/messageDialog/messageDialog" xid="warningDialog" message="你只能为今天打卡!!!!!"></span></div>