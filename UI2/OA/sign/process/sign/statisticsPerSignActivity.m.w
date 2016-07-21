<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:267px;left:49px;" onModelConstructDone="modelModelConstructDone" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="signInfoData" concept="OA_Sign" orderBy="fSignTime desc"><reader xid="default4" action="/OA/sign/logic/action/queryOA_SignAction"></reader>
  <creator xid="default5"></creator>
  <writer xid="default6"></writer>
  </div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="统计"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">统计</div>  
        <div class="x-titlebar-right reverse"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-sm btn-icon-left pull-right" label="选择日期" xid="selDate" onClick="{operation:'datePicker.show'}" icon="icon-ios7-calendar-outline" style="font-size:0.8em;font-weight:bold;">
   <i xid="i1" class="icon-ios7-calendar-outline"></i>
   <span xid="span1">选择日期</span></a></div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" xid="content1" style="background-color:#ddd;display:none;"> 
      <div xid="div1" style="padding:10px;margin-bottom:10px;background-color:white;"> 
        <span xid="weekSpan" style="padding:5px 5px 5px 10px;" /><span xid="dateSpan" style="padding:5px 5px 5px 10px;"/></div> 
    <div component="$UI/system/components/justep/list/list" class="x-list" xid="signList" data="signInfoData" style="background-color:white;">
   <ul class="x-list-template" xid="listTemplateUl1">
    <li xid="li1" style="margin-bottom:5px;border-bottom:1px solid #bbbbbb;">
  
  <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel" xid="panel2">
   <div class="panel-heading" xid="heading1" style="background-color:#eeeeee;">
    <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2" style="padding-bottom:0;">
   <div class="x-col x-col-fixed x-col-center" xid="col3" style="width:auto;"><div class="x-blob" component="$UI/system/components/justep/org/orgImage" style="height:45px;width:45px;" xid="orgImage1" bind-ref='ref("fPersonID")' orgKind="person">
   <div class="x-blob-bar" xid="div2">
    <i class="x-blob-edit icon-compose" xid="i2"></i>
    <i class="x-blob-del icon-close-round" xid="i3"></i></div> 
   <img class="img-circle x-blob-img x-autofill" xid="image1"></img></div></div>
   <div class="x-col x-col-fixed x-col-center" xid="col4" style="width:auto;"><span xid="span2" bind-text='val("fPersonName")'></span>
  </div>
   <div class="x-col x-col-fixed x-col-center" xid="col5" style="width:auto;"><span xid="span3" bind-text='$object.val("fSignTime").toString().split(" ")[1]'></span></div></div></div> 
   <div class="panel-body" xid="body1" bind-visible=' val("fRemark")'><div component="$UI/system/components/justep/row/row" class="x-row" xid="row4" style="padding-left:15px;margin-top:10px;margin-bottom:10px;">
   <div class="x-col" xid="col1"><span xid="remarkSpan" bind-text='"备注："+val("fRemark")' bind-visible='val("fRemark")'></span></div>
   </div></div>
   <div class="panel-footer" xid="footer1" style="background-color:white;"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row3">
   <div class="x-col" xid="col6" style="padding-top:0;">
  <div component="$UI/system/components/justep/row/row" class="x-row no-padding" xid="row1">
   <div class="x-col x-col-fixed no-padding x-col-center" xid="col2" style="width:auto;"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" xid="button2" icon="icon-android-location" style="margin-left:5px;color:#999;">
   <i xid="i5" class="icon-android-location"></i>
   <span xid="span4" bind-text=' val("fSignAddress")? val("fSignAddress"):"地理信息暂无"'></span></a></div>
   <div class="x-col x-col-center no-padding" xid="col7" style="color:#999;"><span xid="span6" bind-text=' val("fSignAddress")? val("fSignAddress"):"地理信息暂无"'></span></div>
   </div></div>
   </div></div></div></li></ul> </div>
  <h2 xid="h21" bind-visible=' !$model.signInfoData.val("fSignTime")' style="text-align:center;font-size:small;color:#aaa;"><![CDATA[用户还未签到]]></h2></div> 
  </div> 
<div component="$UI/system/components/justep/datePicker/datePicker" class="x-popPicker" xid="datePicker" onOK="datePickerOK" type="date" style="top:68px;left:29px;">
   <div class="x-popPicker-overlay" xid="div4"></div>
   <div class="x-popPicker-content" xid="div5">
    <div class="x-poppicker-header" xid="div6">
     <button class="btn btn-default x-btn-ok" xid="button3">确定</button></div> </div> </div>
  <div xid="waitDiv" style="position:relative;height:200px;">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button1" style="position:absolute;font-size:30px;top:42%;left:42%;" icon="icon-loading-a">
    <i xid="i4" class="icon-loading-a"></i>
    <span xid="span5"></span></a> </div></div>
