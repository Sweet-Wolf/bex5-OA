<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model"><action name="queryOA_ChekInOutAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_ChekInOut"/>
<private name="select" type="String" value="OA_ChekInOut.*"/>
<private name="from" type="String" value="OA_ChekInOut OA_ChekInOut"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_ChekInOut"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_ChekInOutAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_ChekInOut"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_ChekInOutAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_ChekInOut"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action global="false" name="queryCheckStatAction" procedure="queryCheckStatProcedure"><label language="zh_CN">考勤统计</label>
<public name="strDate" type="String"/>
</action>



<action name="queryOA_AttendanceSetAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_AttendanceSet"/>
<private name="select" type="String" value="OA_AttendanceSet.*"/>
<private name="from" type="String" value="OA_AttendanceSet OA_AttendanceSet"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_AttendanceSet"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_AttendanceSetAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_AttendanceSet"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_AttendanceSetAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_AttendanceSet"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action global="false" name="queryCheckStatDeptAction" procedure="queryCheckStatDeptProcedure">
<public name="strDate" type="String"/>
</action>
<action global="false" name="queryCheckSortStatAction" procedure="queryCheckSortStatProcedure"><public name="strDeptID" type="String"/>
<public name="strDate" type="String"/>
</action>
<action name="queryOA_ParticipateAttendancePersonAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_ParticipateAttendancePerson"/>
<private name="select" type="String" value="OA_ParticipateAttendancePerson.*"/>
<private name="from" type="String" value="OA_ParticipateAttendancePerson OA_ParticipateAttendancePerson"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_ParticipateAttendancePerson"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_ParticipateAttendancePersonAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_ParticipateAttendancePerson"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_ParticipateAttendancePersonAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_ParticipateAttendancePerson"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryOA_AttendanceWifiAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_AttendanceWifi"/>
<private name="select" type="String" value="OA_AttendanceWifi.*"/>
<private name="from" type="String" value="OA_AttendanceWifi OA_AttendanceWifi"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_AttendanceWifi"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_AttendanceWifiAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_AttendanceWifi"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_AttendanceWifiAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_AttendanceWifi"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>





<action global="false" name="queryStartEndTimeAction" procedure="queryStartEndTimeProcedure"/>






<action name="queryOA_AdvancedSettingAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_AdvancedSetting"/>
<private name="select" type="String" value="OA_AdvancedSetting.*"/>
<private name="from" type="String" value="OA_AdvancedSetting OA_AdvancedSetting"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_AdvancedSetting"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_AdvancedSettingAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_AdvancedSetting"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_AdvancedSettingAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_AdvancedSetting"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action global="false" name="queryGoWorkTimeAction" procedure="queryGoWorkTimeProcedure"/>
<action global="false" name="queryRankLateAction" procedure="queryRankLateProcedure"/>
<action global="false" name="queryRankAbsenAction" procedure="queryRankAbsenProcedure"/>

<action global="false" name="deleteAttendanceAction" procedure="deleteAttendanceProcedure"><public name="deleteAll" type="String"/>
</action>



<action name="queryOA_AttendanceMapAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_AttendanceMap"/>
<private name="select" type="String" value="OA_AttendanceMap.*"/>
<private name="from" type="String" value="OA_AttendanceMap OA_AttendanceMap"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_AttendanceMap"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_AttendanceMapAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_AttendanceMap"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_AttendanceMapAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_AttendanceMap"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryOA_AttendanceAdminAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_AttendanceAdmin"/>
<private name="select" type="String" value="OA_AttendanceAdmin.*"/>
<private name="from" type="String" value="OA_AttendanceAdmin OA_AttendanceAdmin"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_AttendanceAdmin"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_AttendanceAdminAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_AttendanceAdmin"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_AttendanceAdminAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_AttendanceAdmin"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action global="false" name="queryAttendanceTimeAction" procedure="queryAttendanceTimeProcedure"><public name="rowID" type="String"/>
</action>
<action global="false" name="queryGoWorkTimeAction" procedure="queryGoWorkTimeProcedure"/>

<action global="false" name="queryRankLateAction" procedure="queryRankLateProcedure"><parameter name="strDate" type="String"/></action>
<action global="false" name="queryRankAbsenAction" procedure="queryRankAbsenProcedure"/>

<action global="false" name="deleteAttendanceAction" procedure="deleteAttendanceProcedure"><public name="deleteAll" type="String"/>
</action>
<action name="saveOA_LateAppealAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_LateAppeal"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_LateAppealAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_LateAppeal"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>

<action name="queryOA_LateAppealAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_LateAppeal"/>
<private name="select" type="String" value="OA_LateAppeal.*"/>
<private name="from" type="String" value="OA_LateAppeal OA_LateAppeal"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_LateAppeal"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>

<action global="false" name="queryRankLateAction" procedure="queryRankLateProcedure"><parameter name="strDate" type="String"/></action>
<action global="false" name="queryRankAbsenAction" procedure="queryRankAbsenProcedure"/>
<action global="false" name="queryOA_AttendanceGroupAction" procedure="queryOA_AttendanceGroupProcedure"><public type="String" name="personID"></public>
</action>
<action global="false" name="deleteAttendanceAction" procedure="deleteAttendanceProcedure"><public name="deleteAll" type="String"/>
</action>
<action global="false" name="queryPersonAction" procedure="queryPersonProcedure"><public name="person" type="String"/>
<public name="rowID" type="String"/>
</action>
















<action name="queryOA_AttendanceWeekAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_AttendanceWeek"/>
<private name="select" type="String" value="OA_AttendanceWeek.*"/>
<private name="from" type="String" value="OA_AttendanceWeek OA_AttendanceWeek"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_AttendanceWeek"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_AttendanceWeekAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_AttendanceWeek"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_AttendanceWeekAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_AttendanceWeek"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryOA_AttendanceTimeAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_AttendanceTime"/>
<private name="select" type="String" value="OA_AttendanceTime.*"/>
<private name="from" type="String" value="OA_AttendanceTime OA_AttendanceTime"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_AttendanceTime"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_AttendanceTimeAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_AttendanceTime"/>
<private name="dataModel" type="String" value="/OA/attendance/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_AttendanceTimeAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_AttendanceTime"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
</model>