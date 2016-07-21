<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/common/process/pubBaseCode/pubBaseCodeActivity.w" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc;" >

    <filter name="filter0" xid="filter1_3" xui:before="rule6" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fScope='办公用品类别']]>
</filter>
    <col name="fScope" parent="rule6" update-mode="insert" xid="ruleCol11_1" xui:parent="rule6" xui:update-mode="insert" >
<calculate xid="calculate11_1" >
<expr xid="default11_1" >
'办公用品类别'</expr>
</calculate>
</col>

</div>