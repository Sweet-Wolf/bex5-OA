<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:484px;left:128px;width:188px;" onLoad="modelLoad" onModelConstruct="modelModelConstruct" onModelConstructDone="modelModelConstructDone"> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="AttendanceTimeData" concept="OA_AttendanceTime"><creator xid="default1" action="/OA/attendance/logic/action/createOA_AttendanceTimeAction"></creator>
  <reader xid="default2" action="/OA/attendance/logic/action/queryOA_AttendanceTimeAction"></reader>
  <writer xid="default3" action="/OA/attendance/logic/action/saveOA_AttendanceTimeAction"></writer></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="AttendanceWeekData" concept="OA_AttendanceWeek"><creator xid="default4" action="/OA/attendance/logic/action/createOA_AttendanceWeekAction"></creator>
  <reader xid="default5" action="/OA/attendance/logic/action/queryOA_AttendanceWeekAction"></reader>
  <writer xid="default6" action="/OA/attendance/logic/action/saveOA_AttendanceWeekAction"></writer></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="考勤时间"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
             
          
  <a component="$UI/system/components/justep/button/button" label="返回" class="btn btn-link btn-xs btn-icon-left" icon="icon-chevron-left" onClick='{"operation":"window.close"}' xid="backBtn"> 
              <i class="icon-chevron-left" />  
              <span>返回</span> 
            </a></div>  
          <div class="x-titlebar-title">考勤时间</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content  x-cards" xid="content1"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1" style="background-color:#FFFFFF;border-top-style:solid;border-bottom-style:solid;border-top-width:1px;border-bottom-width:1px;border-color:#d9d9d9 ;">
   <div class="x-col x-col-fixed x-col-center" xid="col1" style="width:auto;"><span xid="span3" style="font-weight:bold;color:#000000;"><![CDATA[设置班次]]></span></div>
   <div class="x-col x-col-fixed x-col-center" xid="col2" style="width:auto;"><span xid="span11"><![CDATA[班次]]></span>
  <span xid="span2" class="departShow" bind-text='$model.AttendanceWeekData.val("fDepart")'></span></div>
   <div class="x-col  x-col-center" xid="col3" style="text-align:center;"><span xid="span6" class="timeShow text-overflow" bind-text='$model.AttendanceWeekData.val("fDepartTime")'></span></div>
  <div class="x-col x-col-10 x-col-center" xid="col4"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="departBtn" icon="glyphicon glyphicon-pencil" style="color:#000000;padding-left:5px;" onClick="departBtnClick">
   <i xid="i2" class="glyphicon glyphicon-pencil"></i>
   <span xid="span4"></span></a></div></div>
  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#d9d9d9;">
   <div class="x-col" xid="col5"><span xid="span7"><![CDATA[可快速设置所有工作日班次]]></span></div>
   </div>
  <div xid="weekDiv" style="background-color:#FFFFFF;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="Monday" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#d9d9d9;">
   <div class="x-col x-col-fixed x-col-center" xid="col8" style="width:auto;"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="monCheckbox" onChange="monCheckboxChange" bind-ref='$model.AttendanceWeekData.ref("fMonday")' bind-value='$model.AttendanceWeekData.ref("fMonday")' checkedValue="true" uncheckedValue="false" name="depart"></span></div>
   <div class="x-col x-col-fixed x-col-center" xid="col9" style="width:auto;"><span xid="span8" style="color:#000000;font-weight:bold;"><![CDATA[星期一]]></span></div>
   <div class="x-col x-col-fixed x-col-center" xid="col10" style="width:auto;"><span xid="span12">班次</span><span xid="span9" bind-text='$model.AttendanceWeekData.val("fDepart")' class="departShow"></span>
  </div>
  <div class="x-col x-col-center" xid="col11" style="text-align:center;">
  <span xid="span10" class="timeShow time-overflow" bind-text='$model.AttendanceWeekData.val("fDepartTime")'></span><span xid="span31" class="hide"><![CDATA[休息]]></span>
  </div>
  </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="Tuesday" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#d9d9d9;">
   <div class="x-col x-col-fixed x-col-center" xid="col40" style="width:auto;">
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="tuesCheckbox" checkedValue="true" uncheckedValue="false" onChange="tuesCheckboxChange" bind-ref='$model.AttendanceWeekData.ref("fTuesday")' name="depart"></span></div> 
   <div class="x-col x-col-fixed x-col-center" xid="col39" style="width:auto;">
    <span xid="span41" style="color:#000000;font-weight:bold;"><![CDATA[星期二]]></span></div> 
   <div class="x-col x-col-fixed x-col-center" xid="col41" style="width:auto;">
    <span xid="span13">班次
  </span><span xid="span43" class="departShow" bind-text='$model.AttendanceWeekData.val("fDepart")'></span></div> 
   <div class="x-col x-col-center" xid="col38" style="text-align:center;">
    <span xid="span42" class="timeShow time-overflow" bind-text='$model.AttendanceWeekData.val("fDepartTime")'></span><span xid="span40" class="hide">休息</span>
  </div> </div><div component="$UI/system/components/justep/row/row" class="x-row" xid="Wednesday" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#d9d9d9;">
   <div class="x-col x-col-fixed x-col-center" xid="col16" style="width:auto;">
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" checkedValue="true" uncheckedValue="false" bind-ref='$model.AttendanceWeekData.ref("fWednesday")' name="depart" xid="wednCheckbox" onChange="wednCheckboxChange"></span></div> 
   <div class="x-col x-col-fixed x-col-center" xid="col17" style="width:auto;">
    <span xid="span14" style="color:#000000;font-weight:bold;"><![CDATA[星期三]]></span></div> 
   <div class="x-col x-col-fixed x-col-center" xid="col19" style="width:auto;">
    <span xid="span23">班次</span>
  <span xid="span15" bind-text='$model.AttendanceWeekData.val("fDepart")' class="departShow"></span></div> 
   <div class="x-col x-col-center" xid="col18" style="text-align:center;">
    <span xid="span16" bind-text='$model.AttendanceWeekData.val("fDepartTime")' class="timeShow time-overflow"></span><span xid="span5" class="hide"><![CDATA[休息]]></span>
  </div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="Thursday" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#d9d9d9;">
   <div class="x-col x-col-fixed x-col-center" xid="col20" style="width:auto;">
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="thursCheckbox" checkedValue="true" uncheckedValue="false" onChange="thursCheckboxChange" bind-ref='$model.AttendanceWeekData.ref("fThursday")' name="depart"></span></div> 
   <div class="x-col x-col-fixed x-col-center" xid="col21" style="width:auto;">
    <span xid="span17" style="color:#000000;font-weight:bold;"><![CDATA[星期四]]></span></div> 
   <div class="x-col x-col-fixed x-col-center" xid="col23" style="width:auto;">
    <span xid="span24">班次</span>
  <span xid="span18" class="departShow" bind-text='$model.AttendanceWeekData.val("fDepart")'></span></div> 
   <div class="x-col x-col-center" xid="col22" style="text-align:center;">
    <span xid="span19" class="timeShow time-overflow" bind-text='$model.AttendanceWeekData.val("fDepartTime")'></span><span xid="span30" class="hide"><![CDATA[休息]]></span>
  </div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="Friday" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#d9d9d9;">
   <div class="x-col x-col-fixed x-col-center" xid="col24" style="width:auto;">
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="friCheckbox" checkedValue="true" uncheckedValue="false" onChange="friCheckboxChange" bind-ref='$model.AttendanceWeekData.ref("fFriday")' name="depart"></span></div> 
   <div class="x-col x-col-fixed x-col-center" xid="col25" style="width:auto;">
    <span xid="span20" style="color:#000000;font-weight:bold;"><![CDATA[星期五]]></span></div> 
   <div class="x-col x-col-fixed x-col-center" xid="col27" style="width:auto;">
    <span xid="span25">班次</span>
  <span xid="span21" bind-text='$model.AttendanceWeekData.val("fDepart")' class="departShow"></span></div> 
   <div class="x-col x-col-center" xid="col26" style="text-align:center;">
    <span xid="span22" bind-text='$model.AttendanceWeekData.val("fDepartTime")' class="timeShow time-overflow"></span><span xid="span33" class="hide"><![CDATA[休息]]></span>
  </div> </div>
  
  
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="Saturday" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#d9d9d9;">
   <div class="x-col x-col-fixed x-col-center" xid="col6" style="width:auto;"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="saturCheckbox" checkedValue="true" uncheckedValue="false" onChange="saturCheckboxChange" bind-ref='$model.AttendanceWeekData.ref("fSaturday")' name="depart"></span></div>
   <div class="x-col x-col-fixed x-col-center" xid="col7" style="width:auto;"><span xid="span36" style="font-weight:bold;color:black;"><![CDATA[星期六]]></span></div>
   <div class="x-col x-col-fixed x-col-center" xid="col36" style="width:auto;"><span xid="span32">班次</span>
  <span xid="span37" bind-text='$model.AttendanceWeekData.val("fDepart")' class="departShow"></span></div>
  <div class="x-col x-col-center" xid="col37" style="text-align:center;"><span xid="span38" bind-text='$model.AttendanceWeekData.val("fDepartTime")' class="timeShow time-overflow"></span><span xid="span39" class="hide"><![CDATA[休息]]></span>
  </div></div><div component="$UI/system/components/justep/row/row" class="x-row" xid="Sunday" style="border-bottom-style:solid;border-bottom-width:1px;border-bottom-color:#d9d9d9;">
   <div class="x-col x-col-fixed x-col-center" xid="col32" style="width:auto;">
    <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="sunCheckbox" checkedValue="true" uncheckedValue="false" onChange="sunCheckboxChange" bind-ref='$model.AttendanceWeekData.ref("fSunday")' name="depart"></span></div> 
   <div class="x-col x-col-fixed x-col-center" xid="col33" style="width:auto;">
    <span xid="span26" style="color:#000000;font-weight:bold;"><![CDATA[星期日]]></span></div> 
   <div class="x-col x-col-fixed x-col-center" xid="col35" style="width:auto;">
    <span xid="span34">班次</span>
  <span xid="span27" bind-text='$model.AttendanceWeekData.val("fDepart")' class="departShow"></span></div> 
   <div class="x-col x-col-center" xid="col34" style="text-align:center;">
    <span xid="span28" bind-text='$model.AttendanceWeekData.val("fDepartTime")' class="timeShow time-overflow"></span><span xid="span35" class="hide"><![CDATA[休息]]></span>
  </div> </div>
  </div>
  </div>
  <div class="x-panel-bottom" xid="bottom1" height="38"><a component="$UI/system/components/justep/button/button" class="btn btn-default btn-only-label center-block" label="确定" xid="saveDateBtn" style="font-size:16px;" onClick='saveDateBtn'>
   <i xid="i3"></i>
   <span xid="span29">确定</span></a></div></div> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="departDlg" width="100%" height="100%" onReceive="departDlgReceive" style="top:44px;left:6px;" forceRefreshOnOpen="true"></span></div>