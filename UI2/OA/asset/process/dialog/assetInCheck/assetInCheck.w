<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:288px;top:4px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="OA_AS_CheckM">
      <reader xid="default1" action="/OA/asset/logic/action/queryASCheckMAction"/>  
      <writer xid="default2" action="/OA/asset/logic/action/saveASCheckMAction"/>  
      <creator xid="default3" action="/OA/asset/logic/action/createASCheckMAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      concept="OA_AS_CheckD" autoLoad="false" autoNew="true">
      <reader xid="default4" action="/OA/asset/logic/action/queryASCheckDAction"/>  
      <writer xid="default5" action="/OA/asset/logic/action/saveASCheckDAction"/>  
      <creator xid="default6" action="/OA/asset/logic/action/createASCheckDAction"/>  
      <master xid="default7" data="mainData" relation="fMasterID"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1">
      <div xid="div10"> 
        <h5 xid="h51" style="line-height:36px;">基本信息</h5>  
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit1"> 
              <label class="x-label" xid="fDateL" bind-text="mainData.ref('fDate')"
                style="width:100px;"/>  
              <div class="x-edit" xid="div1"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="fDate" bind-ref="mainData.ref('fDate')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label20" xid="labelEdit2"> 
              <label class="x-label" xid="fNOL" bind-text="mainData.label('fNO')"
                style="width:100px;"/>  
              <div class="x-edit" xid="div2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="fNO" bind-ref="mainData.ref('fNO')"/>
              </div> 
            </div> 
          </div> 
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput3"> 
              <label class="x-label" xid="fCheckDeptsL" bind-text="mainData.label('fCheckDepts')" style="width:100px;" />  
              <div class="x-edit" xid="div6"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" xid="fCheckDepts" bind-ref="mainData.ref('fCheckDepts')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput2"> 
              <label class="x-label" xid="fCheckPsnsL" bind-text="mainData.label('fCheckPsns')" style="width:100px;" />  
              <div class="x-edit" xid="div7"> 
                <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fCheckPsns" bind-ref="mainData.ref('fCheckPsns')" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col3"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput1"> 
              <label class="x-label" xid="fRemarkL" bind-text="mainData.label('fRemark')" style="width:100px;" />  
              <div class="x-edit" xid="div3"> 
                <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fRemark" bind-ref="mainData.ref('fRemark')" />
              </div> 
            </div> 
          </div></div>  
        </div>  
      <h5 xid="h52" style="line-height:36px;">验收项</h5>  
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"
        xid="listBar"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="addBtn" icon="icon-plus" label="添加" onClick="{operation:'detailData.new'}"> 
          <i xid="i6" class="icon-plus"/>  
          <span xid="span10">添加</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="deleteBtn" onClick="{operation:'detailData.delete'}"> 
          <i xid="i7"/>  
          <span xid="span11">删除</span>
        </a> 
      </div>
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="detailGrid" data="detailData" showRowNumber="true" height="auto" width="100%"> 
        <columns xid="columns1">
          <column name="fCheckItem" xid="column1" editable="true">
          	<editor xid="editor11"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fCheckItem')" xid="input12" />
            </editor>
          </column>  
          <column name="fDescription" xid="column2" editable="true">
          	<editor xid="editor11"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fDescription')" xid="input12" />
            </editor>
          </column>  
          <column name="fCheckPsn" xid="column3" editable="true">
          	<editor xid="editor11"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fCheckPsn')" xid="input12" />
            </editor>
          </column>  
          <column name="fRemark" xid="column4" editable="true">
          	<editor xid="editor11"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fRemark')" xid="input12" />
            </editor>
          </column>
        </columns>
      </div></div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"wReceiver.windowCancel"}'> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/> 
</div>
