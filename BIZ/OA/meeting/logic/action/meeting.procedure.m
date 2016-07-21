<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="getDateQueryDataProcedure" code-model="/OA/meeting/logic/code" code="Meeting.getDateQueryData"> 
    <parameter name="beginDate" type="String"/>  
    <parameter name="endDate" type="String"/>  
    <parameter name="roomID" type="String"/> 
  </procedure>  
  <procedure name="getRoomQueryDataProcedure" code-model="/OA/meeting/logic/code" code="Meeting.getRoomQueryData"> 
    <parameter name="roomDate" type="String"/>  
    <parameter name="roomIDStr" type="String"/>  
    <parameter name="roomFilterStr" type="String"/> 
  </procedure>  
  <procedure name="reportProcedure" code-model="/OA/meeting/logic/code" code="Meeting.report"> 
    <parameter name="dataModel" type="String"/>  
    <parameter name="param" type="String"/> 
  </procedure>  
  <procedure name="newScheduleByMeetingProcedure" code-model="/OA/meeting/logic/code" code="Meeting.newScheduleByMeeting">
    <parameter name="cmd" type="Xml"/>
  </procedure>
</model>
