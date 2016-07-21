<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/common/process/pubMultySelect/pubMultySelect.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window window window window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

   <div xid="main" autoLoad="false" concept="OA_DC_Doc"  xui:update-mode="merge"/>
    <reader action="/OA/doc/logic/action/queryOA_DC_DocAction" xid="default1_3" xui:parent="main" xui:update-mode="insert" />
   <div xid="smartFilter2" filterCols="fDocTypeName,fRelevanceName,fTitle,fDocNumber,fDocExigenceLevelName,fDocSecretLevelName"  xui:update-mode="merge"/>
    <column name="fBizStateName" xid="column6_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fDocTypeName" xid="column1_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fTitle" xid="column2_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fDocNumber" xid="column3_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fIssueState" xid="column8_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fDocExigenceLevelName" xid="column4_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fDocSecretLevelName" xid="column5_1" xui:parent="columns2" xui:update-mode="insert" />
    <column name="fRelevanceName" xid="column7_1" xui:parent="columns2" xui:update-mode="insert" />
   <span xid="windowReceiver" onReceive="windowReceiverReceive"  xui:update-mode="merge"/>

</div>