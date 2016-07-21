<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<action name="queryPersonInfoAction" global="false" procedure="queryPersonInfoProcedure">
<private name="concept" type="String"></private>
<public name="idColumn" type="String" value="SA_OPPerson"></public>
<private name="select" type="String" value="SA_OPPerson.*,mainOrg.sName as mainOrgName,mainOrg.sFID as mainOrgFID,mainOrg.sFName as mainOrgFName,mainOrg.sSequence as mainOrgSequence"></private>
<private name="from" type="String" value="SA_OPPerson SA_OPPerson  optional  join SA_OPOrg mainOrg on mainOrg = SA_OPPerson.sMainOrgID"></private>
<protected name="condition" type="String" value="SA_OPPerson = :currentPersonID()"></protected>
<permission name="range" type="List"></permission>
<public name="filter" type="String"></public>
<public name="distinct" type="Boolean" value="false"></public>
<public name="offset" type="Integer"></public>
<public name="limit" type="Integer"></public>
<public name="columns" type="String"></public>
<public name="orderBy" type="String" value="mainOrg.sSequence asc"></public>
<private name="aggregate" type="String"></private>
<public name="aggregateColumns" type="String"></public>
<public name="variables" type="Map"></public>
<private name="dataModel" type="String" value="/system/data"></private>
<private name="fnModel" type="String"></private>
</action>
<action name="queryPersonOrgAction" global="false" procedure="queryPersonOrgProcedure"><private name="concept" type="String"></private>
<public name="idColumn" type="String" value="SA_OPOrg"></public>
<private name="select" type="String" value="SA_OPOrg.*,SA_OPPerson as personID,SA_OPPerson.sName as personName,SA_OPPerson.sCode as personCode,SA_OPPerson.sNumb as personNumb,SA_OPPerson.sLoginName as personLoginName,SA_OPPerson.sPassword as personPassword,SA_OPPerson.sMainOrgID as personMainOrgID,SA_OPPerson.sIDCard as personIDCard,SA_OPPerson.sValidState as personValidState,SA_OPPerson.version as personVersion,SA_OPPerson.sSex as personSex,'' as ognName,'' as dptName,'' as posName,SA_OrgLevel.sName as levelName"></private>
<private name="from" type="String" value="SA_OPOrg SA_OPOrg  optional  join SA_OPPerson SA_OPPerson on SA_OPOrg.sPersonID = SA_OPPerson optional  join SA_OrgLevel SA_OrgLevel on SA_OPOrg.sLevel = SA_OrgLevel.sCode"></private>
<protected name="condition" type="String" value="SA_OPPerson  =  :currentPersonID()"></protected>
<permission name="range" type="List"></permission>
<public name="filter" type="String"></public>
<public name="distinct" type="Boolean" value="false"></public>
<public name="offset" type="Integer"></public>
<public name="limit" type="Integer"></public>
<public name="columns" type="String"></public>
<public name="orderBy" type="String" value="SA_OPOrg.sSequence asc"></public>
<private name="aggregate" type="String"></private>
<public name="aggregateColumns" type="String"></public>
<public name="variables" type="Map"></public>
<private name="dataModel" type="String" value="/system/data"></private>
<private name="fnModel" type="String"></private>
</action>
</model>