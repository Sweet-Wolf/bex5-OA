<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:355px;left:31px;" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="timeData" concept="OA_AdvancedSetting" autoNew="false"><creator xid="default1" action="/OA/attendance/logic/action/createOA_AdvancedSettingAction"></creator>
  <reader xid="default2" action="/OA/attendance/logic/action/queryOA_AdvancedSettingAction"></reader>
  <writer xid="default3" action="/OA/attendance/logic/action/saveOA_AdvancedSettingAction"></writer></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="高级设置"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">高级设置</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div class="x-panel-content x-cards" xid="content1" style="padding-top:0px;margin-top:0px;"><div xid="div1" style="background-color:white;margin-bottom:5px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="workRow" style="padding:0px 0px 0px 5px;margin:0px 0px 0px 0px;border-style:solid solid solid solid;border-width:0px 0px 1px 0px;border-color:#D9D9D9 #D9D9D9 #D9D9D9 #D9D9D9;" bind-click="workRowClick">
   <div class="x-col x-col-center" xid="col1"><span xid="span1"><![CDATA[设置上班弹性时间]]></span></div>
   <div class="x-col x-col-center pull-right" xid="col2" style="text-align:right;"><span xid="workSpan" style="color:#C3C3C3;" bind-text='$model.timeData.val("fGoWorkTime")'><![CDATA[]]></span></div>
   <div class="x-col x-col-fixed" xid="col3" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button1" icon="icon-chevron-right" style="color:#C0C0C0;">
   <i xid="i1" class="icon-chevron-right"></i>
   <span xid="span3"></span></a></div></div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="lateRow" style="padding:0px 0px 0px 5px;margin:0px 0px 0px 0px;border-style:solid solid solid solid;border-width:0px 0px 1px 0px;border-color:#D9D9D9 #D9D9D9 #D9D9D9 #D9D9D9;" bind-click="lateRowClick">
   <div class="x-col x-col-center" xid="col6">
    <span xid="span6"><![CDATA[设置严重迟到]]></span></div> 
   <div class="x-col x-col-center pull-right" xid="col4" style="text-align:right;">
    <span xid="lateSpan" style="color:#C3C3C3;" bind-text='$model.timeData.val("fLateTime")'><![CDATA[]]></span></div> 
   <div class="x-col x-col-fixed" xid="col5" style="width:auto;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button2" icon="icon-chevron-right" style="color:#C0C0C0;">
     <i xid="i2" class="icon-chevron-right"></i>
     <span xid="span5"></span></a> </div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="absentRow" style="padding:0px 0px 0px 5px;margin:0px 0px 0px 0px;border-style:solid solid solid solid;border-width:0px 0px 1px 0px;border-color:#D9D9D9 #D9D9D9 #D9D9D9 #D9D9D9;" bind-click="absentRowClick">
   <div class="x-col x-col-center" xid="col9">
    <span xid="span9"><![CDATA[设置旷工]]></span></div> 
   <div class="x-col x-col-center pull-right" xid="col7" style="text-align:right;">
    <span xid="absentSpan" style="color:#C3C3C3;" bind-text='$model.timeData.val("fAbsentTime")'><![CDATA[]]></span></div> 
   <div class="x-col x-col-fixed" xid="col8" style="width:auto;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button3" icon="icon-chevron-right" style="color:#C0C0C0;">
     <i xid="i3" class="icon-chevron-right"></i>
     <span xid="span8"></span></a> </div> </div>
  </div>
  <span xid="span10" style="padding-left:5px;color:#C0C0C0;font-size:12px;font-family:宋体;"><![CDATA[上班后超过多久打卡分别设置为迟到、严重迟到和旷工]]></span><div xid="div2" style="background-color:white;margin:10px 0px 0px 0px;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="mastEarly" style="padding:0px 0px 0px 5px;margin:0px 0px 0px 0px;border-style:solid solid solid solid;border-width:1px 0px 1px 0px;border-color:#D9D9D9 #D9D9D9 #D9D9D9 #D9D9D9;" bind-click="mastEarlyClick">
   <div class="x-col x-col-center" xid="col12">
    <span xid="span13"><![CDATA[设置上班打卡的最早时间]]></span></div> 
   <div class="x-col x-col-center pull-right" xid="col10" style="text-align:right;">
    <span xid="longSpan" style="color:#C3C3C3;" bind-text='$model.timeData.val("fFirstEarlyTime")'><![CDATA[]]></span></div> 
   <div class="x-col x-col-fixed" xid="col11" style="width:auto;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button4" icon="icon-chevron-right" style="color:#C0C0C0;">
     <i xid="i4" class="icon-chevron-right"></i>
     <span xid="span12"></span></a> </div> </div></div>
  <span xid="span14" style="padding-left:5px;color:#C0C0C0;font-size:12px;font-family:宋体;"><![CDATA[上班多少分钟前才允许打卡]]></span></div>
  </div> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="shortTimeChooseDlg" status="normal" onReceive="shortTimeChooseDlgReceive" forceRefreshOnOpen="true"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="longTimeChooseDlg" onReceive="longTimeChooseDlgReceive" status="normal"></span>
  </div>