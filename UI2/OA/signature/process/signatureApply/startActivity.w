<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/signature/process/parentW/parent.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc;" >

   <div xid="dSignature" autoLoad="false" autoNew="true"  xui:update-mode="merge"/>
    <filter name="filter0" xid="filter1_19" xui:parent="dType" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='印章类别']]>
</filter>

</div>