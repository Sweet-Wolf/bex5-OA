<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryOA_SignProcedure" code-model="/OA/sign/logic/code" code="Sign.queryOA_Sign"> 
    <parameter name="range" type="List"/>  
    <parameter name="concept" type="String"/>  
    <parameter name="select" type="String"/>  
    <parameter name="from" type="String"/>  
    <parameter name="aggregate" type="String"/>  
    <parameter name="dataModel" type="String"/>  
    <parameter name="fnModel" type="String"/>  
    <parameter name="condition" type="String"/>  
    <parameter name="distinct" type="Boolean"/>  
    <parameter name="idColumn" type="String"/>  
    <parameter name="filter" type="String"/>  
    <parameter name="limit" type="Integer"/>  
    <parameter name="offset" type="Integer"/>  
    <parameter name="columns" type="String"/>  
    <parameter name="orderBy" type="String"/>  
    <parameter name="aggregateColumns" type="String"/>  
    <parameter name="variables" type="Map"/> 
  </procedure>  
  <procedure name="querySignCountProcedure" code-model="/OA/sign/logic/code" code="Sign.querySignCount"> 
    <parameter name="strDate" type="String"/> 
  </procedure>  
  <procedure name="queryDeptPsnSignProcedure" code-model="/OA/sign/logic/code" code="Sign.queryDeptPsnSign"> 
    <parameter name="strDate" type="String"/> 
  </procedure>  
  <procedure name="queryDeptLatestSignProcedure" code-model="/OA/sign/logic/code" code="Sign.queryDeptLatestSign"> 
    <parameter name="strDate" type="String"/> 
  </procedure>  
  <procedure name="queryDeptNotSignProcedure" code-model="/OA/sign/logic/code" code="Sign.queryDeptNotSign">
    <parameter name="strDate" type="String"/>
  </procedure> 
</model>
