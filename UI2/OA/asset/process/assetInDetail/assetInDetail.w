<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc;"
  xid="window">  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgBuyApply"
    style="left:226px;top:560px;" title="选择资产采购信息" showTitle="true" status="normal"
    onReceive="dlgBuyApplyReceive"/>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgInCheck"
    title="资产验收单" showTitle="true" status="normal" style="left:331px;top:560px;" onReceive="dlgInCheckReceive"/>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgInDate"
    title="填写入库日期" showTitle="true" status="normal" width="50%" height="50%" style="left:397px;top:558px;"
    onReceive="dlgInDateReceive"/>
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:409px;top:236px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AS_InM" columns="" autoNew="false"
      onSaveCommit="DataSaveCommit"> 
      <reader action="/OA/asset/logic/action/queryASInMAction"/>  
      <writer action="/OA/asset/logic/action/saveASInMAction"/>  
      <creator action="/OA/asset/logic/action/createASInMAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" concept="OA_AS_InD" columns="" autoNew="false"> 
      <reader action="/OA/asset/logic/action/queryASInDetailAction"/>  
      <writer action="/OA/asset/logic/action/saveASInDAction"/>  
      <creator action="/OA/asset/logic/action/createASInDAction"/>  
      <master data="mainData" relation="fMasterID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="modeData"
      concept="OA_Pub_BaseCode"> 
      <reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default2" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"/>  
      <creator xid="default3" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"/>  
      <filter name="filter" xid="filter2"><![CDATA[OA_Pub_BaseCode.fScope='资产入库类型']]></filter>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="kindData"
      concept="OA_Pub_BaseCode"> 
      <reader xid="default12" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default13" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"/>  
      <creator xid="default20" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"/>  
      <filter name="filter" xid="filter1"><![CDATA[OA_Pub_BaseCode.fScope='固定资产类别']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="unitData"
      concept="OA_Pub_BaseCode"> 
      <reader xid="default21" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default22" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"/>  
      <creator xid="default23" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"/>  
      <filter name="filter" xid="filter3"><![CDATA[OA_Pub_BaseCode.fScope='办公用品计量单位']]></filter>
    </div>
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/>  
  <div class="tab-pane" xid="detailTabContent"> 
        <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="newBtn2" label="新建" onClick="{&quot;operation&quot;:&quot;mainData.new&quot;}"> 
            <i xid="i2" />  
            <span xid="span2">新建</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="saveBtn2" onClick="{&quot;operation&quot;:&quot;mainData.save&quot;}" label="保存"> 
            <i xid="i10" />  
            <span xid="span6">保存</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button2" onClick="{&quot;operation&quot;:&quot;mainData.delete&quot;}"> 
            <i xid="i13" />  
            <span xid="span14" /> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="button3" onClick="{&quot;operation&quot;:&quot;mainData.refresh&quot;}" label="刷新"> 
            <i xid="i11" />  
            <span xid="span9">刷新</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="preBtn" onClick="{operation:'mainData.prevRow'}"> 
            <i xid="i3" />  
            <span xid="span3" /> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="nextBtn" onClick="{operation:'mainData.nextRow'}"> 
            <i xid="i5" />  
            <span xid="span4" /> 
          </a> 
        </div>  
        <div xid="div17"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput1" style="float:right;"> 
            <label class="x-label" xid="label1" style="text-align:right;width:50px;">NO:</label>  
            <div component="$UI/system/components/justep/output/output" class="x-output x-edit" xid="output1" bind-ref="mainData.ref('fNO')" />
          </div>  
          <h5 xid="h51" style="line-height:36px;padding-left:15px;">基本信息</h5>
        </div>
        <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1"> 
                <label class="x-label" xid="label2" style="width:100px;" bind-text="mainData.label('fDutyDeptName')" />  
                <div class="x-edit" xid="div16">
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelect" bind-ref="mainData.ref('fDutyDeptID')" bind-labelRef="mainData.ref('fDutyDeptName')" includeOrgKind="ogn,dpt"> 
                    <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="dOrg" limit="-1" />  
                    <option xid="option2"> 
                      <columns xid="columns1"> 
                        <column name="sName" xid="column1" />
                      </columns> 
                    </option> 
                  </div>
                </div>
              </div>
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2">
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2"> 
                <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fDutyPsnName')" />  
                <div class="x-edit" xid="div18"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="psmSelect" bind-ref="mainData.ref('fDutyPsnID')" bind-labelRef="mainData.ref('fDutyPsnName')" includeOrgKind="psm"> 
                    <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1"> 
                      <treeOption xid="default7" rootFilter="1=1" />
                    </div>  
                    <option xid="option1" value="sFCode" label="sFName"> 
                      <columns xid="columns2"> 
                        <column name="sName" xid="column2" />
                      </columns> 
                    </option> 
                  </div>
                </div> 
              </div>
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
              <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3"> 
                <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fDate')" />  
                <div class="x-edit" xid="div19"> 
                  <input xid="fDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fDate')" />
                </div> 
              </div>
            </div>
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
    <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fMode')"></label>
    <div class="x-edit" xid="div20">
     <select component="$UI/system/components/justep/select/select" class="form-control" xid="fMode" bind-ref="mainData.ref('fModeID')" bind-labelRef="mainData.ref('fMode')" optionsAutoLoad="true" bind-options="modeData" bind-optionsLabel="fName" bind-optionsValue="OA_Pub_BaseCode"></select></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
    <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fAmount')"></label>
    <div class="x-edit" xid="div22">
     <input xid="fAmount" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fAmount')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
    <label class="x-label" xid="label5" style="width:100px;" bind-text="mainData.label('fStateName')"></label>
    <div class="x-edit" xid="div21">
     <input xid="fStateName" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fStateName')"></input></div> </div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
    <label class="x-label" xid="label9" style="width:100px;" bind-text="mainData.label('fRemark')"></label>
    <div class="x-edit" xid="div23">
     <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fRemark" bind-ref="mainData.ref('fRemark')"></textarea></div> </div> </div></div>  
          </div>
        <div xid="div26"> 
          <h5 xid="h53" style="line-height:36px;padding-left:15px;"><![CDATA[资产明细]]></h5>
        </div>
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="detailForm">
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter" xid="listBar"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="addBtn" icon="icon-plus" label="添加" onClick="{operation:'detailData.new'}"> 
              <i xid="i6" class="icon-plus" />  
              <span xid="span10">添加</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="deleteBtn" onClick="{operation:'detailData.delete'}"> 
              <i xid="i7" />  
              <span xid="span11">删除</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="trgInsertBtn" label="选择采购信息" icon="icon-android-checkmark" onClick="trgInsertBtnClick"> 
              <i xid="i9" class="icon-android-checkmark" />  
              <span xid="span13">选择采购信息</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="trgCheck" label="验收" icon="icon-android-checkmark" onClick="trgCheckClick"> 
              <i xid="i14" class="icon-android-checkmark" />  
              <span xid="span28">验收</span>
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="trgIn" label="入库" icon="icon-android-checkmark" onClick="trgInClick"> 
              <i xid="i15" class="icon-android-checkmark" />  
              <span xid="span29">入库</span>
            </a>
          </div>
          <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" xid="detailGrid" data="detailData" height="auto" class="x-grid-no-bordered" showRowNumber="false" multiselect="true"> 
            <columns xid="columns"> 
              <column name="fKind" editable="true"> 
                <editor> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="kindSelect" bind-labelRef="ref('fKind')" bind-ref="ref('fKindID')" bind-extRef="ref('fCode')" onHideOption="kindSelectHideOption"> 
                    <option xid="option3" data="kindData" value="OA_Pub_BaseCode" label="fName" ext="fCode" />
                  </div>
                </editor> 
              </column>  
              <column name="fCode" editable="true" xid="column14"> 
                <editor xid="editor11"> 
                  <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fCode')" xid="input12" />
                </editor> 
              </column>
              <column name="fName" editable="true" xid="column13"> 
                <editor xid="editor10"> 
                  <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fName')" xid="input11" />
                </editor> 
              </column>
              <column name="fSpecType" editable="true" xid="column12"> 
                <editor xid="editor9"> 
                  <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fSpecType')" xid="input10" />
                </editor> 
              </column>
              <column name="fUnit" editable="true" xid="column11"> 
                <editor xid="editor8"> 
                  <select component="$UI/system/components/justep/select/select" class="form-control" xid="select3" bind-labelRef="ref('fUnit')" bind-ref="ref('fUnitID')" bind-options="$model.unitData" bind-optionsValue="OA_Pub_BaseCode" bind-optionsLabel="fName" />
                </editor> 
              </column>
              <column name="fAmount" editable="true" xid="column9"> 
                <editor xid="editor6"> 
                  <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fAmount')" xid="input7" />
                </editor> 
              </column>
              <column name="fDate" editable="true" xid="column5"> 
                <editor xid="editor2"> 
                  <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fDate')" xid="input3" />
                </editor> 
              </column>
              <column name="fIsCheckName" editable="true" xid="column8"> 
                <editor xid="editor5"> 
                  <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fIsCheckName')" xid="input6" />
                </editor> 
              </column>
              <column name="fIsInName" editable="true" xid="column6"> 
                <editor xid="editor3"> 
                  <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fIsInName')" xid="input4" />
                </editor> 
              </column>
              <column name="fBuyApplyNO" editable="true" xid="column10"> 
                <editor xid="editor7"> 
                  <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fBuyApplyNO')" xid="input8" />
                </editor> 
              </column>
              <column name="fCheckNO" editable="true" xid="column7"> 
                <editor xid="editor4"> 
                  <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fCheckNO')" xid="input5" />
                </editor> 
              </column>
              <column name="fRemark" editable="true" xid="column4"> 
                <editor xid="editor1"> 
                  <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fRemark')" xid="input1" />
                </editor> 
              </column> 
            </columns> 
          </div>
        </div>
      </div></div>
