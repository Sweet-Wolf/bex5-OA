<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:55px;top:295px;"><div component="$UI/system/components/justep/data/bizData" xid="dInventory" concept="OA_AS_Inventory"><reader xid="default1" action="/OA/asset/logic/action/queryASInventoryAction"></reader>
  <writer xid="default2" action="/OA/asset/logic/action/saveASInventoryAction"></writer>
  <creator xid="default3" action="/OA/asset/logic/action/creaInyApplyQueryAction"></creator></div>
  <div component="$UI/system/components/justep/data/bizData" xid="dJoinInventory" concept="OA_AS_InventoryD"><reader xid="default4" action="/OA/asset/logic/action/queryASInventoryRecordAction"></reader>
  <writer xid="default5" action="/OA/asset/logic/action/saveASJoinInventoryAction"></writer>
  <creator xid="default6" action="/OA/asset/logic/action/createASJoinInventoryAction"></creator>
  </div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"><div xid="div">
   
   <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
      <label class="x-label" xid="label1" bind-text="dInventory.label('fDate')" style="width:100px;"></label>
      <div class="x-edit" xid="div1">
       <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" bind-ref="dInventory.ref('fDate')"></input></div> </div> </div> 
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
      <label class="x-label" xid="label2" bind-text="dInventory.label('fCreateDeptName')" style="width:100px;"></label>
      <div class="x-edit" xid="div2">
       <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelect" bind-ref="dInventory.ref('fDeptID')" bind-labelRef="dInventory.ref('fDeptName')" includeOrgKind="ogn,dpt">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="dOrg" limit="-1"></div>
   <option xid="option2">
    <columns xid="columns1">
     <column name="sName" xid="column1"></column></columns> </option> </div></div> </div> </div> 
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput3">
      <label class="x-label" xid="label5" bind-text="dInventory.label('fPersonName')" style="width:100px;"></label>
      <div class="x-edit" xid="div6">
       <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="psmSelect" bind-ref="dInventory.ref('fPersonID')" bind-labelRef="dInventory.ref('fPersonName')" includeOrgKind="psm">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
    <treeOption xid="default7" rootFilter="1=1"></treeOption></div> 
   <option xid="option1" value="sFCode" label="sFName">
    <columns xid="columns2">
     <column name="sName" xid="column2"></column></columns> </option> </div></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10">
     <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput2">
      <label class="x-label" xid="label10" bind-text="dInventory.label('fDescription')" style="width:100px;"></label>
      <div class="x-edit" xid="div7">
       <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dInventory.ref('fDescription')"></textarea></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col3">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelTextarea1">
     <label class="x-label" xid="label3" bind-text="dInventory.label('fRemark')" style="width:100px;"></label>
     <div class="x-edit" xid="div3">
      <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea2" bind-ref="dInventory.ref('fRemark')"></textarea></div> </div> </div></div> 
   </div></div>  
    <div class="x-panel-bottom" xid="bottom1">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"wReceiver.windowCancel"}'> 
        <i xid="i2"/>  
        <span xid="span2">取消</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span>
      </a>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/>
</div>