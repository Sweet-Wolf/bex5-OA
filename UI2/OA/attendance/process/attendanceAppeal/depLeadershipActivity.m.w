<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns="http://www.w3.org/1999/xhtml" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  extends="LateAppealActivity.m.w" 
  __id="id_1" 
  design="device:m;" >

   <div xid="LateAppealData" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
    <readonly xid="readonly1_6" xui:parent="rule1" xui:update-mode="insert" >
<expr xid="default1_6" >
true</expr>
</readonly>
   <input xid="appealTimeInput" readonly="true"  xui:update-mode="merge"/>
   <textarea xid="appealContentText" readonly="true"  xui:update-mode="merge"/>

</div>