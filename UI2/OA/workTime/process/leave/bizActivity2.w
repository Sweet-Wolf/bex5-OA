<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="bizActivity1.w" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

  <div xid="gridSelect1" xui:update-mode="delete"/>
  <div xid="dept" xui:update-mode="delete"/>
  <div xid="orgSelectPC1" xui:update-mode="delete"/>
  <div xid="input3" xui:update-mode="delete"/>
  <div xid="fEndTime" xui:update-mode="delete"/>
  <div xid="input6" xui:update-mode="delete"/>
  <div xid="input10" xui:update-mode="delete"/>
  <div xid="fPLACE" xui:update-mode="delete"/>
  <div xid="textarea1" xui:update-mode="delete"/>
  <div xid="textarea2" xui:update-mode="delete"/>
    <div bind-ref="mainData.ref('fLeaveTypeName')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output11_2" xui:parent="div19" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fApplyDeptName')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output21_2" xui:parent="div2" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fApplyPersonName')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output31_2" xui:parent="div3" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fStartTime')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output41_2" xui:parent="div6" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fEndTime')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output51_2" xui:parent="div5" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fTransport')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output61_2" xui:parent="div8" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fRelationTel')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output71_2" xui:parent="div7" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fPLACE')" class="x-output form-control" component="$UI/system/components/justep/output/output" xid="output81_2" xui:parent="div13" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fLeaveReason')" class="x-output form-control" component="$UI/system/components/justep/output/output" style="height:60px;" xid="output91_2" xui:parent="div14" xui:update-mode="insert" />
   <span xid="radioGroup1" disabled="true" readonly="true"  xui:update-mode="merge"/>
    <div bind-ref="mainData.ref('fRemark')" class="x-output form-control" component="$UI/system/components/justep/output/output" style="height:60px;" xid="output101_2" xui:parent="div12" xui:update-mode="insert" />

</div>