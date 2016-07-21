<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:28px;top:141px;" onLoad="modelLoad"><div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="true" concept="OA_AM_Category" columns="OA_AM_Category,version,fCategoryNO,fCategoryName,fUseStatus,fUseStatusName,fParentID,fSequence,fDescription,fStopDate,fCategoryURL,fCategoryURLCode,fCategoryURLName,fCreateOgnID,fCreateOgnName,fCreateDeptID,fCreateDeptName,fCreatePosID,fCreatePosName,fCreatePsnID,fCreatePsnName,fCreatePsnFID,fCreatePsnFName,fCreateTime" autoNew="false" confirmRefresh="false" limit="-1" orderBy="fSequence:asc" isTree="true" onSaveCommit="mainDataSaveCommit" onValueChanged="mainDataValueChanged">
   <reader action="/OA/archival/logic/action/queryAMCategoryAction" xid="default8"></reader>
   <writer action="/OA/archival/logic/action/saveAMCategoryAction" xid="default9"></writer>
   <creator action="/OA/archival/logic/action/createAMCategoryAction" xid="default10"></creator>
   <treeOption xid="default1" parentRelation="fParentID" rootFilter="OA_AM_Category.fParentID='_is_root_'"></treeOption>
   <rule xid="rule1">
    <col name="fCategoryNO" xid="ruleCol1">
     <readonly xid="readonly1">
      <expr xid="default2"></expr></readonly> 
     <required xid="required1">
      <expr xid="default5">true</expr></required> </col> 
    <col name="fCategoryName" xid="ruleCol2">
     <readonly xid="readonly2">
      <expr xid="default3"></expr></readonly> 
     <required xid="required2">
      <expr xid="default6">true</expr></required> </col> 
    <col name="fSequence" xid="ruleCol3">
     <readonly xid="readonly3">
      <expr xid="default4"></expr></readonly> 
     <required xid="required3">
      <expr xid="default7">true</expr></required> </col> </rule> </div></div> 
<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="newBtn" label="新建类目" icon="icon-android-add" onClick="newBtnClick">
   <i xid="i19" class="icon-android-add"></i>
   <span xid="span2">新建类目</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.save'}" xid="saveBtn">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="delBtn" onClick="{operation:'mainData.delete'}">
   <i xid="i2"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mainData.refresh'}" xid="refreshBtn">
   <i xid="i3"></i>
   <span xid="span4"></span></a>
  <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button" icon="icon-ios7-play" label="启用" onClick="StartUseBtnClick" xid="StartUseBtn">
   <i class="icon-ios7-play" xid="i23"></i>
   <span xid="span5">启用</span></a>
  <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button" icon="icon-ios7-play" label="全部启用" onClick="AllUseBtnClick" xid="AllUseBtn">
   <i class="icon-ios7-play" xid="i21"></i>
   <span xid="span15">全部启用</span></a>
  <a class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button" icon="icon-ios7-pause" label="停用" onClick="StopUseBtnClick" xid="StopUseBtn">
   <i class="icon-ios7-pause" xid="i24"></i>
   <span xid="span15">停用</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="修复路径" xid="trgRepair" icon="icon-ios7-browsers" onClick="trgRepairClick">
   <i xid="i4" class="icon-ios7-browsers"></i>
   <span xid="span6">修复路径</span></a></div>
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2" style="height:100%;overflow:hidden;">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col24">
    <div class="x-bordered" style="height:7700%;" xid="div1">
     <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grdCategory" data="mainData" appearance="tree" expandColumn="fCategoryName" useVirtualRoot="true" virtualRootLabel="类目设置" width="100%" height="auto">
      <columns xid="columns1">
       <column name="fCategoryName" xid="column1" label="类目" editable="true"></column></columns> </div> </div> </div> 
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col20">
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row3">
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col10">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput4">
       <label class="x-label" style="width:100px;" title="类 目 号" xid="label10">类 目 号</label>
       <div class="x-edit" xid="div10" style="width:200px;">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input26" bind-ref="mainData.ref('fCategoryNO')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col26">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput1">
       <label class="x-label" xid="label7" style="width:100px;" title="启用标识">启用标识</label>
       <div class="x-edit" xid="div7">
        <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fUseStatusName')" xid="output12"></output></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col27">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput1">
       <label class="x-label" xid="label3" style="width:100px;" title="类目名称">类目名称</label>
       <div class="x-edit" xid="div3">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input25" bind-ref="mainData.ref('fCategoryName')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col29">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelInput2">
       <label class="x-label" xid="label14" style="width:100px;" title="排 序">排 序</label>
       <div class="x-edit" xid="div40">
        <input component="$UI/system/components/justep/input/input" class="form-control" xid="input27" bind-ref="mainData.ref('fSequence')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col21">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelTextarea1">
       <label class="x-label" xid="label2" style="width:100px;" title="描      述">描      述</label>
       <div class="x-edit" xid="div4">
        <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="mainData.ref('fDescription')" xid="textarea1"></textarea></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col13">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit10">
       <label class="x-label" xid="label11" style="width:100px;" title="提交部门">提交部门</label>
       <div class="x-edit" xid="div18">
        <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output1" bind-ref="mainData.ref('fCreateDeptName')"></div></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col6">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
       <label class="x-label" xid="label6" style="width:100px;" title="提 交 人">提 交 人</label>
       <div class="x-edit" xid="div20">
        <div component="$UI/system/components/justep/output/output" class="x-output form-control" xid="output2" bind-ref="mainData.ref('fCreatePsnName')"></div></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col12">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput3">
       <label class="x-label" xid="label5" style="width:100px;" title="提交时间">提交时间</label>
       <div class="x-edit" xid="div21">
        <output class="x-output form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fCreateTime')" xid="output8"></output></div> </div> </div> 
     <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col28">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelOutput5">
       <label class="x-label" xid="label12" style="width:100px;" title="停用时间">停用时间</label>
       <div class="x-edit" xid="div38">
        <output class="form-control" component="$UI/system/components/justep/output/output" data="mainData" bind-ref="mainData.ref('fStopDate')" xid="output11"></output></div> </div> </div> </div> </div> </div></div>