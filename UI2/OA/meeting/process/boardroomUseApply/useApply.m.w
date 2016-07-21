<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window container-fluid oa" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:435px;top:568px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_MT_UseApply" orderBy="" columns=""
      autoNew="false" onSaveCommit="mainDataSaveCommit"> 
      <reader action="/OA/meeting/logic/action/queryMTUSEAPPLYAction"/>  
      <writer action="/OA/meeting/logic/action/saveMTUSEAPPLYAction"/>  
      <creator action="/OA/meeting/logic/action/createMTUSEAPPLYAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dUsePerson"
      concept="OA_MT_UseApplyPsns"> 
      <reader xid="default1" action="/OA/meeting/logic/action/queryMTUSEAPPLYPSNSAction"/>  
      <writer xid="default2" action="/OA/meeting/logic/action/saveMTUSEAPPLYPSNSAction"/>  
      <creator xid="default3" action="/OA/meeting/logic/action/createMTUSEAPPLYPSNSAction"/>  
      <master xid="default16" data="mainData" relation="fMasterID"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dBoardroom"
      concept="OA_MT_Boardroom" orderBy="fCode asc" autoLoad="true"> 
      <reader xid="default4" action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/>  
      <filter name="filter0" xid="filter1">OA_MT_Boardroom.fUseStatus='1'</filter>
    </div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" onAdvanceCommit="processAdvanceCommit" onBackCommit="processBackCommit" onAbortCommit="processAbortCommit"/>  
  <div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert">
   <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button1">
    <i class="icon-loading-a" xid="i4"></i>
    <span xid="span511"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="会议室使用申请"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">会议室使用申请</div>  
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
    <div class="x-panel-content" xid="meetingContent" style="display:none;"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="详细信息"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fMeetNameL" style="width:100px;"><![CDATA[会议主题]]></label>  
          <div class="x-edit"> 
            <input class="form-control text-right" component="$UI/system/components/justep/input/input"
              xid="" bind-ref="mainData.ref('fMeetName')"/> 
             
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fBoardroomL" style="width:100px;"><![CDATA[会议室]]></label>  
          <div class="x-edit"> 
            <select component="$UI/system/components/justep/select/select" xid="select1"
              bind-ref="mainData.ref('fBoardroomID')" bind-labelRef="mainData.ref('fBoardroom')"
              bind-options="dBoardroom" bind-optionsValue="OA_MT_Boardroom" bind-optionsLabel="fName"
              class="form-control"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fBeginTimeL" style="width:100px;"><![CDATA[开始时间]]></label>  
          <div class="x-edit"> 
            <input class="form-control text-right" component="$UI/system/components/justep/input/input"
              xid="" bind-ref="mainData.ref('fBeginTime')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fEndTimeL" style="width:100px;"><![CDATA[结束时间]]></label>  
          <div class="x-edit"> 
            <input class="form-control text-right" component="$UI/system/components/justep/input/input"
              xid="" bind-ref="mainData.ref('fEndTime')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fPhoneL" style="width:100px;"><![CDATA[联系电话]]></label>  
          <div class="x-edit"> 
            <input class="form-control text-right" component="$UI/system/components/justep/input/input"
              xid="" bind-ref="mainData.ref('fPhone')"/> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fMeetPsnsL" style="width:100px;"><![CDATA[参会人员]]></label>  
          <div class="x-edit"> 
            <div class="input-group" xid="inputGroup1"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control text-right" xid="fMeetPsns" bind-ref="mainData.ref('fMeetPsns')"/>
              <div class="input-group-addon" xid="div11" style="background-color:transparent;border-left-style:none;"
                bind-click="button1Click"> 
                <i xid="i111" class="icon-android-search"/> 
              </div> 
            </div>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fOutPsnsL" style="width:110px;"><![CDATA[外部参会人员]]></label>  
          <div class="x-edit"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control text-right" xid="fOutPsns" bind-ref="mainData.ref('fOutPsns')"
              placeHolder="多人可以用逗号分开"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fMeetPsnNumL" style="width:100px;"><![CDATA[参会人数]]></label>  
          <div class="x-edit"> 
            <div class="input-group" xid="div19"> 
              <input class="form-control text-right" component="$UI/system/components/justep/input/input"
                bind-ref="mainData.ref('fMeetPsnNum')" xid="fNUMBER" style="border-right-style:none;"/>  
              <div class="input-group-addon" xid="div17" style="background-color:transparent;border-left-style:none;">(人)</div>
            </div>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fDescriptionL" style="width:100px;"><![CDATA[需求描述]]></label>  
          <div class="x-edit"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control text-right" xid="fDescription" bind-ref="mainData.ref('fDescription')"/> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="dialogMeetPsn"
    title="选择参会人员" multiSelection="true" cascade="true" includeOrgKind="psm" onReceive="dialogMeetPsnReceive"
    style="left:71px;top:14px;"/>
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu" anchor="processMenu"> 
    <div class="x-popMenu-overlay" xid="div4"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="menu"> 
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
          label="回退" xid="backButton" onClick="{operation:'process.back'}"> 
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
</div>
