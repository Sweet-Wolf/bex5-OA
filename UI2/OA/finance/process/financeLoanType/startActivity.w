<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/common/process/pubBaseCode/pubBaseCodeActivity.w" 
  xid="window" 
  class="window window window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc;" >

  <div xid="dPubBaseCode" xui:update-mode="delete"/>
   <div xid="model" style="height:auto;left:332px;top:286px;"  xui:update-mode="merge"/>
    <div autoLoad="true" component="$UI/system/components/justep/data/bizData" concept="OA_Pub_BaseCode" onSaveCommit="dPubBaseCodeSaveCommit" onValueChanged="dPubBaseCodeValueChanged" orderBy="fSequence asc" xid="dPubBaseCode" xui:before="dBtnStatus" xui:parent="model" xui:update-mode="insert" >
<reader action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction" xid="default1" />
<writer action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction" xid="default41_3" />
<creator action="/OA/common/logic/action/createOA_Pub_BaseCodeAction" xid="default51_3" />
<rule xid="rule6" >
<col name="fName" xid="ruleCol11" >
<required xid="required3" >
<expr xid="default18" >


js:true</expr>
<message xid="default19" />
</required>
</col>
</rule>
<filter name="filter0" xid="filter11_3" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<![CDATA[OA_Pub_BaseCode.fScope='借款类型']]>
</filter>
<rule xid="rule11_3" xui:parent="dPubBaseCode" xui:update-mode="insert" >
<col name="fScope" xid="ruleCol13_3" >
<calculate xid="calculate13_3" >
<expr xid="default13_3" >
<![CDATA['借款类型']]>
</expr>
</calculate>
</col>
</rule>
</div>
   <a xid="filterBtn" onClick="dPubBaseCodeValueChanged"  xui:update-mode="merge"/>

</div>