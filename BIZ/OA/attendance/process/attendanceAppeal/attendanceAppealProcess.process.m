<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<process name="attendanceAppealProcess" start="start1" end="end1">
		<label language="zh_CN">考勤申诉</label>
		<static-activity name="aLateAppealActivity">
			<label language="zh_CN">考勤申诉</label>
		<has-action action="queryOA_ChekInOutAction" access-permission="public"></has-action>
<has-action action="saveOA_LateAppealAction" access-permission="public"></has-action>
<has-action action="createOA_LateAppealAction" access-permission="public"></has-action>
<has-action action="queryOA_LateAppealAction" access-permission="public"></has-action>
</static-activity>
	<place name="start1"><label language="zh_CN">开始</label>
<has-token token="init"></has-token>
</place>
<token name="init"></token>
<business-activity name="LateAppealActivity" condition="true"><label language="zh_CN">考勤申诉</label>
<input name="x" unit="start1"></input>
<output name="x" unit="depLeadershipActivity"></output>

















</business-activity>
<business-activity name="depLeadershipActivity" condition="true"><label language="zh_CN">部门领导</label>
<input name="x" unit="LateAppealActivity"></input>
<output name="x" unit="xor1"></output>

<back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" then-flow-mode="flowToAgain"><to activity="LateAppealActivity"></to>
</back-rule>



<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity('', false)" default-expr=""></executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">'部门领导:考勤申诉'</item>
</task-relation-value>
</execute-rule>
</business-activity>
<place name="xor1"><label language="zh_CN">XOR</label>
</place>


<business-activity name="chargeLeadershipActivity" condition="true"><label language="zh_CN">分管领导</label>
<input name="x" unit="xor1"></input>
<output name="x" unit="personnelMattersActivity"></output>
<back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" then-flow-mode="flowToAgain"><to activity="LateAppealActivity"></to>
</back-rule>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity(currentDeptID(), true)" default-expr=""></executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">'分管领导:考勤申诉'</item>
</task-relation-value>
</execute-rule>
</business-activity>

<business-activity name="personnelMattersActivity" condition="true"><label language="zh_CN">人事</label>

<output name="x" unit="end1"></output>
<input name="x" unit="chargeLeadershipActivity"></input>
<input name="x" unit="xor1"></input>


<back-rule condition="true" dialog-enabled="true" save-enabled="false" ignore-execute-mode="true" back-range="specified" then-flow-mode="flowToAgain"><to activity="LateAppealActivity"></to>
</back-rule>

<advance-rule condition="true" dialog-enabled="false" save-enabled="false" jump-enabled="false" customized-enabled="false" ignore-execute-mode=" false " task-wait="false" task-join="false"></advance-rule>
<execute-rule condition="true" task-assign-mode="together"><executor-range range-expr="findOrgUnitsHasCActivity(currentDeptID(), true)" default-expr=""></executor-range>
<task-relation-value><item relation="sPreemptMode">'tpmOpen'</item>
<item relation="sExecuteMode">'temPreempt'</item>
<item relation="sName">'人事:考勤申诉'</item>
</task-relation-value>
</execute-rule>
</business-activity>
<place name="end1"><label language="zh_CN">结束</label>
</place>
<has-action action="queryOA_ChekInOutAction" access-permission="public"></has-action>
<has-action action="saveOA_LateAppealAction" access-permission="public"></has-action>
<has-action action="createOA_LateAppealAction" access-permission="public"></has-action>
<has-action action="queryOA_LateAppealAction" access-permission="public"></has-action>

</process>
</model>
