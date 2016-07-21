<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="mobileDocDealProcess">
		<label language="zh_CN">公文处理</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">公文处理</label>
		</static-activity>
	



<has-action action="queryTaskCenterAction" access-permission="public"></has-action>
<has-action action="queryOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="saveOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="mobileDocDealPortalAction" access-permission="public"></has-action>
</process>
</model>
