<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:657px;top:107px;">
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dAssetReturn" idColumn="returnDate" autoNew="true" limit="-1">
      <column label="归还日期" name="returnDate" type="Date" xid="default3"/>  
      <column label="备注" name="remark" type="String" xid="default4"/>
    <data xid="default5">[{&quot;returnDate&quot;:&quot;2015-04-19T16:00:00.000Z&quot;}]</data>
  <rule xid="rule1">
   <col name="returnDate" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default1">true</expr></required> </col> </rule></div>
    <rule id="dataRule1" column="returnDate" type="xsd:date"/>
    
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel"> 
    <div class="x-panel-content" xid="content">
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form">
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit2"> 
              <label class="x-label" xid="ReturnDateL" style="width:100px;"><![CDATA[归还日期：]]></label>  
              <div class="x-edit" xid="div2">
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="inpReturnDate" bind-ref="dAssetReturn.ref('returnDate')"/>
              </div>
            </div>
          </div> 
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4"> 
            <div class="x-edit" xid="div5" />
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5"> 
              <label class="x-label" xid="remarkL" style="width:100px;"><![CDATA[备注：]]></label>  
              <div class="x-edit" xid="div3">
                <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="Remark" bind-ref="dAssetReturn.ref('remark')" />
              </div>
            </div>
          </div></div>  
        </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom"> 
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
    xid="wReceiver" style="left:443px;top:568px;"/> 
</div>
