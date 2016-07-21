<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:125px;top:405px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dApproveParam" idColumn="folderID">
      <column label="folderID" name="folderID" type="String" xid="default1"/>  
      <column label="isNeedApprove" name="isNeedApprove" type="String" xid="default2"/>  
      <column label="isInheritApprove" name="isInheritApprove" type="String" xid="default3"/>  
      <data xid="default4">[{}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dCheckbox" idColumn="approveChb"> 
      <column label="approveChb" name="approveChb" type="Boolean" xid="default5"/>  
      <column label="inheritChb" name="inheritChb" type="Boolean" xid="default6"/>  
      <column label="overrideChb" name="overrideChb" type="Boolean" xid="default7"/>  
      <data xid="default8">[{"approveChb":"","inheritChb":"","overrideChb":""}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dIsDisabled" idColumn="approveChb">
      <column label="approveChb" name="approveChb" type="Boolean" xid="default9"/>  
      <column label="inheritChb" name="inheritChb" type="Boolean" xid="default10"/>  
      <column label="overrideChb" name="overrideChb" type="Boolean" xid="default11"/>  
      <data xid="default13">[{"approveChb":"","inheritChb":"","overrideChb":""}]</data>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:237px;top:18px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1" style="width:99%;"> 
        <div class="col col-xs-4" xid="col1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit1">
   <label class="x-label" xid="label1" style="width:100px;"><![CDATA[需要审批发布]]></label>
   <div class="x-edit" xid="div1"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="approveChb" bind-checked=' $model.dCheckbox.ref("approveChb")' bind-disable=' $model.dIsDisabled.ref("approveChb")'></span></div></div></div>  
        </div>
       <div component="$UI/system/components/bootstrap/row/row" class="row"
              xid="row2" style="width:99%;"> 
              <div class="col col-xs-4" xid="col4"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit2">
   <label class="x-label" xid="label2" style="width:100px;"><![CDATA[继承父栏目]]></label>
   <div class="x-edit" xid="div2"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="inheritChb" bind-checked=' $model.dCheckbox.ref("inheritChb")' bind-click="inheritChbClick" bind-disable=' $model.dIsDisabled.ref("inheritChb")'></span></div></div></div>  
              <div class="col col-xs-1" xid="col7"></div><div class="col col-xs-4" xid="col5"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit3">
   <label class="x-label" xid="label3" style="width:100px;"><![CDATA[应用于子栏目]]></label>
   <div class="x-edit" xid="div3"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="overrideChb" bind-checked=' $model.dCheckbox.ref("overrideChb")' bind-disable=' $model.dIsDisabled.ref("overrideChb")'></span></div></div></div>  
              </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom2"> 
      <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
        label="取    消" style="margin-left:30px;width:80px;" xid="cancelBtn" onClick="{operation:'windowReceiver.windowCancel'}"> 
        <i xid="i41"/>  
        <span xid="span41">取 消</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="okBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span>
      </a> 
    </div>
  </div>
</div>
