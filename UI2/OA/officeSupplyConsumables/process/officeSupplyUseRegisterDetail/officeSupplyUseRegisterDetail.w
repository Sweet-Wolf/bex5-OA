<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc;"
  xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:543px;top:20px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_OSC_UseApplyM" columns="" autoNew="false"
      onSaveCommit="DataSaveCommit" orderBy="fBizState desc,fNO desc,fApplyDate desc"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyMAction"/>  
      <writer action="/OA/officeSupplyConsumables/logic/action/saveOSCUseApplyMAction"/>  
      <creator action="/OA/officeSupplyConsumables/logic/action/createOSCUseApplyMAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" concept="OA_OSC_UseApplyD" columns="" autoNew="false"
      onValueChanged="detailDataValueChanged"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyDAction"/>  
      <writer action="/OA/officeSupplyConsumables/logic/action/saveOSCUseApplyDAction"/>  
      <creator action="/OA/officeSupplyConsumables/logic/action/createOSCUseApplyDAction"/>  
      <master data="mainData" relation="fMasterID"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="DialogList"
    style="left:116px;top:364px;" src="$UI/OA/officeSupplyConsumables/process/dialog/selectBaseInfoDialog/selectBaseInfo.w"
    title="用品信息" showTitle="true" height="80%" status="normal" forceRefreshOnOpen="true"
    width="80%"> 
    <result concept="detailData" operation="edit" origin="mainData" xid="default2"> 
      <mapping from="OA_OSC_BaseInfo" to="fItemID" xid="default3"/>  
      <mapping from="fName" to="fName" xid="default4"/>  
      <mapping from="fCode" to="fCode" xid="default5"/>  
      <mapping from="fSpecType" to="fSpecType" xid="default6"/>  
      <mapping from="fKindID" to="fKindID" xid="default7"/>  
      <mapping from="fKindName" to="fKindName" xid="default8"/>  
      <mapping from="fUnitID" to="fUnitID" xid="default9"/>  
      <mapping from="fUnitName" to="fUnitName" xid="default10"/> 
    </result> 
  </span>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel"> 
    <div class="x-panel-content" xid="content"> 
      <div xid="div2"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
          xid="processBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'mainData.new'}" xid="button2"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'mainData.delete'}" xid="button1"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="saveBtn" onClick="{operation:'mainData.save'}"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a> 
        </div>  
        <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fApplyDeptName')"/>  
                <div class="x-edit" xid="div1"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="orgSelectPC1" bind-ref="mainData.ref('fApplyDeptID')" bind-labelRef="mainData.ref('fApplyDeptName')"
                    includeOrgKind="ogn,dpt"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="false" xid="dOrg" limit="-1"/>  
                    <option xid="option1" value="SA_OPOrg" label="sName"> 
                      <columns xid="columns1"> 
                        <column name="sName" xid="column5"/> 
                      </columns> 
                    </option> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fApplyDate')"/>  
                <div class="x-edit" xid="div1"> 
                  <input xid="fApplyDate" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="mainData.ref('fApplyDate')"/> 
                </div> 
              </div> 
            </div>    
           <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fApplyPsnName')"/>  
                <div class="x-edit" xid="div1"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                xid="orgSelectPC2" bind-ref="mainData.ref('fApplyPsnID')" bind-labelRef="mainData.ref('fApplyPsnName')"
                includeOrgKind="ogn,dpt,pos,psm"> 
                <div component="$UI/system/components/justep/data/bizData"
                  autoLoad="false" xid="dPsn" limit="-1"> 
                  <treeOption xid="default11"/> 
                </div>  
                <option xid="option2" value="SA_OPOrg" label="sName"> 
                  <columns xid="columns2"> 
                    <column name="sName" xid="column6"/> 
                  </columns> 
                </option> 
              </div> 
                </div> 
              </div> 
            </div>   
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fDemandDate')"/>  
                <div class="x-edit" xid="div1"> 
                  <input xid="fDemandDate" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="mainData.ref('fDemandDate')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fApplyReason')"/>  
                <div class="x-edit" xid="div1"> 
                  <textarea xid="fApplyReason" class="form-control" component="$UI/system/components/justep/textarea/textarea"
                    bind-ref="mainData.ref('fApplyReason')"/> 
                </div> 
              </div> 
            </div>
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fRemark')"/>  
                <div class="x-edit" xid="div1"> 
                  <textarea xid="fRemark" class="form-control" component="$UI/system/components/justep/textarea/textarea"
                    bind-ref="mainData.ref('fRemark')"/> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/controlGroup/controlGroup"
            class="x-control-group" title="用品信息" collapsible="true" xid="detailCG"> 
            <div class="x-control-group-title" xid="controlGroupTitle2"> 
              <span xid="span7">用品信息</span> 
            </div>  
            <div xid="div3"> 
              <div component="$UI/system/components/justep/toolBar/toolBar"
                class="x-toolbar x-toolbar-spliter form-inline" xid="detailBar"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-icon-left" xid="addBtn" icon="icon-plus"
                  onClick="addBtnClick" label="新建"> 
                  <i xid="i6" class="icon-plus"/>  
                  <span xid="span10">新建</span> 
                </a>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-icon-left" xid="deleteBtn" onClick="{operation:'detailData.delete'}"> 
                  <i xid="i7"/>  
                  <span xid="span11"/> 
                </a> 
              </div>  
              <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
                xid="detail" data="detailData" width="100%" height="auto" class="x-grid-no-bordered"
                showRowNumber="true"> 
                <columns xid="column"> 
                  <column name="fName" label="名称" editable="false" xid="column11"> 
                    <editor xid="fNameE"> 
                      <input xid="fName" component="$UI/system/components/justep/input/input"
                        class="form-control" bind-ref="ref('fName')"/> 
                    </editor> 
                  </column>  
                  <column name="fKindName" label="类别" editable="false" xid="column12"> 
                    <editor xid="fKindNameE"> 
                      <input xid="fKindName" component="$UI/system/components/justep/input/input"
                        class="form-control" bind-ref="ref('fKindName')"/> 
                    </editor> 
                  </column>  
                  <column name="fUnitName" label="计量单位" editable="false" xid="column13"> 
                    <editor xid="fUnitNameE"> 
                      <input xid="fUnitName" component="$UI/system/components/justep/input/input"
                        class="form-control" bind-ref="ref('fUnitName')"/> 
                    </editor> 
                  </column>  
                  <column name="fSpecType" label="规格型号" editable="false" xid="column14"> 
                    <editor xid="fSpecTypeE"> 
                      <input xid="fSpecType" component="$UI/system/components/justep/input/input"
                        class="form-control" bind-ref="ref('fSpecType')"/> 
                    </editor> 
                  </column>  
                  <column name="fDemandNum" label="申请数量" editable="true" xid="column15"> 
                    <editor xid="fDemandNumE"> 
                      <input xid="fDemandNum" component="$UI/system/components/justep/input/input"
                        class="form-control" bind-ref="ref('fDemandNum')"/> 
                    </editor> 
                  </column>  
                  <column name="fFactNum" label="实际数量" editable="false" xid="column17"> 
                    <editor xid="fFactNumE"> 
                      <input xid="fFactNum" component="$UI/system/components/justep/input/input"
                        class="form-control" bind-ref="ref('fFactNum')"/> 
                    </editor> 
                  </column>  
                  <column name="fRemark" label="备注" editable="true" xid="column16"> 
                    <editor xid="fRemarkE"> 
                      <input xid="fRemark" component="$UI/system/components/justep/input/input"
                        class="form-control" bind-ref="ref('fRemark')"/> 
                    </editor> 
                  </column> 
                </columns> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
