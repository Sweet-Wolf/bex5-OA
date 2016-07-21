<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/asset/process/assetRepairApply/handlerDirectorActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

  <div xid="advanceBtn" xui:update-mode="delete"/>
  <div xid="saveBtn" xui:update-mode="delete"/>
  <div xid="moreBtn" xui:update-mode="delete"/>
  <div xid="inpfRepairDate" xui:update-mode="delete"/>
  <div xid="inpReturnDate" xui:update-mode="delete"/>
  <div xid="inpfRepairAmount" xui:update-mode="delete"/>
  <div xid="RepairToolBar" xui:update-mode="delete"/>
  <div xid="Repairgrid" xui:update-mode="delete"/>
  <div xid="FitToolBar" xui:update-mode="delete"/>
  <div xid="Fitgrid" xui:update-mode="delete"/>
    <output bind-ref="mainData.ref('fRepairDate')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output11_5" xui:parent="div4_2" xui:update-mode="insert" />
    <output bind-ref="mainData.ref('fReturnDate')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output31_5" xui:parent="div5_2" xui:update-mode="insert" />
    <output bind-ref="mainData.ref('fRepairAmount')" class="form-control" component="$UI/system/components/justep/output/output" data="mainData" xid="output21_5" xui:parent="div6_2" xui:update-mode="insert" />
    <div class="table table-hover table-striped" component="$UI/system/components/justep/dataTables/dataTables" data="dRepairItem" flexibleWidth="true" rowActiveClass="active" showRowNumber="true" xid="dataTables1_5" xui:parent="RepairTabContent" xui:update-mode="insert" >
<columns xid="columns1_5" >
<column name="fItem" xid="column1_5" />
<column name="fDescription" xid="column2_5" />
<column name="fAmount" xid="column3_5" />
<column name="fRemark" xid="column4_5" />
</columns>
</div>
    <div class="table table-hover table-striped" component="$UI/system/components/justep/dataTables/dataTables" data="dFittingInfo" flexibleWidth="true" rowActiveClass="active" showRowNumber="true" xid="dataTables21_5" xui:parent="FittingTabContent" xui:update-mode="insert" >
<columns xid="columns21_5" >
<column name="fName" xid="column9_4" />
<column name="fUnit" xid="column10_4" />
<column name="fNum" xid="column11_4" />
<column name="fPrice" xid="column12_4" />
<column name="fAmount" xid="column13_4" />
<column name="fRemark" xid="column14_4" />
</columns>
</div>

</div>