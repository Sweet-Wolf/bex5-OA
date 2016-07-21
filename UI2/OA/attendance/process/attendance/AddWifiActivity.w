<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="top:406px;left:257px;height:auto;" onParamsReceive="modelParamsReceive"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="mainData" idColumn="wifiMac"><column label="wifiMac地址" name="wifiMac" type="String" xid="xid1"></column>
  <column label="wifi名称" name="wifiName" type="String" xid="xid2"></column></div></div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="添加办公WIFI"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">添加办公WIFI</div>  
          <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="okBtn" icon="icon-android-checkmark" onClick="okBtnClick">
   <i xid="i1" class="icon-android-checkmark"></i>
   <span xid="span4"></span></a></div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/justep/list/list" class="x-list" xid="list1" data="mainData">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" style="margin-bottom:10px;border:1px solid #dbdbdb;"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-2" xid="col1" style="padding-top:14px;padding-left:40px;"><span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="checkbox1" name="check" onChange="checkbox1Change"></span></div>
   <div class="col col-xs-10" xid="col2"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2">
   <div class="col col-xs-12" xid="col4"><span xid="span1" bind-text='val("wifiName")' style="font-weight:bold;font-size:medium;"></span></div>
   <div class="col col-xs-12" xid="col5"><span xid="span2" bind-text='val("wifiMac")'></span></div>
   <div class="col col-xs-12" xid="col6"><span xid="span3"><![CDATA[你附近的]]></span></div></div></div>
   </div></li></ul> </div></div>
  </div> 
</div>