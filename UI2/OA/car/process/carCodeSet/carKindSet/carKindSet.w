<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/common/process/pubBaseCode/pubBaseCodeActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

    <filter name="filter0" xid="filter1_7" xui:before="rule6" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fScope='车辆类型']]>
</filter>
    <col name="fScope" parent="rule6" update-mode="insert" xid="ruleCol11_1" xui:parent="rule6" xui:update-mode="insert" >
<calculate xid="calculate11_1" >
<expr xid="default11_1" >
'车辆类型'</expr>
</calculate>
</col>

</div>