<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:152px;top:97px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dAssetInDate" idColumn="inDate" autoNew="true"><column label="入库日期" name="inDate" type="Date" xid="default2"></column>
  <data xid="default5">[{&quot;inDate&quot;:&quot;&quot;}]</data></div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
   <label class="x-label" xid="label1" style="width:100px;"><![CDATA[入库日期：]]></label>
   <div class="x-edit" xid="div1"><input component="$UI/system/components/justep/input/input" class="form-control" xid="fData" bind-ref="dAssetInDate.ref('inDate')"></input></div></div></div>
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