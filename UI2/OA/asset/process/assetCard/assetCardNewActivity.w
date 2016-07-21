<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:249px;top:365px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_AS_Card" limit="-1" columns="" autoNew="true"> 
      <reader action="/OA/asset/logic/action/queryASMyAssetAction" xid="default1"/>  
      <writer action="/OA/asset/logic/action/saveASCardAction" xid="default2"/>  
      <creator action="/OA/asset/logic/action/createASCardAction" xid="default3"/>  
      <calculateRelation relation="calcCheckBox" xid="calculateRelation1"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="kindData"
      concept="OA_Pub_BaseCode" autoLoad="true"> 
      <reader xid="default5" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default6" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"/>  
      <creator xid="default7" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"/>  
      <filter name="filter0" xid="filter1">OA_Pub_BaseCode.fScope='固定资产类别' and OA_Pub_BaseCode.fUseStatusName='启用'</filter>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="unitData"
      concept="OA_Pub_BaseCode" autoLoad="true"> 
      <reader xid="default12" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default13" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"/>  
      <creator xid="default14" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"/>  
      <filter name="filter1" xid="filter2">OA_Pub_BaseCode.fScope='办公用品计量单位' and OA_Pub_BaseCode.fUseStatusName='启用'</filter>
    </div>
  <div component="$UI/system/components/justep/data/bizData" xid="sourceData" concept="OA_Pub_BaseCode" autoLoad="true">
   <reader xid="default10" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default11" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
   <creator xid="default15" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
   <filter name="filter1" xid="filter4"><![CDATA[OA_Pub_BaseCode.fScope='资产入库类型' and OA_Pub_BaseCode.fUseStatusName='启用']]></filter></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="statusData" idColumn="value"><column label="值" name="value" type="String" xid="xid1"></column>
  <column label="名" name="label" type="String" xid="xid2"></column>
  <data xid="default16">[{&quot;value&quot;:&quot;0&quot;,&quot;label&quot;:&quot;闲置&quot;},{&quot;value&quot;:&quot;1&quot;,&quot;label&quot;:&quot;占用&quot;},{&quot;value&quot;:&quot;2&quot;,&quot;label&quot;:&quot;报废&quot;},{&quot;value&quot;:&quot;3&quot;,&quot;label&quot;:&quot;处理&quot;}]</data></div></div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgAssetInRecord"
    style="left:237px;top:10px;" title="入库信息" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgCheck"
    style="left:287px;top:10px;" title="验收信息" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgUseRecord"
    style="left:337px;top:10px;" title="使用记录" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgRepair"
    style="left:387px;top:10px;" title="维修记录" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgInventory"
    style="left:437px;top:10px;" title="清查记录" status="normal" showTitle="true"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgBuyRecord"
    style="left:487px;top:10px;" title="采购信息" status="normal" showTitle="true"/>  
  <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar"
    class="x-toolbar x-toolbar-spliter form-inline"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'mainData.save'}" xid="button1"> 
      <i xid="i4"/>  
      <span xid="span2"/>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="入库信息" xid="trgAssetInRecord" onClick="trgAssetInRecordClick" icon="icon-android-system-windows"> 
      <i xid="i1" class="icon-android-system-windows"/>  
      <span xid="span1">入库信息</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="采购信息" xid="trgBuyRecord" onClick="trgBuyRecordClick" icon="icon-android-system-windows"> 
      <i xid="i10" class="icon-android-system-windows"/>  
      <span xid="span16">采购信息</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="验收信息" xid="trgCheck" onClick="trgCheckClick" icon="icon-android-system-windows"> 
      <i xid="i2" class="icon-android-system-windows"/>  
      <span xid="span11">验收信息</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="使用记录" xid="trgUseRecord" onClick="trgUseRecordClick" icon="icon-android-system-windows"> 
      <i xid="i3" class="icon-android-system-windows"/>  
      <span xid="span13">使用记录</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="维修记录" xid="trgRepair" onClick="trgRepairClick" icon="icon-android-system-windows"> 
      <i xid="i7" class="icon-android-system-windows"/>  
      <span xid="span14">维修记录</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="清查记录" xid="trgInventory" onClick="trgInventoryClick" icon="icon-android-system-windows"> 
      <i xid="i9" class="icon-android-system-windows"/>  
      <span xid="span15">清查记录</span> 
    </a> 
  </div>  
  <div class="container-fluid" xid="div1"> 
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit1"> 
            <label class="x-label" xid="label1" bind-text="mainData.label('fKind')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div8"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                xid="gridSelect1" bind-ref="mainData.ref('fKindID')" bind-labelRef="mainData.ref('fKind')"> 
                <option xid="option1" data="kindData" value="OA_Pub_BaseCode" label="fName"/>
              </div>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit2"> 
            <label class="x-label" xid="label2" bind-text="mainData.label('fCode')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div9"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fCode" bind-ref="mainData.ref('fCode')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit3"> 
            <label class="x-label" xid="label3" bind-text="mainData.label('fName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div10"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fName" bind-ref="mainData.ref('fName')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit6"> 
            <label class="x-label" xid="label4" bind-text="mainData.label('fSpecType')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div13"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fSpecType" bind-ref="mainData.ref('fSpecType')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit5"> 
            <label class="x-label" xid="label5" bind-text="mainData.label('fUnit')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div12"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                xid="gridSelect2" bind-ref="mainData.ref('fUnitID')" bind-labelRef="mainData.ref('fUnit')"> 
                <option xid="option2" data="unitData" value="OA_Pub_BaseCode" label="fName"/>
              </div>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit4"> 
            <label class="x-label" xid="label6" bind-text="mainData.label('fStatusName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div11"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3" bind-ref="mainData.ref('fStatus')" bind-labelRef="mainData.ref('fStatusName')">
   <option xid="option3" value="value" label="label" data="statusData"></option></div></div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelSelect1"> 
            <label class="x-label" xid="label9" bind-text="mainData.label('fDutyDeptName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div14"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC1" includeOrgKind="ogn,dpt" bind-ref="mainData.ref('fDutyDeptID')" bind-labelRef="mainData.ref('fDutyDeptName')">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="mdOrg"></div>
   <option xid="option5" value="sCode" label="sName">
    <columns xid="columns1">
     <column name="sName" xid="column1"></column></columns> </option> </div></div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelInput1"> 
            <label class="x-label" xid="label8" bind-text="mainData.label('fDutyPsnName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div15"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC2" includeOrgKind="psm" bind-ref="mainData.ref('fDutyPsnID')" bind-labelRef="mainData.ref('fDutyPsnName')">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1"><treeOption xid="default18" rootFilter="1=1"></treeOption></div>
   <option xid="option6" value="sCode" label="sName">
    <columns xid="columns2">
     <column name="sName" xid="column2"></column></columns> </option> </div>
  </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelInput2"> 
            <label class="x-label" xid="label7" bind-text="mainData.label('fSourceName')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div16"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4" bind-ref="mainData.ref('fSource')" bind-labelRef="mainData.ref('fSourceName')">
   <option xid="option4" data="sourceData" value="OA_Pub_BaseCode" label="fName"></option></div></div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelInput3"> 
            <label class="x-label" xid="label11" style="width:100px;">存放位置</label>  
            <div class="x-edit" xid="div19"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fExtendStr" bind-ref="mainData.ref('fExtendStr3')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col29"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelSelect10"> 
            <label class="x-label" xid="label31" bind-text="mainData.label('fOriginValue')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div33"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fOriginValue" bind-ref="mainData.ref('fOriginValue')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelInput8"> 
            <label class="x-label" xid="label32" bind-text="mainData.label('fAddDepreValue')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div32"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fAddDepreValue" bind-ref="mainData.ref('fAddDepreValue')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col30"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelInput7"> 
            <label class="x-label" xid="label33" bind-text="mainData.label('fRemainValue')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div37"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fRemainValue" bind-ref="mainData.ref('fRemainValue')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col26"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelInput9"> 
            <label class="x-label" xid="label28" bind-text="mainData.label('fServiceYear')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div34"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fServiceYear" bind-ref="mainData.ref('fServiceYear')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelSelect7"> 
            <label class="x-label" xid="label27" bind-text="mainData.label('fBgDepreYear')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div35"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fBgDepreYear" bind-ref="mainData.ref('fBgDepreYear')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col25"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelSelect8"> 
            <label class="x-label" xid="label26" bind-text="mainData.label('fBgDepreMonth')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div36"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="output16" bind-ref="mainData.ref('fBgDepreMonth')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col33"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit14"> 
            <label class="x-label" xid="label29" bind-text="mainData.label('fFactory')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div40"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fFactory" bind-ref="mainData.ref('fFactory')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit13"> 
            <label class="x-label" xid="label30" bind-text="mainData.label('fFactoryDate')"
              style="width:100px;"/>  
            <div class="x-edit" xid="div39"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fFactoryDate" bind-ref="mainData.ref('fFactoryDate')"/>
            </div> 
          </div> 
        </div>
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col34"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit15"> 
            <label class="x-label" xid="label34" style="width:100px;" bind-text="mainData.label('fSupplier')"/>  
            <div class="x-edit" xid="div41"> 
              <input component="$UI/system/components/justep/input/input" class="x-output form-control"
                xid="fSupplier" bind-ref="mainData.ref('fSupplier')"/>
            </div> 
          </div> 
        </div>
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col35"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit16"> 
            <label class="x-label" xid="label35" style="width:100px;" bind-text="mainData.label('fDetailInfo')"/>  
            <div class="x-edit" xid="div42"> 
              <textarea component="$UI/system/components/justep/textarea/textarea" class="x-output form-control"
                xid="fDetailInfo" bind-ref="mainData.ref('fDetailInfo')"/>
            </div> 
          </div> 
        </div>
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col36"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label20" xid="labelEdit17"> 
            <label class="x-label" xid="label36" style="width:100px;" bind-text="mainData.label('fRemark')"/>  
            <div class="x-edit" xid="div43"> 
              <textarea component="$UI/system/components/justep/textarea/textarea" class="x-output form-control"
                xid="fRemark" bind-ref="mainData.ref('fRemark')"/>
            </div> 
          </div> 
        </div>
      </div> 
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/> 
</div>
