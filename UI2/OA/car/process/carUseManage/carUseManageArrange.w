<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:491px;top:138px;height:126px;width:183px;"
    xui:update-mode="insert" xui:parent="" onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseManage"
      directDelete="true" autoLoad="false" concept="OA_CA_CarManage" orderBy="" autoNew="false"
      onBeforeSave="dCarUseManageBeforeSave"> 
      <reader action="/OA/car/logic/action/queryCACarManageAction"/>  
      <writer action="/OA/car/logic/action/saveCACarManageAction"/>  
      <creator action="/OA/car/logic/action/createCACarManageAction"/> 
    <rule xid="rule1">
   <col name="fBeginTime" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default9">true</expr></required> </col> 
   <col name="fEndTime" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default10">true</expr></required> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDriverInfo"
      concept="OA_CA_DriverBasicInfo"> 
      <reader xid="default4" action="/OA/car/logic/action/queryCADriverBasicInfoAction"/> 
    </div>
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseManageArrange"
      concept="OA_CA_CarManageArrange" autoLoad="true"> 
      <reader xid="default1" action="/OA/car/logic/action/queryCACarManageArrangeDetailAction"/>  
      <writer xid="default2" action="/OA/car/logic/action/saveCACarManageArrangeAction"/>  
      <creator xid="default3" action="/OA/car/logic/action/createCACarManageArrangeAction"/>  
      <master xid="default8" data="dCarUseManage" relation="fMasterID"/> 
    <rule xid="rule2">
   <col name="fCarKindID" xid="ruleCol3">
    <readonly xid="readonly1">
     <expr xid="default11">true</expr></readonly> </col> 
   <col name="fName" xid="ruleCol4">
    <readonly xid="readonly2">
     <expr xid="default12">true</expr></readonly> </col> 
   <col name="fCarKindName" xid="ruleCol5">
    <readonly xid="readonly3">
     <expr xid="default13">true</expr></readonly> </col> 
   <col name="fCode" xid="ruleCol6">
    <readonly xid="readonly4">
     <expr xid="default14">true</expr></readonly> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="isRoundtripData" idColumn="isRoundtrip"> 
      <column label="是否往返" name="isRoundtrip" type="String" xid="default6"/>  
      <data xid="default7">[{"isRoundtrip":"单程"},{"isRoundtrip":"双程"}]</data> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectCars"
    src="$UI/OA/car/process/dialog/selcetCarsDialog/selectCarsDialog.w" onReceive="dlgSelectCarsReceive"
    status="normal" style="left:47px;top:156px;" xui:update-mode="insert" xui:parent=""/>  
  <div xid="view" xui:update-mode="insert" xui:parent=""> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="moreBtn" onClick="{operation:'dCarUseManage.new'}"> 
        <i xid="i15"/>  
        <span xid="span15">新增</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'dCarUseManage.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a> 
    </div>  
    <div xid="content"> 
      <h1 xid="h11" class="text-center">用车申请单</h1>  
      <div class="x-control-group" collapsible="true" component="$UI/system/components/justep/controlGroup/controlGroup"
        title="用车安排" xid="controlGroup211" xui:before="controlGroup1" xui:parent="content"
        xui:update-mode="insert"> 
        <div class="x-control-group-title" xid="controlGroupTitle211"> 
          <span xid="span211">用车安排</span> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form1"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseManageArrange.label('fCode')"/>  
                <div class="x-edit" xid="div1"> 
                   
                <div class="input-group" xid="inputGroup2">
    <input bind-ref="dCarUseManageArrange.ref('fCode')" class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseManage" xid="fCode" style="border-right-style:none;" /><div class="input-group-addon" xid="div4" style="background-color:transparent;border-left-style:none;" bind-click="selectCarClick">
    <i xid="i111" class="icon-android-search"></i></div></div></div>  
                </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col17"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit2"> 
                <label class="x-label" xid="label2" style="width:100px;" bind-text="dCarUseManageArrange.label('fCarDriverName')"/>  
                <div class="x-edit" xid="div2"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                    xid="gridSelect1" bind-ref="dCarUseManageArrange.ref('fCarDriverID')"
                    bind-labelRef="dCarUseManageArrange.ref('fCarDriverName')"> 
                    <option xid="option4" data="dDriverInfo" value="fCode" label="fName"/> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManageArrange.label('fName')"/>  
                <div class="x-edit" xid="div3"> 
                  <input bind-ref="dCarUseManageArrange.ref('fName')" class="form-control"
                    component="$UI/system/components/justep/input/input" data="dCarUseManage"
                    xid="input4"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManageArrange.label('fCarKindName')"/>  
                <div class="x-edit" xid="div3"> 
                  <input bind-ref="dCarUseManageArrange.ref('fCarKindName')"
                    class="form-control" component="$UI/system/components/justep/input/input"
                    data="dCarUseManage" xid="input3"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManageArrange.label('fTelephone')"/>  
                <div class="x-edit" xid="div3"> 
                  <input bind-ref="dCarUseManageArrange.ref('fTelephone')" class="form-control"
                    component="$UI/system/components/justep/input/input" data="dCarUseManage"
                    xid="input6"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManageArrange.label('fArgnPsnName')"/>  
                <div class="x-edit" xid="div3"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="orgSelectPC1" bind-ref="dCarUseManageArrange.ref('fArgnPsnID')"
                    bind-labelRef="dCarUseManageArrange.ref('fArgnPsnName')"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="true" xid="pOrgData"/>  
                    <option xid="option3" value="SA_OPOrg" label="sName"> 
                      <columns xid="columns3"> 
                        <column name="sName" xid="column3"/> 
                      </columns> 
                    </option> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="基本信息" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span7"> <![CDATA[基本信息]]> </span> 
        </div>  
        <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row4"> 
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fNO')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseManage.ref('fNO')" xid="input2" readonly="true"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fIsRoundtrip')"/>  
                <div class="x-edit" xid="div3"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="fIsRoundtrip" bind-ref="dCarUseManage.ref('fIsRoundtrip')" bind-labelRef="dCarUseManage.ref('fIsRoundtrip')">
   <option xid="option5" data="isRoundtripData" value="isRoundtrip" label="isRoundtrip"></option></div></div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fApplyDeptName')"/>  
                <div class="x-edit" xid="div3"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="treeSltDept" bind-ref="dCarUseManage.ref('fApplyDeptID')"
                    bind-labelRef="dCarUseManage.ref('fApplyDeptName')" includeOrgKind="ogn,dpt"
                    includeDisabled="true"> 
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
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fApplyPsnName')"/>  
                <div class="x-edit" xid="div3"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="treeSltPsm" bind-ref="dCarUseManage.ref('fApplyPsnID')" bind-labelRef="dCarUseManage.ref('fApplyPsnName')"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="true" xid="dPsm" limit="-1"> 
                      <treeOption xid="default5" rootFilter="1=1"/> 
                    </div>  
                    <option xid="option2" value="SA_OPOrg" label="sName"> 
                      <columns xid="columns2"> 
                        <column name="sName" xid="column2"/> 
                      </columns> 
                    </option> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fApplyDate')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseManage.ref('fApplyDate')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fPersonCount')"/>  
                <div class="x-edit" xid="div3"> 
                  <input xid="fApplyDate" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseManage.ref('fPersonCount')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fDestination')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseManage.ref('fDestination')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fTelephone')"/>  
                <div class="x-edit" xid="div3"> 
                  <input xid="fDestination" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseManage.ref('fTelephone')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fBeginTime')"/>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseManage.ref('fBeginTime')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fEndTime')"/>  
                <div class="x-edit" xid="div3"> 
                  <input xid="fBeginTime" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="dCarUseManage.ref('fEndTime')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fApplyReason')"/>  
                <div class="x-edit" xid="div3"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="textarea1" bind-ref="dCarUseManage.ref('fApplyReason')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fDriveCircuit')"/>  
                <div class="x-edit" xid="div3"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="textarea2" bind-ref="dCarUseManage.ref('fDriveCircuit')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="dCarUseManage.label('fRemark')"/>  
                <div class="x-edit" xid="div3"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="textarea3" bind-ref="dCarUseManage.ref('fRemark')"/> 
                </div> 
              </div> 
            </div> 
          </div>
        </div> 
      </div>  
      <div class="x-panel-bottom" xid="bottom1" height="42"></div> 
    </div> 
  </div> 
</div>
