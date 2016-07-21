<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="startActivity.w" 
  xid="window" 
  class="window window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc;" >

  <div xid="saveBtn" xui:update-mode="delete"/>
  <div xid="fApplyDeptName" xui:update-mode="delete"/>
  <div xid="fApplyPsnName" xui:update-mode="delete"/>
  <div xid="fApplyDate" xui:update-mode="delete"/>
  <div xid="fApplyReason" xui:update-mode="delete"/>
  <div xid="fRemark" xui:update-mode="delete"/>
  <div xid="detailBar" xui:update-mode="delete"/>
  <div xid="kindSelect" xui:update-mode="delete"/>
  <div xid="fName" xui:update-mode="delete"/>
  <div xid="fSpecType" xui:update-mode="delete"/>
  <div xid="unitSelect" xui:update-mode="delete"/>
  <div xid="fBuyNum" xui:update-mode="delete"/>
  <div xid="fPrice" xui:update-mode="delete"/>

  <div xid="fRemarkd" xui:update-mode="delete"/>
   <div xid="mainData" autoLoad="true" autoNew="false"  xui:update-mode="merge"/>
   <div xid="process" style="width:24px;height:24px;left:393px;top:12px;"  xui:update-mode="merge"/>
    <div bind-ref="mainData.ref('fApplyDeptName')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="fApplyDeptName" xui:parent="div1" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fApplyPsnName')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="fApplyPsnName" xui:parent="div2" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fApplyDate')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="fApplyDate" xui:parent="div3" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fApplyReason')" class="x-output form-control" component="$UI/system/components/justep/output/output" style="height:60px;" xid="fApplyReason" xui:parent="div9" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fRemark')" class="x-output form-control" component="$UI/system/components/justep/output/output" style="height:60px;" xid="output51_2" xui:parent="div12" xui:update-mode="insert" />

</div>