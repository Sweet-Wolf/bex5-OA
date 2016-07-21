<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:319px;top:67px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dataMain" concept="OA_MT_UseApply"> 
      <reader xid="default1" action="/OA/meeting/logic/action/queryMTUSEAPPLYAction"/>  
      <writer xid="default2" action="/OA/meeting/logic/action/saveMTUSEAPPLYAction"/>  
      <creator xid="default3" action="/OA/meeting/logic/action/createMTUSEAPPLYAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:72px;top:4px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="会议室使用申请详细"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeBtn" onClick="closeBtnClick" icon="icon-chevron-left"> 
            <i xid="i4" class="icon-chevron-left"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">会议室使用申请详细</div>  
        <div class="x-titlebar-right reverse" xid="div3" style="width:188px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="chartBtn" icon="icon-android-keypad" onClick="chartBtnClick"> 
            <i xid="i1" class="icon-android-keypad"/>  
            <span xid="span1"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div class="media"> 
        <a class="pull-left content-head-pic " href="#" style="margin-right:0px;"
          xid="a2"> 
          <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
            xid="orgImage3" orgKind="person" bind-ref="dataMain.ref('fCurrentPersonID')"> 
            <div class="x-blob-bar" xid="div8"> 
              <i class="x-blob-edit icon-compose" xid="i9"/>  
              <i class="x-blob-del icon-close-round" xid="i10"/> 
            </div>  
            <img class="x-blob-img media-object" xid="image3"/> 
          </div> 
        </a>  
        <div component="$UI/system/components/justep/output/output" class="media-heading oa-title-data"
          xid="outputName" bind-ref="dataMain.ref('fApplyPsnName')"/>  
        <div component="$UI/system/components/justep/output/output" xid="outputTime"
          bind-ref="dataMain.ref('fApplyDate')" format="yyyy-MM-dd hh:mm"/> 
      </div>  
      <div class="media-body"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fMeetNameL" style="width:100px;"><![CDATA[会议主题]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output2" bind-ref="dataMain.ref('fMeetName')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fBoardroomL" style="width:100px;"><![CDATA[会议室]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output1" bind-ref="dataMain.ref('fBoardroom')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fBeginTimeL" style="width:100px;"><![CDATA[开始时间]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output3" bind-ref="dataMain.ref('fBeginTime')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fEndTimeL" style="width:100px;"><![CDATA[结束时间]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output4" bind-ref="dataMain.ref('fEndTime')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fPhoneL" style="width:100px;"><![CDATA[联系电话]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output5" bind-ref="dataMain.ref('fPhone')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fMeetPsnsL" style="width:100px;"><![CDATA[参会人员]]></label>  
          <div class="x-edit"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="text-right form-control" xid="textarea1" bind-ref="dataMain.ref('fMeetPsns')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fOutPsnsL" style="width:110px;"><![CDATA[外部参会人员]]></label>  
          <div class="x-edit"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="text-right form-control" xid="textarea2" bind-ref="dataMain.ref('fOutPsns')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fMeetPsnNumL" style="width:100px;"><![CDATA[参会人数]]></label>  
          <div class="x-edit"> 
            <div class="input-group" xid="div19"> 
              <div component="$UI/system/components/justep/output/output"
                  class="x-output text-right form-control" xid="output6" bind-ref="dataMain.ref('fMeetPsnNum')"/> 
              <div class="input-group-addon" xid="div17" style="background-color:transparent;border-left-style:none;">(人)</div>
            </div>

          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fDescriptionL" style="width:100px;"><![CDATA[需求描述]]></label>  
          <div class="x-edit"> 
            <textarea component="$UI/system/components/justep/textarea/textarea" class="text-right form-control" xid="textarea3" bind-ref="dataMain.ref('fDescription')"></textarea></div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dataMain" autoFilter="false" autoClose="false" autoStart="false" autoSave="false"/> 
</div>
