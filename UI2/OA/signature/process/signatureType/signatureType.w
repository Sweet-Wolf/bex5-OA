<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/common/process/pubBaseCode/pubBaseCodeActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window window window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc;" >

    <filter name="filter0" xid="filter1_7" xui:before="rule6" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fScope='印章类别']]>
</filter>
    <col name="fScope" xid="ruleCol1_1" xui:parent="rule6" xui:update-mode="insert" >
<calculate xid="calculate1_1" >
<expr xid="default1_1" >
'印章类别'</expr>
</calculate>
</col>

</div>