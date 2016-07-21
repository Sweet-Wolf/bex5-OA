<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/common/process/pubBaseCode/pubBaseCodeActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

  <div xid="rule6" xui:update-mode="delete"/>
    <filter name="filter0" xid="filter1_7" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fScope='来文类别']]>
</filter>
    <rule xid="rule1_7" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<col name="fScope" xid="ruleCol1_7" >
<calculate xid="calculate1_7" >
<expr xid="default1_7" >
'来文类别'</expr>
</calculate>
</col>
<col name="fName" xid="ruleCol2_7" >
<required xid="required1_7" >
<expr xid="default2_7" >
undefined</expr>
<message xid="default3_7" />
</required>
</col>
</rule>

</div>