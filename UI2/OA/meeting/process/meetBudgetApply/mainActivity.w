<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_MT_BudgetApply" orderBy=""
      columns="" autoNew="true"> 
      <reader action="/OA/meeting/logic/action/queryOA_MT_BudgetApplyAction"/>  
      <writer action="/OA/meeting/logic/action/saveOA_MT_BudgetApplyAction"/>  
      <creator action="/OA/meeting/logic/action/createOA_MT_BudgetApplyAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="chartBtn" onClick="{operation:'process.showChart'}"> 
          <i xid="i5"/>  
          <span xid="span5"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recordBtn" onClick="{operation:'process.processRecord'}"> 
          <i xid="i55"/>  
          <span xid="span55"/> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'mainData.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label"
        label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
        <i xid="i15" class="icon-ios7-more"/>  
        <span xid="span15">更多</span> 
      </a> 
    </div>  
    <div xid="content"> 
      <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div component="$UI/system/components/justep/excelLayout/excelLayout"
          class="x-excel-layout" style="width:100%; height: 100%;" xid="excelLayout"
          src="mainActivity.xml"> 
          <label xid="TfMeetNameL" bind-text="mainData.label('fMeetName')"/>  
          <input xid="TfMeetNameF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fMeetName')"/>  
          <label xid="TfMeetTimeL" bind-text="mainData.label('fMeetTime')"/>  
          <input xid="TfMeetTimeF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fMeetTime')"/>  
          <label xid="TfMeetPalceL" bind-text="mainData.label('fMeetPalce')"/>  
          <input xid="TfMeetPalceF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fMeetPalce')"/>  
          <label xid="TfMeetReportL" bind-text="mainData.label('fMeetReport')"/>  
          <input xid="TfMeetReportF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fMeetReport')"/>  
          <label xid="TfMeetTypeL" bind-text="mainData.label('fMeetType')"/>  
          <input xid="TfMeetTypeF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fMeetType')"/>  
          <label xid="TfMeetDayCountL" bind-text="mainData.label('fMeetDayCount')"/>  
          <input xid="TfMeetDayCountF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fMeetDayCount')"/>  
          <label xid="TfMeetPartnerNumL" bind-text="mainData.label('fMeetPartnerNum')"/>  
          <input xid="TfMeetPartnerNumF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fMeetPartnerNum')"/>  
          <label xid="TfRentHouseCostStandL" bind-text="mainData.label('fRentHouseCostStand')"/>  
          <input xid="TfRentHouseCostStandF" class="form-control xui-autofill"
            component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fRentHouseCostStand')"/>  
          <label xid="TfEatCostStadardL" bind-text="mainData.label('fEatCostStadard')"/>  
          <input xid="TfEatCostStadardF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fEatCostStadard')"/>  
          <label xid="TfOtherCostL" bind-text="mainData.label('fOtherCost')"/>  
          <input xid="TfOtherCostF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fOtherCost')"/>  
          <label xid="TfConsultCostL" bind-text="mainData.label('fConsultCost')"/>  
          <input xid="TfConsultCostF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fConsultCost')"/>  
          <label xid="TfApplyDateL" bind-text="mainData.label('fApplyDate')"/>  
          <input xid="TfApplyDateF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fApplyDate')"/>  
          <label xid="TfCostSourceL" bind-text="mainData.label('fCostSource')"/>  
          <input xid="TfCostSourceF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fCostSource')"/>  
          <label xid="TfAccountNameL" bind-text="mainData.label('fAccountName')"/>  
          <input xid="TfAccountNameF" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fAccountName')"/> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
