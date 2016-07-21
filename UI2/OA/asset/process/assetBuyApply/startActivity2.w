<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:98px;top:198px;">
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="mainData" concept="OA_AS_BuyApplyM" autoNew="true">
      <reader xid="default1" action="/OA/asset/logic/action/queryASBuyApplyMAction"/>  
      <writer xid="default2" action="/OA/asset/logic/action/saveASBuyApplyMAction"/>  
      <creator xid="default3" action="/OA/asset/logic/action/createASBuyApplyMAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="detailData" concept="OA_AS_BuyApplyD">
      <reader xid="default4" action="/OA/asset/logic/action/queryOA_AS_BuyApplyDAction"/>  
      <writer xid="default5" action="/OA/asset/logic/action/saveOA_AS_BuyApplyDAction"/>  
      <creator xid="default6" action="/OA/asset/logic/action/createOA_AS_BuyApplyDAction"/>  
      <master xid="default7" data="mainData" relation="fMasterID"/>
    </div>
  </div>  
    <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" style="width:24px;height:24px;left:286px;top:693px;"/> 
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
    <div class="col col-xs-4" xid="col1">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelEdit1"> 
        <label class="x-label" xid="label1"><![CDATA[fNo]]></label>  
        <div class="x-edit" xid="div1">
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input1" bind-ref="mainData.ref('fNO')"/>
        </div>
      </div>
    </div>  
    <div class="col col-xs-4" xid="col2"/>  
    <div class="col col-xs-4" xid="col3"/>
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="主表保存" xid="button4" onClick="{operation:'mainData.save'}"> 
      <i xid="i4"/>  
      <span xid="span4">主表保存</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="从表新增" xid="button5" onClick="{operation:'detailData.new'}"> 
      <i xid="i5"/>  
      <span xid="span5">从表新增</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="从表删除" xid="button6" onClick="{operation:'detailData.delete'}"> 
      <i xid="i6"/>  
      <span xid="span6">从表删除</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-default"
      label="button" xid="button7"> 
      <i xid="i7"/>  
      <span xid="span7"/>
    </a>
  </div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
    altRows="true" class="x-grid-no-bordered" xid="grid1" data="detailData"> 
    <columns xid="columns1">
      <column width="100" name="fMasterID" xid="column2"/>
    </columns>
  </div>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-default"
    label="button" xid="button2"> 
    <i xid="i2"/>  
    <span xid="span2"/>
  </a>  
  <a component="$UI/system/components/justep/button/button" class="btn btn-default"
    label="button" xid="button3"> 
    <i xid="i3"/>  
    <span xid="span3"/>
  </a>
</div>
