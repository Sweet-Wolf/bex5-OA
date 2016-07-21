<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="OA_WorkDaily" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">工作日报</label>
<has-relation relation="fPersonID" data-type="String" size="36" default-value-expr="currentPersonID()"></has-relation>
<has-relation relation="fPersonName" data-type="String" size="64" default-value-expr="currentPersonName()"></has-relation>
<has-relation relation="fDeptID" data-type="String" size="36" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"></has-relation>
<has-relation relation="fDeptName" data-type="String" size="64" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"></has-relation>
<has-relation relation="fCreateTime" data-type="DateTime" default-value-expr="currentDateTime()"></has-relation>
<has-relation relation="fDate" data-type="Date" default-value-expr="currentDate()"></has-relation>
<has-relation relation="fFinishWork" data-type="String" size="1024"></has-relation>
<has-relation relation="fWorkPlan" data-type="String" size="1024"></has-relation>
<has-relation relation="fNeedHelp" data-type="String" size="1024"></has-relation>
<has-relation relation="fRemark" data-type="String" size="1024"></has-relation>
<has-relation relation="fImgURL" data-type="String" size="1024"></has-relation>
<has-relation relation="fReleaseScope" data-type="String" size="1024"></has-relation>

</concept>
<relation name="fPersonID" data-type="String"><label language="zh_CN">填报人</label>
</relation>
<relation name="fPersonName" data-type="String"><label language="zh_CN">填报人名称</label>
</relation>
<relation name="fDeptID" data-type="String"><label language="zh_CN">填报部门</label>
</relation>
<relation name="fDeptName" data-type="String"><label language="zh_CN">填报部门名称</label>
</relation>
<relation name="fCreateTime" data-type="String"><label language="zh_CN">创建日期</label>
</relation>
<relation name="fDate" data-type="String"><label language="zh_CN">填报日期</label>
</relation>
<relation name="fFinishWork" data-type="String"><label language="zh_CN">今日完成工作</label>
</relation>
<relation name="fWorkPlan" data-type="String"><label language="zh_CN">明日工作计划</label>
</relation>
<relation name="fNeedHelp" data-type="String"><label language="zh_CN">需协调与帮助</label>
</relation>
<relation name="fRemark" data-type="String"><label language="zh_CN">备注</label>
</relation>
<relation name="fImgURL" data-type="String"><label language="zh_CN">图片路径</label>
</relation>
<relation name="fReleaseScope" data-type="String"><label language="zh_CN">发布范围</label>
</relation>

<concept name="OA_WorkWeekly" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">工作周报</label>
<has-relation relation="fPersonID" size="36" default-value-expr="currentPersonID()"></has-relation>
<has-relation relation="fPersonName" size="64" default-value-expr="currentPersonName()"></has-relation>
<has-relation relation="fDeptID" size="36" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"></has-relation>
<has-relation relation="fDeptName" size="64" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"></has-relation>
<has-relation relation="fCreateTime" data-type="DateTime" default-value-expr="currentDateTime()"></has-relation>
<has-relation relation="fDate" default-value-expr="currentDate()" data-type="Date"></has-relation>
<has-relation relation="fFinishWork" size="1024"><label language="zh_CN">本周完成工作</label>
</has-relation>
<has-relation relation="fWorkPlan" size="1024"><label language="zh_CN">下周工作计划</label>
</has-relation>
<has-relation relation="fNeedHelp" size="1024"></has-relation>
<has-relation relation="fRemark" size="1024"></has-relation>
<has-relation relation="fImgURL" size="1024"></has-relation>
<has-relation relation="fReleaseScope" size="1024"></has-relation>
<has-relation relation="fWorkSummary" data-type="String" size="1024"></has-relation>
</concept>
<relation name="fWorkSummary" data-type="String"><label language="zh_CN">本周工作总结</label>
</relation>
<concept name="OA_Workmonthly" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">工作月报</label>
<has-relation relation="fPersonID" size="36" default-value-expr="currentPersonID()"></has-relation>
<has-relation relation="fPersonName" size="64" default-value-expr="currentPersonName()"></has-relation>
<has-relation relation="fDeptID" size="36" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"></has-relation>
<has-relation relation="fDeptName" size="64" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"></has-relation>
<has-relation relation="fCreateTime" data-type="DateTime" default-value-expr="currentDateTime()"></has-relation>
<has-relation relation="fDate" data-type="Date" default-value-expr="currentDate()"></has-relation>
<has-relation relation="fFinishWork" size="1024"><label language="zh_CN">本月完成工作</label>
</has-relation>
<has-relation relation="fWorkPlan" size="1024"><label language="zh_CN">下月工作计划</label>
</has-relation>
<has-relation relation="fNeedHelp" size="1024"></has-relation>
<has-relation relation="fRemark" size="1024"></has-relation>
<has-relation relation="fImgURL" size="1024"></has-relation>
<has-relation relation="fReleaseScope" size="1024"></has-relation>
<has-relation relation="fWorkSummary" size="1024"><label language="zh_CN">本月工作总结</label>
</has-relation>
</concept>
</model>