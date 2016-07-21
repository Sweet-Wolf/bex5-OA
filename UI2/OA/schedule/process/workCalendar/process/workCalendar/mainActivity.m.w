<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:14px;left:246px;" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="workLogCountData" idColumn="fID" onCustomRefresh="workLogCountDataCustomRefresh"><column label="fID" name="fID" type="String" xid="xid2"></column>
  <column label="工作日志填写人" name="PersonName" type="String" xid="xid1"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="approvalData" idColumn="fID" onCustomRefresh="approvalDataCustomRefresh"><column name="fID" type="String" xid="xid11"></column>
  <column name="fApplyPsnName" type="String" xid="xid12"></column>
  <column name="fApplyType" type="String" xid="xid13"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="approvalStaData" idColumn="fApplyPsnName"><column name="fApplyPsnName" type="String" xid="xid15"></column>
  <column name="fApplyType" type="String" xid="xid16"></column>
  <column label="人数" name="fCount" type="String" xid="xid17"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="signPersonData" idColumn="fID" onCustomRefresh="signPersonDataCustomRefresh"><column name="fID" type="String" xid="xid14"></column>
  <column name="fPersonName" type="String" xid="xid18"></column>
  <extendType xid="extendType1"></extendType></div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1" bind-load="panel1Load"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="titleBar" title="工作日历">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">工作日历</div>  
          <div class="x-titlebar-right reverse"> 
          </div>
        </div> 
      </div>  
    <div xid="waitDiv" style="position:relative;height:200px;">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button2" style="position:absolute;font-size:30px;top:42%;left:42%;" icon="icon-loading-a">
    <i xid="i3" class="icon-loading-a"></i>
    <span xid="span3"></span></a> </div><div class="x-panel-content" xid="content1" style="display:none;">
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full" xid="panel2">
   <div class="x-panel-top" xid="top2"><div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar" xid="scheTitleBar">
   <div class="x-titlebar-left" xid="left1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="prevBtn" icon="icon-ios7-arrow-back" onClick="prevBtnClick">
   <i xid="i1" class="icon-ios7-arrow-back"></i>
   <span xid="span1"></span></a>
  <span xid="monthSpan"></span></div>
   <div class="x-titlebar-title" xid="title1"></div>
   <div class="x-titlebar-right reverse" xid="right1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="nextBtn" icon="icon-ios7-arrow-forward" onClick="nextBtnClick">
   <i xid="i2" class="icon-ios7-arrow-forward"></i>
   <span xid="span2"></span></a></div></div></div>
   <div class="x-panel-content" xid="content2"><div component="$UI/system/components/justep/calendar/calendar" view="month" day="now" firstDay="monday" lunarDay="false" xid="calendar" views="month" bind-click="calendarClick"></div>
  
  
  
  <div xid="div7" style="background-color:#EEEEF3;"><div xid="approvalDiv" style="padding:0px 15px;background-color:white;"><div class="media" xid="media1">
   <div class="media-left media-middle" xid="mediaLeft1">
    <a href="#" xid="a1">
     <img class="media-object" src="$UI/OA/common/images/workLog_approve.png" alt="" xid="image1" style="width:20;" height="20"></img></a> </div> 
   <div class="media-body" xid="mediaBody1">
    <div xid="div2" style="border-bottom:1px solid #dbdbdb;" class="clearfix"><h4 xid="Approval" class="pull-left"><![CDATA[审批]]></h4>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="进入首页" xid="btnApproval" onClick="btnApprovalClick">
   <i xid="i4"></i>
   <span xid="span5">进入首页</span></a>
  </div>
  <div xid="approvalContentDiv"><p xid="pApproval" style="padding:5px 5px 5px 5px;"><![CDATA[想看团队审批情况，提交一个审批吧]]>
  </p>
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="approvalList" data="approvalStaData" dataItemAlias="approvalRow">
   <ul class="x-list-template" xid="listTemplateUl3">
    <li xid="li3" style="padding-bottom:10px;"><span xid="fApplyType" bind-text='val("fApplyType")+"人数："' style="font-weight:bold;"></span>
  <span xid="personNumber" bind-text='val("fCount")'></span><div component="$UI/system/components/justep/list/list" class="x-list" xid="list6" data="approvalData" filter=' $row.val("fApplyType") ==approvalRow.val("fApplyType")'>
   <ul class="x-list-template" xid="listTemplateUl6">
    <li xid="li6" style="display:inline-block;"><div class="x-blob" component="$UI/system/components/justep/org/orgImage" style="height:35px;width:35px;margin-top:5px;" xid="fApplyPsnName" bind-ref='ref("fApplyPsnName")'>
   <div class="x-blob-bar" xid="div9">
    <i class="x-blob-edit icon-compose" xid="i9"></i>
    <i class="x-blob-del icon-close-round" xid="i10"></i></div> 
   <img class="x-blob-img x-autofill" xid="image6"></img></div>
  <span xid="personNameSpan" bind-text='val("fApplyPsnName")' style="display:block;margin-top:5px;"></span></li></ul> </div></li></ul> </div></div></div> 
  </div></div><div xid="signDiv" style="padding:0px 15px;background-color:white;margin-top:10px;">
   <div class="media" xid="media2">
    <div class="media-left" xid="mediaLeft2">
     <a href="#" xid="a2">
      <img class="media-object" src="$UI/OA/common/images/workLog_sign.png" alt="" xid="image2" height="20" style="width:20;"></img></a> </div> 
    <div class="media-body" xid="mediaBody3">
     <div xid="div3" style="border-bottom:1px solid #dbdbdb;" class="clearfix">
      <h4 xid="hSign" class="pull-left"><![CDATA[签到]]></h4>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="进入首页" xid="btnSign" onClick="{operation:'locationDialog.open'}">
       <i xid="i5"></i>
       <span xid="span6">进入首页</span></a> </div> 
     <p xid="pSign" style="padding:5px 5px 5px 5px;"><![CDATA[想看团队人员位置分布，签一下到吧]]></p>
  <div xid="divSign">
   <span xid="signCountSpan" style="display:block;font-weight:bold;" bind-text='"签到人数："+$model.signPersonData.getCount()'></span><div component="$UI/system/components/justep/list/list" class="x-list" xid="list4" data="signPersonData">
   <ul class="x-list-template" xid="listTemplateUl5">
    <li xid="li5" class="pull-left" style="margin-right:10px;"><div class="x-blob" component="$UI/system/components/justep/org/orgImage" xid="signPerson" bind-ref='ref("fPersonName")' style="height:35px;width:35px;">
   <div class="x-blob-bar" xid="div6">
    <i class="x-blob-edit icon-compose" xid="i13"></i>
    <i class="x-blob-del icon-close-round" xid="i14"></i></div> 
   <img class="x-blob-img x-autofill" xid="image8"></img></div>
  <span xid="singPersonName" style="display:block;margin-top:5px;" bind-text='val("fPersonName")'></span></li></ul> </div>
  </div></div> </div> </div><div xid="workLogDiv" style="padding:0px 15px;background-color:white;;margin-top:10px;">
   <div class="media" xid="media3">
    <div class="media-left media-middle" xid="mediaLeft3">
     <a href="#" xid="a3">
      <img class="media-object" src="$UI/OA/common/images/workLog.png" alt="" xid="image3" style="width:20;" height="20"></img></a> </div> 
    <div class="media-body" xid="mediaBody4">
     <div xid="div5" style="border-bottom:1px solid #dbdbdb;" class="clearfix">
      <h4 xid="hLog" class="pull-left"><![CDATA[日志]]></h4>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" label="进入首页" xid="btnLog" onClick="btnLogClick">
       <i xid="i6"></i>
       <span xid="span7">进入首页</span></a> 
  </div> 
     <div xid="workLogContent"><div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
   <div class="x-col" xid="col3">
    <span xid="span8" style="margin-right:20px;font-weight:bold;"><![CDATA[提交人数：]]></span>
    <span xid="countSpan"><![CDATA[]]></span></div> </div>
  <div component="$UI/system/components/justep/row/row" class="x-row" xid="row2">
   <div class="x-col" xid="headPortrait">
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list3" data="workLogCountData">
   <ul class="x-list-template" xid="listTemplateUl4">
    <li xid="li4" class="pull-left"><div class="x-blob" component="$UI/system/components/justep/org/orgImage" xid="logPerson" bind-ref='ref("PersonName")' style="height:35px;width:35px;">
   <div class="x-blob-bar" xid="div4">
    <i class="x-blob-edit icon-compose" xid="i11"></i>
    <i class="x-blob-del icon-close-round" xid="i12"></i></div> 
   <img class="x-blob-img x-autofill" xid="image7"></img></div>
  <span xid="logPersonName" bind-text='val("PersonName")' style="display:block;margin-top:5px;"></span></li></ul> </div></div></div>
  </div><div xid="workLogPrompt"><p xid="p3"><![CDATA[想看团队日志提交情况，提交一个日志吧]]></p></div></div> </div> </div>
  </div></div>
   </div>
  </div>
  </div> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="logDialog" src="$UI/OA/workLog/process/logDetail/logDetail.m.w"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="approvalDialog" src="$UI/OA/ExaminationApproval/process/ExaminationApproval/mainActivity.m.w"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="locationDialog" src="$UI/OA/sign/process/sign/mainActivity.m.w" onClose="locationDialogClose"></span></div>