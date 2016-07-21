<?xml version="1.0" encoding="UTF-8" standalone="no"?><model xmlns="http://www.justep.com/model">
<action global="false" name="queryWorksAction" procedure="queryWorksProcedure">
</action>




<action name="queryOA_WorkFavoriteAction" procedure="bizQueryProcedure"><permission name="range" type="List"/>
<private name="concept" type="String" value="OA_WorkFavorite"/>
<private name="select" type="String" value="OA_WorkFavorite.*"/>
<private name="from" type="String" value="OA_WorkFavorite OA_WorkFavorite"/>
<private name="aggregate" type="String"/>
<private name="dataModel" type="String" value="/OA/workHome/data"/>
<private name="fnModel" type="String"/>
<protected name="condition" type="String"/>
<public name="distinct" type="Boolean" value="false"/>
<public name="idColumn" type="String" value="OA_WorkFavorite"/>
<public name="filter" type="String"/>
<public name="limit" type="Integer"/>
<public name="offset" type="Integer"/>
<public name="columns" type="String"/>
<public name="orderBy" type="String"/>
<public name="aggregateColumns" type="String"/>
<public name="variables" type="Map"/>
</action>
<action name="saveOA_WorkFavoriteAction" procedure="bizSaveProcedure"><permission name="insertRange" type="List"/>
<permission name="deleteRange" type="List"/>
<permission name="updateRange" type="List"/>
<private name="concept" type="String" value="OA_WorkFavorite"/>
<private name="dataModel" type="String" value="/OA/workHome/data"/>
<private name="fnModel" type="String"/>
<protected name="readOnly" type="String"/>
<protected name="notNull" type="String"/>
<public name="table" required="true" type="Table"/>
</action>
<action name="createOA_WorkFavoriteAction" procedure="bizCreateProcedure"><private name="concept" type="String" value="OA_WorkFavorite"/>
<private name="fnModel" type="String"/>
<public name="table" required="true" type="Table"/>
<public name="defaultValues" type="Map"/>
</action>
</model>