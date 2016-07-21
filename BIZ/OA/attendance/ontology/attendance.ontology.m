<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="OA_ChekInOut" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">考勤打卡</label>

<has-relation relation="fPersonID" data-type="String" default-value-expr="currentPersonID()"></has-relation>
<has-relation relation="fPersonName" data-type="String" default-value-expr="currentPersonName()"></has-relation>
<has-relation relation="fOrgID" data-type="String" default-value-expr="currentOgnID()"></has-relation>
<has-relation relation="fOrgName" data-type="String" default-value-expr="currentOgnName()"></has-relation>
<has-relation relation="fDeptID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"></has-relation>
<has-relation relation="fDeptName" data-type="String" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"></has-relation><has-relation relation="fCheckInAM" data-type="DateTime"></has-relation>




<has-relation relation="fCheckOutAM" data-type="DateTime"></has-relation><has-relation relation="fCheckInPM" data-type="DateTime"></has-relation><has-relation relation="fCheckOutPM" data-type="DateTime"></has-relation><has-relation relation="fIsLate" data-type="String"></has-relation>

<has-relation relation="fIsLateRemark" data-type="String" size="1024"></has-relation>
<has-relation relation="fIsLeaving" data-type="String"></has-relation>
<has-relation relation="fIsLeavingRemark" data-type="String" size="1024"></has-relation>
<has-relation relation="fAbsenteeism" data-type="String"></has-relation>

<has-relation relation="fLateImg" data-type="String" size="1024"></has-relation>
<has-relation relation="fLeavingImg" data-type="String" size="1024"></has-relation>




<has-relation relation="fCheckAreaAM" data-type="String"></has-relation>
<has-relation relation="fCheckAreaPM" data-type="String"></has-relation>
<has-relation relation="fCheckSite"></has-relation>
</concept>
<relation name="fID" data-type="String"><label language="zh_CN">ID</label>
</relation>
<relation name="fPersonID" data-type="String"><label language="zh_CN">考勤人ID</label>
</relation>
<relation name="fPersonName" data-type="String"><label language="zh_CN">考勤人名称</label>
</relation>
<relation name="fOrgID" data-type="String"><label language="zh_CN">考勤组织ID</label>
</relation>
<relation name="fOrgName" data-type="String"><label language="zh_CN">考勤组织名称</label>
</relation>
<relation name="fDeptID" data-type="String"><label language="zh_CN">考勤部门ID</label>
</relation>
<relation name="fDeptName" data-type="String"><label language="zh_CN">考勤部门名称</label>
</relation>




<relation name="fIsLate" data-type="String"><label language="zh_CN">是否迟到</label>
</relation>


<relation name="fIsLateRemark" data-type="String"><label language="zh_CN">迟到备注</label>
</relation>
<relation name="fIsLeaving" data-type="String"><label language="zh_CN">是否早退</label>
</relation>
<relation name="fIsLeavingRemark" data-type="String"><label language="zh_CN">早退备注</label>
</relation>
<relation name="fAbsenteeism" data-type="String"><label language="zh_CN">是否旷工</label>
</relation>

<relation name="fLateImg" data-type="String"><label language="zh_CN">迟到图片</label>
</relation>
<relation name="fLeavingImg" data-type="String"><label language="zh_CN">早退图片</label>
</relation>
<relation name="fCheckOutAM" data-type="DateTime"><label language="zh_CN">签退时间AM</label>
</relation>
<relation name="fCheckInPM" data-type="DateTime"><label language="zh_CN">签到时间PM</label>
</relation>
<relation name="fCheckInAM" data-type="DateTime"><label language="zh_CN">签到时间AM</label>
</relation>
<relation name="fCheckOutPM" data-type="DateTime"><label language="zh_CN">签退时间PM</label>
</relation>
<relation name="fCheckAreaAM" data-type="String"><label language="zh_CN">早签到地点</label>
</relation>
<relation name="fCheckAreaPM" data-type="String"><label language="zh_CN">晚签退地点</label>
</relation>
<concept name="OA_AttendanceSet" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">考勤设置</label>
<has-relation relation="fOrgID" default-value-expr="currentOgnID()"></has-relation>
<has-relation relation="fOrgName" default-value-expr="currentOgnName()"></has-relation>
<has-relation relation="fDeptID" default-value-expr="currentDeptID()"></has-relation>
<has-relation relation="fDeptName" default-value-expr="currentDeptName()"></has-relation>




<has-relation relation="checkInAMtime" data-type="String" default-value-expr="'09:00'"></has-relation>
<has-relation relation="checkOutAMtime" data-type="String" default-value-expr="'12:00'"></has-relation>
<has-relation relation="checkInPMtime" data-type="String" default-value-expr="'13:00'"></has-relation>
<has-relation relation="checkOutPMtime" data-type="String" default-value-expr="'18:00'"></has-relation>
<has-relation relation="fCheckSite" data-type="String"></has-relation>
</concept>
<relation name="checkInAMtime" data-type="String"><label language="zh_CN">签到时间AM</label>
</relation>
<relation name="checkOutAMtime" data-type="String"><label language="zh_CN">签退时间AM</label>
</relation>
<relation name="checkInPMtime" data-type="String"><label language="zh_CN">签到时间PM</label>
</relation>
<relation name="checkOutPMtime" data-type="String"><label language="zh_CN">签退时间PM</label>
</relation>
<relation name="fCheckSite" data-type="String"><label language="zh_CN">考勤地点</label>
</relation>
<concept name="OA_AttendanceAdmin" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">考勤管理</label>

<has-relation relation="fPersonID" default-value-expr="currentPersonID()"></has-relation>
<has-relation relation="fPersonName" default-value-expr="currentPersonName()"></has-relation>
<has-relation relation="fOrgID" default-value-expr="currentOgnID()"></has-relation>
<has-relation relation="fOrgName" default-value-expr="currentOgnName()"></has-relation>
<has-relation relation="fDeptID" default-value-expr="currentDeptID()"></has-relation>
<has-relation relation="fDeptName" default-value-expr="currentDeptName()"></has-relation>



<has-relation relation="fAttendanceClass" data-type="String"><label language="zh_CN">考勤班制</label>
</has-relation>
<has-relation relation="fAttendanceGroupName" data-type="String"></has-relation>
<has-relation relation="fAttendanceTeamManager" data-type="String" size="1024"></has-relation>
<has-relation relation="fAttendanceTeamManagerID" data-type="String" size="1024"></has-relation>
<has-relation relation="fCreateTime" data-type="DateTime" default-value-expr="currentDateTime()"></has-relation>
<has-relation relation="fUpdataTime" data-type="DateTime" default-value-expr="currentDateTime()"></has-relation>
<has-relation relation="fAttendancePersonName" size="1024"></has-relation>
<has-relation relation="fAttendancePersonID" data-type="String" size="1024"></has-relation>
<has-relation relation="fEffectiveRange"></has-relation>
</concept>
<relation name="fAttendanceName" data-type="String"><label language="zh_CN">考勤组名称</label>
</relation>
<relation name="fAttendancePersonName" data-type="String"><label language="zh_CN">参与考勤人员</label>
</relation>
<relation name="fAttendanceCharge" data-type="String"><label language="zh_CN">考勤负责人</label>
</relation>
<relation name="fAttendanceClass" data-type="String"><label language="zh_CN">考勤类型</label>
</relation>


<concept name="OA_ParticipateAttendancePerson" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">参与考勤人员</label>

<has-relation relation="fAttendanceAdminID"></has-relation><has-relation relation="fPersonID"><label language="zh_CN">参与考勤人员ID</label>
</has-relation>
<has-relation relation="fPersonName"><label language="zh_CN">参与考勤人员</label>
</has-relation>


</concept>
<relation name="fSID" data-type="String"><label language="zh_CN">主表ID</label>
</relation>
<relation name="fIsCharge" data-type="String"><label language="zh_CN">是否为负责人</label>
</relation>
<concept name="OA_AttendanceWifi" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation><has-relation relation="fAttendanceAdminID"></has-relation>
<label language="zh_CN">WIFI定位</label>

<has-relation relation="fWifiName" data-type="String"></has-relation>
<has-relation relation="fMacAddress" data-type="String"></has-relation>

</concept>
<relation name="fWifiName" data-type="String"><label language="zh_CN">WIFI名称</label>
</relation>
<relation name="fMacAddress" data-type="String"><label language="zh_CN">MAC地址</label>
</relation>
<concept name="OA_AttendanceMap" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">地图定位</label>

<has-relation relation="fAttendanceAdminID"></has-relation><has-relation relation="fLongitude" data-type="String"></has-relation>
<has-relation relation="fLatitude" data-type="String"></has-relation>
<has-relation relation="fAddressDetail" data-type="String"></has-relation>


<has-relation relation="fAttenAddrName" data-type="String"></has-relation>
</concept>
<relation name="fLongitude" data-type="String"><label language="zh_CN">经度</label>
</relation>
<relation name="fLatitude" data-type="String"><label language="zh_CN">纬度</label>
</relation>
<relation name="fAddressDetail" data-type="String"><label language="zh_CN">地址信息</label>
</relation>
<relation name="fEffectiveRange" data-type="String"><label language="zh_CN">有效范围</label>
</relation>

<relation name="fBanci" data-type="String"><label language="zh_CN">班次</label>
</relation>
<relation name="fAttendanceTime" data-type="String"><label language="zh_CN">考勤时间段</label>
</relation>
<relation name="fDeparting" data-type="String"><label language="zh_CN">班次</label>
</relation>
<relation name="fStartAM" data-type="String"><label language="zh_CN">上午上班时间</label>
</relation>
<relation name="fEndAM" data-type="String"><label language="zh_CN">上午下班时间</label>
</relation>
<relation name="fStartPM" data-type="String"><label language="zh_CN">下午上班时间</label>
</relation>
<relation name="fEndPM" data-type="String"><label language="zh_CN">下午下班时间</label>
</relation>
<relation name="fAttendanceAdminID" data-type="String"><label language="zh_CN">考勤管理ID</label>
</relation>
<relation name="fAttendanceGroupName" data-type="String"><label language="zh_CN">考勤组名称</label>
</relation>
<concept name="OA_AttendanceTime" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">考勤时间设置</label>
<has-relation relation="fAttendanceAdminID"></has-relation>
<has-relation relation="fDepart" data-type="String" default-value-expr="'A'"></has-relation>
<has-relation relation="fStartAM" default-value-expr="'09:00:00'"><label language="zh_CN">上班</label>
</has-relation>
<has-relation relation="fEndAM" default-value-expr="'18:00:00'"><label language="zh_CN">下班</label>
</has-relation><has-relation relation="fStartPM"></has-relation>

<has-relation relation="fEndPM"></has-relation>

<has-relation relation="fTime" data-type="String" default-value-expr="'时段1'"></has-relation>
<has-relation relation="fOrgID" default-value-expr="currentOgnID()"></has-relation>
<has-relation relation="fOrgName" default-value-expr="currentOrgName()"></has-relation>

</concept>
<relation name="fDepart" data-type="String"><label language="zh_CN">班次</label>
</relation>
<relation name="fAttendanceTeamManager" data-type="String"><label language="zh_CN">考勤组负责人</label>
</relation>
<relation name="fAttendanceTeamManagerID" data-type="String"><label language="zh_CN">考勤组负责人ID</label>
</relation>
<concept name="OA_AttendanceWeek" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">考勤星期设置</label>
<has-relation relation="fAttendanceAdminID"></has-relation>
<has-relation relation="fDepartID" data-type="String"></has-relation>
<has-relation relation="fMonday" data-type="String" default-value-expr="'true'"><label language="zh_CN">每周一</label>
</has-relation>
<has-relation relation="fTuesday" data-type="String" default-value-expr="'true'"></has-relation>
<has-relation relation="fWednesday" data-type="String" default-value-expr="'true'"></has-relation>
<has-relation relation="fThursday" data-type="String" default-value-expr="'true'"></has-relation>
<has-relation relation="fFriday" data-type="String" default-value-expr="'true'"></has-relation>
<has-relation relation="fSaturday" data-type="String" default-value-expr="'false'"></has-relation>
<has-relation relation="fSunday" data-type="String" default-value-expr="'false'"></has-relation>
<has-relation relation="fDepart" default-value-expr="'A'"></has-relation>
<has-relation relation="fDepartTime" data-type="String" default-value-expr="'09:00-18:00'"></has-relation>
</concept>
<relation name="fDepartID" data-type="String"><label language="zh_CN">考勤班次设置ID</label>
</relation>
<relation name="fMonday" data-type="String"><label language="zh_CN">星期一</label>
</relation>
<relation name="fTuesday" data-type="String"><label language="zh_CN">每周二</label>
</relation>
<relation name="fWednesday" data-type="String"><label language="zh_CN">每周三</label>
</relation>
<relation name="fThursday" data-type="String"><label language="zh_CN">每周四</label>
</relation>
<relation name="fFriday" data-type="String"><label language="zh_CN">每周五</label>
</relation>
<relation name="fSaturday" data-type="String"><label language="zh_CN">每周六</label>
</relation>
<relation name="fSunday" data-type="String"><label language="zh_CN">每周日</label>
</relation>
<relation name="fCreateTime" data-type="DateTime"><label language="zh_CN">创建时间</label>
</relation>
<relation name="fUpdataTime" data-type="DateTime"><label language="zh_CN">修改时间</label>
</relation>
<relation name="fAttenAddrName" data-type="String"><label language="zh_CN">考勤地点名称</label>
</relation>


<relation name="fGoWorkTime" data-type="String"><label language="zh_CN">上班弹性时间</label>
</relation>
<relation name="fLateTime" data-type="String"><label language="zh_CN">迟到考核</label>
</relation>
<relation name="fAbsentTime" data-type="String"><label language="zh_CN">旷工考核</label>
</relation>
<relation name="fFirstEarlyTime" data-type="String"><label language="zh_CN">最早打卡时间</label>
</relation>
<concept name="OA_AdvancedSetting" default-value-expr="guid()">
	<has-relation relation="version" default-value-expr="0">
		<label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">高级设置</label>
<has-relation relation="fGoWorkTime" default-value-expr="'关闭'"></has-relation>
<has-relation relation="fLateTime" default-value-expr="'关闭'"></has-relation>
<has-relation relation="fAbsentTime" default-value-expr="'关闭'"></has-relation>
<has-relation relation="fFirstEarlyTime" default-value-expr="'关闭'"></has-relation>
<has-relation relation="fOgnID" data-type="String"></has-relation>
<has-relation relation="fOgnName" data-type="String"></has-relation>
<has-relation relation="fCreatepreID" data-type="String"></has-relation>
<has-relation relation="fCreatepreName" data-type="String"></has-relation>
</concept>
<relation name="fOgnID" data-type="String"><label language="zh_CN">组织ID</label>
</relation>
<relation name="fOgnName" data-type="String"><label language="zh_CN">组织名称</label>
</relation>
<relation name="fCreatepreID" data-type="String"><label language="zh_CN">创建人ID</label>
</relation>
<relation name="fCreatepreName" data-type="String"><label language="zh_CN">创建人名称</label>
</relation>
<relation name="fAttendancePersonID" data-type="String"><label language="zh_CN">参与考勤人员ID</label>
</relation>
<concept name="OA_LateAppeal" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">迟到早退申诉</label>
<has-relation relation="fApplicantID" data-type="String"></has-relation>
<has-relation relation="fApplicantName" data-type="String"></has-relation>
<has-relation relation="fApplicantTime" data-type="DateTime"></has-relation>
<has-relation relation="fAppealContent" data-type="String"></has-relation>
<has-relation relation="fAppealResult" data-type="String"></has-relation>
<has-relation relation="fAppealWay" data-type="String"></has-relation>
</concept>
<relation name="fApplicantID" data-type="String"><label language="zh_CN">申请人ID</label>
</relation>
<relation name="fApplicantName" data-type="String"><label language="zh_CN">申请人名称</label>
</relation>
<relation name="fApplicantTime" data-type="DateTime"><label language="zh_CN">申请时间</label>
</relation>
<relation name="fAppealContent" data-type="String"><label language="zh_CN">申诉内容</label>
</relation>
<relation name="fAppealResult" data-type="String"><label language="zh_CN">申诉结果</label>
</relation>
<relation name="fAppealWay" data-type="String"><label language="zh_CN">申诉方式</label>
</relation>
<relation name="fFDepartID" data-type="String"><label language="zh_CN">考勤班次ID</label>
</relation>
<relation name="fTime" data-type="String"><label language="zh_CN">时段</label>
</relation>
<relation name="isChecked" data-type="String"><label language="zh_CN">是否选中</label>
</relation>
<relation name="fDepartTime" data-type="String"><label language="zh_CN">班次时间</label>
</relation>
</model>