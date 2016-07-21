<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:178px;top:39px;"
    onModelConstructDone="modelModelConstructDone" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_WM_LeaveApply" orderBy="" columns=""
      autoNew="true" onBeforeSave="mainDataBeforeSave" onValueChanged="mainDataValueChanged"> 
      <reader action="/OA/workTime/logic/action/queryOA_WM_LeaveApplyAction"/>  
      <writer action="/OA/workTime/logic/action/saveOA_WM_LeaveApplyAction"/>  
      <creator action="/OA/workTime/logic/action/createOA_WM_LeaveApplyAction"/>  
      <rule xid="rule1"> 
        <col name="fLeaveTypeName" xid="ruleCol13"> 
          <required xid="required10"> 
            <expr xid="default19">true</expr>
          </required> 
        </col>  
        <col name="fPLACE" xid="ruleCol15"> 
          <required xid="required12"> 
            <expr xid="default21">true</expr>
          </required> 
        </col>  
        <col name="fLeaveTypeID" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default25">true</expr>
          </required> 
        </col>  
        <col name="fStartTime" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default26">true</expr>
          </required> 
        </col>  
        <col name="fEndTime" xid="ruleCol3"> 
          <required xid="required3"> 
            <expr xid="default27">true</expr>
          </required>  
          <calculate xid="calculate1"> 
            <expr xid="default8"/>
          </calculate>  
          <constraint xid="constraint1"> 
            <expr xid="default9">$row.val("fEndTime")&gt;$row.val("fStartTime")</expr>
          </constraint> 
        </col>  
        <col name="fLeaveReason" xid="ruleCol4"> 
          <required xid="required4"> 
            <expr xid="default28">true</expr>
          </required> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="typeData" concept="OA_WM_LeaveType" limit="-1">
      <reader xid="default1" action="/OA/workTime/logic/action/queryOA_WM_LeaveTypeAction"/>  
      <writer xid="default2" action="/OA/workTime/logic/action/saveOA_WM_LeaveTypeAction"/>  
      <creator xid="default3" action="/OA/workTime/logic/action/createOA_WM_LeaveTypeAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_WM_LeaveType.fUseStatus=1]]></filter>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="vacationData" concept="OA_WM_Vacation">
      <reader xid="default4" action="/OA/workTime/logic/action/queryOA_WM_VacationAction"/>  
      <writer xid="default5" action="/OA/workTime/logic/action/saveOA_WM_VacationAction"/>  
      <creator xid="default6" action="/OA/workTime/logic/action/createOA_WM_VacationAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="isData" idColumn="value">
      <column label="值" name="value" type="String" xid="xid1"/>  
      <column label="名称" name="label" type="String" xid="xid2"/>  
      <data xid="default7">[{"value":"1","label":"是"},{"value":"0","label":"否"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData"/>  
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
        <i xid="i6"/>  
        <span xid="span7"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.processRecord'}" xid="button2"> 
        <i xid="i7"/>  
        <span xid="span8"/>
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
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;"><![CDATA[申请信息]]></label>  
              <div class="x-edit" xid="div1"></div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit20"> 
              <label class="x-label" xid="label27" style="width:100px;"><![CDATA[]]></label>  
              <div class="x-edit" xid="div21"/>
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit19"> 
              <label class="x-label" xid="label25" style="width:100px;"><![CDATA[NO]]></label>  
              <div class="x-edit" xid="div20"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output form-control" xid="output1" bind-ref="mainData.ref('fNO')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit19"> 
              <label class="x-label" xid="label25" style="width:100px;" bind-text="mainData.label('fLeaveTypeName')"><![CDATA[]]></label>  
              <div class="x-edit" xid="div19"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                  xid="gridSelect1" bind-ref="mainData.ref('fLeaveTypeID')" bind-labelRef="mainData.ref('fLeaveTypeName')"
                  onUpdateValue="gridSelect1UpdateValue"> 
                  <option xid="option1" data="typeData" value="fTypeCode" label="fTypeName"/>
                </div>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit2"> 
              <label class="x-label" xid="label2" style="width:100px;" bind-text="mainData.label('fApplyDeptName')"/>  
              <div class="x-edit" xid="div2"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                  xid="dept" bind-ref="mainData.ref('fApplyDeptID')" bind-labelRef="mainData.ref('fApplyDeptName')"
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
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit3"> 
              <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fApplyPersonName')"/>  
              <div class="x-edit" xid="div3"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                  xid="orgSelectPC1" bind-labelRef="mainData.ref('fApplyPersonName')"
                  bind-ref="mainData.ref('fApplyPersonID')" includeOrgKind="psm" onUpdateValue="orgSelectPC1UpdateValue"
                  bind-extRef="mainData.ref('fURL')"> 
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
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit6"> 
              <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fStartTime')"/>  
              <div class="x-edit" xid="div6"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  xid="input3" bind-ref="mainData.ref('fStartTime')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit5"> 
              <label class="x-label" xid="label5" style="width:100px;" bind-text="mainData.label('fEndTime')"/>  
              <div class="x-edit" xid="div5"> 
                <input xid="fEndTime" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fEndTime')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit4"> 
              <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fLeaveTime')"/>  
              <div class="x-edit" xid="div4"> 
                <div class="form-control" component="$UI/system/components/justep/output/output"
                  bind-ref="mainData.ref('fLeaveDays')" xid="fLeaveDays" style="width:40px;float:left;"/>  
                <label xid="label19" style="float:left;line-height:35px;padding-left:5px;padding-right:5px;">天</label>  
                <div class="form-control" component="$UI/system/components/justep/output/output"
                  bind-ref="mainData.ref('fLeaveHours')" xid="fLeaveHours" style="width:40px;float:left;"/>  
                <label xid="label20" style="float:left;line-height:35px;">小时</label>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit9"> 
              <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fApplyDate')"/>  
              <div class="x-edit" xid="div9"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output form-control" xid="output2" bind-ref="mainData.ref('fApplyDate')"
                  format="yyyy-MM-dd"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit8"> 
              <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fTransport')"/>  
              <div class="x-edit" xid="div8"> 
                <input class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fTransport')" xid="input6"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit7"> 
              <label class="x-label" xid="label9" style="width:100px;" bind-text="mainData.label('fRelationTel')"/>  
              <div class="x-edit" xid="div7"> 
                <input xid="input10" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fRelationTel')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col18"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit14"> 
              <label class="x-label" xid="label16" style="width:100px;" bind-text="vacationData.label('fHoliday')"/>  
              <div class="x-edit" xid="div18"> 
                <div xid="output11" class="form-control" component="$UI/system/components/justep/output/output"
                  bind-ref="vacationData.ref('fHoliday')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col20"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit13"> 
              <label class="x-label" xid="label17" style="width:100px;">已休年假</label>  
              <div class="x-edit" xid="div17"> 
                <div class="form-control" component="$UI/system/components/justep/output/output"
                  bind-ref="vacationData.ref('fAlreadyDay')" xid="output15" style="width:40px;float:left;"/>  
                <label xid="label22" style="float:left;line-height:35px;padding-left:5px;padding-right:5px;">天</label>  
                <div class="form-control" component="$UI/system/components/justep/output/output"
                  bind-ref="vacationData.ref('fAlreadyHour')" xid="output14" style="width:40px;float:left;"/>  
                <label xid="label21" style="float:left;line-height:35px;">小时</label>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col19"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit12"> 
              <label class="x-label" xid="label18" style="width:100px;">剩余年假</label>  
              <div class="x-edit" xid="div16"> 
                <div class="form-control" component="$UI/system/components/justep/output/output"
                  bind-ref="vacationData.ref('fLeavingsDay')" xid="output17" style="width:40px;float:left;"/>  
                <label xid="label24" style="float:left;line-height:35px;padding-left:5px;padding-right:5px;">天</label>  
                <div class="form-control" component="$UI/system/components/justep/output/output"
                  bind-ref="vacationData.ref('fLeavingsHour')" xid="output16" style="width:40px;float:left;"/>  
                <label xid="label23" style="float:left;line-height:35px;">小时</label>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col15"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit18"> 
              <label class="x-label" xid="label13" style="width:100px;" bind-text="mainData.label('fPLACE')"/>  
              <div class="x-edit" xid="div13"> 
                <input xid="fPLACE" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fPLACE')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col17"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit10"> 
              <label class="x-label" xid="label12" style="width:100px;" bind-text="mainData.label('fLeaveReason')"/>  
              <div class="x-edit" xid="div14"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea1" bind-ref="mainData.ref('fLeaveReason')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit11"> 
              <label class="x-label" xid="label11" style="width:100px;" bind-text="mainData.label('fIsReducHoliday')"/>  
              <div class="x-edit" xid="div15"> 
                <span component="$UI/system/components/justep/select/radioGroup"
                  class="x-radio-group" xid="radioGroup1" bind-ref="mainData.ref('fIsReducHoliday')"
                  bind-itemset="isData" bind-itemsetValue="ref('value')" bind-itemsetLabel="ref('label')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit15"> 
              <label class="x-label" xid="label10" style="width:100px;" bind-text="mainData.label('fCreatePerName')"/>  
              <div class="x-edit" xid="div10"> 
                <div class="form-control" component="$UI/system/components/justep/output/output"
                  bind-ref="mainData.ref('fCreatePerName')" xid="output9"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col25"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit16"> 
              <label class="x-label" xid="label15" style="width:100px;" bind-text="mainData.label('fBizStateName')"/>  
              <div class="x-edit" xid="div11"> 
                <div class="form-control" component="$UI/system/components/justep/output/output"
                  bind-ref="mainData.ref('fBizStateName')" xid="output8"/>
              </div> 
            </div> 
          </div>  
          <div xid="col26" class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit17"> 
              <label class="x-label" xid="label14" style="width:100px;" bind-text="mainData.label('fRemark')"/>  
              <div class="x-edit" xid="div12"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea2" bind-ref="mainData.ref('fRemark')"/>
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>
  </div> 
</div>
