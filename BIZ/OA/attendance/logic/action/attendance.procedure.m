<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryCheckStatProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryCheckStat"> 
    <parameter name="strDate" type="String"/> 
  </procedure>  
  <procedure name="queryCheckStatDeptProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryCheckStatDept"> 
    <parameter name="strDate" type="String"/> 
  </procedure>  
  <procedure name="queryCheckSortStatProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryCheckSortStat"> 
    <parameter name="strDeptID" type="String"/>  
    <parameter name="strDate" type="String"/> 
  </procedure>  
  <procedure name="queryStartEndTimeProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryStartEndTime"/>  
  <procedure name="queryAttendanceTimeProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryAttendanceTime"> 
    <parameter name="rowID" type="String"/> 
  </procedure>  
  <procedure name="queryStartEndTimeProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryStartEndTime"/>  
  <procedure name="queryGoWorkTimeProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryGoWorkTime"/>  
  <procedure name="queryRankLateProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryRankLate"/>  
  <procedure name="queryRankAbsenProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryRankAbsen"/>  
  <procedure name="queryOA_AttendanceGroupProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryOA_AttendanceGroup"> 
    <parameter name="personID" type="String"/>
  </procedure>  
  <procedure name="deleteAttendanceProcedure" code-model="/OA/attendance/logic/code" code="Attendance.deleteAttendance"> 
    <parameter name="deleteAll" type="String"/> 
  </procedure>  
  <procedure name="queryPersonProcedure" code-model="/OA/attendance/logic/code" code="Attendance.queryPerson"> 
    <parameter name="person" type="String"/>  
    <parameter name="rowID" type="String"/> 
  </procedure> 
</model>
