<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  extends="$UI/OA/signature/process/parentW/parent.w" 
  __id="id_1" 
  design="device:pc;" 
  class="window" >

    <readonly xid="readonly1_1" xui:parent="rule1" xui:update-mode="insert" >
<expr xid="default1_1" >


true</expr>
</readonly>
   <div xid="process" onAbortCommit="processAbortCommit" onAdvanceCommit="processAdvanceCommit" onBackCommit="processBackCommit"  xui:update-mode="merge"/>

</div>