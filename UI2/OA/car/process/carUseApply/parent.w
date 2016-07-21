<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xui="http://www.justep.com/xui" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:449px;top:22px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseApply"
      directDelete="true" autoLoad="false" concept="OA_CA_CarUseApply" orderBy=""
      columns="" autoNew="false" onValueChanged="dCarUseApplyValueChanged"> 
      <reader action="/OA/car/logic/action/queryCACarUseApplyAction"/>  
      <writer action="/OA/car/logic/action/saveCACarUseApplyAction"/>  
      <creator action="/OA/car/logic/action/createCACarUseApplyAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseArrange"
      concept="OA_CA_CarUseArrange" autoLoad="true"> 
      <reader xid="default1" action="/OA/car/logic/action/queryCACarUseArrangeAction"/>  
      <writer xid="default2" action="/OA/car/logic/action/saveCACarUseArrangeAction"/>  
      <creator xid="default3" action="/OA/car/logic/action/createCACarUseArrangeAction"/>  
      <master xid="default8" data="dCarUseApply" relation="fMasterID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDriverInfo"
      concept="OA_CA_DriverBasicInfo"> 
      <reader xid="default4" action="/OA/car/logic/action/queryCADriverBasicInfoAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="isRoundtripData" idColumn="isRoundtrip"> 
      <column label="是否往返" name="isRoundtrip" type="String" xid="default6"/>  
      <data xid="default7">[{"isRoundtrip":"单程"},{"isRoundtrip":"双程"}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dCarUseApply"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectCars"
    src="$UI/OA/car/process/dialog/selcetCarsDialog/selectCarsDialog.w" onReceive="dlgSelectCarsReceive"
    status="normal"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="carUseReportWindowDialog"
    style="left:47px;top:73px;" src="$UI/OA/car/process/carUseReport/carUseReport.w"
    status="normal" showTitle="true"/>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'dCarUseApply.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2"/> 
      </a>  
      
      <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
        label="流程图" onClick="{operation:'process.showChart'}" xid="chartBtn" xui:before="moreBtn"
        xui:parent="mainBar" xui:update-mode="insert"> 
        <i xid="i11"/>  
        <span xid="span11">流程图</span>
      </a>
      <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
        label="流程记录" onClick="{operation:'process.processRecord'}" xid="RecordBtn"
        xui:before="moreBtn" xui:parent="mainBar" xui:update-mode="insert"> 
        <i xid="i21"/>  
        <span xid="span21">流程记录</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label"
        label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
        <i xid="i15" class="icon-ios7-more"/>  
        <span xid="span15">更多</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label"
        label="打印" xid="printBtn" icon="icon-printer" onClick="printBtnClick"> 
        <i xid="i6" class="icon-printer"/>  
        <span xid="span8">打印</span> 
      </a> 
    </div>  
    <div xid="content"> 
      <h1 xid="h11" class="text-center">用车申请单</h1>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="基本信息" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span7"><![CDATA[基本信息]]></span> 
        </div>  
        <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApply.label('fNO')"/>  
                <div class="x-edit" xid="div1"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseApply.ref('fNO')" xid="input2" readonly="true"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit2"> 
                <label class="x-label" xid="label2" style="width:100px;" bind-text="dCarUseApply.label('fIsRoundtrip')"/>  
                <div class="x-edit" xid="div2"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="fIsRoundtrip" bind-ref="dCarUseApply.ref('fIsRoundtrip')" bind-labelRef="dCarUseApply.ref('fIsRoundtrip')">
   <option xid="option2" data="isRoundtripData" value="isRoundtrip" label="isRoundtrip"></option></div></div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit4"> 
                <label class="x-label" xid="label4" style="width:100px;" bind-text="dCarUseApply.label('fApplyDeptName')"/>  
                <div class="x-edit" xid="div4"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="treeSltDept" bind-ref="dCarUseApply.ref('fApplyDeptID')"
                    bind-labelRef="dCarUseApply.ref('fApplyDeptName')" includeOrgKind="ogn,dpt"
                    includeDisabled="false"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="true" xid="dOrg" limit="-1"/>  
                    <option xid="option1" value="SA_OPOrg" label="sName"> 
                      <columns xid="columns1"> 
                        <column name="sName" xid="column1"/> 
                      </columns> 
                    </option> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit5"> 
                <label class="x-label" xid="label5" style="width:100px;" bind-text="dCarUseApply.label('fApplyPsnName')"/>  
                <div class="x-edit" xid="div5"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="treeSltPsm" bind-ref="dCarUseApply.ref('fApplyPsnID')" bind-labelRef="dCarUseApply.ref('fApplyPsnName')"
                    includeOrgKind="psm" includeDisabled="true" onShowOption="treeSltPsmShowOption"
                    onHideOption="treeSltPsmHideOption"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="false" xid="dPsm" limit="-1"> 
                      <treeOption xid="default5" delayLoad="false" rootFilter="1=1"/> 
                    </div>  
                    <option xid="option5" value="sPersonID" label="sName"> 
                      <columns xid="columns2"> 
                        <column name="sName" xid="column2"/> 
                      </columns> 
                    </option> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col15"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit6"> 
                <label class="x-label" xid="label6" style="width:100px;" bind-text="dCarUseApply.label('fPersonCount')"/>  
                <div class="x-edit" xid="div6"> 
                  <input xid="fApplyDate" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseApply.ref('fPersonCount')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col15"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit6"> 
                <label class="x-label" xid="label6" style="width:100px;" bind-text="dCarUseApply.label('fApplyDate')"/>  
                <div class="x-edit" xid="div6"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseApply.ref('fApplyDate')" xid="input1"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit7"> 
                <label class="x-label" xid="label6" style="width:100px;" bind-text="dCarUseApply.label('fDestination')"/>  
                <div class="x-edit" xid="div7"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseApply.ref('fDestination')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit7"> 
                <label class="x-label" xid="label6" style="width:100px;" bind-text="dCarUseApply.label('fTelephone')"/>  
                <div class="x-edit" xid="div7"> 
                  <input xid="fDestination" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseApply.ref('fTelephone')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit7"> 
                <label class="x-label" xid="label6" style="width:100px;" bind-text="dCarUseApply.label('fBeginTime')"/>  
                <div class="x-edit" xid="div7"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseApply.ref('fBeginTime')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit7"> 
                <label class="x-label" xid="label6" style="width:100px;" bind-text="dCarUseApply.label('fEndTime')"/>  
                <div class="x-edit" xid="div7"> 
                  <input xid="fBeginTime" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseApply.ref('fEndTime')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col16"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit7"> 
                <label class="x-label" xid="label6" style="width:100px;" bind-text="dCarUseApply.label('fApplyReason')"/>  
                <div class="x-edit" xid="div7"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="textarea1" bind-ref="dCarUseApply.ref('fApplyReason')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col16"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit7"> 
                <label class="x-label" xid="label6" style="width:100px;" bind-text="dCarUseApply.label('fDriveCircuit')"/>  
                <div class="x-edit" xid="div7"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="textarea2" bind-ref="dCarUseApply.ref('fDriveCircuit')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col16"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit7"> 
                <label class="x-label" xid="label6" style="width:100px;" bind-text="dCarUseApply.label('fRemark')"/>  
                <div class="x-edit" xid="div7"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="textarea3" bind-ref="dCarUseApply.ref('fRemark')"/> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
