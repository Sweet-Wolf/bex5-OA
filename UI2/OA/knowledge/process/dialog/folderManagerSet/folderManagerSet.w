<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:215px;top:183px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dManager"
      concept="OA_KM_FDManager" limit="-1"> 
      <reader xid="default1" action="/OA/knowledge/logic/action/queryKMFDManagerAction"/>  
      <writer xid="default2" action="/OA/knowledge/logic/action/saveKMFDManagerAction"/>  
      <creator xid="default3" action="/OA/knowledge/logic/action/createKMFDManagerAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dChecked" idColumn="inheritChb"> 
      <column label="inheritChb" name="inheritChb" type="Boolean" xid="default4"/>  
      <column label="overrideChb" name="overrideChb" type="Boolean" xid="default5"/>  
      <data xid="default7">[{"inheritChb":"","overrideChb":""}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="executeData" idColumn="fManagerID"> 
      <column label="fManagerID" name="fManagerID" type="String" xid="default8"/>  
      <column label="fManagerName" name="fManagerName" type="String" xid="default9"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dManagerFilter"
    style="left:56px;top:193px;" filterData="dManager"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:33px;top:401px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectManager"
    style="left:156px;top:419px;" status="normal"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'orgDialogPC.open'}" xid="button4" icon="icon-android-add"
          label="添加"> 
          <i xid="i4" class="icon-android-add"/>  
          <span xid="span4">添加</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dManager.delete'}" xid="button1"> 
          <i xid="i1"/>  
          <span xid="span1"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dManager.refresh'}" xid="button2"> 
          <i xid="i2"/>  
          <span xid="span2"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dManagerFilter.menu'}" xid="button3"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        altRows="true" class="x-grid-no-bordered" xid="grdManager" data="dManager"
        height="auto" width="100%"> 
        <columns xid="columns2"> 
          <column width="100" name="fFolderID" xid="column6" hidden="true" label="栏目ID"> 
            <editor xid="editor1"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input1" bind-ref="ref('fFolderID')"/> 
            </editor> 
          </column>  
          <column width="100" name="fManagerID" xid="column7" editable="true"
            label="管理员ID" hidden="true"> 
            <editor xid="editor2"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input2" bind-ref="ref('fManagerID')"/> 
            </editor> 
          </column>  
          <column width="100" name="fManagerName" xid="column8" label="管理员" editable="true"> 
            <editor xid="editor3"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input3" bind-ref="ref('fManagerName')"/> 
            </editor> 
          </column>  
          <column width="350" name="sOrgFName" xid="column10" label="路径"> 
            <editor xid="editor4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input4" bind-ref="ref('sOrgFName')"/> 
            </editor> 
          </column>  
          <column width="100" name="fIsInherit" xid="column9"> 
            <editor xid="editor5"> 
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="checkbox1" bind-checked=" $model.dManager.ref(&quot;fIsInherit&quot;) == '1'"/> 
            </editor> 
          </column> 
        </columns> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom2" height="90"> 
       <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col-sm-3" xid="col11"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit2"> 
            <label class="x-label" xid="label3" style="width:90px;"><![CDATA[继承父栏目]]></label>  
            <div class="x-edit" xid="div2">
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="inheritChb" bind-checked=" $model.dChecked.ref(&quot;inheritChb&quot;)"
                bind-click="inheritChbClick"/>
            </div>
          </div>
        </div>  
        <div class="col-sm-3" xid="col13"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit3"> 
            <label class="x-label" xid="label4" style="width:100px;"><![CDATA[应用于子栏目]]></label>  
            <div class="x-edit" xid="div3">
              <span component="$UI/system/components/justep/button/checkbox"
                class="x-checkbox" xid="overrideChb" bind-checked=" $model.dChecked.ref(&quot;overrideChb&quot;)"/>
            </div>
          </div>
        </div>  
        </div>
        
      
      <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button"
        label="取    消" style="margin-left:30px;width:80px;" xid="button5" onClick="{operation:'windowReceiver.windowCancel'}"> 
        <i xid="i6"/>  
        <span xid="span5">取 消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="button6" onClick="okBtnClick"> 
        <i xid="i5"/>  
        <span xid="span6">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="orgDialogPC" style="left:184px;top:349px;" multiSelection="true" status="normal"
    onReceive="orgDialogPCReceive" includeDisabled="true" width="60%" height="55%"/> 
</div>
