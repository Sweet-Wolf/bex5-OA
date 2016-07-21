<?xml version="1.0" encoding="utf-8"?>
<model xmlns="http://www.justep.com/model">
	<procedure name="getBizConfigProcedure" 
		code-model="/OA/common/logic/code"
		code="com.justep.oa.ConfigUtils.getBizConfig">
		<parameter name="fileFullName" type="String" />
	</procedure>
	<action name="getBizConfigAction" global="TRUE"
		procedure="getBizConfigProcedure">
		<public name="fileFullName" type="String" />
	</action>
</model>
