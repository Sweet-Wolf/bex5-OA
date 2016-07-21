<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model"><action name="queryNewConcept_1Action" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="newConcept_1"/>
<private name="select" type="String" value="newConcept_1.*"/>
<private name="from" type="String" value="newConcept_1 newConcept_1"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/ExaminationApproval/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="newConcept_1"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveNewConcept_1Action" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="newConcept_1"/>
<private name="dataModel" type="String" value="/OA/ExaminationApproval/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createNewConcept_1Action" procedure="bizCreateProcedure"><private name="concept" type="String" value="newConcept_1"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>




<action name="queryActivityExecutorPersonIDs" global="false" procedure="queryActivityExecutorPersonIDsProcedure"><public type="String" name="sheetId"></public>
<public type="String" name="activityName"></public>
<public type="String" name="step"></public>
</action>

<action name="queryAllPersonIDs" global="false" procedure="queryAllPersonIDsProcedure"></action>
</model>