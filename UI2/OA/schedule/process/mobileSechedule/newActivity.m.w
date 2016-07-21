<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:102px;height:auto;left:261px;top:316px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="scheduleData"
      concept="OA_SD_Schedule" autoLoad="false" limit="-1" confirmDelete="false" onBeforeSave="scheduleDataBeforeSave"> 
      <reader xid="default1" action="/OA/schedule/logic/action/querySDSCHEDULEAction"/>  
      <writer xid="default2" action="/OA/schedule/logic/action/saveSDSCHEDULEAction"/>  
      <creator xid="default3" action="/OA/schedule/logic/action/createSDSCHEDULEAction"/>  
      <rule xid="rule2">
   <col name="fName" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default13">js:true</expr>
     <message xid="default14">请输入主题</message></required> </col> 
   <col name="fStartTime" xid="ruleCol5">
    <required xid="required5">
     <expr xid="default15">js:true</expr>
     <message xid="default16">请选择开始时间</message></required> 
    <constraint xid="constraint1">
     <expr xid="default17"><![CDATA[js: $row.val("fStartTime") <  $row.val("fEndTime")]]></expr>
     <message xid="default18">开始时间不能大于结束时间</message></constraint> </col> 
   <col name="fEndTime" xid="ruleCol6">
    <required xid="required6">
     <expr xid="default19">js:true</expr>
     <message xid="default20">请选择结束时间</message></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" xid="weekData"
      idColumn="day" autoNew="false" autoLoad="true"> 
      <column label="day" name="day" type="Integer" xid="default6"/>  
      <column label="xing" name="xingqi" type="String" xid="default7"/>  
      <data xid="default9">[{"day":2,"xingqi":"星期一"},{"day":3,"xingqi":"星期二"},{"day":4,"xingqi":"星期三"},{"day":5,"xingqi":"星期四"},{"day":6,"xingqi":"星期五"},{"day":7,"xingqi":"星期六"},{"day":1,"xingqi":"星期日"}]</data> 
    </div> 
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dExecutor" concept="OA_SD_Executor">
   <reader xid="default4" action="/OA/schedule/logic/action/querySDEXECUTORAction"></reader>
   <writer xid="default5" action="/OA/schedule/logic/action/saveSDEXECUTORAction"></writer>
   <creator xid="default4" action="/OA/schedule/logic/action/createSDEXECUTORAction"></creator>
   <master xid="default23" data="scheduleData" relation="fSDMasterID"></master></div></div>  
  <!--   <span component="$UI/system/components/justep/org/orgDialog" xid="orgSingleDialog"
    onReceive="orgSingleDialogReceive"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgMutilDialog"
    multiSelection="true" onReceive="orgMutilDialogReceive"/>   -->  
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？" style="left:49px;top:86px;"/>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents1" wrap="false" swipe="false"> 
    <div class="x-contents-content" xid="new"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel3"> 
        <div class="x-panel-top" xid="top3" > 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="titleBar" title="日程编辑"> 
            <div class="x-titlebar-left" xid="div27"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="listBtn" icon="icon-chevron-left" onClick="listBtnClick"> 
                <i xid="i1" class="icon-chevron-left"/>  
                <span xid="span2"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div28">日程编辑</div>  
            <div class="x-titlebar-right reverse" xid="div29"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="saveBtn" icon="icon-checkmark-round" onClick="saveBtnClick"> 
                <i xid="i2" class="icon-checkmark-round"/>  
                <span xid="span6"/> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content5"> 
          <div xid="div25" class="input-group input-group-row"> 
            <span xid="span75" class="input-group-addon">主题</span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptTheme" bind-ref="scheduleData.ref('fTitle')" style="text-align:right;" placeHolder="请输入主题"/> 
          </div>  
          <div xid="div20" class="input-group input-group-row"> 
            <span xid="span7" class="input-group-addon">开始时间</span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptStartTime" bind-ref="scheduleData.ref('fBeginTime')" style="text-align:right;"
              format="yyyy-MM-dd hh:mm" placeHolder="请选择开始时间"/> 
          </div>  
          <div xid="div21" class="input-group input-group-row"> 
            <span xid="span71" class="input-group-addon">结束时间</span>  
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iptEndTime" bind-ref="scheduleData.ref('fEndTime')" style="text-align:right;"
              format="yyyy-MM-dd hh:mm" placeHolder="请选择结束时间"/> 
          </div>  
          <textarea component="$UI/system/components/justep/textarea/textarea" placeHolder="请输入日程说明"
            class="form-control input-row" xid="textarea1" bind-ref="scheduleData.ref('fContent')"
            style="height:86px;"/>  
            <div xid="div52" class="row-line"> 
            <div class="x-ro" component="$UI/system/components/justep/social/relativeOrg/relativeOrg"
              xid="selectCreator" data="scheduleData" groupName="参与人" multiSelection="true" statusEnabled="false" bind-nameRef="scheduleData.ref('fTitle')" onChange="selectCreatorChange" groupID="SD_Schedule"> 
              <div component="$UI/system/components/justep/data/bizData" concept="SA_Social"
                xid="bizData3"/>  
            </div> 
          </div>  
          <div class="input-group input-group-row" xid="labelToggle1"> 
            <span xid="span731" class="input-group-addon"><![CDATA[是否公开]]></span>  
            <div component="$UI/system/components/justep/button/toggle" class="x-toggle x-edit pull-right"
              xid="toggle2" bind-ref="scheduleData.ref('fIsShared')" ON="是" OFF="否" checkedValue="1"/> 
          </div>  
          <!-- <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelToggle2">
      <label class="x-label" xid="label2">动态分享</label>
      <span component="$UI/system/components/justep/button/toggle" class="x-toggle x-edit" xid="toggle3" bind-ref="scheduleData.ref('fShare')"></span></div>
       -->  

        </div> 
      </div> 
    </div>  
    </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:3px;top:356px;" onReceive="windowReceiverReceive"/> 
</div>
