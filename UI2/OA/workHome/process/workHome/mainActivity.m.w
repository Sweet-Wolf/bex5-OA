<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:m;">
	<span component="$UI/chat/bex5/funcsDialog/funcsDialog" xid="funcsDialog" forceRefreshOnOpen="true" mode="selectFunc" onReceive="funcsDialogReceive" filter='$model.labelStr.get().indexOf($row.val("fTitle")) == -1'/>  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:12px;left:80px;height:auto;" onLoad="modelLoad"><div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="applyBizData" concept="OA_WorkFavorite" limit="-1" confirmDelete="false" directDelete="true" orderBy="fLabel asc">
   <creator xid="default1" action="/OA/workHome/logic/action/createOA_WorkFavoriteAction"></creator>
   <reader xid="default3" action="/OA/workHome/logic/action/queryOA_WorkFavoriteAction"></reader>
   <writer xid="default4" action="/OA/workHome/logic/action/saveOA_WorkFavoriteAction"></writer>
   <filter name="filter1" xid="filter1"></filter></div>
  </div> 
<div xid="waitDiv" style="position:relative;height:200px;">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button2" style="position:absolute;font-size:30px;top:42%;left:42%;" icon="icon-loading-a">
    <i xid="i4" class="icon-loading-a"></i>
    <span xid="span3"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2" style="display:none;">
   <div class="x-panel-content x-cards" xid="content3" style="height:100%;">
   <div xid="div6" style="margin-top:-10px;background-color:white;position:relative;" class="clearfix">
    <img alt="" xid="image6" style="width:100%;z-index:10;" src="$UI/OA/workHome/process/workHome/img/workHomeBig-03.png"></img>
    </div> 
   <div xid="div5" style="background-color:white;margin-top:-10px;" class="clearfix">
     
  <div xid="contentDiv"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row13" style="padding:0px 0px 0px 0px;margin-top:10px;background-color:white;">
   <div class="x-col col-xs-12" xid="moreBtn" style="padding:0px 0px 0px 0px;margin:3px 0px 3px 0px;background-color:white;border-bottom:1px solid #808080;"><a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right btn-defult" label="编辑" xid="compileBtn" style="color:#808080;font-size:medium;" onClick="compileBtnClick" icon="dataControl dataControl-pencill">
   <i xid="i15" class="dataControl dataControl-pencill"></i>
   <span xid="span25">编辑</span></a></div>
   </div><div component="$UI/system/components/justep/list/list" class="x-list" xid="ShowItemList" data="applyBizData" style="height:100%;padding-top:0px;background-color:white;" filter='$row.val("fPresonID") ==$model.getContext().getCurrentPersonID()' onAfterRender="ShowItemListAfterRender">
     <ul class="x-list-template clearfix" xid="listTemplateUl4" style="background-color:white;padding-top:10px;">
      <li class="col-xs-4" style="text-align:center;background-color:white;padding-top:10px;" xid="applyList" bind-click="applyListClick">
       <i xid="icon" bind-css=' val("fIcon")' style="font-size:28px;padding:5px 5px 5px 5px;border-radius:10px;color:#FFFFFF;height:35px;width:35px;" bind-style=' {backgroundColor:val("fColor")}'></i><span xid="span22" style="color:#888888;display:block;margin-top:5px;" bind-text='val("fLabel")'></span>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="removeBtn" icon="glyphicon glyphicon-remove-circle" style="position:absolute;top:-5px;right:5px;color:red;font-size:large;display:none;" onClick="removeBtnClick">
   <i xid="i1" class="glyphicon glyphicon-remove-circle"></i>
   <span xid="span2"></span></a></li> </ul> </div></div>
  </div> 
    
  
  <div xid="addMoreDiv" style="background-color:white;margin-top:10px;" class="clearfix"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon pull-right" label="button" xid="addMoreBtn" icon="glyphicon glyphicon-menu-right" style="color:#808080;font-size:large;">
   <i xid="i16" class="glyphicon glyphicon-menu-right"></i>
   <span xid="span26"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="更多" xid="button1" icon="linear linear-bus" style="color:#808080;font-size:medium;">
   <i xid="i3" class="linear linear-bus"></i>
   <span xid="span1">更多</span></a></div><i xid="i2"></i>
  </div>
   </div>
  </div>