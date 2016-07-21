<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  extends="useApplyActivity.m.w" 
  __id="id_1" 
  design="device:m;" 
  class="oa container-fluid window" >

  <div xid="div11" xui:update-mode="delete"/>
    <rule xid="rule1_12" xui:parent="mainData" xui:update-mode="insert" >
<readonly xid="readonly1_12" >
<expr xid="default1_12" >
true</expr>
</readonly>
</rule>
   <select xid="select1" disabled="true"  xui:update-mode="merge"/>
   <div xid="inputGroup1" style="width:100%;"  xui:update-mode="merge"/>
   <textarea xid="fMeetPsns" disabled="true" readonly="true" style="width:100%;"  xui:update-mode="merge"/>

</div>