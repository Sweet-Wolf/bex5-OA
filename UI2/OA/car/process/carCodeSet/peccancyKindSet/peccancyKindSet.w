<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/common/process/pubBaseCode/pubBaseCodeActivity.w" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

    <filter name="filter0" xid="filter1_10" xui:before="rule6" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fScope='违章类型']]>
</filter>
    <col name="fScope" xid="ruleCol1_3" xui:parent="rule6" xui:update-mode="insert" >
<calculate xid="calculate1_3" >
<expr xid="default1_3" >
'违章类型'</expr>
</calculate>
</col>

</div>