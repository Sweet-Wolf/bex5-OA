<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="mobileReadDocQueryProcess">
		<label language="zh_CN">待阅公文</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">待阅公文</label>
		</static-activity>
	














<has-action action="queryReadDocAction" access-permission="public"></has-action>
<has-action action="queryTaskAction" access-permission="public"></has-action>
<has-action action="queryOA_DC_ReaderOpinionAction" access-permission="public"></has-action>
<has-action action="setReaderOpinionToTaskAction" access-permission="public"></has-action>
<has-action action="recordReadedAction" access-permission="public"></has-action>
<has-action action="mobileReadDocPortalAction" access-permission="public"></has-action>
</process>
</model>
