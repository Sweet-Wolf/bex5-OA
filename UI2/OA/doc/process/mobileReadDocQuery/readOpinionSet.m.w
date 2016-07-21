<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:88px;top:229px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dData" idColumn="fOpinion"> 
      <column label="常用语" name="fOpinion" type="String" xid="default3"/>  
      <column label="fMasterID" name="fMasterID" type="String" xid="default4"/>  
      <column label="fActivityFName" name="fActivityFName" type="String" xid="default5"/>  
      <column label="fActivityLabel" name="fActivityLabel" type="String" xid="default6"/>  
      <column label="fState" name="fState" type="String" xid="default7"/>  
      <column label="fStateName" name="fStateName" type="String" xid="default8"/>  
      <column label="fCreatePsnID" name="fCreatePsnID" type="String" xid="default9"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocProcess"
      concept="OA_DC_ReaderOpinion" limit="1"> 
      <reader xid="default1" action="/OA/doc/logic/action/queryOA_DC_ReaderOpinionAction"/>
    </div>
  </div>  
    <span component="$UI/system/components/justep/messageDialog/messageDialog"
    xid="closeMsgDlg" type="YesNo" onClose="closeMsgDlgClose" title="提示" message="是否取消当前操作？" style="left:107px;top:118px;"/> 
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive" style="left:191px;top:36px;"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full panel panel-default"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeBtn" style="width:40px;" icon="icon-chevron-left" onClick="closeBtnClick"> 
            <i xid="i8" class="icon-chevron-left"/>  
            <span xid="span5"/>
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2"/>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="saveBtn" icon="icon-checkmark-round" onClick="saveBtnClick">
   <i xid="i2" class="icon-checkmark-round"></i>
   <span xid="span6"></span></a></div> 
      </div>
    </div>  
    <div class="x-panel-content" xid="content1">
    	<div dir="ltr" style="height:100%;width:100%;"> 
        <div _component="$UI/system/components/justep/labelEdit/labelEdit"
          class="input-group input-row" xid="contentLabelInput" style="width:100%;height:100%;"> 
          <!--  <span xid="span8" class="input-group-addon" ></span> -->  
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
            style="height:100%;" placeHolder="请输入处理意见  " xid="textarea1" bind-ref="dData.ref('fOpinion')"/> 
        </div> 
      </div> 
    </div>  
    </div>
</div>
