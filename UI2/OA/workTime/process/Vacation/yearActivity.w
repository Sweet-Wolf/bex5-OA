<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:82px;top:176px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tempData" idColumn="effectiveDate" autoNew="true">
      <column label="生效日期" name="effectiveDate" type="Date" xid="xid1"/>  
      <column label="失效日期" name="failureDate" type="Date" xid="xid2"/>
    <rule xid="rule1">
   <col name="effectiveDate" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default1">true</expr></required> </col> 
   <col name="failureDate" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default2">true</expr></required> </col> </rule></div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1"> 
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit1"> 
            <label class="x-label" xid="label3" style="width:100px;" bind-text="tempData.label('effectiveDate')"/>  
            <div class="x-edit" xid="div2"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="output5" bind-ref="tempData.ref('effectiveDate')" format="yyyy-MM-dd"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit2"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="tempData.label('failureDate')"/>  
            <div class="x-edit" xid="div1"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="output1" bind-ref="tempData.ref('failureDate')" format="yyyy-MM-dd"/>
            </div> 
          </div> 
        </div>
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{&quot;operation&quot;:&quot;wReceiver.windowCancel&quot;}"> 
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
