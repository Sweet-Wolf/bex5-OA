<?xml version="1.0" encoding="utf-8" standalone="no"?><model xmlns="http://www.justep.com/model">  
  <action global="true" name="queryCommonWordsAction" procedure="bizQueryProcedure"> 
    <private name="concept" type="String" value="AP_CommonWords"/>  
    <private name="select" type="String" value="AP_CommonWords.*"/>  
    <private name="from" type="String" value="AP_CommonWords AP_CommonWords"/>  
    <private name="aggregate" type="String"/>  
    <private name="dataModel" type="String" value="/OA/common/data"/>  
    <private name="fnModel" type="String"/>  
    <protected name="condition" type="String" value="AP_CommonWords.fPersonID = :currentPersonID()"/>  
    <permission name="range" type="List"/>  
    <public name="distinct" type="Boolean" value="false"/>  
    <public name="idColumn" type="String" value="AP_CommonWords"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>  
    <public name="offset" type="Integer"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String" value="AP_CommonWords.fCommonWords"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/> 
  </action>  
  <action global="true" name="saveCommonWordsAction" procedure="bizSaveProcedure"> 
    <permission name="insertRange" type="List"/>
    <permission name="deleteRange" type="List"/>
    <permission name="updateRange" type="List"/>
    <private name="fnModel" type="String" value="/system/logic/fn"/>  
    <private name="concept" type="String" value="AP_CommonWords"/>  
    <public name="table" type="Object"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <private name="dataModel" type="String" value="/OA/common/data"/> 
  </action>  
  <action global="true" name="createCommonWordsAction" procedure="bizCreateProcedure"> 
    <private name="concept" type="String" value="AP_CommonWords"/>  
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String"/> 
  </action> 
</model>