<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:476px;top:53px;" onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dCarPeccancyRecord"
      directDelete="true" autoLoad="true" concept="OA_CA_PeccancyRecord" columns=""
      autoNew="false" confirmRefresh="false"> 
      <reader action="/OA/car/logic/action/queryCAPeccancyRecordAction"/>  
      <writer action="/OA/car/logic/action/saveCAPeccancyRecordAction"/>  
      <creator action="/OA/car/logic/action/createCAPeccancyRecordAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <rule xid="rule1">
   <col name="fPeccancyPerName" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default2">true</expr></required> </col> 
   <col name="fPeccancyType" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default3">true</expr></required> </col> 
   <col name="fPeccancyTypeID" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default4">true</expr></required> </col> 
   <col name="fCode" xid="ruleCol4">
    <readonly xid="readonly1">
     <expr xid="default5">true</expr></readonly> </col> 
   <col name="fName" xid="ruleCol5">
    <readonly xid="readonly2">
     <expr xid="default6">true</expr></readonly> </col> 
   <col name="fType" xid="ruleCol6">
    <readonly xid="readonly3">
     <expr xid="default7">true</expr></readonly> </col> 
   <col name="fCarKindID" xid="ruleCol7">
    <readonly xid="readonly4">
     <expr xid="default8">true</expr></readonly> </col> 
   <col name="fCarKindName" xid="ruleCol8">
    <readonly xid="readonly5">
     <expr xid="default9">true</expr></readonly> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dPeccancyKind"
      concept="OA_Pub_BaseCode" limit="-1"> 
      <reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/> 
    <filter name="filter0" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='违章类型']]></filter></div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'dCarPeccancyRecord.new'}" xid="button3"> 
      <i xid="i4" />  
      <span xid="span5" /> 
    </a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{operation:'dCarPeccancyRecord.delete'}" xid="button2"> 
      <i xid="i3" />  
      <span xid="span4" /> 
    </a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dCarPeccancyRecord.save'}" xid="button1"> 
      <i xid="i2"/>  
      <span xid="span3"/> 
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
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" bind-text="dCarPeccancyRecord.label('fCode')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div1"> 
         
                   
               
               
                 
          
            <div class="input-group" xid="inputGroup1">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fCode')" xid="input1" style="border-right-style:none;"/><div class="input-group-addon" xid="span14" style="background-color:transparent;border-left-style:none;" bind-click="selectCarClick">
    <i xid="i11" class="icon-android-search"></i></div></div></div> 
			 </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit2"> 
            <label class="x-label" xid="label2" bind-text="dCarPeccancyRecord.label('fName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div2"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fName')"
                xid="input3"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit3"> 
            <label class="x-label" xid="label3" bind-text="dCarPeccancyRecord.label('fType')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div3"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fType')"
                xid="input5"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarPeccancyRecord.label('fCarKindName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div4"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fCarKindName')"
                xid="input11"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarPeccancyRecord.label('fPeccancyTime')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div4"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fPeccancyTime')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarPeccancyRecord.label('fPeccancyPerName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div4"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fPeccancyPerName')"
                xid="input6"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarPeccancyRecord.label('fPeccancySite')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div4"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fPeccancySite')"
                xid="input8"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarPeccancyRecord.label('fPeccancyType')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div4"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="dCarPeccancyRecord.ref('fPeccancyTypeID')" bind-labelRef="dCarPeccancyRecord.ref('fPeccancyType')">
   <option xid="option1" data="dPeccancyKind" value="fCode" label="fName"></option></div></div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarPeccancyRecord.label('fPeccancyPay')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div4"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fPeccancyPay')"
                xid="input10"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarPeccancyRecord.label('fPeccancyScore')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div4"> 
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarPeccancyRecord" bind-ref="dCarPeccancyRecord.ref('fPeccancyScore')"
                xid="input9"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelInput1"> 
            <label class="x-label" xid="label4" bind-text="dCarPeccancyRecord.label('fRemark')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div4"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="textarea1" bind-ref="dCarPeccancyRecord.ref('fRemark')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectCars"
    style="left:149px;top:53px;" src="$UI/OA/car/process/dialog/selcetCarsDialog/selectCarsDialog.w"
    onReceive="dlgSelectCarsReceive" width="80%" height="80%" status="normal"/> 
</div>
