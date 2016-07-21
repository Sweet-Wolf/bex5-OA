<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="startActivity.m.w" 
  __id="id_1" 
  design="device:mobile" 
  class="oa" >

   <div xid="mainData" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
   <div xid="process" onAdvanceCommit="processAdvanceCommit"  xui:update-mode="merge"/>

</div>