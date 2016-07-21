<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/common/process/pubBaseCode/pubBaseCodeActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

    <filter name="filter0" xid="filter1_7" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fScope='图书类型']]>
</filter>
    <rule xid="rule1_1" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<col name="fScope" xid="ruleCol1_1" >
<calculate xid="calculate1_1" >
<expr xid="default1_1" >
'图书类型'</expr>
</calculate>
</col>
</rule>

</div>