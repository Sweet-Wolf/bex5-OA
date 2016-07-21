<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:132px;top:294px;"><div component="$UI/system/components/justep/data/bizData" xid="dRights" concept="OA_KM_Rights"><reader xid="default1" action="/OA/knowledge/logic/action/queryKMRightsAction"></reader>
  <writer xid="default2" action="/OA/knowledge/logic/action/saveKMRightsAction"></writer>
  <creator xid="default3" action="/OA/knowledge/logic/action/createKMRightsAction"></creator></div></div> 
<div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel1">
   <div class="x-panel-top" xid="top1"><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="addBtn" label="添加" icon="icon-android-add" onClick="{operation:'orgDialogPC.open'}">
   <i xid="i3" class="icon-android-add"></i>
   <span xid="span3">添加</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dRights.delete'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dRights.refresh'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  </div></div>
   <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dtRights" data="dRights">
   <columns xid="columns1"><column name="fFolderName" xid="column3"></column><column name="fOrgFName" xid="column1"></column>
  <column name="fIsInherit" xid="column2"></column>
  </columns></div></div>
   <div class="x-panel-bottom" xid="bottom2">
   <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取    消" style="margin-left:30px;width:80px;" xid="cancelBtn" onClick="{operation:'windowReceiver.windowCancel'}">
    <i xid="i41"></i>
    <span xid="span41">取 消</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button" label="确定" xid="OKBtn" onClick="OKBtnClick">
    <i xid="i5"></i>
    <span xid="span5">确定</span></a> </div></div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span><span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="orgDialogPC" title="选择组织" multiSelection="true" cascade="false" includeDisabled="false" onReceive="orgDialogPCReceive"></span></div>