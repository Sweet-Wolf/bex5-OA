<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile"
  xid="window" class="window container-fluid oa" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:266px;top:396px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_WM_EvecApply" autoNew="true"
      onValueChanged="mainDataValueChanged" onSaveCommit="mainDataSaveCommit"> 
      <reader action="/OA/workTime/logic/action/queryOA_WM_EvecApplyAction" xid="default9"/>  
      <writer action="/OA/workTime/logic/action/saveOA_WM_EvecApplyAction" xid="default10"/>  
      <creator action="/OA/workTime/logic/action/createOA_WM_EvecApplyAction" xid="default11"/>  
      <master xid="default1" data="mainData"/>
    <rule xid="rule1">
   <col name="fSTARTTIME" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default12">true</expr></required> </col> 
   <col name="fENDTIME" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default13">true</expr></required> </col> 
   <col name="fREASON" xid="ruleCol3">
    <required xid="required3">
     <expr xid="default2">true</expr></required> </col> 
   <col name="fPLACE" xid="ruleCol4">
    <required xid="required4">
     <expr xid="default3">true</expr></required> </col> </rule></div>  
   <!--  <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="childData" concept="OA_WM_eveMember" directDelete="true" confirmDelete="false"> 
      <reader xid="default9" action="/OA/workTime/logic/action/queryOA_WM_eveMemberAction"/>  
      <writer xid="default10" action="/OA/workTime/logic/action/saveOA_WM_eveMemberAction"/>  
      <creator xid="default11" action="/OA/workTime/logic/action/createOA_WM_eveMemberAction"/>
    </div> -->
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" onAdvanceCommit="processAdvanceCommit" onBackCommit="processBackCommit" onAbortCommit="processAbortCommit"/>  
  <div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert">
   <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button1">
    <i class="icon-loading-a" xid="i4"></i>
    <span xid="span511"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="出差申请"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">出差申请</div>  
        <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            label="" xid="moreBtn" icon="icon-android-more" onClick="moreBtnClick"> 
            <i xid="i1" class="icon-android-more"/>  
            <span xid="span1"/>
          </a>
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="流转" xid="button2" onClick="{operation:'process.advance'}"> 
            <i xid="i12"/>  
            <span xid="span12">流转</span> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" style="display:none;" xid="evecsureContent"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="详细信息"> 
        <!--         <div class="x-control-group-title">详细信息</div>   -->  
        <div xid="div6"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelInput2"> 
            <label class="x-label" style="width:100px;" xid="fPLACEL"><![CDATA[出差地点]]></label>  
            <div class="x-edit" xid="div5"> 
              <input component="$UI/system/components/justep/input/input" class="form-control "
                xid="fPLACE" bind-ref="mainData.ref('fPLACE')" placeHolder="如：北京、上海、杭州(必填)"/>
            </div> 
          </div> 
        </div>
        <div xid="div9">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit1"> 
            <label class="x-label" xid="fSTARTTIMEL" style="width:100px;"><![CDATA[开始时间]]></label>  
            <div class="x-edit" xid="div3">
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fSTARTTIME" bind-ref="mainData.ref('fSTARTTIME')" placeHolder="请选择(必填)"/>
            </div>
          </div>
        </div>  
        <div xid="div10">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit2"> 
            <label class="x-label" style="width:100px;" xid="fENDTIMEL"><![CDATA[结束时间]]></label>  
            <div class="x-edit" xid="div8"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fENDTIME" bind-ref="mainData.ref('fENDTIME')"/>
            </div> 
          </div>
        </div>
        <div xid="div13"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelInput1"> 
            <label class="x-label left" xid="fDAYSL" style="width:100px;"><![CDATA[出差时长]]></label>  
            <div class="x-edit" xid="div21"> 
              <div component="$UI/system/components/justep/output/output" class="x-output" xid="fDAYS" bind-ref='$model.mainData.ref("fDAYS")'></div></div> 
          </div>
        </div>  
        <div xid="div14"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelOutput1"> 
            <label class="x-label" xid="fPERSONNELL" style="width:100px;" title="出差人员"><![CDATA[出差事由]]></label>  
            <div class="x-edit" xid="div2"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="fREASONL" bind-ref="$model.mainData.ref(&quot;fREASON&quot;)"
                placeHolder="请输入出差事由"/>
            </div> 
          </div> 
        </div>  
        <div xid="div15"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelInput3"> 
            <label class="x-label left" xid="fNUMBERL" style="width:100px;"><![CDATA[图片]]></label>  
            <div class="x-edit" xid="div24"> 
              <div component="$UI/system/components/justep/attachment/attachmentImage"
                access="duud" xid="attachmentImage1" bind-ref="$model.mainData.ref(&quot;fURL&quot;)"> 
                <div class="x-attachment x-attachment-image" xid="div1"> 
                  <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}"
                    xid="div7"> 
                    <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)"
                      xid="image1" style="width:30%;height:30%;"/>  
                    <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2"
                      class="x-remove-barget" xid="a1"/>
                  </div>  
                  <div class="x-doc-process" xid="div11"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="progressBar1"/>
                  </div>  
                  <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)"
                    xid="div12"> 
                    <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                      xid="div16"/>
                  </div> 
                </div> 
              </div>
            </div> 
          </div>
        </div>
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu" anchor="processMenu"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-item" xid="item2"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="保存" xid="saveButton" onClick="{operation:'mainData.save'}"> 
          <i xid="i5"/>  
          <span xid="span5">保存</span> 
        </a> 
      </li>  
      <li class="x-menu-divider divider" xid="divider1"/>  
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="回退" xid="backButton" onClick="{operation:'process.back'}" bind-enable="$model.btnreadOnly(&quot;backButton&quot;)"> 
          <i xid="i2"/>  
          <span xid="span2">回退</span> 
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
          <i xid="i7"/>  
          <span xid="span7">流程图</span> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="psmDialog"
    title="选择人员" multiSelection="true" includeOrgKind="psm" onReceive="psmDialogReceive"/>
</div>
