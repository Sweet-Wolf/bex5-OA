<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model">


<action global="false" name="querySignCountAction" procedure="querySignCountProcedure"><public name="strDate" type="String"/>
</action>
<action name="queryOA_SignAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_Sign"/>
<private name="select" type="String" value="OA_Sign.*"/>
<private name="from" type="String" value="OA_Sign OA_Sign"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/sign/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_Sign"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_SignAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_Sign"/>
<private name="dataModel" type="String" value="/OA/sign/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_SignAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_Sign"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
<action name="queryDeptLatestSignAction" global="false" procedure="queryDeptLatestSignProcedure"><public type="String" name="strDate"></public>
</action>


<action name="queryDeptNotSignAction" global="false" procedure="queryDeptNotSignProcedure"><public type="String" name="strDate"></public>
</action>
</model>