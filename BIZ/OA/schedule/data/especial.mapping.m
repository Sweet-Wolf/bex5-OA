<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">
<store name="OA_SD_ScheduleEsp"></store>


<store name="OA_v_especialSchedule"/>
<store name="OA_SD_especialSchedulePerson"/><mapping concept="OA_SD_especialSchedulePerson"><table name="OA_SD_especialSchedulePerson" type="owner-table"><key field="fID" type="String"/>
<item field="version" relation="version"/>
<item field="fExecutorID" relation="fExecutorID"/>
<item field="fExecutorName" relation="fExecutorName"/>
<item field="fOrderNum" relation="fOrderNum"/>
</table>
</mapping>
<mapping concept="OA_v_especialSchedule"><table name="OA_v_especialSchedule" type="owner-table"><key field="fID" type="String"/>
<item field="version" relation="version"/>
<item field="fScheduleID" relation="fScheduleID"/>
<item field="fTitle" relation="fTitle"/>
<item field="fExecutorName" relation="fExecutorName"/>
<item field="fExecutorID" relation="fExecutorID"/>
<item field="fContent" relation="fContent"/>
<item field="fEndDatePart" relation="fEndDatePart"/>
<item field="fEndTime" relation="fEndTime"/>
<item field="fDate" relation="fDate"/>
</table>
</mapping>

<mapping concept="OA_SD_ScheduleEsp"><table name="OA_SD_ScheduleEsp" type="owner-table"><key field="fID" type="String"></key>
</table>
</mapping>
</model>