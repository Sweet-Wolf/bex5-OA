<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="queryOA_CA_feesregisterProcedure" code-model="/OA/car/logic/code" code="Car.queryOA_CA_feesregister"> 
    <parameter name="year" type="Integer"/>  
    <parameter name="month1" type="Integer"/>  
    <parameter name="month2" type="Integer"/> 
  </procedure>  
  <procedure name="queryOA_CA_FeesregisterProcedure" code-model="/OA/car/logic/code" code="Car.queryOA_CA_Feesregister"> 
    <parameter name="year" type="String"/>  
    <parameter name="month1" type="String"/>  
    <parameter name="month2" type="String"/> 
  </procedure>  
  <procedure name="queryOA_CA_FeesregisterReportProcedure" code-model="/OA/car/logic/code" code="Car.queryOA_CA_FeesregisterReport"> 
    <parameter name="year" type="String"/>  
    <parameter name="month1" type="String"/>  
    <parameter name="month2" type="String"/> 
  </procedure>  
  <procedure name="queryCarUseReportProcedure" code-model="/OA/car/logic/code" code="Car.queryCarUseReport"> 
    <parameter name="id" type="String"/> 
  </procedure>  
  <procedure name="queryCarUseDetailReportProcedure" code-model="/OA/car/logic/code" code="Car.queryCarUseDetailReport">
    <parameter name="masterId" type="String"/>
  </procedure>
</model>
