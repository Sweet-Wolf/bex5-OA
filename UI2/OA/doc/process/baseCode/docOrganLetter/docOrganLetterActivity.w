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

  <div xid="rule6" xui:update-mode="delete"/>
    <rule xid="rule1_4" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<col name="fScope" xid="ruleCol1_4" >
<calculate xid="calculate1_4" >
<expr xid="default1_4" >
'发文机关代字'</expr>
</calculate>
</col>
<col name="fName" xid="ruleCol2_4" >
<required xid="required1_4" >
<expr xid="default2_4" >
undefined</expr>
<message xid="default3_4" />
</required>
</col>
</rule>
    <filter name="filter0" xid="filter1_4" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fScope='发文机关代字']]>
</filter>

</div>