<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryOA_WorkLogProcedure" code-model="/OA/workLog/logic/code" code="WorkLog.queryOA_WorkLog"> 
    <parameter name="strDate" type="String"/> 
  </procedure>  
  <procedure name="queryOA_WorkDailyScopeProcedure" code-model="/OA/workLog/logic/code" code="WorkLog.queryOA_WorkDailyScope"> 
    <parameter name="strStartDate" type="String"/>  
    <parameter name="strEndDate" type="String"/> 
  </procedure>  
  <procedure name="queryOA_WorkWeeklyScopeProcedure" code-model="/OA/workLog/logic/code" code="WorkLog.queryOA_WorkWeeklyScope"> 
    <parameter name="strStartDate" type="String"/>  
    <parameter name="strEndDate" type="String"/> 
  </procedure>  
  <procedure name="queryOA_WorkmonthlyScopeProcedure" code-model="/OA/workLog/logic/code" code="WorkLog.queryOA_WorkmonthlyScope"> 
    <parameter name="strStartDate" type="String"/>  
    <parameter name="strEndDate" type="String"/> 
  </procedure>  
  <procedure name="queryOA_WorkLogReportProcedure" code-model="/OA/workLog/logic/code" code="WorkLog.queryOA_WorkLogReport"> 
    <parameter name="ksql" type="String"/>  
    <parameter name="variables" type="Map"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/> 
  </procedure>  
  <procedure name="queryWorkLogReportProcedure" code-model="/OA/workLog/logic/code" code="WorkLog.queryWorkLogReport">
    <parameter name="strConcept" type="String"/>
    <parameter name="strStartDate" type="String"/>
    <parameter name="strEndDate" type="String"/>
  </procedure>
</model>
