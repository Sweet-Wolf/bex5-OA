<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="signProcess">
		<label language="zh_CN">签到</label>
		<static-activity name="mainActivity">
			<label language="zh_CN">签到</label>
		</static-activity>
	





<static-activity name="statisticsPerSignActivity"><label language="zh_CN">统计个人签到</label>
</static-activity>
<static-activity name="statisticsActivity"><label language="zh_CN">统计</label>
</static-activity>



<static-activity name="groupSignActivity"><label language="zh_CN">团队签到信息</label>




<has-action action="queryDeptLatestSignAction" access-permission="public"></has-action>
<has-action action="queryOA_SignAction" access-permission="public"></has-action>
</static-activity>


































<has-action action="queryOA_SignAction" access-permission="public"></has-action>
<has-action action="saveOA_SignAction" access-permission="public"></has-action>
<has-action action="createOA_SignAction" access-permission="public"></has-action>
<has-action action="queryDeptLatestSignAction" access-permission="public"></has-action>
<has-action action="queryDeptNotSignAction" access-permission="public"></has-action>
<has-action action="querySignCountAction" access-permission="public"></has-action>
<static-activity name="signDetailActivity"></static-activity>
<static-activity name="signMapActivity"></static-activity>

</process>
</model>
