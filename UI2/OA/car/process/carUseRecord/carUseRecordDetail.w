<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:437px;top:24px;height:163px;width:214px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseRecord"
      directDelete="true" autoLoad="true" concept="OA_CA_CarRecord" columns="" autoNew="false" confirmRefresh="false"> 
      <reader action="/OA/car/logic/action/queryCACarRecordAction"/>  
      <writer action="/OA/car/logic/action/saveCACarRecordAction"/>  
      <creator action="/OA/car/logic/action/createCACarRecordAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <rule xid="rule2">
   <col name="fTotalCharge" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default8">$model.getTotalCharge()</expr></calculate> </col> 
   <readonly xid="readonly1">
    <expr xid="default9">getCurrentRow() &amp;&amp; $model.dCarUseRecord.val(&quot;fStatus&quot;) == 1</expr></readonly> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseRecordFeeDetail"
      concept="OA_CA_CarRecordFeeDetail" autoLoad="true"> 
      <reader xid="default1" action="/OA/car/logic/action/queryCACarRecordFeeDetailAction"/>  
      <writer xid="default2" action="/OA/car/logic/action/saveCACarRecordFeeDetailAction"/>  
      <creator xid="default3" action="/OA/car/logic/action/createCACarRecordFeeDetailAction"/>  
      <calculateRelation relation="recordNO" xid="calculateRelation1" type="Integer"/>  
      <master xid="default6" data="dCarUseRecord" relation="fMasterID"/> 
    <rule xid="rule1">
   <col name="recordNO" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default4">$row.index()+1</expr></calculate> </col> 
   <readonly xid="readonly2">
    <expr xid="default10">getCurrentRow() &amp;&amp; $model.dCarUseRecord.val(&quot;fStatus&quot;) == 1</expr></readonly> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dFeeKind"
      concept="OA_Pub_BaseCode">
      <reader xid="default7" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='费用类别']]></filter>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    style="left:348px;top:37px;" src="$UI/OA/car/process/dialog/selectCarUseApplyDialog/selectCarUseApplyDialog.w"
    onReceive="windowDialogReceive" status="normal" width="90%" height="90%"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'dCarUseRecord.new'}" xid="button9"> 
          <i xid="i9"/>  
          <span xid="span11"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'dCarUseRecord.save'}" xid="button7"> 
          <i xid="i7"/>  
          <span xid="span9"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'dCarUseRecord.delete'}" xid="button8"> 
          <i xid="i8"/>  
          <span xid="span10"/> 
        </a> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="btnSubmitDOMActivate" xid="btnSubmit" label="提交" bind-disable=' $model.dCarUseRecord.val("fStatus") == 1'>
   <i xid="i2"></i>
   <span xid="span2">提交</span></a></div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="基本信息" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span4"><![CDATA[基本信息]]></span> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col24"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseRecord.label('fNO')"/>  
                <div class="x-edit" xid="div1"> 
                   
                <div class="input-group" xid="inputGroup1">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fNO')" readonly="true" xid="input9" style="border-right-style:none;"/><div class="input-group-addon" xid="span14" style="background-color:transparent;border-left-style:none;" bind-click="selectCarUseApplyClick">
    <i xid="i11" class="icon-android-search"></i></div></div></div>  
                </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col32"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit2"> 
                <label class="x-label" xid="label2" style="width:100px;" bind-text="dCarUseRecord.label('fCode')"/>  
                <div class="x-edit" xid="div2"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fCode')" readonly="true"
                    xid="input11"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fName')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fName')" readonly="true"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fCarDriverName')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fCarDriverName')"
                    readonly="true"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fApplyDeptName')"/>  
                <div class="x-edit" xid="div3"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="orgSelectPC1" bind-ref="dCarUseRecord.ref('fApplyDeptID')"
                    bind-labelRef="dCarUseRecord.ref('fApplyDeptName')" includeOrgKind="ogn,dpt"
                    includeDisabled="false"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="true" xid="dOrg" limit="-1"/>  
                    <option xid="option1" value="SA_OPOrg" label="sName"> 
                      <columns xid="columns2"> 
                        <column name="sName" xid="column5"/> 
                      </columns> 
                    </option> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fApplyPsnName')"/>  
                <div class="x-edit" xid="div3"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="treeSltPsm" bind-ref="dCarUseRecord.ref('fApplyPsnID')" bind-labelRef="dCarUseRecord.ref('fApplyPsnName')"
                    onShowOption="treeSltPsmShowOption" onHideOption="treeSltPsmHideOption"
                    includeOrgKind="psm" includeDisabled="true"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="true" xid="dPsm" limit="-1"> 
                      <treeOption xid="default5" rootFilter="1=1"/> 
                    </div>  
                    <option xid="option2" value="SA_OPOrg" label="sName"> 
                      <columns xid="columns3"> 
                        <column name="sName" xid="column6"/> 
                      </columns> 
                    </option> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fBeginTime')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fBeginTime')"
                    xid="input4"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fEndTime')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fEndTime')"
                    xid="input3"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fBeginMileage')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fBeginMileage')"
                    xid="input6"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fEndMileage')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fEndMileage')"
                    xid="input5"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fMileage')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fMileage')"
                    xid="input8"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fTotalCharge')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fTotalCharge')"
                    xid="input7"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fRemark')"/>  
                <div class="x-edit" xid="div3"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="textarea1" bind-ref="dCarUseRecord.ref('fRemark')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fCreatePsnName')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fCreatePsnName')"
                    xid="input2" readonly="true"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput1"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseRecord.label('fCreateTime')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseRecord" bind-ref="dCarUseRecord.ref('fCreateTime')"
                    xid="input1" readonly="true"/> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="费用明细" xid="controlGroup2"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span5">title</span> 
        </div>  
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar2"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{operation:'dCarUseRecordFeeDetail.save'}" xid="button3"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{operation:'dCarUseRecordFeeDetail.delete'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span6"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{operation:'dCarUseRecordFeeDetail.new'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span7"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{operation:'dCarUseRecordFeeDetail.refresh'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span8"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
          altRows="true" class="x-grid-no-bordered" xid="grid1" data="dCarUseRecordFeeDetail"
          showRowNumber="true" width="100%" height="auto"> 
          <columns xid="columns1">
            <column name="fChargeTypeName" xid="column1" editable="true">
              <editor xid="editor1"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="ref('fChargeTypeID')" bind-labelRef="ref('fChargeTypeName')">
   <option xid="option3" data="dFeeKind" value="fCode" label="fName"></option></div></editor>
            </column>  
            <column name="fAmount" xid="column2" label="金额" editable="true">
              <editor xid="editor2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit-focusin"
                  xid="input10" bind-ref="ref('fAmount')"/>
              </editor>
            </column>  
            <column name="fDescription" xid="column3" editable="true">
              <editor xid="editor3"> 
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit-focusin"
                  xid="input12" bind-ref="ref('fDescription')"/>
              </editor>
            </column>
          </columns> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
