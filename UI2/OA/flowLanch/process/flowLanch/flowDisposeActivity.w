<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="flowLanchApplyActivity.w" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

  <div xid="orgSelectPC4" xui:update-mode="delete"/>
  <div xid="orgSelectPC3" xui:update-mode="delete"/>
    <readonly xid="readonly1_3" xui:parent="rule1" xui:update-mode="insert" >
<expr xid="default1_3" >
true</expr>
</readonly>
    <input bind-ref="mainData.ref('fApplyDeptName')" class="form-control" component="$UI/system/components/justep/input/input" xid="input1_3" xui:parent="div4" xui:update-mode="insert" />
    <input bind-ref="mainData.ref('fApplyPsnName')" class="form-control" component="$UI/system/components/justep/input/input" xid="input2_3" xui:parent="div9" xui:update-mode="insert" />

</div>