<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="OA_Sign" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">签到</label>
<has-relation relation="fPersonID" data-type="String" default-value-expr="currentPersonID()"></has-relation>
<has-relation relation="fPersonName" data-type="String" default-value-expr="currentPersonName()"></has-relation>

<has-relation relation="fOrgID" data-type="String" default-value-expr="currentOgnID()"><label language="zh_CN">签到组织</label>
</has-relation>
<has-relation relation="fOrgName" data-type="String" default-value-expr="currentOgnName()"></has-relation>
<has-relation relation="fDeptID" data-type="String" default-value-expr="if(currentDeptID() = null, currentOgnID(), currentDeptID())"></has-relation>
<has-relation relation="fDeptName" data-type="String" default-value-expr="if(currentDeptName() = null, currentOgnName(), currentDeptName())"></has-relation>
<has-relation relation="fSignTime" data-type="DateTime" default-value-expr="currentDateTime()"></has-relation>
<has-relation relation="fLongitude" data-type="String"></has-relation>
<has-relation relation="fDimension" data-type="String"></has-relation>
<has-relation relation="fSignAddress" data-type="String"></has-relation>
<has-relation relation="fRemark" data-type="String" size="1024"></has-relation>
<has-relation relation="fImgURL" data-type="String" size="1024"></has-relation>
</concept>
<relation name="fPersonID" data-type="String"><label language="zh_CN">签到人</label>
</relation>
<relation name="fPersonName" data-type="String"><label language="zh_CN">签到人名称</label>
</relation>

<relation name="fOrgID" data-type="String"><label language="zh_CN">组织ID</label>
</relation>
<relation name="fOrgName" data-type="String"><label language="zh_CN">组织名称</label>
</relation>
<relation name="fDeptID" data-type="String"><label language="zh_CN">签到部门</label>
</relation>
<relation name="fDeptName" data-type="String"><label language="zh_CN">部门名称</label>
</relation>
<relation name="fSignTime" data-type="String"><label language="zh_CN">签到时间</label>
</relation>
<relation name="fLongitude" data-type="String"><label language="zh_CN">经度</label>
</relation>
<relation name="fDimension" data-type="String"><label language="zh_CN">纬度</label>
</relation>
<relation name="fSignAddress" data-type="String"><label language="zh_CN">签到地址</label>
</relation>
<relation name="fRemark" data-type="String"><label language="zh_CN">备注</label>
</relation>
<relation name="fImgURL" data-type="String"><label language="zh_CN">图片</label>
</relation>
</model>