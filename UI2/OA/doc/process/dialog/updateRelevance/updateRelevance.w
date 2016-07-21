<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:125px;top:266px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dRelevance" idColumn="id"> 
      <column name="relevanceName" type="String" xid="default1"/>  
      <column name="id" type="String" xid="default2"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <h1 xid="title" class="text-left" style="font-size:14px;"><![CDATA[请输入新的关联名称：]]></h1> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="form-group" xid="formGroup1"> 
          <div class="col-sm-12" xid="col2"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="dRelevance.ref('relevanceName')" xid="fTitle"/> 
          </div> 
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
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/> 
</div>
