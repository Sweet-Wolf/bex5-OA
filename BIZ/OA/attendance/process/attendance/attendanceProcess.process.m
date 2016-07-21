<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="attendanceProcess">
		<label language="zh_CN">考勤打卡</label>
		<static-activity name="attendanceActivity">
			<label language="zh_CN">考勤打卡</label>
	
































<has-action action="queryStartEndTimeAction" access-permission="public"></has-action>
<has-action action="queryGoWorkTimeAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceGroupAction" access-permission="public"></has-action>
</static-activity>

<static-activity name="CountAttendanceActivity">
<has-action action="queryOA_ChekInOutAction" access-permission="public"></has-action>
<label language="zh_CN">个人考勤统计</label>
</static-activity>



<static-activity name="AttendanceTimeActivity"><label language="zh_CN">考勤时间</label>








<has-action action="queryOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="queryAttendanceTimeAction" access-permission="public"></has-action>
</static-activity>
<static-activity name="AddressChoiceActivity"><label language="zh_CN">位置选择</label>
</static-activity>
<static-activity name="SetAttendanceActivity"><label language="zh_CN">设置考勤规则</label>
















































































<has-action action="queryOA_AttendanceMapAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceMapAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceMapAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceWifiAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceWifiAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceWifiAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="queryAttendanceTimeAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceWeekAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceWeekAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceWeekAction" access-permission="public"></has-action>
</static-activity>
<static-activity name="AddWorkAddressActivity"><label language="zh_CN">添加办公地点</label>
</static-activity>
<static-activity name="SetAddrActivity"><label language="zh_CN">设置办公地点</label>
</static-activity>









<has-action action="queryOA_ChekInOutAction" access-permission="public"></has-action>
<has-action action="saveOA_ChekInOutAction" access-permission="public"></has-action>
<has-action action="createOA_ChekInOutAction" access-permission="public"></has-action>
<has-action action="queryCheckStatAction" access-permission="public"></has-action>
<has-action action="queryCheckStatDeptAction" access-permission="public"></has-action>
<has-action action="queryCheckSortStatAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceAdminAction" access-permission="public"></has-action>
<static-activity name="AttendanceManagerActivity">





<label language="zh_CN">考勤组管理</label>

















<has-action action="queryOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceGroupAction" access-permission="public"></has-action>
<has-action action="deleteAttendanceAction" access-permission="public"></has-action>
</static-activity>


<has-action action="queryOA_ChekInOutAction" access-permission="public"></has-action>
<has-action action="saveOA_ChekInOutAction" access-permission="public"></has-action>
<has-action action="createOA_ChekInOutAction" access-permission="public"></has-action>
<has-action action="queryCheckStatAction" access-permission="public"></has-action>
<has-action action="queryCheckStatDeptAction" access-permission="public"></has-action>
<has-action action="queryCheckSortStatAction" access-permission="public"></has-action>
<has-action action="queryStartEndTimeAction" access-permission="public"></has-action>
<static-activity name="AttendanceWeekActivity"><label language="zh_CN">考勤星期</label>





















<has-action action="queryOA_AttendanceWeekAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceWeekAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceWeekAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="queryOA_AdvancedSettingAction" access-permission="public"></has-action>
<has-action action="saveOA_AdvancedSettingAction" access-permission="public"></has-action>
<has-action action="createOA_AdvancedSettingAction" access-permission="public"></has-action>
<has-action action="queryAttendanceTimeAction" access-permission="public"></has-action>
</static-activity>
<static-activity name="settingActivity"><label language="zh_CN">高级设置</label>
<has-action action="queryOA_AdvancedSettingAction" access-permission="public"></has-action>
<has-action action="saveOA_AdvancedSettingAction" access-permission="public"></has-action>
<has-action action="createOA_AdvancedSettingAction" access-permission="public"></has-action>
</static-activity>
<static-activity name="rankListActivity"><label language="zh_CN">考勤排行榜</label>
<has-action action="queryRankLateAction" access-permission="public"></has-action>
<has-action action="queryRankAbsenAction" access-permission="public"></has-action>
</static-activity>

<static-activity name="SetAttendancePeopleActivity"><label language="zh_CN">设置考勤人员</label>










<has-action action="queryOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="queryPersonAction" access-permission="public"></has-action>
</static-activity>

<static-activity name="departAActivity"><label language="zh_CN">修改班次</label>
<has-action action="queryOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceTimeAction" access-permission="public"></has-action>
</static-activity>
<static-activity name="departBActivity"><label language="zh_CN">新增班次</label>
<has-action action="queryOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceTimeAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceTimeAction" access-permission="public"></has-action>
</static-activity>
<static-activity name="newAttendanceActivity"><label language="zh_CN">新增考勤组</label>









































<has-action action="queryOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceAdminAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceMapAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceMapAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceMapAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceWeekAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceWeekAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceWeekAction" access-permission="public"></has-action>
<has-action action="queryPersonAction" access-permission="public"></has-action>
<has-action action="queryOA_AttendanceWifiAction" access-permission="public"></has-action>
<has-action action="saveOA_AttendanceWifiAction" access-permission="public"></has-action>
<has-action action="createOA_AttendanceWifiAction" access-permission="public"></has-action>
</static-activity>


</process>
</model>
