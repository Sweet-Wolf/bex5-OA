<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/common/process/pubBaseCode/pubBaseCodeActivity.w" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

    <filter name="filter0" xid="filter1_2" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fScope='公文紧急程度']]>
</filter>
    <rule xid="rule1_2" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<col name="fScope" xid="ruleCol1_2" >
<calculate xid="calculate1_2" >
<expr xid="default1_2" >
'公文紧急程度'</expr>
</calculate>
</col>
</rule>

</div>