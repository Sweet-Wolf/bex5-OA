<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:193px;top:7px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dFolder"
      concept="OA_KM_Folder" orderBy="fName:asc" autoLoad="true" isTree="true" onSaveCommit="dFolderSaveCommit" directDelete="true"> 
      <reader xid="default1" action="/OA/knowledge/logic/action/queryKMFolderAction"/>  
      <writer xid="default2" action="/OA/knowledge/logic/action/saveKMFolderAction"/>  
      <creator xid="default3" action="/OA/knowledge/logic/action/createKMFolderAction"/>  
      <treeOption xid="default4" parentRelation="fParent" rootFilter="OA_KM_Folder = 'public'"/>  
      <rule xid="rule4"> 
        <readonly xid="readonly6"> 
          <expr xid="default26">getCurrentRow() &amp;&amp; $model.conceptIsReadonly()</expr>
        </readonly>  
        <col name="fName" xid="ruleCol5"> 
          <required xid="required3"> 
            <expr xid="default27">true</expr>  
            <message xid="default28">'栏目名称必填!'</message>
          </required> 
        </col>  
        <col name="fUseStatusName" xid="ruleCol6"> 
          <readonly xid="readonly7"> 
            <expr xid="default29">true</expr>
          </readonly> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dRights"
      concept="OA_KM_Rights" autoLoad="true"> 
      <reader xid="default5" action="/OA/knowledge/logic/action/queryKMRightsAction"/>  
      <writer xid="default6" action="/OA/knowledge/logic/action/saveKMRightsAction"/>  
      <creator xid="default7" action="/OA/knowledge/logic/action/createKMRightsAction"/>  
      <master xid="default8" data="dFolder" relation="fFolderID"/>  
      <filter name="fltRights" xid="filter1"><![CDATA[OA_KM_Rights.fKWKind = 'Folder']]></filter>  
      <rule xid="rule3"> 
        <readonly xid="readonly5"> 
          <expr xid="default25">true</expr>
        </readonly> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dCurrentFolderInfo" idColumn="folderID"> 
      <column label="folderID" name="folderID" type="String" xid="default9"/>  
      <column label="folderFName" name="folderFName" type="String" xid="default10"/>  
      <column label="fIsNeedApprove" name="fIsNeedApprove" type="String" xid="default11"/>  
      <column label="fIsInheritApprove" name="fIsInheritApprove" type="String"
        xid="default12"/>  
      <column label="fIsInheritManager" name="fIsInheritManager" type="String"
        xid="default13"/>  
      <column label="fManagerNames" name="fManagerNames" type="String" xid="default14"/>  
      <column label="fIsInheritRights" name="fIsInheritRights" type="String" xid="default15"/>  
      <data xid="default16">[{}]</data> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgRightsSet"
    src="$UI/OA/knowledge/process/dialog/folderRigthsSet/folderRightsSet.w" title="权限设置"
    showTitle="true" status="normal" width="60%" height="60%" onReceive="dlgRightsSetReceive"/>
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="nvgFolder"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'dFolder.save'}" xid="button1"> 
      <i xid="i5"/>  
      <span xid="span6"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="deleteFolderFun" xid="deletebtn" icon="icon-android-remove" label="删除"> 
      <i xid="i6" class="icon-android-remove"/>  
      <span xid="span7">删除</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="newBtn" onClick="newBtnClick" icon="icon-android-add" label="新增"> 
      <i xid="i7" class="icon-android-add"/>  
      <span xid="span8">新增</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'dFolder.refresh'}" xid="button6"> 
      <i xid="i8"/>  
      <span xid="span9"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="启用" xid="trgStartUse" icon="icon-ios7-play" onClick="trgStartUseClick"> 
      <i xid="i9" class="icon-ios7-play"/>  
      <span xid="span12">启用</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="全部启用" xid="trgAllUse" icon="icon-ios7-skipforward" onClick="trgAllUseClick"> 
      <i xid="i9" class="icon-ios7-skipforward"/>  
      <span xid="span13">全部启用</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="停用" xid="trgStopUse" icon="icon-ios7-pause" onClick="trgStopUseClick"> 
      <i xid="i10" class="icon-ios7-pause"/>  
      <span xid="span14">停用</span> 
    </a> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgApproveSet"
    src="$UI/OA/knowledge/process/dialog/folderApproveSet/folderApproveSet.w" title="审批设置"
    showTitle="true" status="normal" width="30%" height="35%" onReceive="dlgApproveSetReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgManagerSet"
    status="normal" showTitle="true" title="管理员设置" width="50%" height="60%" src="$UI/OA/knowledge/process/dialog/folderManagerSet/folderManagerSet.w"
    onReceive="dlgManagerSetReceive"/>
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2"
    style="height:auto;width:99%;"> 
    <div class="col col-xs-4 col-sm-4 col-md-4 col-lg-4" xid="col4" style="height:auto;"> 
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        altRows="true" class="x-grid-no-bordered" xid="grdFolder" data="dFolder" appearance="tree"
        caption="名称" height="auto" useVirtualRoot="false" expandColumn="fName" width="100%"
        onRowClick="grdFolderRowClick"> 
        <columns xid="columns2">
          <column width="100" name="fName" xid="column5" label="名称"/>
        </columns> 
      </div> 
    </div>  
    <div class="col col-xs-8 col-sm-8 col-md-8 col-lg-8" xid="col5" style="height:auto;"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="审批设置" xid="approveSet" onClick="approveSetClick"> 
          <i xid="i2"/>  
          <span xid="span3">审批设置</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="管理员设置" xid="managerSet" onClick="managerSetClick"> 
          <i xid="i3"/>  
          <span xid="span4">管理员设置</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-default"
          label="权限设置" xid="rightSetBtn" onClick="openRightsSetDialog"> 
          <i xid="i4"/>  
          <span xid="span5">权限设置</span> 
        </a> 
      </div>  
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form1"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;" bind-text="dFolder.label('fName')"/>  
              <div class="x-edit" xid="div1">
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input1" bind-ref="dFolder.ref('fName')"/>
              </div>
            </div>
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit2"> 
              <label class="x-label" xid="label2" style="width:100px;" bind-text="dFolder.label('fDescription')"/>  
              <div class="x-edit" xid="div2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input6" bind-ref="dFolder.ref('fDescription')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelInput1"> 
              <label class="x-label" xid="label3" style="width:100px;" bind-text="dFolder.label('fUseStatusName')"/>  
              <div class="x-edit" xid="div3"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input3" bind-ref="dFolder.ref('fUseStatusName')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col8"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelInput2"> 
              <label class="x-label" xid="label4" style="width:100px;"><![CDATA[审批设置]]></label>  
              <div class="x-edit" xid="div4"> 
                <span component="$UI/system/components/justep/button/checkbox"
                  class="x-checkbox" xid="checkbox2" value="1" bind-checked="$model.dCurrentFolderInfo.val(&quot;fIsNeedApprove&quot;) == '1'"
                  disabled="true"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelInput3"> 
              <label class="x-label" xid="label5" style="width:100px;"><![CDATA[管理员设置]]></label>  
              <div class="x-edit" xid="div5"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input4" bind-ref="dCurrentFolderInfo.ref('fManagerNames')" readonly="true"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit3"> 
              <label class="x-label" xid="label6" style="width:100px;"><![CDATA[权限设置]]></label>  
              <div class="x-edit" xid="div6"> 
                <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
                  altRows="true" xid="grdRights" data="dRights" height="auto" class="x-grid-no-bordered x-grid-title-center" width="100%"> 
                  <columns xid="columns1"> 
                    <column name="fOrgFName" xid="column1" label="组织" width="200"> 
                      <editor xid="editor1"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" xid="output1" bind-ref="ref('fOrgFName')"/>
                      </editor> 
                    </column>  
                    <column name="fCanCreateKW" xid="column2" label="创建知识" align="center"
                      width="60"> 
                      <editor xid="editor2"> 
                        <span component="$UI/system/components/justep/button/checkbox"
                          class="x-checkbox" xid="checkbox3" bind-checked=" $model.dRights.ref(&quot;fCanCreateKW&quot;)"/>
                      </editor> 
                    </column>  
                    <column name="fCanReleaseKW" xid="column3" label="发布知识" align="center"
                      width="60"> 
                      <editor xid="editor3"> 
                        <span component="$UI/system/components/justep/button/checkbox"
                          class="x-checkbox" xid="checkbox4" bind-checked=" $model.dRights.ref(&quot;fCanReleaseKW&quot;)"/>
                      </editor> 
                    </column>  
                    <column name="fIsInherit" xid="column4" label="继承" align="center"
                      width="60"> 
                      <editor xid="editor4"> 
                        <span component="$UI/system/components/justep/button/checkbox"
                          class="x-checkbox" xid="checkbox5" bind-checked=" $model.dRights.ref(&quot;fIsInherit&quot;)"/>
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
</div>
