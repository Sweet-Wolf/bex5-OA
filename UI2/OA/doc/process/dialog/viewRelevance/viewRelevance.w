<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:51px;top:242px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDoc" concept="OA_DC_Doc" limit="-1"> 
      <reader xid="default1" action="/OA/doc/logic/action/queryOA_DC_DocAction"/> 
    <writer xid="default2" action="/OA/doc/logic/action/saveOA_DC_DocAction"></writer>
  <creator xid="default3" action="/OA/doc/logic/action/createOA_DC_DocAction"></creator></div> 
  </div>  
   <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgAddRelevance" src="$UI/OA/doc/process/dialog/addRelevance/addRelevance.w" status="normal" onReceive="dlgAddRelevanceReceive"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgUpdateRelevance" title="修改关联名称" status="normal" width="30%" height="27%" onReceive="dlgUpdateRelevanceReceive" src="$UI/OA/doc/process/dialog/updateRelevance/updateRelevance.w"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"> 
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1"
      filterData="dDoc" class="pull-right" filterCols="fDocTypeName,fTitle,fDocNumber,fDocExigenceLevelName,fDocSecretLevelName,fRelevanceName"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div>  
    <a component="$UI/system/components/justep/button/button" label="添加关联"
      class="btn btn-link btn-icon-left" icon="icon-plus" xid="AddRelevanceBtn" onClick="AddRelevanceBtnClick"> 
      <i class="icon-plus"/>  
      <span>添加关联</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="删除关联" xid="DelRelevanceBtn" icon="icon-android-remove" onClick="DelRelevanceBtnClick"> 
      <i xid="i4" class="icon-android-remove"/>  
      <span xid="span7">删除关联</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="UpdateRelevanceBtn" label="修改关联名称" icon="icon-android-note" onClick="UpdateRelevanceBtnClick"> 
      <i xid="i2" class="icon-android-note"/>  
      <span xid="span2">修改关联名称</span> 
    </a> 
  </div>  
  </div>
  <div class="x-panel-content" xid="content1"> 
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table table-hover" xid="mainDataTables" data="dDoc"
      multiSelect="false"> 
      <columns xid="columns2">
        <column name="fBizStateName" xid="column7"/>
        <column name="fDocTypeName" xid="column1"/>  
        <column name="fTitle" xid="column2"/>  
        <column name="fDocNumber" xid="column3"/>  
        <column name="fIssueDate" xid="column6"/>
        <column name="fDocExigenceLevelName" xid="column4"/>  
        <column name="fDocSecretLevelName" xid="column5"/>  
        <column name="fRelevanceName" xid="column8"/>
      </columns> 
    </div> 
  </div>  
  <div class="x-panel-bottom" xid="bottom1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
      label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'> 
      <i xid="i1"/>  
      <span xid="span1">取消</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button"
      label="确定" xid="okBtn" onClick="{operation:'windowReceiver.windowEnsure'}"> 
      <i xid="i2"/>  
      <span xid="span2">确定</span> 
    </a> 
  </div> 
  </div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:186px;top:72px;" onReceive="windowReceiverReceive"/>
</div>
