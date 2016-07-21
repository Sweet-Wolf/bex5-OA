<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:20px;top:205px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dFolder"
      concept="OA_KM_Folder" isTree="true" autoLoad="true"> 
      <reader xid="default1" action="/OA/knowledge/logic/action/queryFolderAction"/>  
      <treeOption xid="default8" parentRelation="fParent" rootFilter="OA_KM_Folder.fParent = 'public'"/>
    <filter name="filter0" xid="filter1"><![CDATA[OA_KM_Folder.fUseStatus = 1]]></filter></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dInfo" idColumn="fTitle" autoNew="true">
      <column label="标题" name="fTitle" type="String" xid="default9"/>  
      <column name="fFolderID" type="String" xid="default10"/>  
      <column name="fFolderName" type="String" xid="default11"/>  
      <column name="fFolderFullID" type="String" xid="default12"/>  
      <column name="fFolderFullName" type="String" xid="default13"/>  
      <column name="fOtherFolderIDs" type="String" xid="default14"/>  
      <column name="fOtherFolderNames" type="String" xid="default15"/>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgOtherFolders" src="$UI/OA/knowledge/process/dialog/selectFolder/selectFolder.w" title="其他栏目" showTitle="true" status="normal" height="80%" onReceive="dlgOtherFoldersReceive"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="default4"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="default2"> 
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;"><![CDATA[标题]]></label>  
              <div class="x-edit" xid="div1">
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="iptfTitle" bind-ref="dInfo.ref('fTitle')"/>
              </div>
            </div>
          </div> 
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit2" style="height:273px;"> 
              <label class="x-label" xid="label2" style="width:100px;"><![CDATA[发布栏目]]></label>  
              <div class="x-edit" xid="div2" style="height:288px;">
                <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid1" data="dFolder" appearance="treeGrid" expandColumn="fName" height="260px" onIndexChanged="grid1IndexChanged" width="100%"> 
                  <columns xid="columns2">
                    <column name="fName" xid="column2" />
                  </columns>
                </div>
              </div>
            </div>
          </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit3"> 
              <label class="x-label" xid="label3" style="width:100px;"><![CDATA[其他栏目]]></label>  
              <div class="x-edit" xid="div3">
                  
                
              <div class="input-group" xid="inputGroup1">
    <div component="$UI/system/components/justep/output/output" class="form-control" xid="optfOtherFolders" bind-ref="dInfo.ref('fOtherFolderNames')" style="border-right-style:none;"/><div class="input-group-addon" xid="span14" style="background-color:transparent;border-left-style:none;" bind-click="btnOtherFoldersClick">
    <i xid="i11" class="icon-android-search"></i></div></div></div>
              </div>
          </div></div> 
      </div>  
      </div>  
    <div class="x-panel-bottom" xid="bottom1">
    	<a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'> 
        <i xid="i1"/>  
        <span xid="span1">取消</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary btn-only-label x-dialog-button"
        label="确定" xid="okBtn" onClick="okBtnClick"> 
        <i xid="i2"/>  
        <span xid="span2">确定</span>
      </a>
    </div> 
  </div> 
</div>
