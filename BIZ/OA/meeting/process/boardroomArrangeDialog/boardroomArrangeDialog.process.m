<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="boardroomArrangeDialogProcess">
    <label language="zh_CN">会议室安排对话框</label>
    <static-activity name="arrangeDetail">
      <label language="zh_CN">会议室安排</label>
    </static-activity>
    
    
    
    
    
    
    
    
    
    
    <!--<has-action action="newScheduleAction"/>-->
    <!--<has-action action="createSDSCHEDULEAction"/>
    <has-action action="querySDSCHEDULEAction"/>
    <has-action action="saveSDSCHEDULEAction"/>-->
  









<has-action action="createMTBOARDROOMAction" access-permission="public"></has-action>
<has-action action="queryMTBOARDROOMAction" access-permission="public"></has-action>
<has-action action="saveMTBOARDROOMAction" access-permission="public"></has-action>
<has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="queryMTRoomArrangeAction" access-permission="public"></has-action>
<has-action action="createMTRoomArrangeAction" access-permission="public"></has-action>
<has-action action="saveMTRoomArrangeAction" access-permission="public"></has-action>
<has-action action="checkBoardroomUsedAction" access-permission="public"></has-action>
<has-action action="deleteScheduleByBizAction" access-permission="public"></has-action>
<has-action action="newScheduleByMeetingAction" access-permission="public"></has-action>
</process>
</model>
