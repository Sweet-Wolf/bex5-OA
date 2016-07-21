<?xml version="1.0" encoding="UTF-8"?><model xmlns="http://www.justep.com/model">  
    
    
    
    
    
    
  <action name="createOSCBaseInfoAction" procedure="bizCreateProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BaseInfo"/>
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOSCBaseInfoAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BaseInfo"/>
    <public name="idColumn" type="String" value="OA_OSC_BaseInfo"/>  
    <private name="select" type="String" value="OA_OSC_BaseInfo.*"/>  
    <private name="from" type="String" value="OA_OSC_BaseInfo OA_OSC_BaseInfo"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>
  	<public name="offset" type="Integer"/> 
  	<public name="distinct" type="Boolean" value="false"/> 
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="saveOSCBaseInfoAction" procedure="bizSaveProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BaseInfo"/>
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="createOSCBuyApplyMAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_OSC_BuyApplyM"/>
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOSCBuyApplyMAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BuyApplyM"/>
    <public name="idColumn" type="String" value="OA_OSC_BuyApplyM"/>  
    <private name="select" type="String" value="OA_OSC_BuyApplyM.*"/>  
    <private name="from" type="String" value="OA_OSC_BuyApplyM OA_OSC_BuyApplyM"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>
  	<public name="offset" type="Integer"/> 
  	<public name="distinct" type="Boolean" value="false"/> 
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="saveOSCBuyApplyMAction" procedure="bizSaveProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BuyApplyM"/>
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="createOSCBuyApplyDAction" procedure="bizCreateProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BuyApplyD"/>
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOSCBuyApplyDAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BuyApplyD"/>
    <public name="idColumn" type="String" value="OA_OSC_BuyApplyD"/>  
    <private name="select" type="String" value="OA_OSC_BuyApplyD.*"/>  
    <private name="from" type="String" value="OA_OSC_BuyApplyD OA_OSC_BuyApplyD"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>
  	<public name="offset" type="Integer"/> 
  	<public name="distinct" type="Boolean" value="false"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="saveOSCBuyApplyDAction" procedure="bizSaveProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_BuyApplyD"/>
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="createOSCUseApplyMAction" procedure="bizCreateProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_UseApplyM"/>
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOSCUseApplyMAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_OSC_UseApplyM"/>
    <public name="idColumn" type="String" value="OA_OSC_UseApplyM"/>  
    <private name="select" type="String" value="OA_OSC_UseApplyM.*"/>  
    <private name="from" type="String" value="OA_OSC_UseApplyM OA_OSC_UseApplyM"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
   <public name="limit" type="Integer"/>
  	<public name="offset" type="Integer"/> 
  	<public name="distinct" type="Boolean" value="false"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="saveOSCUseApplyMAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_OSC_UseApplyM"/>
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="createOSCUseApplyDAction" procedure="bizCreateProcedure"> 
    <public name="concept" type="String" value="OA_OSC_UseApplyD"/>
    <public name="table" type="Object"/>  
    <public name="defaultValues" type="Map"/>  
    <private name="fnModel" type="String" value="/system/logic/fn"/> 
  </action>  
  <action name="queryOSCUseApplyDAction" procedure="bizQueryProcedure"> 
    <public name="concept" type="String" value="OA_OSC_UseApplyD"/>
    <public name="idColumn" type="String" value="OA_OSC_UseApplyD"/>  
    <private name="select" type="String" value="OA_OSC_UseApplyD.*"/>  
    <private name="from" type="String" value="OA_OSC_UseApplyD OA_OSC_UseApplyD"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>
  	<public name="offset" type="Integer"/> 
  	<public name="distinct" type="Boolean" value="false"/> 
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="saveOSCUseApplyDAction" procedure="bizSaveProcedure"> 
    <public name="concept" type="String" value="OA_OSC_UseApplyD"/>
    <permission name="insertRange" type="List"/>  
    <permission name="deleteRange" type="List"/>  
    <permission name="updateRange" type="List"/>
	<private name="fnModel" type="String"/>  
    <protected name="readOnly" type="String"/>  
    <protected name="notNull" type="String"/>  
    <public name="table" type="Object"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="queryOSCUseApplyDetailAction" procedure="bizQueryProcedure"> 
  	<public name="concept" type="String" value="OA_OSC_UseApplyD"/>
    <public name="idColumn" type="String" value="OA_OSC_UseApplyD"/>  
    <private name="select" type="String" value="OA_OSC_UseApplyD.*,m.fBizState AS fBizState,m.fBizStateName AS fBizStateName,m.fCreatePsnID AS fCreatePsnID,m.fCreatePsnFID AS fCreatePsnFID,m.fCreateTime AS fCreateTime,m.fApplyDeptName AS fApplyDeptName,m.fApplyPsnID AS fApplyPsnID,m.fApplyPsnName AS fApplyPsnName,m.fApplyPsnFID AS fApplyPsnFID,m.fApplyDate AS fApplyDate"/>  
    <private name="from" type="String" value="OA_OSC_UseApplyD OA_OSC_UseApplyD optional join OA_OSC_UseApplyM m on OA_OSC_UseApplyD.fMasterID = m"/>  
    <protected name="condition" type="String"/>  
    <permission name="range" type="List"/>  
    <public name="filter" type="String"/>  
    <public name="limit" type="Integer"/>
  	<public name="offset" type="Integer"/> 
  	<public name="distinct" type="Boolean" value="false"/>  
    <public name="columns" type="String"/>  
    <public name="orderBy" type="String"/>  
    <private name="aggregate" type="String"/>  
    <public name="aggregateColumns" type="String"/>  
    <public name="variables" type="Map"/>  
    <private name="fnModel" type="String"/>  
    <private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"/> 
  </action>  
  <action name="canUseAction" procedure="canUseProcedure">
  	<public name="bizID" type="String"/>
  </action>  
  <procedure code="Office.canUse" code-model="/OA/officeSupplyConsumables/logic/code" name="canUseProcedure"> 
    <parameter name="bizID" type="String"/> 
  </procedure> 
  
  <action name="useRegisterAction" procedure="useRegisterProcedure">
  	<public name="bizID" type="String"/>
  </action>  
  <procedure code="Office.useRegister" code-model="/OA/officeSupplyConsumables/logic/code" name="useRegisterProcedure"> 
    <parameter name="bizID" type="String"/> 
  </procedure> 
  
  
<action name="queryOSCUseApplyExMAction" global="false" procedure="bizQueryProcedure">
<label language="zh_CN">我审批</label>
<private name="concept" type="String" value="OA_OSC_UseApplyM"></private>
<public name="idColumn" type="String" value="OA_OSC_UseApplyM"></public>
<private name="select" type="String" value="OA_OSC_UseApplyM.*,SA_Task.*"></private>
<private name="from" type="String" value="OA_OSC_UseApplyM OA_OSC_UseApplyM  join SA_Task SA_Task on OA_OSC_UseApplyM = SA_Task.sData1"></private>
<protected name="condition" type="String" value="SA_Task.sStatusID in ('tesReady', 'tesExecuting')  AND  SA_Task.sKindID in ('tkTask', 'tkExecutor')  AND SA_Task.sExecutorPersonID = :currentPersonID() AND SA_Task.sProcess = '/OA/officeSupplyConsumables/process/officeSupplyUseApply/officeSupplyUseApplyProcess'"></protected>
<permission name="range" type="List"></permission>
<public name="filter" type="String"></public>
<public name="distinct" type="Boolean" value="false"></public>
<public name="offset" type="Integer"></public>
<public name="limit" type="Integer"></public>
<public name="columns" type="String"></public>
<public name="orderBy" type="String"></public>
<private name="aggregate" type="String"></private>
<public name="aggregateColumns" type="String"></public>
<public name="variables" type="Map"></public>
<private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"></private>
<private name="fnModel" type="String"></private>
</action>
<action name="queryOSCUseApplyCrMAction" global="false" procedure="bizQueryProcedure">
<label language="zh_CN">我发起</label>
<private name="concept" type="String" value="OA_OSC_UseApplyM"></private>
<public name="idColumn" type="String" value="OA_OSC_UseApplyM"></public>
<private name="select" type="String" value="OA_OSC_UseApplyM.*,SA_Task.sExecutorPersonName as sExecutorPersonName,SA_Task.sStatusName as sStatusName"></private>
<private name="from" type="String" value="OA_OSC_UseApplyM OA_OSC_UseApplyM  join SA_Task SA_Task on OA_OSC_UseApplyM = SA_Task.sData1"></private>
<protected name="condition" type="String" value="SA_Task.sCreatorPersonID = :currentPersonID() AND SA_Task.sExecutorPersonID &lt;&gt; :currentPersonID() AND  SA_Task.sKindID in ('tkTask', 'tkExecutor')  AND SA_Task.sStatusID &lt;&gt; 'tesReady' AND SA_Task.sProcess = '/OA/officeSupplyConsumables/process/officeSupplyUseApply/officeSupplyUseApplyProcess'"></protected>
<permission name="range" type="List"></permission>
<public name="filter" type="String"></public>
<public name="distinct" type="Boolean" value="false"></public>
<public name="offset" type="Integer"></public>
<public name="limit" type="Integer"></public>
<public name="columns" type="String"></public>
<public name="orderBy" type="String"></public>
<private name="aggregate" type="String"></private>
<public name="aggregateColumns" type="String"></public>
<public name="variables" type="Map"></public>
<private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"></private>
<private name="fnModel" type="String"></private>
</action>

<action name="queryOSCUseApplyPaMAction" global="false" procedure="bizQueryProcedure">
<label language="zh_CN">我相关</label>
<private name="concept" type="String" value="OA_OSC_UseApplyM"></private>
<public name="idColumn" type="String" value="OA_OSC_UseApplyM"></public>
<private name="select" type="String" value="OA_OSC_UseApplyM.*,SA_Task.sExecutorPersonName as sExecutorPersonName,SA_Task.sStatusName as sStatusName"></private>
<private name="from" type="String" value="OA_OSC_UseApplyM OA_OSC_UseApplyM  join SA_Task SA_Task on OA_OSC_UseApplyM = SA_Task.sData1"></private>
<protected name="condition" type="String" value="SA_Task.sCreatorPersonID &lt;&gt; :currentPersonID() AND  SA_Task.sKindID in ('tkTask', 'tkExecutor')  AND SA_Task.sStatusID &lt;&gt; 'tesFinished' AND SA_Task.sProcess = '/OA/officeSupplyConsumables/process/officeSupplyUseApply/officeSupplyUseApplyProcess' AND SA_Task.sExecutorPersonID LIKE   '%' + :currentPersonName()  + '%'"></protected>
<permission name="range" type="List"></permission>
<public name="filter" type="String"></public>
<public name="distinct" type="Boolean" value="false"></public>
<public name="offset" type="Integer"></public>
<public name="limit" type="Integer"></public>
<public name="columns" type="String"></public>
<public name="orderBy" type="String"></public>
<private name="aggregate" type="String"></private>
<public name="aggregateColumns" type="String"></public>
<public name="variables" type="Map"></public>
<private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"></private>
<private name="fnModel" type="String"></private>
</action>
<action name="queryOSCUseApplyClMAction" global="false" procedure="bizQueryProcedure">
<label language="zh_CN">已审批</label>
<private name="concept" type="String" value="OA_OSC_UseApplyM"></private>
<public name="idColumn" type="String" value="OA_OSC_UseApplyM"></public>
<private name="select" type="String" value="OA_OSC_UseApplyM.*,SA_Task.sExecutorPersonName as sExecutorPersonName,SA_Task.sStatusName as sStatusName"></private>
<private name="from" type="String" value="OA_OSC_UseApplyM OA_OSC_UseApplyM  join SA_Task SA_Task on OA_OSC_UseApplyM = SA_Task.sData1"></private>
<protected name="condition" type="String"></protected>
<permission name="range" type="List"></permission>
<public name="filter" type="String"></public>
<public name="distinct" type="Boolean" value="false"></public>
<public name="offset" type="Integer"></public>
<public name="limit" type="Integer"></public>
<public name="columns" type="String"></public>
<public name="orderBy" type="String"></public>
<private name="aggregate" type="String"></private>
<public name="aggregateColumns" type="String"></public>
<public name="variables" type="Map"></public>
<private name="dataModel" type="String" value="/OA/officeSupplyConsumables/data"></private>
<private name="fnModel" type="String"></private>
</action>
</model>