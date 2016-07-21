<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="applyActivity.w" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc;" >

  <div xid="orgSelectPC4" xui:update-mode="delete"/>
  <div xid="orgSelectPC3" xui:update-mode="delete"/>
   <div xid="model" style="height:auto;left:444px;top:160px;"  xui:update-mode="merge"/>
    <readonly xid="readonly1_2" xui:parent="rule1" xui:update-mode="insert" >
<expr xid="default1_2" >


true</expr>
</readonly>
    <input bind-ref="mainData.ref('fBorrowDeptName')" class="form-control" component="$UI/system/components/justep/input/input" xid="input1_2" xui:parent="div1" xui:update-mode="insert" />
    <input bind-ref="mainData.ref('fBorrowPsnName')" class="form-control" component="$UI/system/components/justep/input/input" xid="input2_2" xui:parent="div2" xui:update-mode="insert" />
   <a xid="addBtn" disabled="true"  xui:update-mode="merge"/>
   <a xid="deleteBtn" disabled="true"  xui:update-mode="merge"/>

</div>