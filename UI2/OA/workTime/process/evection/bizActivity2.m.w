<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="$UI/OA/workTime/process/evection/mainActivity.m.w" 
  __id="id_1" 
  design="device:mobile" 
  class="oa container-fluid window" >

   <div xid="mainData" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
    <readonly xid="readonly1_2" xui:parent="rule1" xui:update-mode="insert" >
<expr xid="default1_2" >


true</expr>
</readonly>
   <div xid="process" onAbortCommit="processAbortCommit" onAdvanceCommit="processAdvanceCommit" onBackCommit="processBackCommit"  xui:update-mode="merge"/>

</div>