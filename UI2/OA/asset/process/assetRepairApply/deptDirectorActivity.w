<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="repairApplyActivity.w" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

  <div xid="orgSelect" xui:update-mode="delete"/>
  <div xid="psmSelect" xui:update-mode="delete"/>
  <div xid="fApplyDate" xui:update-mode="delete"/>
 
  <div xid="grdSltRepairType" xui:update-mode="delete"/>
  <div xid="fDescription" xui:update-mode="delete"/>
  <div xid="fRemark" xui:update-mode="delete"/>
   <div xid="model" style="height:auto;left:753px;top:34px;"  xui:update-mode="merge"/>
    <output bind-ref="mainData.ref('fApplyDeptName')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output11_2" xui:parent="div4" xui:update-mode="insert" />
    <output bind-ref="mainData.ref('fApplyPsnName')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output21_2" xui:parent="div5" xui:update-mode="insert" />
    <output bind-ref="mainData.ref('fApplyDate')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output41_2" xui:parent="div6" xui:update-mode="insert" />
   <output xid="optCode" style="float:left;"  xui:update-mode="merge"/>
    <output bind-ref="mainData.ref('fRepairType')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output31_2" xui:parent="div11" xui:update-mode="insert" />
    <output bind-ref="mainData.ref('fDescription')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" style="height:60px;" xid="output51_2" xui:parent="div16" xui:update-mode="insert" />
    <output bind-ref="mainData.ref('fRemark')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" style="height:60px;" xid="output61_2" xui:parent="div24" xui:update-mode="insert" />

</div>