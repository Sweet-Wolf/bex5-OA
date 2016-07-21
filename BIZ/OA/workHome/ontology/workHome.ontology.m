<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<concept name="OA_WorkFavorite" default-value-expr="guid()"><has-relation relation="version" default-value-expr="0"><label language="zh_CN">版本</label>
</has-relation>
<label language="zh_CN">工作收藏</label>
<has-relation relation="fPresonID" data-type="String" default-value-expr="currentPersonID()"></has-relation><has-relation relation="fLabel" data-type="String"><label language="zh_CN">名称</label>
</has-relation><has-relation relation="fProcess" data-type="String"></has-relation><has-relation relation="fActitvty" data-type="String"></has-relation><has-relation relation="fUrl" data-type="String"></has-relation><has-relation relation="fIcon" data-type="String" default-value-expr="'icon-social-linkedin'"></has-relation><has-relation relation="fColor" data-type="String" default-value-expr="'#00B987'"></has-relation><has-relation relation="fDevicesType" data-type="String" default-value-expr="'m'"></has-relation>







</concept>
<relation name="fProcess" data-type="String"><label language="zh_CN">流程</label>
</relation>
<relation name="fActitvty" data-type="String"><label language="zh_CN">环节</label>
</relation>
<relation name="fUrl" data-type="String"><label language="zh_CN">地址</label>
</relation>
<relation name="fPresonID" data-type="String"><label language="zh_CN">人员ID</label>
</relation>
<relation name="fDevicesType" data-type="String"><label language="zh_CN">设备类型</label>
</relation>
<relation name="fLabel" data-type="String"><label language="zh_CN">功能名称</label>
</relation>
<relation name="fIcon" data-type="String"><label language="zh_CN">图标</label>
</relation>
<relation name="fColor" data-type="String"><label language="zh_CN">图标颜色</label>
</relation>
</model>