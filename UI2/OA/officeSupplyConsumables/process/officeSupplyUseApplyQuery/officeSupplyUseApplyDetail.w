<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div xid="detailTabContent"> 
    <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar"
      class="x-toolbar x-toolbar-spliter"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="button3" onClick="{&quot;operation&quot;:&quot;mainData.refresh&quot;}" label="刷新"> 
        <i xid="i11"/>  
        <span xid="span9">刷新</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="preBtn" onClick="{operation:'mainData.prevRow'}"> 
        <i xid="i3"/>  
        <span xid="span3"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="nextBtn" onClick="{operation:'mainData.nextRow'}"> 
        <i xid="i5"/>  
        <span xid="span4"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
        xid="chartBtn" onClick="chartBtnClick" label="流程图" icon="icon-image"> 
        <i xid="i8" class="icon-image"/>  
        <span xid="span8">流程图</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}"
        xid="button2"> 
        <i xid="i2"/>  
        <span xid="span2"/>
      </a> 
    </div>  
    <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
      <div xid="formGroup2" class="form-group"> 
        <div xid="col21" class="col-sm-1"> 
          <label xid="fApplyDeptNameL" class="control-label" bind-text="mainData.label('fApplyDeptName')"/> 
        </div>  
        <div xid="col22" class="col-sm-3"> 
          <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
            xid="orgSelectPC1" bind-ref="mainData.ref('fApplyDeptID')" bind-labelRef="mainData.ref('fApplyDeptName')"
            includeOrgKind="ogn,dpt"> 
            <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
              xid="dOrg" limit="-1"/>  
            <option xid="option1" value="SA_OPOrg" label="sName"> 
              <columns xid="columns1"> 
                <column name="sName" xid="column5"/> 
              </columns> 
            </option> 
          </div> 
        </div>  
        <div xid="col23" class="col-sm-1"> 
          <label xid="fApplyDateL" class="control-label" bind-text="mainData.label('fApplyDate')"/> 
        </div>  
        <div xid="col24" class="col-sm-3"> 
          <input xid="fApplyDate" class="form-control" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fApplyDate')"/> 
        </div>  
        <div xid="col31" class="col-sm-1"> 
          <label xid="fApplyPsnNameL" class="control-label" bind-text="mainData.label('fApplyPsnName')"/> 
        </div>  
        <div xid="col32" class="col-sm-3"> 
          <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
            xid="orgSelectPC2" bind-ref="mainData.ref('fApplyPsnID')" bind-labelRef="mainData.ref('fApplyPsnName')"
            includeOrgKind="ogn,dpt,pos,psm"> 
            <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
              xid="dPsn" limit="-1"> 
              <treeOption xid="default2"/> 
            </div>  
            <option xid="option2" value="SA_OPOrg" label="sName"> 
              <columns xid="columns2"> 
                <column name="sName" xid="column6"/> 
              </columns> 
            </option> 
          </div> 
        </div> 
      </div>  
      <div xid="formGroup3" class="form-group"> 
        <div xid="col33" class="col-sm-1"> 
          <label xid="fDemandDateL" class="control-label" bind-text="mainData.label('fDemandDate')"/> 
        </div>  
        <div xid="col34" class="col-sm-11"> 
          <input xid="fDemandDate" class="form-control" component="$UI/system/components/justep/input/input"
            bind-ref="mainData.ref('fDemandDate')"/> 
        </div> 
      </div>  
      <div xid="formGroup1" class="form-group"> 
        <div xid="col11" class="col-sm-1"> 
          <label xid="fApplyReasonL" class="control-label" bind-text="mainData.label('fApplyReason')"/> 
        </div>  
        <div xid="col12" class="col-sm-11"> 
          <textarea xid="fApplyReason" class="form-control" component="$UI/system/components/justep/textarea/textarea"
            bind-ref="mainData.ref('fApplyReason')"/> 
        </div> 
      </div>  
      <div xid="formGroup4" class="form-group"> 
        <div xid="col43" class="col-sm-1"> 
          <label xid="fRemarkL" class="control-label" bind-text="mainData.label('fRemark')"/> 
        </div>  
        <div xid="col44" class="col-sm-11"> 
          <textarea xid="fRemark" class="form-control" component="$UI/system/components/justep/textarea/textarea"
            bind-ref="mainData.ref('fRemark')"/> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="用品信息" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span21">用品信息</span>
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
          xid="dataTables1" data="detailData"> 
          <columns xid="columns1"> 
            <column name="fCode" xid="column2"/>  
            <column name="fName" xid="column1"/>  
            <column name="fSpecType" xid="column3"/>  
            <column name="fKindName" xid="column4"/>  
            <column name="fUnitName" xid="column5"/>  
            <column name="fDemandNum" xid="column8"/>  
            <column name="fFactNum" xid="column10"/>  
            <column name="fRemark" xid="column13" orderable="false"/>
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="detailPagerBar" data="detailData"> 
          <div class="row" xid="div3"> 
            <div class="col-sm-3" xid="div9"> 
              <div class="x-pagerbar-length" xid="div10"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
                  <span xid="span22">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select2"> 
                    <option value="10" xid="default16">10</option>  
                    <option value="20" xid="default17">20</option>  
                    <option value="50" xid="default18">50</option>  
                    <option value="100" xid="default19">100</option>
                  </select>  
                  <span xid="span23">条</span>
                </label> 
              </div> 
            </div>  
            <div class="col-sm-3" xid="div11"> 
              <div class="x-pagerbar-info" xid="div12">当前显示0条，共0条</div>
            </div>  
            <div class="col-sm-6" xid="div13"> 
              <div class="x-pagerbar-pagination" xid="div14"> 
                <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                  xid="pagination2"> 
                  <li class="prev" xid="li3"> 
                    <a href="#" xid="a2"> 
                      <span aria-hidden="true" xid="span24">«</span>  
                      <span class="sr-only" xid="span25">Previous</span>
                    </a> 
                  </li>  
                  <li class="next" xid="li4"> 
                    <a href="#" xid="a4"> 
                      <span aria-hidden="true" xid="span26">»</span>  
                      <span class="sr-only" xid="span27">Next</span>
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:261px;top:149px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_OSC_UseApplyM" columns="" autoNew="false"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyMAction"
        xid="default1"/>  
      <writer action="/OA/officeSupplyConsumables/logic/action/saveOSCUseApplyMAction"
        xid="default2"/>  
      <creator action="/OA/officeSupplyConsumables/logic/action/createOSCUseApplyMAction"
        xid="default3"/>  
      <rule xid="rule1"> 
        <readonly xid="readonly1"> 
          <expr xid="default8">true</expr>
        </readonly> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" concept="OA_OSC_UseApplyD" columns="" autoNew="false"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyDAction"
        xid="default4"/>  
      <writer action="" xid="default5"/>  
      <creator action="" xid="default6"/>  
      <master data="mainData" relation="fMasterID" xid="default7"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="taskData"
      concept="SA_Task"> 
      <reader xid="default9" action="/system/logic/action/queryTaskAction"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"/>
</div>
