<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_WM_EvecApply" 
      autoNew="true" onValueChanged="mainDataValueChanged"> 
      <reader action="/OA/workTime/logic/action/queryOA_WM_EvecApplyAction"/>  
      <writer action="/OA/workTime/logic/action/saveOA_WM_EvecApplyAction"/>  
      <creator action="/OA/workTime/logic/action/createOA_WM_EvecApplyAction"/>  
      <rule xid="rule1"> 
        <col name="fAPPLYDATE" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default1">true</expr>
          </readonly> 
        </col>  
        <col name="fSTARTTIME" xid="ruleCol2"> 
          <required xid="required1"> 
            <expr xid="default2">true</expr>
          </required> 
        </col>  
        <col name="fENDTIME" xid="ruleCol3"> 
          <required xid="required2"> 
            <expr xid="default3">true</expr>
          </required>  
          <constraint xid="constraint1"> 
            <expr xid="default7">$row.val("fENDTIME")&gt;$row.val("fSTARTTIME")</expr>
          </constraint> 
        </col>  
        <col name="fNUMBER" xid="ruleCol4"> 
          <readonly xid="readonly2"> 
            <expr xid="default4">true</expr>
          </readonly> 
        </col>  
        <col name="fBizStateName" xid="ruleCol5"> 
          <readonly xid="readonly3"> 
            <expr xid="default5">true</expr>
          </readonly> 
        </col>  
        <col name="fCreateTime" xid="ruleCol6"> 
          <readonly xid="readonly4"> 
            <expr xid="default6">true</expr>
          </readonly> 
        </col>  
        <col name="fPERSONNEL" xid="ruleCol7"> 
          <readonly xid="readonly5"> 
            <expr xid="default8">true</expr>
          </readonly> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="childData" concept="OA_WM_eveMember" directDelete="true" confirmDelete="false">
      <reader xid="default9" action="/OA/workTime/logic/action/queryOA_WM_eveMemberAction"/>  
      <writer xid="default10" action="/OA/workTime/logic/action/saveOA_WM_eveMemberAction"/>  
      <creator xid="default11" action="/OA/workTime/logic/action/createOA_WM_eveMemberAction"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData"/>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="orgDialogPC" multiSelection="true" title="选择人员" status="normal" onReceive="orgDialogPCReceive"/>
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
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'mainData.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.showChart'}" xid="button1"> 
        <i xid="i7"/>  
        <span xid="span8"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.processRecord'}" xid="button2"> 
        <i xid="i9"/>  
        <span xid="span9"/>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label"
        label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
        <i xid="i15" class="icon-ios7-more"/>  
        <span xid="span15">更多</span> 
      </a>
    </div>  
    <div xid="content"> 
      <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col1"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;">申请信息</label>  
              <div class="x-edit" xid="div1"/>
            </div> 
          </div>
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit19"> 
              <label class="x-label" xid="label25" style="width:100px;">NO</label>  
              <div class="x-edit" xid="div20"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output form-control" xid="output1" bind-ref="mainData.ref('fNO')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit20"> 
              <label class="x-label" xid="label27" style="width:100px;" bind-text="mainData.label('fAPPLYDEPTNAME')"/>  
              <div class="x-edit" xid="div21">
                <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                  xid="dept" bind-ref="mainData.ref('fAPPLYDEPTID')" bind-labelRef="mainData.ref('fAPPLYDEPTNAME')"
                  includeOrgKind="ogn,dpt" onUpdateValue="deptUpdateValue"> 
                  <div component="$UI/system/components/justep/data/bizData"
                    autoLoad="false" xid="dDep" limit="-1"/>  
                  <option xid="option3" value="SA_OPOrg" label="sName"> 
                    <columns xid="columns1"> 
                      <column name="sName" xid="column1"/>
                    </columns> 
                  </option> 
                </div>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit2"> 
              <label class="x-label" xid="label2" style="width:100px;" bind-text="mainData.label('fAPPLYPERSONNAME')"/>  
              <div class="x-edit" xid="div2">
                <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                  xid="orgSelectPC1" bind-labelRef="mainData.ref('fAPPLYPERSONNAME')"
                  bind-ref="mainData.ref('fAPPLYPERSONID')" includeOrgKind="psm" bind-extRef="mainData.ref('fURL')"> 
                  <div component="$UI/system/components/justep/data/bizData"
                    autoLoad="false" xid="dPsm" limit="-1"> 
                    <treeOption xid="default24" rootFilter="1=1"/>
                  </div>  
                  <option xid="option2" value="SA_OPOrg" label="sName" ext="sFID"> 
                    <columns xid="columns2"> 
                      <column name="sName" xid="column2"/>
                    </columns> 
                  </option> 
                </div>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit4"> 
              <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fAPPLYDATE')"/>  
              <div class="x-edit" xid="div3">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fAPPLYDATE')" xid="input2"/>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit3"> 
              <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fSTARTTIME')"/>  
              <div class="x-edit" xid="div4">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fSTARTTIME')" xid="input3"/>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit8"> 
              <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fENDTIME')"/>  
              <div class="x-edit" xid="div6">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fENDTIME')" xid="input4"/>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col15"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit7"> 
              <label class="x-label" xid="label5" style="width:100px;" bind-text="mainData.label('fDAYS')"/>  
              <div class="x-edit" xid="div8">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fDAYS')" xid="input5"/>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit5"> 
              <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fPERSONNEL')"/>  
              <div class="x-edit" xid="div7">
                  
                <div class="input-group" xid="inputGroup2">
    <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fPERSONNEL')" xid="input9" style="border-right-style:none;" /><div class="input-group-addon" xid="div9" style="background-color:transparent;border-left-style:none;" bind-click="seachBtnClick">
    <i xid="i111" class="icon-android-search"></i></div></div></div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit6"> 
              <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fPLACE')"/>  
              <div class="x-edit" xid="div5">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fPLACE')" xid="input10"/>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col27"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit22"> 
              <label class="x-label" xid="label19" style="width:100px;" bind-text="mainData.label('fMODENAME')"/>  
              <div class="x-edit" xid="div18">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fMODENAME')" xid="input11"/>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col29"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit21"> 
              <label class="x-label" xid="label17" style="width:100px;" bind-text="mainData.label('fNUMBER')"/>  
              <div class="x-edit" xid="div22">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fNUMBER')" xid="input12"/>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit17"> 
              <label class="x-label" xid="label20" style="width:100px;" bind-text="mainData.label('fREASON')"/>  
              <div class="x-edit" xid="div19">
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea1" bind-ref="mainData.ref('fREASON')"/>
              </div>
            </div> 
          </div>  
          <div xid="col30" class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit18"> 
              <label class="x-label" xid="label18" style="width:100px;" bind-text="mainData.label('fRemark')"/>  
              <div class="x-edit" xid="div17">
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea2" bind-ref="mainData.ref('fRemark')"/>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col33"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit25"> 
              <label class="x-label" xid="label21" style="width:100px;" bind-text="mainData.label('fCreatePerName')"/>  
              <div class="x-edit" xid="div26">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fCreatePerName')" xid="input8"/>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col32"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit23"> 
              <label class="x-label" xid="label24" style="width:100px;" bind-text="mainData.label('fCreateTime')"/>  
              <div class="x-edit" xid="div25">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fCreateTime')" xid="input7"/>
              </div>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col34"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit24"> 
              <label class="x-label" xid="label22" style="width:100px;" bind-text="mainData.label('fBizStateName')"/>  
              <div class="x-edit" xid="div23">
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fBizStateName')" xid="input6"/>
              </div>
            </div> 
          </div>
        </div>
      </div> 
    </div> 
  </div> 
</div>
