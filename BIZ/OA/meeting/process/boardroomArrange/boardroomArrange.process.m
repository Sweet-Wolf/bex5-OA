<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="boardroomArrangeProcess"> 
    <label language="zh_CN">会议室安排</label>  
    <static-activity name="boardroomArrange"> 
      <label language="zh_CN">boardroomArrange</label> 
    </static-activity>  
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
  <has-action action="createMTBOARDROOMAction" access-permission="public"></has-action>
<has-action action="queryMTBOARDROOMAction" access-permission="public"></has-action>
<has-action action="saveMTBOARDROOMAction" access-permission="public"></has-action>
<has-action action="queryMTRoomArrangeAction" access-permission="public"></has-action>
<has-action action="createMTRoomArrangeAction" access-permission="public"></has-action>
<has-action action="saveMTRoomArrangeAction" access-permission="public"></has-action>
<has-action action="checkBoardroomUsedAction" access-permission="public"></has-action>
<has-action action="deleteScheduleByBizAction" access-permission="public"></has-action>
<has-action action="newScheduleByMeetingAction" access-permission="public"></has-action>
<has-action action="queryMTARRANGEPSNSAction" access-permission="public"></has-action>
<has-action action="saveMTARRANGEPSNSAction" access-permission="public"></has-action>
<has-action action="createMTARRANGEPSNSAction" access-permission="public"></has-action>
<has-action action="createMTUSEAPPLYAction" access-permission="public"></has-action>
<has-action action="queryMTUSEAPPLYAction" access-permission="public"></has-action>
<has-action action="saveMTUSEAPPLYAction" access-permission="public"></has-action>
<has-action action="createMTUSEAPPLYPSNSAction" access-permission="public"></has-action>
<has-action action="saveMTUSEAPPLYPSNSAction" access-permission="public"></has-action>
<has-action action="queryMTUSEAPPLYPSNSAction" access-permission="public"></has-action>
<has-action action="sqlQueryAction" access-permission="public"><public name="dataModel" type="String" value="/OA/meeting/data"></public>
</has-action>
<has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"></has-action>
<has-action action="reportAction" access-permission="public"></has-action>
</process> 
</model>
