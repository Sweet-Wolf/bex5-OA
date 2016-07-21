<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:573px;top:110px;"> 
     <div component="$UI/system/components/justep/data/bizData" 
      xid="mainData"  directDelete="true" autoLoad="false" autoNew="true" concept="OA_AS_BuyApplyM"
      isTree="false">
      <reader xid="default1" action="/OA/asset/logic/action/queryASBuyApplyMAction"/>  
      <writer xid="default2" action="/OA/asset/logic/action/saveASBuyApplyMAction"/>  
      <creator xid="default3" action="/OA/asset/logic/action/createASBuyApplyMAction"/>
       <rule xid="rule1"> 
        <col name="fAmount" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default5">$model.detailData.sum("fAmount")</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" 
      xid="detailData"  directDelete="true" autoLoad="true" autoNew="false" concept="OA_AS_BuyApplyD"
      isTree="false" >
      <reader xid="default4" action="/OA/asset/logic/action/queryOA_AS_BuyApplyDAction"/>  
      <writer xid="default5" action="/OA/asset/logic/action/saveOA_AS_BuyApplyDAction"/>  
      <creator xid="default6" action="/OA/asset/logic/action/createOA_AS_BuyApplyDAction"/>  
      <master xid="default7" data="mainData" relation="fMasterID"/>
      <rule xid="rule7"> 
        <col name="fAmount" xid="ruleCol7"> 
          <calculate xid="calculate7"> 
            <expr xid="default11">js:isNaN($row.val('fBuyNum')*$row.val('fPrice'))?0:$row.val('fBuyNum')*$row.val('fPrice')</expr> 
          </calculate> 
        </col> 
      </rule>  
    </div>
    <div component="$UI/system/components/justep/data/bizData" xid="baseCodeData"
      concept="OA_Pub_BaseCode" columns="OA_Pub_BaseCode,fName"> 
      <reader xid="default2" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer xid="default3" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"/>  
      <creator xid="default4" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" style="width:24px;height:24px;left:286px;top:693px;"/>  
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
      <!-- <li class="x-menu-item" xid="chartItem"> 
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
      </li>  --> 
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
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.showChart'}" xid="showChartutBtn"> 
        <i xid="i9"/>  
        <span xid="span8"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'process.processRecord'}" xid="processRecordBtn"> 
        <i xid="i10"/>  
        <span xid="span9"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label"
        label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
        <i xid="i15"/>  
        <span xid="span15">更多</span> 
      </a> 
    </div>  
    <div xid="content1"> 
      <h1 xid="mainTitle" class="text-center"><![CDATA[]]></h1>  
      <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit1"> 
              <label class="x-label" xid="fApplyDeptNameL" style="width:100px;"
                bind-text="mainData.label('fApplyDeptName')"/>  
              <div class="x-edit" xid="div1"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="fApplyDeptName" bind-ref="mainData.ref('fApplyDeptName')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit2"> 
              <label class="x-label" xid="fApplyPsnNameL" style="width:100px;"
                bind-text="mainData.label('fApplyPsnName')"/>  
              <div class="x-edit" xid="div2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="fApplyPsnName" bind-ref="mainData.ref('fApplyPsnName')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit3"> 
              <label class="x-label" xid="fApplyDateL" style="width:100px;" bind-text="mainData.label('fApplyDate')"/>  
              <div class="x-edit" xid="div3"> 
                <input xid="fApplyDate" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="mainData.ref('fApplyDate')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit6"> 
              <label class="x-label" xid="fBizStateNameL" style="width:100px;"
                bind-text="mainData.label('fBizStateName')"/>  
              <div class="x-edit" xid="div6"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output form-control" xid="fBizStateName" bind-ref="mainData.ref('fBizStateName')"
                  style="background-color:#efefef;"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelOutput1"> 
              <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fAmount')"/>  
              <div class="x-edit" xid="div4"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output form-control" xid="output1" bind-ref="mainData.ref('fAmount')"
                  style="background-color:#efefef;"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit9"> 
              <label class="x-label" xid="fApplyReasonL" style="width:100px;"
                bind-text="mainData.label('fApplyReason')"/>  
              <div class="x-edit" xid="div9"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="fApplyReason" bind-ref="mainData.ref('fApplyReason')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit12"> 
              <label class="x-label" xid="fRemarkL" style="width:100px;" bind-text="mainData.label('fRemark')"/>  
              <div class="x-edit" xid="div12"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="fRemark" bind-ref="mainData.ref('fRemark')"/> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div> 
          <h5 xid="h52" style="line-height:36px;">资产明细</h5>  
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
            xid="detailBar"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              xid="addBtn" icon="icon-plus" onClick="{operation:'detailData.new'}"> 
              <i xid="i6" class="icon-plus"/>  
              <span xid="span10"/> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              xid="deleteBtn" onClick="{operation:'detailData.delete'}"> 
              <i xid="i7"/>  
              <span xid="span11"/> 
            </a> 
          </div>  
          <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
            xid="detail" data="detailData" width="100%" height="auto" class="x-grid-no-bordered"> 
            <columns xid="column"> 
              <column name="fKind" label="资产类别" editable="true"> 
                <editor xid="fKindE"> 
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control" xid="kindSelect" bind-options="$model.baseCodeData"
                    bind-optionsValue="OA_Pub_BaseCode" bind-optionsLabel="fName"
                    bind-ref="ref('fKindID')" bind-labelRef="ref('fKind')" bind-focus="kindSelectFocus"
                    style="width:100%;" optionsAutoLoad="false"/> 
                </editor> 
              </column>  
              <column name="fName" label="资产名称" editable="true"> 
                <editor xid="fNameE"> 
                  <input xid="fName" component="$UI/system/components/justep/input/input"
                    class="form-control" bind-ref="ref('fName')"/> 
                </editor> 
              </column>  
              <column name="fSpecType" label="规格型号" editable="true"> 
                <editor xid="fSpecTypeE"> 
                  <input xid="fSpecType" component="$UI/system/components/justep/input/input"
                    class="form-control" bind-ref="ref('fSpecType')"/> 
                </editor> 
              </column>  
              <column name="fUnit" label="单位" editable="true"> 
                <editor xid="fUnitE"> 
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control" xid="unitSelect" bind-ref="ref('fUnitID')"
                    bind-labelRef="ref('fUnit')" bind-options="$model.baseCodeData"
                    bind-optionsValue="OA_Pub_BaseCode" bind-optionsLabel="fName"
                    bind-focus="unitSelectFocus" optionsAutoLoad="false"/> 
                </editor> 
              </column>  
              <column name="fBuyNum" label="采购数量" editable="true"> 
                <editor xid="fBuyNumE"> 
                  <input xid="fBuyNum" component="$UI/system/components/justep/input/input"
                    class="form-control" bind-ref="ref('fBuyNum')" format="0,000"/> 
                </editor> 
              </column>  
              <column name="fPrice" label="单价" editable="true"> 
                <editor xid="fPriceE"> 
                  <input xid="fPrice" component="$UI/system/components/justep/input/input"
                    class="form-control" bind-ref="ref('fPrice')" format="0,000.00"/> 
                </editor> 
              </column>  
              <column name="fAmount" label="金额" editable="true" formatter="currency"> 
                <!--                   <editor xid="fAmountE">  -->  
                <!--                     <input xid="fAmount" component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fAmount')" format="0,000.00"/>  -->  
                <!--                   </editor>  -->  
                <formatoptions xid="default6" decimalPlaces="2" suffix="元"/> 
              </column>  
              <column name="fRemark" label="备注" editable="true"> 
                <editor xid="fRemarkE"> 
                  <input xid="fRemarkd" component="$UI/system/components/justep/input/input"
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
