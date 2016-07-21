<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model">










<action name="queryOA_WorkDailyAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_WorkDaily"/>
<private name="select" type="String" value="OA_WorkDaily.*"/>
<private name="from" type="String" value="OA_WorkDaily OA_WorkDaily"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/workLog/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_WorkDaily"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_WorkDailyAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_WorkDaily"/>
<private name="dataModel" type="String" value="/OA/workLog/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_WorkDailyAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_WorkDaily"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>



<action name="queryOA_WorkWeeklyAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_WorkWeekly"/>
<private name="select" type="String" value="OA_WorkWeekly.*"/>
<private name="from" type="String" value="OA_WorkWeekly OA_WorkWeekly"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/workLog/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_WorkWeekly"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_WorkWeeklyAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_WorkWeekly"/>
<private name="dataModel" type="String" value="/OA/workLog/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_WorkWeeklyAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_WorkWeekly"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryOA_WorkmonthlyAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Workmonthly"/>
<private name="select" type="String" value="OA_Workmonthly.*"/>
<private name="from" type="String" value="OA_Workmonthly OA_Workmonthly"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/workLog/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Workmonthly"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_WorkmonthlyAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_Workmonthly"/>
<private name="dataModel" type="String" value="/OA/workLog/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_WorkmonthlyAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_Workmonthly"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryOA_WorkLogAction" global="false" procedure="queryOA_WorkLogProcedure"><public type="String" name="strDate"></public>
</action>
<action name="queryOA_WorkDailyScopeAction" global="false" procedure="queryOA_WorkDailyScopeProcedure">
<public type="String" name="strStartDate"></public>
<public type="String" name="strEndDate"></public>
</action>
<action name="queryOA_WorkWeeklyScopeAction" global="false" procedure="queryOA_WorkWeeklyScopeProcedure">
<public type="String" name="strStartDate"></public>
<public type="String" name="strEndDate"></public>
</action>
<action name="queryOA_WorkmonthlyScopeAction" global="false" procedure="queryOA_WorkmonthlyScopeProcedure">
<public type="String" name="strStartDate"></public>
<public type="String" name="strEndDate"></public>
</action>



<action name="queryOA_WorkLogReportAction" global="false" procedure="ksqlQueryProcedure">







<private name="ksql" type="String" value="select OA_WorkDaily,OA_WorkDaily.version as version,OA_WorkDaily.fPersonID as fPersonID,OA_WorkDaily.fPersonName as fPersonName,OA_WorkDaily.fDeptID as fDeptID,OA_WorkDaily.fDeptName as fDeptName,DateTimeToString(OA_WorkDaily.fCreateTime) as fCreateTime,OA_WorkDaily.fDate as fDate,OA_WorkDaily.fFinishWork as fFinishWork,OA_WorkDaily.fWorkPlan as fWorkPlan,OA_WorkDaily.fNeedHelp as fNeedHelp,OA_WorkDaily.fRemark as fRemark,OA_WorkDaily.fImgURL as fImgURL,OA_WorkDaily.fReleaseScope as fReleaseScope from OA_WorkDaily OA_WorkDaily where OA_WorkDaily.fPersonName = :currentPersonName() OR instr(OA_WorkDaily.fReleaseScope, :currentPersonName(), 0) &gt;= 0"></private>
<public name="variables" type="Map"></public>
<private name="dataModel" type="String" value="/OA/workLog/data"></private>
<public name="fnModel" type="String"></public>
</action>
<action name="queryWorkLogReportAction" global="false" procedure="queryWorkLogReportProcedure"><public type="String" name="strConcept"></public>
<public type="String" name="strStartDate"></public>
<public type="String" name="strEndDate"></public>

</action>
</model>