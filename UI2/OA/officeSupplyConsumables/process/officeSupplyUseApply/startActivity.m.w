<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile"
  xid="window" class="oa" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:68px;top:41px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_OSC_UseApplyM" orderBy="" columns=""
      autoNew="true" isTree="false"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyMAction"/>  
      <writer action="/OA/officeSupplyConsumables/logic/action/saveOSCUseApplyMAction"/>  
      <creator action="/OA/officeSupplyConsumables/logic/action/createOSCUseApplyMAction"/>  
      <calculateRelation relation="calcCheckBox"/>  
      <rule xid="rule1"> 
        <col name="fDemandDate" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default2">!$model.isRootProcess()</expr>
          </readonly> 
        </col> 
        <col name="fApplyReason" xid="ruleCol2"> 
          <readonly xid="readonly2"> 
            <expr xid="default3">!$model.isRootProcess()</expr>
          </readonly> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" concept="OA_OSC_UseApplyD" columns="" autoNew="false" updateMode="whereVersion"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyDetailAction"/>  
      <writer action="/OA/officeSupplyConsumables/logic/action/saveOSCUseApplyDAction"/>  
      <creator action="/OA/officeSupplyConsumables/logic/action/createOSCUseApplyDAction"/>  
      <master xid="default1" data="mainData" relation="fMasterID"/>  
      <calculateRelation relation="calculate" xid="calculateRelation1"/> 
      <rule xid="rule1"> 
        <col name="fDemandNum" xid="ruleCol3"> 
          <readonly xid="readonly3"> 
            <expr xid="default2">!$model.isRootProcess()</expr>
          </readonly> 
        </col> 
      </rule>
    </div>  
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" onBeforeAdvanceQuery="processBeforeAdvanceQuery" style="top:441px;left:56px;width:24px;height:24px;" onAdvanceCommit="processAdvanceCommit" onBackCommit="processBackCommit" onAbortCommit="processAbortCommit"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu" anchor="moreBtn"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu1"> 
      <li class="x-menu-divider divider" xid="divider1"/>  
      <li class="x-menu-item" xid="item1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link"
          label="回退" xid="backButton" onClick="{operation:'process.back'}" bind-enable='$model.btnreadOnly("backButton")'> 
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="selectItemDlg"
    src="selectItemActivity.m.w" onReceive="selectItemDlgReceive" style="top:16px;left:488px;"/>  
  <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="messageDialog" title="提示：" type="OKCancel" style="top:18px;left:221px;"/>  
  <div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert">
   <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button3">
    <i class="icon-loading-a" xid="i7"></i>
    <span xid="span511"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="办公用品领用申请"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">办公用品领用申请</div>  
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
    <div class="x-panel-content x-cards" xid="officeContent" style="display:none;"> 
      <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
        xid="panel2"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"
          xid="labelEdit1"> 
          <label class="x-label" xid="lblxqrq"><![CDATA[需求日期]]></label>  
          <div class="x-edit" xid="div1"> 
            <input component="$UI/system/components/justep/input/input" class="form-control text-right"
              xid="input1" bind-ref="mainData.ref('fDemandDate')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-row"
          xid="labelEdit2"> 
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
            xid="textarea1" placeHolder="请输入申请原因" bind-ref="mainData.ref('fApplyReason')"/> 
        </div> 
      </div>  
      <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
        xid="panel1"> 
        <!--         <div class="panel-heading" xid="heading1">  -->  
        <!--           <div component="$UI/system/components/bootstrap/row/row" class="row" -->  
        <!--             xid="row3">  -->  
        <!--             <div class="col col-xs-4" xid="col7"/>   -->  
        <!--             <div class="col col-xs-4" xid="col8"/>   -->  
        <!--             <div class="col col-xs-4" xid="col9" style="padding-right:0">  -->  
        <!--               <a component="$UI/system/components/justep/button/button" class="btn btn-link pull-right" -->  
        <!--                 label="编辑" xid="button5" onClick="edit">  -->  
        <!--                 <i xid="i8"/>   -->  
        <!--                 <span xid="span8">编辑</span>  -->  
        <!--               </a>  -->  
        <!--             </div>  -->  
        <!--           </div>  -->  
        <!--         </div>   -->  
        <!--         <div class="panel-body" xid="body1">  -->  
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list1" data="detailData"> 
          <ul class="x-list-template" xid="listTemplateUl1"> 
            <li xid="li1" class="list-group-item" style="padding: 0 15px"> 
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row1"> 
                <!--                 <div class="col col-xs-1" xid="col2">  -->  
                <!--                 </div>   -->  
                <!--                 <span component="$UI/system/components/justep/button/checkbox" -->  
                <!--                   class="x-checkbox pull-left check-item" xid="checkbox1" bind-visible=" $model.controlData.val(&quot;edit&quot;) === 1" -->  
                <!--                   bind-ref="ref('calculate')"/> -->  
                <div class="col col-xs-4" xid="col1"> 
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output form-control" xid="output1" bind-ref="ref('fName')"/> 
                </div>  
                <!--                 <div class="col col-xs-1" xid="col4">  -->  
                <!--                   <a component="$UI/system/components/justep/button/button" -->  
                <!--                     class="btn btn-link btn-only-icon" label="button" xid="minus" -->  
                <!--                     icon="icon-ios7-minus-outline" onClick="minusNum">  -->  
                <!--                     <i xid="i5" class="icon-ios7-minus-outline"/>   -->  
                <!--                     <span xid="span4"/>  -->  
                <!--                   </a>  -->  
                <!--                 </div>   -->  
                <!--                 <div class="col col-xs-1" xid="col5">  -->  
                <!--                   <div component="$UI/system/components/justep/output/output" -->  
                <!--                     xid="output2" class="x-output form-control text-center" bind-ref="ref('fDemandNum')"/>  -->  
                <!--                 </div>   -->  
                <!--                 <div class="col col-xs-2" xid="col6">  -->  
                <!--                   <a component="$UI/system/components/justep/button/button" -->  
                <!--                     class="btn btn-link btn-only-icon" xid="plus" icon="icon-ios7-plus-outline" -->  
                <!--                     onClick="plusNum">  -->  
                <!--                     <i xid="i7" class="icon-ios7-plus-outline"/>   -->  
                <!--                     <span xid="span5"/>  -->  
                <!--                   </a>  -->  
                <!--                 </div>   -->  
                <div class="col col-xs-5 text-right"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-xs btn-only-icon" label="button" xid="reduceCountBtn"
                    icon="icon-android-remove" onClick="minusNum" bind-enable=" $model.isRootProcess()"> 
                    <i xid="i3" class="icon-android-remove"/>  
                    <span xid="span5"/> 
                  </a>  
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output text-center" xid="output5" bind-ref="ref('fDemandNum')"
                    style="margin-right:10px;margin-left:10px;display:inline-block"/>  
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-xs btn-only-icon btn-link" label="button" xid="addCountBtn"
                    icon="icon-android-add" onClick="plusNum" bind-enable=" $model.isRootProcess()"> 
                    <i xid="i4" class="icon-android-add"/>  
                    <span xid="span4"/> 
                  </a> 
                </div>  
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link pull-right" label="删除" xid="button1" onClick="delData" bind-visible=" $model.isRootProcess()"> 
                  <i xid="i5"/>  
                  <span xid="span3">删除</span> 
                </a> 
              </div> 
            </li> 
          </ul> 
        </div>  
        <div id="choiceLabelInput" bind-click="newPlaceClick" class="oa-input-group-row"
          style="height:40px;" bind-visible=" $model.isRootProcess()"> 
          <label class="x-label"><![CDATA[新增领用物品]]></label>  
          <span class="pull-right" style="padding-top:5px"> 
            <i class="icon-chevron-right"/> 
          </span> 
        </div>  
        <!--         </div>  --> 
      </div> 
    </div> 
  </div> 
</div>
