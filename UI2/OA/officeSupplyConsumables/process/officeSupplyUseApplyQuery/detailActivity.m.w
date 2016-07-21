<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window container-fluid oa" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:144px;top:311px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="OA_OSC_UseApplyM" autoNew="false" autoLoad="false" limit="1" confirmRefresh="false"> 
      <reader xid="default1" action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyMAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="detailData" concept="OA_OSC_UseApplyD"> 
      <reader xid="default2" action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyDetailAction"/>  
      <master xid="default3" data="mainData" relation="fMasterID"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:72px;top:4px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="领用申请信息"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeBtn" onClick="closeBtnClick" icon="icon-chevron-left"> 
            <i xid="i4" class="icon-chevron-left"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">领用申请信息</div>  
        <div class="x-titlebar-right reverse" xid="div3" style="width:188px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="chartBtn" icon="icon-android-keypad" onClick="chartBtnClick"> 
            <i xid="i1" class="icon-android-keypad"/>  
            <span xid="span1"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" xid="content1"> 
      <div class="panel x-card panel-default" component="$UI/system/components/bootstrap/panel/panel"
        xid="panel2"> 
        <div class="media"> 
          <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
            xid="orgImage3" orgKind="person" bind-ref="mainData.ref('fCreatePsnID')"> 
            <div class="x-blob-bar" xid="div8"> 
              <i class="x-blob-edit icon-compose" xid="i9"/>  
              <i class="x-blob-del icon-close-round" xid="i10"/> 
            </div>  
            <img class="x-blob-img media-object" xid="image3"/> 
          </div>  
          <div class="media-body"> 
            <div component="$UI/system/components/justep/output/output" class="media-heading oa-title-data"
              xid="outputName" bind-ref="mainData.ref('fCreatePsnName')"/>  
            <div component="$UI/system/components/justep/output/output" xid="outputTime"
              bind-ref="mainData.ref('fCreateTime')" format="yyyy-MM-dd hh:mm"/>  
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit3"> 
              <label class="x-label" xid="label3"><![CDATA[需求日期]]></label>  
              <div class="x-edit" xid="div7"> 
                <div component="$UI/system/components/justep/output/output"
                  class="x-output form-control" xid="output3" bind-ref="mainData.ref('fDemandDate')"
                  format="yyyy-MM-dd"/> 
              </div> 
            </div>  
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit5"> 
              <!--             <label class="x-label" xid="label5"><![CDATA[用印文件及事由]]></label>   -->  
              <div class="x-edit" xid="div10"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea1" bind-ref="mainData.ref('fApplyReason')"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="panel panel-default" component="$UI/system/components/bootstrap/panel/panel"
        xid="panel3"> 
          <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table" xid="dataTables1" data="detailData">
   <columns xid="columns1"><column name="fName" xid="column1"></column>
  <column name="fDemandNum" xid="column2"></column></columns></div></div>
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" autoFilter="false" autoClose="false" autoStart="false" autoSave="false"/> 
</div>
