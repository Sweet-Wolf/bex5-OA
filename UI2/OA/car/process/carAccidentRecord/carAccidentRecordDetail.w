<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:476px;top:53px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dCarAccidentRecord"
      directDelete="true" autoLoad="true" concept="OA_CA_AccidentRecord" columns=""
      autoNew="false" confirmRefresh="false"> 
      <reader action="/OA/car/logic/action/queryCAAccidentRecordAction"/>  
      <writer action="/OA/car/logic/action/saveCAAccidentRecordAction"/>  
      <creator action="/OA/car/logic/action/createCAAccidentRecordAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <rule xid="rule1">
   <col name="fCode" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default1">true</expr></readonly> </col> 
   <col name="fName" xid="ruleCol2">
    <readonly xid="readonly2">
     <expr xid="default2">true</expr></readonly> </col> 
   <col name="fType" xid="ruleCol3">
    <readonly xid="readonly3">
     <expr xid="default3">true</expr></readonly> </col> 
   <col name="fCarKindID" xid="ruleCol4">
    <readonly xid="readonly4">
     <expr xid="default4">true</expr></readonly> </col> 
   <col name="fCarKindName" xid="ruleCol5">
    <readonly xid="readonly5">
     <expr xid="default5">true</expr></readonly> </col> </rule></div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dCarAccidentRecord.new'}" xid="button3"> 
      <i xid="i4"/>  
      <span xid="span5"/> 
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dCarAccidentRecord.save'}" xid="button1"> 
      <i xid="i2"/>  
      <span xid="span3"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dCarAccidentRecord.delete'}" xid="button2"> 
      <i xid="i3"/>  
      <span xid="span4"/> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="基本信息" xid="controlGroup1"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span2"><![CDATA[基本信息]]></span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarAccidentRecord.label('fCode')"/>  
            <div class="x-edit" xid="div7"> 
               
            <div class="input-group" xid="inputGroup1">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fCode')" xid="input7" style="border-right-style:none;"/><div class="input-group-addon" xid="span14" style="background-color:transparent;border-left-style:none;" bind-click="selectCarClick">
    <i xid="i11" class="icon-android-search"></i></div></div></div>  
            </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit2"> 
            <label class="x-label" xid="label2" bind-text="dCarAccidentRecord.label('fName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div8"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fName')"
                xid="input11"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col30"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit3"> 
            <label class="x-label" xid="label3" bind-text="dCarAccidentRecord.label('fType')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div9"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fType')"
                xid="input13"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fCarKindName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fCarKindName')"
                xid="input15"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fAccidentDeptName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAccidentDeptName')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fAccidentPerName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAccidentPerName')"
                xid="input6"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fAccidentTime')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAccidentTime')"
                xid="input8"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fAccidentSite')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAccidentSite')"
                xid="input1"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fAcccidentBurden')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAcccidentBurden')"
                xid="input10"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fWoundedDetail')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fWoundedDetail')"
                xid="input9"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fEconomyLoss')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fEconomyLoss')"
                xid="input2"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fAmerce')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fAmerce')"
                xid="input3"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fFactPayment')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fFactPayment')"
                xid="input5"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fPayDifference')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarAccidentRecord" bind-ref="dCarAccidentRecord.ref('fPayDifference')"
                xid="input4"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fAccidentPass')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="textarea3" bind-ref="dCarAccidentRecord.ref('fAccidentPass')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarAccidentRecord.label('fPhoto')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <div component="$UI/system/components/justep/attachment/attachmentImage"
                access="duud" xid="fPhoto" bind-ref="dCarAccidentRecord.ref('fPhoto')"> 
                <div class="x-attachment x-attachment-image" xid="div1"> 
                  <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}"
                    xid="div2"> 
                    <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)"
                      xid="image1"/>  
                    <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2"
                      class="x-remove-barget" xid="a1"/> 
                  </div>  
                  <div class="x-doc-process" xid="div3"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="div4"/> 
                  </div>  
                  <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)"
                    xid="div5"> 
                    <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                      xid="div6"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectCars"
    style="left:149px;top:53px;" src="$UI/OA/car/process/dialog/selcetCarsDialog/selectCarsDialog.w"
    onReceive="dlgSelectCarsReceive" status="normal" width="80%" height="80%"/> 
</div>
