<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <action name="assetSummaryMainAction" global="false" procedure="assetSummaryMainProcedure"> 
    <public name="beginDate" type="String"/>  
    <public name="endDate" type="String"/>  
    <public name="dayNum" type="String"/>  
    <public name="orgIDs" type="String"/> 
  </action>  
  <action name="assetSummaryDetailAction" global="false" procedure="assetSummaryDetailProcedure"> 
    <public name="beginDate" type="String"/>  
    <public name="endDate" type="String"/>  
    <public name="orgIDs" type="String"/> 
  </action>  
  <action name="assetSummaryZTAction" global="false" procedure="assetSummaryZTProcedure"> 
    <public name="beginDate" type="String"/>  
    <public name="endDate" type="String"/>  
    <public name="dayNum" type="String"/>  
    <public name="orgIDs" type="String"/> 
  </action>  
  <action name="assetSummaryBTAction" global="false" procedure="assetSummaryBTProcedure"> 
    <public name="beginDate" type="String"/>  
    <public name="endDate" type="String"/>  
    <public name="orgIDs" type="String"/> 
  
</action> 

<action name="newReportAction" global="false" procedure="ksqlQueryProcedure" log-enabled="true"><private name="ksql" type="String" value="select OA_AS_Card.fKind as fKind,trim( SUM(OA_AS_Card.fRemainValue) / 10000 ) as fRemainValue from OA_AS_Card OA_AS_Card group by OA_AS_Card.fKind"></private>
<public name="variables" type="Map"></public>
<private name="dataModel" type="String" value="/OA/asset/data"></private>
<public name="fnModel" type="String"></public>



<public type="String" name="tempOrgID"></public>
</action>

</model>
