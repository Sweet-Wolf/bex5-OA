<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:422px;top:176px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dCarBasicInfo"
      directDelete="true" autoLoad="false" concept="OA_CA_CarBasicInfo" columns=""
      autoNew="false" onSaveCommit="dCarBasicInfoSaveCommit"> 
      <reader action="/OA/car/logic/action/queryCACarBasicInfoAction"/>  
      <writer action="/OA/car/logic/action/saveCACarBasicInfoAction"/>  
      <creator action="/OA/car/logic/action/createCACarBasicInfoAction"/>  
      <calculateRelation relation="calcCheckBox"/>  
      <rule xid="rule4"> 
        <readonly xid="readonly3"> 
          <expr xid="default19">js:getCurrentRow() &amp;&amp; val("fUseStatus") == '1'</expr> 
        </readonly>  
        <col name="fCode" xid="ruleCol7"> 
          <required xid="required7"> 
            <expr xid="default20">undefined</expr>  
            <message xid="default21"/> 
          </required> 
        </col>  
        <col name="fName" xid="ruleCol8"> 
          <required xid="required8"> 
            <expr xid="default22">undefined</expr>  
            <message xid="default23"/> 
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dCarKind"
      concept="OA_Pub_BaseCode" limit="-1"> 
      <reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/> 
    <filter name="filter2" xid="filter3"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='车辆类型']]></filter></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dCarDriver"
      concept="OA_CA_DriverBasicInfo" limit="-1"> 
      <reader xid="default2" action="/OA/car/logic/action/queryCADriverBasicInfoAction"/> 
    <filter name="filter0" xid="filter1"><![CDATA[OA_CA_DriverBasicInfo.fUseStatus=1]]></filter></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dUseKind"
      concept="OA_Pub_BaseCode" limit="-1"> 
      <reader xid="default3" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/> 
    <filter name="filter1" xid="filter2"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='使用性质']]></filter></div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgCarSafetyInfo"
    status="normal" src="$UI/OA/car/process/dialog/upDateCarSafetyInfo/upDateCarSafetyInfo.w" showTitle="true" title="保险情况"/>  
  <div class="x-toolbar form-inline x-toolbar-spliter" component="$UI/system/components/justep/toolBar/toolBar"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dCarBasicInfo.new'}" xid="button4"> 
      <i xid="i4"/>  
      <span xid="span7"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dCarBasicInfo.save'}" xid="button1"> 
      <i xid="i2"/>  
      <span xid="span5"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dCarBasicInfo.delete'}" xid="button3"> 
      <i xid="i3"/>  
      <span xid="span6"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dCarBasicInfo.refresh'}" xid="button5"> 
      <i xid="i7"/>  
      <span xid="span8"/> 
    </a>  
    <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
      icon="icon-ios7-play" label="启用" xid="trgStartUse" onClick="trgStartUseClick"> 
      <i class="icon-ios7-play" xid="i8"/>  
      <span xid="span12">启用</span> 
    </a>  
    <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
      icon="icon-ios7-pause" label="停用" xid="trgStopUse" onClick="trgStopUseClick"> 
      <i class="icon-ios7-pause" xid="i10"/>  
      <span xid="span14">停用</span> 
    </a>  
    <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
      label="年审情况" xid="trgYear" onClick="trgYearClick"> 
      <i xid="i5"/>  
      <span xid="span3">年审情况</span> 
    </a>  
    <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
      label="保险情况" xid="trgSafe" onClick="trgSafeClick"> 
      <i xid="i6"/>  
      <span xid="span4">保险情况</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="基本信息" xid="carBasicInfoBasic" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span2"><![CDATA[基本信息]]></span> 
    </div>  
    <div xid="div1"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1"> 
        <div class="col col-xs-8 col-sm-8 col-md-8 col-lg-8" xid="col1"> 
          <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
            xid="form1"> 
            <div class="form-group" xid="formGroup1"> 
              <div class="col-sm-2" xid="col4"> 
                <label class="control-label" bind-text="dCarBasicInfo.label('fCode')"
                  xid="fCodeLabel"/> 
              </div>  
              <div class="col-sm-4" xid="col5"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCode')" xid="input1"/> 
              </div>  
              <div class="col-sm-2" xid="col6"> 
                <label class="control-label" bind-text="dCarBasicInfo.label('fName')"
                  xid="controlLabel1"/> 
              </div>  
              <div class="col-sm-4" xid="col7"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fName')" xid="input2"/> 
              </div> 
            </div>  
            <div class="form-group" xid="formGroup2"> 
              <div class="col-sm-2" xid="col8"> 
                <label class="control-label" bind-text="dCarBasicInfo.label('fType')"
                  xid="controlLabel2"/> 
              </div>  
              <div class="col-sm-4" xid="col9"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fType')" xid="input3"/> 
              </div>  
              <div class="col-sm-2" xid="col10"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCarKindName&quot;)"
                  xid="controlLabel3"/> 
              </div>  
              <div class="col-sm-4" xid="col11"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3" bind-ref="dCarBasicInfo.ref('fCarKindID')" bind-labelRef="dCarBasicInfo.ref('fCarKindName')">
   <option xid="option5" data="dCarKind" value="fCode" label="fName"></option></div></div> 
            </div>  
            <div class="form-group" xid="formGroup3"> 
              <div class="col-sm-2" xid="col12"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCheckPsnNum&quot;)"
                  xid="controlLabel4"/> 
              </div>  
              <div class="col-sm-4" xid="col13"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCheckPsnNum')"
                  xid="input5"/> 
              </div>  
              <div class="col-sm-2" xid="col14"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCheckLoad&quot;)"
                  xid="controlLabel5"/> 
              </div>  
              <div class="col-sm-4" xid="col15"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCheckLoad')"
                  xid="input6"/> 
              </div> 
            </div>  
            <div class="form-group" xid="formGroup4"> 
              <div class="col-sm-2" xid="col16"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCheckOilConsumption&quot;)"
                  xid="controlLabel6"/> 
              </div>  
              <div class="col-sm-4" xid="col17"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCheckOilConsumption')"
                  xid="input7"/> 
              </div>  
              <div class="col-sm-2" xid="col18"> 
                <label class="control-label" bind-text="$model.dCarBasicInfo.label(&quot;fDisplacement&quot;)"
                  xid="controlLabel7"/> 
              </div>  
              <div class="col-sm-4" xid="col19"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fDisplacement')"
                  xid="input8"/> 
              </div> 
            </div>  
            <div class="form-group" xid="formGroup5"> 
              <div class="col-sm-2" xid="col20"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fOilGrade&quot;)"
                  xid="controlLabel8"/> 
              </div>  
              <div class="col-sm-4" xid="col21"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fOilGrade')" xid="input9"/> 
              </div>  
              <div class="col-sm-2" xid="col22"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCarFrameNo&quot;)"
                  xid="controlLabel9"/> 
              </div>  
              <div class="col-sm-4" xid="col23"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCarFrameNo')"
                  xid="input10"/> 
              </div> 
            </div>  
            <div class="form-group" xid="formGroup6"> 
              <div class="col-sm-2" xid="col24"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCarEngineNo&quot;)"
                  xid="controlLabel10"/> 
              </div>  
              <div class="col-sm-4" xid="col25"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fCarEngineNo')"
                  xid="input11"/> 
              </div>  
              <div class="col-sm-2" xid="col26"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCarDriverName&quot;)"
                  xid="controlLabel11"/> 
              </div>  
              <div class="col-sm-4" xid="col27"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="dCarBasicInfo.ref('fCarDriverID')" bind-labelRef="dCarBasicInfo.ref('fCarDriverName')">
   <option xid="option3" data="dCarDriver" value="fCode" label="fName"></option></div></div> 
            </div>  
            <div class="form-group" xid="formGroup7"> 
              <div class="col-sm-2" xid="col28"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fUseKindName&quot;)"
                  xid="controlLabel12"/> 
              </div>  
              <div class="col-sm-4" xid="col29"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" bind-ref="dCarBasicInfo.ref('fUseKindID')" bind-labelRef="dCarBasicInfo.ref('fUseKindName')">
   <option xid="option4" data="dUseKind" value="fCode" label="fName"></option></div></div>  
              <div class="col-sm-2" xid="col30"> 
                <label class="control-label" bind-text="$model.dCarBasicInfo.label(&quot;fUseStatusName&quot;)"
                  xid="controlLabel13"/> 
              </div>  
              <div class="col-sm-4" xid="col31"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fUseStatusName')"
                  xid="fUseStatusName"/> 
              </div> 
            </div>  
            <div class="form-group" xid="formGroup8"> 
              <div class="col-sm-2" xid="col37"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fDutyDeptName&quot;)"
                  xid="controlLabel14"/> 
              </div>  
              <div class="col-sm-4" xid="col38"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                  xid="orgSelectPC1" bind-ref="dCarBasicInfo.ref('fDutyDeptID')" bind-labelRef="dCarBasicInfo.ref('fDutyDeptName')"
                  includeOrgKind="ogn,dpt" includeDisabled="true"> 
                  <div component="$UI/system/components/justep/data/bizData"
                    autoLoad="true" xid="dOrg" limit="-1"/>  
                  <option xid="option1" value="SA_OPOrg" label="sName"> 
                    <columns xid="columns1"> 
                      <column name="sName" xid="column1"/> 
                    </columns> 
                  </option> 
                </div> 
              </div>  
              <div class="col-sm-2" xid="col39"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fDutyPsnName&quot;)"
                  xid="controlLabel15"/> 
              </div>  
              <div class="col-sm-4" xid="col40"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                  xid="orgSelectPC2" bind-ref="dCarBasicInfo.ref('fDutyDeptID')" bind-labelRef="dCarBasicInfo.ref('fDutyDeptName')"> 
                  <div component="$UI/system/components/justep/data/bizData"
                    autoLoad="true" xid="dPsm" limit="-1"> 
                    <treeOption xid="default4" rootFilter="1=1"/> 
                  </div>  
                  <option xid="option2" value="SA_OPOrg" label="sName"> 
                    <columns xid="columns2"> 
                      <column name="sName" xid="column2"/> 
                    </columns> 
                  </option> 
                </div> 
              </div> 
            </div>  
            <div class="form-group" xid="formGroup9"> 
              <div class="col-sm-2" xid="col36"> 
                <label class="control-label" bind-text=" $model.dCarBasicInfo.label(&quot;fCarAppendix&quot;)"
                  xid="controlLabel16"><![CDATA[c]]></label> 
              </div>  
              <div class="col-sm-10" xid="col35"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control x-edit" xid="textarea3" bind-ref="dCarBasicInfo.ref('fCarAppendix')"/> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-4 col-sm-4 col-md-4 col-lg-4" xid="col2" style="height:100%;"> 
          <div component="$UI/system/components/justep/attachment/attachmentImage"
            access="duud" xid="attachmentImage1" bind-ref="dCarBasicInfo.ref('fPhoto')"
            style="height:100%;width:100%;"> 
            <div class="x-attachment x-attachment-image" xid="div3"> 
              <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}"
                xid="div4"> 
                <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)"
                  xid="image1"/>  
                <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2"
                  class="x-remove-barget" xid="a1"/> 
              </div>  
              <div class="x-doc-process" xid="div5"> 
                <div class="progress-bar x-doc-process-bar" role="progressbar"
                  style="width:0%;" xid="div6"/> 
              </div>  
              <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)"
                xid="div7"> 
                <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                  xid="div8"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="资产信息" xid="assetsInfo" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span9">title</span> 
    </div>  
    <div xid="div2"> 
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form2"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row2"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col48"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit1"> 
              <label class="x-label" xid="label1" bind-text="dCarBasicInfo.label('fEquipmentNo')"
                style="width:100px;"/>  
              <div class="x-edit" xid="div9"> 
                 
              <div class="input-group" xid="inputGroup2">
    <input class="form-control" component="$UI/system/components/justep/input/input" data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fEquipmentNo')" xid="input4" style="border-right-style:none;"/><div class="input-group-addon" xid="span15" style="background-color:transparent;border-left-style:none;" bind-click="dlgselectAssetCardOpen">
    <i xid="i111" class="icon-android-search"></i></div></div></div>  
              </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col51"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit2"> 
              <label class="x-label" xid="label2" bind-text="dCarBasicInfo.label('fOriginValue')"
                style="width:100px;"/>  
              <div class="x-edit" xid="div10"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fOriginValue')"
                  xid="input12"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col52"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelInput1"> 
              <label class="x-label" xid="label3" bind-text="dCarBasicInfo.label('fRemainValue')"
                style="width:100px;"/>  
              <div class="x-edit" xid="div11"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  data="dCarBasicInfo" bind-ref="dCarBasicInfo.ref('fRemainValue')"
                  xid="input13"/> 
              </div> 
            </div> 
          </div> 
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col3">
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput2"> 
          <label class="x-label" xid="label4" bind-text="dCarBasicInfo.label('fRemark')" style="width:100px;" />  
          <div class="x-edit" xid="div12"> 
            <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit" xid="textarea2" bind-ref="dCarBasicInfo.ref('fRemark')" />
          </div> 
        </div>
      </div></div> 
         </div> 
    </div>  
   
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgselectAssetCard"
    src="$UI/OA/car/process/dialog/selectAssetCardDialog/selectAssetCardDialog.w"
    status="normal" onReceive="dlgselectAssetCardReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgCarYearCheckInfo"
    src="$UI/OA/car/process/dialog/upDateCarYearCheckInfo/upDateCarYearCheckInfo.w"
    status="normal" width="80%" height="80%" showTitle="true" title="年审情况"/> 
</div>
