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
    <filter name="filter0" xid="filter1_6" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fScope='公文行文方向']]>
</filter>
    <rule xid="rule1_6" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<col name="fScope" xid="ruleCol1_6" >
<calculate xid="calculate1_6" >
<expr xid="default1_6" >
'公文行文方向'</expr>
</calculate>
</col>
<col name="fName" xid="ruleCol2_6" >
<required xid="required1_6" >
<expr xid="default2_6" >
undefined</expr>
<message xid="default3_6" />
</required>
</col>
</rule>

</div>