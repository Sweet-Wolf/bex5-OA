<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_WorkWeekly" orderBy=""
      columns="" onSaveCommit="saveCommit" autoNew="true" confirmDelete="true"> 
      <reader action="/OA/workLog/logic/action/queryOA_WorkWeeklyAction"/>  
      <writer action="/OA/workLog/logic/action/saveOA_WorkWeeklyAction"/>  
      <creator action="/OA/workLog/logic/action/createOA_WorkWeeklyAction"/>  
    <rule xid="rule1">
   <col name="fReleaseScope" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default1">true</expr>
     <message xid="default2">请选择发布范围</message></required> </col> </rule></div>
  </div>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="psmDialog" onReceive="psmDialogReceive" multiSelection="true" includeOrgKind="psm"></span><div xid="waitDiv" style="position:relative;height:400px;">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button2" style="position:absolute;font-size:30px;top:42%;left:42%;" icon="icon-loading-a">
    <i xid="i2" class="icon-loading-a"></i>
    <span xid="span3"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="工作周报"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span></span> 
          </a> 
        </div>  
        <div class="x-titlebar-title">工作周报</div>  
        <div class="x-titlebar-right reverse"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="saveBtn" xid="button1" icon="icon-android-checkmark" onClick="[{operation:'mainData.save'},{operation:'window.close'}]">
   <i xid="i1" class="icon-android-checkmark"></i>
   <span xid="span1">saveBtn</span></a>
  </div> 
      </div> 
    </div>  
    <div class="x-panel-content" style="display:none;" xid="weeklyContent"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="详细信息"> 
     
        <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label30"> 
                    <label class="x-label left" bind-text="$model.mainData.label('fFinishWork')" xid="finishWorkL" style="width:auto;"/>  
                    <div class="x-edit"> 
                    
 					   <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                  	  data="mainData" bind-ref="mainData.ref('fFinishWork')" xid="fFinishWork"/>  
                    </div> 
                  </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label30"> 
                    <label class="x-label left" bind-text="$model.mainData.label('fWorkSummary')" xid="workSummary" style="width:auto;"/>  
                    <div class="x-edit"> 
                    
 					   <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                  	  data="mainData" bind-ref="mainData.ref('fWorkSummary')" xid="fWorkSummary"/>  
                    </div> 
                  </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label30"> 
                    <label class="x-label left" bind-text="$model.mainData.label('fWorkPlan')" xid="workPlanL" style="width:auto;"/>  
                    <div class="x-edit"> 
                    
 					   <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                  	  data="mainData" bind-ref="mainData.ref('fWorkPlan')" xid="fWorkPlan"/>  
                    </div> 
                  </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label30"> 
                    <label class="x-label left" bind-text="$model.mainData.label('fNeedHelp')" xid="needHelp" style="width:auto;"/>  
                    <div class="x-edit"> 
                    
 					   <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                  	  data="mainData" bind-ref="mainData.ref('fNeedHelp')" xid="fNeedHelp"/>  
                    </div> 
                  </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20"> 
                    <label class="x-label left" bind-text="$model.mainData.label('fRemark')" xid="remarkL"/>  
                    <div class="x-edit"> 
                    
 					   <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea"
                  	  data="mainData" bind-ref="mainData.ref('fRemark')" xid="fRemark"/>  
                    </div> 
                  </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit"
                    class="x-label-edit x-label20"> 
                    <label class="x-label left"><![CDATA[图片]]></label>  
                    <div class="x-edit" xid="imgURL"> 
                    
                  	  <div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="attachmentImage" bind-ref='$model.mainData.ref("fImgURL")'>
   <div class="x-attachment x-attachment-image" xid="div1">
    <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div2">
     <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image1" style="width:20%;"></img>
     <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a1"></a></div> 
    <div class="x-doc-process" xid="div3">
     <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="progressBar1"></div></div> 
    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div4">
     <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div5"></div></div> </div> </div></div> 
                  </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20">
   <label class="x-label left" bind-text='$model.mainData.label("fReleaseScope")' xid="label1"></label>
   <div class="x-edit" style="position:relative;height:37px;" xid="div8">
    <span class="x-output" component="$UI/system/components/justep/output/output" data="mainData" bind-ref='$model.mainData.ref("fReleaseScope")' xid="output1"></span>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="findBtn" style="position:absolute;top:0px;right:0px;" onClick="findBtnClick">
     <i xid="i3" class="icon-android-search" style="color:#808080;"></i>
     <span xid="span2"></span></a> </div> </div></div> 
    </div> 
  </div> 
</div>