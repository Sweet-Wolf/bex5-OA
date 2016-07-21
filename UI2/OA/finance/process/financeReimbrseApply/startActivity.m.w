<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile"
  xid="window" class="oa" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:453px;top:500px;" onLoad="modelLoad"> 
    <!--     <div component="$UI/system/components/justep/data/data" xid="controlData" -->  
    <!--       idColumn="edit" autoLoad="true">  -->  
    <!--       <column name="edit" type="Integer"/>   -->  
    <!--       <data><![CDATA[ -->  
    <!--       [{edit:0}] -->  
    <!--       ]]></data>  -->  
    <!--     </div>  --> 
  <div component="$UI/system/components/justep/data/bizData" xid="mainData" directDelete="true" autoLoad="false" autoNew="true" concept="OA_FC_ReimbApplyM" orderBy="" columns="" isTree="false" onSaveCommit="mainDataSaveCommit">
   <reader action="/OA/finance/logic/action/queryFCReimbApplyMAction" xid="default1"></reader>
   <writer action="/OA/finance/logic/action/saveFCReimbApplyMAction" xid="default2"></writer>
   <creator action="/OA/finance/logic/action/createFCReimbApplyMAction" xid="default3"></creator>
   <rule xid="rule1">
   
   <col name="fReiEvent" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default11">true</expr></required> </col> 
   <col name="fRemark" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default12">true</expr></required> </col> 
   <col name="fReimAmt" xid="ruleCol4">
    <readonly xid="readonly1">
     <expr xid="default13"></expr></readonly> 
    <required xid="required4">
     <expr xid="default14">true</expr></required> </col> </rule></div>
  <div component="$UI/system/components/justep/data/bizData" xid="detailData" directDelete="true" autoLoad="true" autoNew="false" concept="OA_FC_ReimbApplyD" orderBy="" isTree="false">
   <reader action="/OA/finance/logic/action/queryFCReimbApplyDAction" xid="default4"></reader>
   <writer action="/OA/finance/logic/action/saveFCReimbApplyDAction" xid="default5"></writer>
   <creator action="/OA/finance/logic/action/createFCReimbApplyDAction" xid="default6"></creator>
   <master xid="default1" data="mainData" relation="fReimFID"></master>
   </div>
 <!--  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dCostType" concept="OA_Pub_BaseCode" limit="-1">
   <reader xid="default8" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default9"></writer>
   <creator xid="default10"></creator>
   <filter name="filter0" xid="filter1">OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='费用类型'</filter></div> --></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" onAdvanceCommit="processAdvanceCommit" onBackCommit="processBackCommit" onAbortCommit="processAbortCommit"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgSelectLoanApplyInfo" status="normal" width="60%" height="60%" title="借款单选择" src="$UI/OA/finance/process/dialog/selectLoanInfoDialog/selectLoanApplyInfoDialog.w" style="top:65px;left:122px;" onReceive="dlgSelectLoanApplyInfoReceive"></span><span component="$UI/system/components/justep/messageDialog/messageDialog" xid="messageDialog" type="OKCancel" title="提示：" style="top:20px;left:128px;"></span><div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu" anchor="processMenu"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item2">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="保存" xid="saveButton" onClick="{operation:'mainData.save'}">
    <i xid="i5"></i>
    <span xid="span5">保存</span></a> </li><li class="x-menu-divider divider" xid="divider1"/>  
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="回退" xid="backButton" onClick="{operation:'process.back'}"> 
          <i xid="i21"/>  
          <span xid="span21">回退</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider2"/>  
      <li class="x-menu-item" xid="item3"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="终止" xid="abortButton" onClick="{operation:'process.abort'}"> 
          <i xid="i6"/>  
          <span xid="span6">终止</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider3"/>  
      <li class="x-menu-item" xid="item4"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="流程图" xid="showChart" onClick="{operation:'process.showChart'}"> 
          <i xid="i17"/>  
          <span xid="span7">流程图</span> 
        </a> 
      </li> 
    
  </ul> 
  </div>  
  <div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert">
   <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button1">
    <i class="icon-loading-a" xid="i4"></i>
    <span xid="span511"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="报销申请"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">报销申请</div>  
        <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="" xid="moreBtn" icon="icon-android-more" onClick="moreBtnClick"> 
            <i xid="i1" class="icon-android-more"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="流转" xid="button2" onClick="{operation:'process.advance'}"> 
            <i xid="i2"/>  
            <span xid="span2">流转</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" style="display:none;" xid="financeContent"> 
      <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
        xid="panel2"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"
          xid="labelEvent"> 
          <label class="x-label" xid="fReiEventL" style="width:100px;"><![CDATA[报销事项]]></label>  
          <div class="x-edit" xid="div1"> 
            <input component="$UI/system/components/justep/input/input" class="form-control text-right"
              xid="fReiEvent" bind-ref="mainData.ref('fReiEvent')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelReimAmt">
   <label class="x-label left" xid="fReimAmtL" style="width:100px;"><![CDATA[报销金额]]></label>
   <div class="x-edit" xid="div7">
    <div class="input-group" xid="div19">
     <input class="form-control text-right" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fReimAmt')" xid="fReimAmt" style="border-right-style:none;" placeHolder="0.0"></input>
     <div class="input-group-addon" xid="div17" style="background-color:transparent;border-left-style:none;">(元)</div></div> </div> </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelRemark">
   <label class="x-label left" xid="fReiAllowanceL" style="width:100px;"><![CDATA[报销明细]]></label>
   <div class="x-edit" xid="div11">
    <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref='$model.mainData.ref("fRemark")'></textarea></div> </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelImage">
   <label class="x-label" xid="fImage" style="width:100px;"><![CDATA[图片]]></label>
   <div class="x-edit" xid="div2">
    <div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="attachmentImage1" bind-ref='$model.mainData.ref("fExtendStr1")'>
   <div class="x-attachment x-attachment-image" xid="div25">
    <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div26">
     <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image1" style="width:20%;"></img>
     <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a3"></a></div> 
    <div class="x-doc-process" xid="div27">
     <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar3"></div></div> 
    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div28">
     <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div29"></div></div> </div> </div></div> </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelAccessory">
   <label class="x-label" xid="fAccessory" style="width:100px;"><![CDATA[附件]]></label>
   <div class="x-edit" xid="div10">
    <div component="$UI/system/components/justep/attachment/attachmentSimple" actionUrl="/baas/justep/attachment/simpleFileStore" xid="attachmentSimple1" bind-ref='$model.mainData.ref("fExtendStr2")'>
   <div class="x-attachment" xid="div12">
    <div class="x-attachment-content x-card-border" xid="div13">
     <div class="x-doc-process" xid="div14">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar2"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div15">
      <div class="x-attachment-cell" xid="div16">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div18">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a2"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'" xid="div20">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'" xid="div21"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div22">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')" xid="div23"></div></div> 
     <div style="clear:both;" xid="div24"></div></div> </div> </div></div> </div></div>  
      </div> 
  </div> 
</div>
