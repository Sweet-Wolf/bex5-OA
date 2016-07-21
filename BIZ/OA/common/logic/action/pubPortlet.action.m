<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
	<action name="getRoleTypeAction" global="TRUE"
		procedure="getRoleTypeActionProcedure">
		<public name="fOrgFID" type="String"/>
	</action>
	<procedure name="getRoleTypeActionProcedure" 
		code-model="/OA/common/logic/code"
		code="Portlet.getRoleType">
		<parameter name="fOrgFID" type="String"/>
	</procedure>
	
	<action name="getAllDeptUnderOrgAction" global="TRUE"
		procedure="getAllDeptUnderOrgProcedure">
	</action>
	<procedure name="getAllDeptUnderOrgProcedure" 
		code-model="/OA/common/logic/code"
		code="Portlet.getAllDeptUnderOrg">
	</procedure>
<action name="querylistDataExAction" global="false" procedure="querylistDataExProcedure"><label language="zh_CN">获取列表数据</label>
<public type="String" name="type"></public>
<public type="String" name="tableName"></public>
<public type="String" name="sProcess"></public>
<public type="String" name="notInActivities"></public>
<public type="String" name="DataModel"></public>
</action>
</model>