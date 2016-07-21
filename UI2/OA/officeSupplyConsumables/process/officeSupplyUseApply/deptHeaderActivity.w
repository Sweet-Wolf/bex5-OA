<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="useApplyActivity.w" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc;" >

  <div xid="detailBar" xui:update-mode="delete"/>
    <rule xid="rule1_7" xui:parent="mainData" xui:update-mode="insert" >
<readonly xid="readonly1_7" >
<expr xid="default1_7" >
true</expr>
</readonly>
</rule>
    <rule xid="rule2_7" xui:parent="detailData" xui:update-mode="insert" >
<readonly xid="readonly2_7" >
<expr xid="default2_7" >
true</expr>
</readonly>
</rule>

</div>