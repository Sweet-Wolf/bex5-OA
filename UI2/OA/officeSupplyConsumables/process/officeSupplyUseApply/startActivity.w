<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:243px;top:184px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" autoNew="true" concept="OA_OSC_UseApplyM"
      orderBy="" columns="" isTree="false"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyMAction"/>  
      <writer action="/OA/officeSupplyConsumables/logic/action/saveOSCUseApplyMAction"/>  
      <creator action="/OA/officeSupplyConsumables/logic/action/createOSCUseApplyMAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" autoNew="false" concept="OA_OSC_UseApplyD"
      orderBy="" columns="" isTree="false" limit="-1"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyDAction"/>  
      <writer action="/OA/officeSupplyConsumables/logic/action/saveOSCUseApplyDAction"/>  
      <creator action="/OA/officeSupplyConsumables/logic/action/createOSCUseApplyDAction"/>  
      <master xid="default1" data="mainData" relation="fMasterID"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" style="width:24px;height:5px;left:184px;top:769px;" onBeforeAdvanceQuery="processBeforeAdvanceQuery"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="chartBtn" onClick="{operation:'process.showChart'}"> 
          <i xid="i5"/>  
          <span xid="span5"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recordBtn" onClick="{operation:'process.processRecord'}"> 
          <i xid="i55"/>  
          <span xid="span55"/> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="processBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2">流转</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'mainData.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
        label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
        <i xid="i15"/>  
        <span xid="span15">更多</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.showChart'}" xid="button1"> 
        <i xid="i9"/>  
        <span xid="span8"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.processRecord'}" xid="button2"> 
        <i xid="i10"/>  
        <span xid="span9"/>
      </a>
    </div>  
    <div xid="content"> 
      <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit1"> 
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
              class="x-label-edit x-label30" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fApplyDate')"/>  
              <div class="x-edit" xid="div1">
                <input xid="fApplyDate" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fApplyDate')"/> 
              </div>
            </div>
          </div> 
          
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fApplyPsnName')"/>  
              <div class="x-edit" xid="div1">
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
          </div> 
          
           <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fDemandDate')"/>  
              <div class="x-edit" xid="div1">
                <input xid="fDemandDate" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fDemandDate')"/>  
              </div>
            </div>
          </div> 
          
           <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fApplyReason')"/>  
              <div class="x-edit" xid="div1">
                <textarea xid="fApplyReason" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              bind-ref="mainData.ref('fApplyReason')"/>  
              </div>
            </div>
          </div> 
          
           <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit1"> 
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
          <div class="x-control-group-title"> 
            <span xid="span7"><![CDATA[用品信息]]></span> 
          </div>  
          <div> 
            <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
              xid="detailBar"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                xid="addBtn" icon="icon-plus" onClick="addBtnClick" label="新建"> 
                <i xid="i6" class="icon-plus"/>  
                <span xid="span10">新建</span> 
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                xid="deleteBtn" onClick="{operation:'detailData.delete'}"> 
                <i xid="i7"/>  
                <span xid="span11"/> 
              </a> 
            </div>  
            <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
              xid="detail" data="detailData" width="100%" height="auto" class="x-grid-no-bordered"
              showRowNumber="true"> 
              <columns xid="column"> 
                <column name="fName" label="名称" editable="false"> 
                  <editor xid="fNameE"> 
                    <input xid="fName" component="$UI/system/components/justep/input/input"
                      class="form-control" bind-ref="ref('fName')"/> 
                  </editor> 
                </column>  
                <column name="fKindName" label="类别" editable="false"> 
                  <editor xid="fKindNameE"> 
                    <input xid="fKindName" component="$UI/system/components/justep/input/input"
                      class="form-control" bind-ref="ref('fKindName')"/> 
                  </editor> 
                </column>  
                <column name="fUnitName" label="计量单位" editable="false"> 
                  <editor xid="fUnitNameE"> 
                    <input xid="fUnitName" component="$UI/system/components/justep/input/input"
                      class="form-control" bind-ref="ref('fUnitName')"/> 
                  </editor> 
                </column>  
                <column name="fSpecType" label="规格型号" editable="false"> 
                  <editor xid="fSpecTypeE"> 
                    <input xid="fSpecType" component="$UI/system/components/justep/input/input"
                      class="form-control" bind-ref="ref('fSpecType')"/> 
                  </editor> 
                </column>  
                <column name="fDemandNum" label="申请数量" editable="true"> 
                  <editor xid="fDemandNumE"> 
                    <input xid="fDemandNum" component="$UI/system/components/justep/input/input"
                      class="form-control" bind-ref="ref('fDemandNum')"/> 
                  </editor> 
                </column>  
                <column name="fRemark" label="备注" editable="true"> 
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="DialogList"
    style="left:116px;top:364px;" src="$UI/OA/officeSupplyConsumables/process/dialog/selectBaseInfoDialog/selectBaseInfo.w"
    title="用品信息" showTitle="true" height="80%" status="normal" forceRefreshOnOpen="true"> 
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
</div>
