<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:45px;top:144px;"><div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="mainData" concept="OA_VS_Survey" orderBy="fDeptFName,fPerName"><reader xid="default1" action="/OA/survey/logic/action/queryVSSurveyAction"></reader>
  <writer xid="default2" action="/OA/survey/logic/action/saveVSSurveyAction"></writer>
  <creator xid="default3" action="/OA/survey/logic/action/createVSSurveyAction"></creator></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dTemp" idColumn="paperID"><column name="paperID" type="String" xid="xid1"></column>
  <column name="pState" type="String" xid="xid2"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dBtn" idColumn="insert"><column name="insert" type="String" xid="xid3"></column>
  <column name="sendSurvey" type="String" xid="xid4"></column>
  <column name="destroySurvey" type="String" xid="xid5"></column>
  <column name="allSendSurvey" type="String" xid="xid6"></column></div></div> 
<span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive" style="left:40px;top:-1px;"></span><span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="orgDialogPC" multiSelection="true" width="60%" height="60%" onReceive="orgDialogPCReceive"></span><div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="insertDOMActivate" xid="button3" label="新增" icon="icon-android-add">
   <i xid="i3" class="icon-android-add"></i>
   <span xid="span3">新增</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.save'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.delete'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.refresh'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span4"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="发布" xid="button5" icon="icon-ios7-browsers" onClick="trgSendDOMActivate">
   <i xid="i5" class="icon-ios7-browsers"></i>
   <span xid="span5">发布</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="作废" xid="button6" icon="icon-ios7-browsers" onClick="trgDestroyDOMActivate">
   <i xid="i6" class="icon-ios7-browsers"></i>
   <span xid="span6">作废</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="全部发布" xid="button7" icon="icon-ios7-browsers" onClick="trgAllSendDOMActivate">
   <i xid="i7" class="icon-ios7-browsers"></i>
   <span xid="span7">全部发布</span></a></div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="mainData">
   <columns xid="columns2"><column name="fDeptFName" xid="column7"></column><column name="fPerName" xid="column6"></column>
  
  <column name="fSState" xid="column8"></column>
  <column name="fFinishTime" xid="column9"></column>
  <column name="fSendTime" xid="column10"></column></columns></div>
  </div>