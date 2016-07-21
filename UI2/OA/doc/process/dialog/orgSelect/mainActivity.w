<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:31px;top:331px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dExternalUnit"
      concept="OA_DC_ExternalUnit" autoLoad="true" isTree="true"> 
      <reader xid="default2" action="/OA/doc/logic/action/queryOA_DC_ExternalUnitAction"/>  
      <treeOption xid="default5" parentRelation="fParent" rootFilter="OA_DC_ExternalUnit.fParent is null and OA_DC_ExternalUnit ='externalUnit'"/>
    </div>  
    </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div class="x-control" component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="dExternalUnit" filterCols="fName" style="float: left;"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/>
      </div>
    </div>
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/grid/grid" expandColumn="fName"
        useVirtualRoot="false" xid="orgTreeGrid" height="auto" class="x-grid-no-bordered"
        data="dExternalUnit" appearance="tree" multiselect="true" directEdit="true" onBeforeRowSelect="orgTreeGridBeforeRowSelect" width="100%"> 
        <columns xid="columns1"> 
          <column name="fName" xid="column1"/>
        </columns>  
        <column width="100" name="fName" xid="column2"/>
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom1">
    	<a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{operation:'windowReceiver.windowCancel'}"> 
        <i xid="i1"/>  
        <span xid="span1">取消</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button"
        label="确定" xid="okBtn" onClick="okBtnClick"> 
        <i xid="i2"/>  
        <span xid="span2">确定</span>
      </a>
    </div> 
  </div> 
</div>
