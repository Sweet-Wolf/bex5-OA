<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:493px;top:264px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dRights"
      concept="OA_KM_Rights" limit="-1"> 
      <reader xid="default1" action="/OA/knowledge/logic/action/queryKMRightsAction"/>  
      <writer xid="default2" action="/OA/knowledge/logic/action/saveKMRightsAction"/>  
      <creator xid="default3" action="/OA/knowledge/logic/action/createKMRightsAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dCheck" idColumn="inheritChb"> 
      <column label="inheritChb" name="inheritChb" type="Boolean" xid="default4"/>  
      <column label="overrideFDChb" name="overrideFDChb" type="Boolean" xid="default5"/>  
      <column label="overrideKWChb" name="overrideKWChb" type="Boolean" xid="default6"/>  
      <data xid="default7">[{"inheritChb":"","overrideFDChb":"","overrideKWChb":""}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="executeData" idColumn="fOrgKind"> 
      <column label="fOrgKind" name="fOrgKind" type="String" xid="default8"/>  
      <column label="fOrgID" name="fOrgID" type="String" xid="default9"/>  
      <column label="fOrgName" name="fOrgName" type="String" xid="default10"/>  
      <column label="fOrgFID" name="fOrgFID" type="String" xid="default11"/>  
      <column label="fOrgFName" name="fOrgFName" type="String" xid="default12"/>  
      <column label="fCanCreateKW" name="fCanCreateKW" type="String" xid="default13"/>  
      <column label="fCanReadKW" name="fCanReadKW" type="String" xid="default14"/>  
      <column label="fCanReleaseKW" name="fCanReleaseKW" type="String" xid="default15"/>  
      <column label="fCanCreateComment" name="fCanCreateComment" type="String"
        xid="default16"/>  
      <column label="fCanReadComment" name="fCanReadComment" type="String" xid="default17"/>  
      <column label="fCanReadRecord" name="fCanReadRecord" type="String" xid="default18"/>  
      <column label="fCanScore" name="fCanScore" type="String" xid="default19"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:353px;top:22px;" onReceive="windowReceiverReceive"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dRights.delete'}" xid="button1"> 
          <i xid="i1"/>  
          <span xid="span1"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'orgDialogPC.open'}" xid="button2" label="添加" icon="icon-android-add"> 
          <i xid="i2" class="icon-android-add"/>  
          <span xid="span2">添加</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dRights.refresh'}" xid="button3"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dRightsFilter.menu'}" xid="button4"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        altRows="true" xid="grdRights" data="dRights" class="x-grid-no-bordered x-grid-title-center"
        height="auto" width="100%"> 
        <columns xid="columns1"> 
          <column name="fOrgFName" xid="column1" label="组织"> 
            <editor xid="editor1"> 
              <div component="$UI/system/components/justep/output/output" class="x-output"
                xid="output1" bind-ref="ref('fOrgFName')"/> 
            </editor> 
          </column>  
          <column name="fCanCreateKW" xid="column2" label="创建知识" align="center" editable="true"> 
            <editor xid="editor2"> 
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="checkbox3" bind-checked=" $model.dRights.ref(&quot;fCanCreateKW&quot;)"/> 
            </editor> 
          </column>  
          <column name="fCanReleaseKW" xid="column3" label="发布知识" align="center" editable="true"> 
            <editor xid="editor3"> 
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="checkbox4" bind-checked=" $model.dRights.ref(&quot;fCanReleaseKW&quot;)"/> 
            </editor> 
          </column>  
          <column name="fIsInherit" xid="column4" label="继承" align="center"> 
            <editor xid="editor4"> 
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="checkbox5" bind-checked=" $model.dRights.ref(&quot;fIsInherit&quot;)"/> 
            </editor> 
          </column> 
        </columns> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom2" height="90"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row2"> 
        <div class="col col-xs-2" xid="col7"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label2" style="width:90px;"><![CDATA[继承父栏目]]></label>  
            <div class="x-edit" xid="div1">
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="inheritChb" bind-checked=" $model.dCheck.ref(&quot;inheritChb&quot;)"
                bind-click="inheritChbClick"/>
            </div>
          </div>
        </div>  
        <div class="col col-xs-2" xid="col8">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit2"> 
            <label class="x-label" xid="label3" style="width:100px;"><![CDATA[应用于子栏目]]></label>  
            <div class="x-edit" xid="div2">
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="checkbox2" bind-checked=" $model.dCheck.ref(&quot;overrideFDChb&quot;)"/>
            </div>
          </div>
        </div>  
        <div class="col col-xs-2" xid="col9">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit3"> 
            <label class="x-label" xid="label4" style="width:90px;"><![CDATA[应用于知识]]></label>  
            <div class="x-edit" xid="div3">
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="checkbox6" bind-checked=" $model.dCheck.ref(&quot;overrideKWChb&quot;)"/>
            </div>
          </div>
        </div> 
      </div>  
      <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
        label="取    消" style="margin-left:30px;width:80px;" xid="cancelBtn" onClick="{operation:'windowReceiver.windowCancel'}"> 
        <i xid="i41"/>  
        <span xid="span41">取 消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i5"/>  
        <span xid="span5">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="orgDialogPC" multiSelection="true" onReceive="orgDialogPCReceive" width="60%"
    height="55%"/>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dRightsFilter"
    filterData="dRights"/> 
</div>
