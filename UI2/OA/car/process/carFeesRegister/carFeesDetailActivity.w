<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:484px;top:10px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dFees"
      concept="OA_CA_FeesRegister" limit="1"> 
      <reader xid="default1" action="/OA/car/logic/action/queryOA_CA_FeesRegisterAction"/>  
      <writer xid="default2" action="/OA/car/logic/action/saveOA_CA_FeesRegisterAction"/>  
      <creator xid="default3" action="/OA/car/logic/action/createOA_CA_FeesRegisterAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgCarInfo"
    src="$UI/OA/car/process/dialog/selcetCarsDialog/selectCarsDialog.w" status="normal"
    width="80%" height="80%" onReceive="dlgCarInfoReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'dFees.new'}" xid="button9"> 
          <i xid="i7"/>  
          <span xid="span10"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'dFees.delete'}" xid="button8"> 
          <i xid="i6"/>  
          <span xid="span9"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'dFees.save'}" xid="button7"> 
          <i xid="i5"/>  
          <span xid="span8"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'dFees.refresh'}" xid="button10"> 
          <i xid="i8"/>  
          <span xid="span11"/> 
        </a> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="基本信息" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span1"><![CDATA[基本信息]]></span> 
        </div>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col50"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;" bind-text="dFees.label('fYear')"/>  
              <div class="x-edit" xid="div1"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input1" bind-ref="dFees.ref('fYear')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col53"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit2"> 
              <label class="x-label" xid="label2" bind-text="dFees.label('fMonth')"
                style="width:100px;"/>  
              <div class="x-edit" xid="div2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input2" bind-ref="dFees.ref('fMonth')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col56"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit3"> 
              <label class="x-label" xid="label3" bind-text="dFees.label('fCarNO')"
                style="width:100px;"/>  
              <div class="x-edit" xid="div3"> 
                 
              <div class="input-group" xid="inputGroup1">
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" bind-ref="dFees.ref('fCarNO')" style="border-right-style:none;"/><div class="input-group-addon" xid="span14" style="background-color:transparent;border-left-style:none;" bind-click="trgCarClick">
    <i xid="i11" class="icon-android-search"></i></div></div></div>  
              </div> 
          </div> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col57"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit4"> 
              <label class="x-label" xid="label4" style="width:100px;" bind-text="dFees.label('fCarName')" />  
              <div class="x-edit" xid="div4"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="dFees.ref('fCarName')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col58"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit " xid="labelEdit5"> 
              <label class="x-label" xid="label5" style="width:100px;" bind-text="dFees.label('fOverTimeDays')" />  
              <div class="x-edit" xid="div5"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="dFees.ref('fOverTimeDays')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col59"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit6"> 
              <label class="x-label" xid="label6" style="width:100px;" bind-text="dFees.label('fFixedParkFee')" />  
              <div class="x-edit" xid="div6"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input5" bind-ref="dFees.ref('fFixedParkFee')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col60"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit7"> 
              <label class="x-label" xid="label7" style="width:100px;" bind-text="dFees.label('fTempParkFee')" />  
              <div class="x-edit" xid="div7"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input8" bind-ref="dFees.ref('fTempParkFee')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col61"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit8"> 
              <label class="x-label" xid="label8" style="width:100px;" bind-text="dFees.label('fReimbLoadToll')" />  
              <div class="x-edit" xid="div8"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input7" bind-ref="dFees.ref('fReimbLoadToll')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col62"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit9"> 
              <label class="x-label" xid="label9" style="width:100px;" bind-text="dFees.label('fETCRoadToll')" />  
              <div class="x-edit" xid="div9"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input10" bind-ref="dFees.ref('fETCRoadToll')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col63"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit10"> 
              <label class="x-label" xid="label10" style="width:100px;" bind-text="dFees.label('fDriverRepairFee')" />  
              <div class="x-edit" xid="div10"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input9" bind-ref="dFees.ref('fDriverRepairFee')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col64"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit11"> 
              <label class="x-label" xid="label11" style="width:100px;" bind-text="dFees.label('fManagerFee')" />  
              <div class="x-edit" xid="div11"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input12" bind-ref="dFees.ref('fManagerFee')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col65"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit12"> 
              <label class="x-label" xid="label12" style="width:100px;"><![CDATA[油量]]></label>  
              <div class="x-edit" xid="div12"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input11" bind-ref="dFees.ref('fLiters')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col66"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit13"> 
              <label class="x-label" xid="label13" style="width:100px;" bind-text="dFees.label('fOilFee')" />  
              <div class="x-edit" xid="div13"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input14" bind-ref="dFees.ref('fOilFee')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col67"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit14"> 
              <label class="x-label" xid="label14" style="width:100px;" bind-text="dFees.label('fVehicleFee')" />  
              <div class="x-edit" xid="div14"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input13" bind-ref="dFees.ref('fVehicleFee')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col68"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit15"> 
              <label class="x-label" xid="label15" style="width:100px;" bind-text="dFees.label('fReimbFee')" />  
              <div class="x-edit" xid="div15"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input16" bind-ref="dFees.ref('fReimbFee')" /> 
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col69"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit16"> 
              <label class="x-label" xid="label16" style="width:100px;" bind-text="dFees.label('fPassageFee')" />  
              <div class="x-edit" xid="div16">
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input15" bind-ref="dFees.ref('fPassageFee')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col70"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit17"> 
              <label class="x-label" xid="label17" style="width:100px;" bind-text="dFees.label('fVehicleTax')" />  
              <div class="x-edit" xid="div17">
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input17" bind-ref="dFees.ref('fVehicleTax')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col71"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit18"> 
              <label class="x-label" xid="label18" style="width:100px;" bind-text="dFees.label('fTransportFee')" />  
              <div class="x-edit" xid="div18">
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input18" bind-ref="dFees.ref('fTransportFee')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col72"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit19"> 
              <label class="x-label" xid="label19" style="width:100px;" bind-text="dFees.label('fMedicalExamFee')" />  
              <div class="x-edit" xid="div19">
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input19" bind-ref="dFees.ref('fMedicalExamFee')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col73"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit20"> 
              <label class="x-label" xid="label20" style="width:100px;" bind-text="dFees.label('fOfficeFee')" />  
              <div class="x-edit" xid="div20">
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input20" bind-ref="dFees.ref('fOfficeFee')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col74"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit21"> 
              <label class="x-label" xid="label21" style="width:100px;" bind-text="dFees.label('fCommunicatFee')" />  
              <div class="x-edit" xid="div21">
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input21" bind-ref="dFees.ref('fCommunicatFee')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col75"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit22"> 
              <label class="x-label" xid="label22" style="width:100px;" bind-text="dFees.label('fAccidentInsurance')" />  
              <div class="x-edit" xid="div22">
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input22" bind-ref="dFees.ref('fAccidentInsurance')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col76"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit23"> 
              <label class="x-label" xid="label23" style="width:100px;" bind-text="dFees.label('fOtherFees')" />  
              <div class="x-edit" xid="div23">
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input23" bind-ref="dFees.ref('fOtherFees')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col77"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit24"> 
              <label class="x-label" xid="label24" style="width:100px;" bind-text="dFees.label('fHundredKmOilFeul')" />  
              <div class="x-edit" xid="div24">
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input24" bind-ref="dFees.ref('fHundredKmOilFeul')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col78"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit25"> 
              <label class="x-label" xid="label25" style="width:100px;" bind-text="dFees.label('fUsersName')" />  
              <div class="x-edit" xid="div25">
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="input25" bind-ref="dFees.ref('fUsersName')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col81"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit26">
   <label class="x-label" xid="label26" style="width:100px;" bind-text="dFees.label('fRemark')"></label>
   <div class="x-edit" xid="div26">
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="dFees.ref('fRemark')"></textarea></div> </div></div></div>  
        </div> 
    </div> 
  </div> 
</div>
