<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window container-fluid oa" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:144px;top:311px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="OA_SL_Signature" autoNew="false" autoLoad="false" limit="1" confirmRefresh="false"> 
      <reader xid="default1" action="/OA/signature/logic/action/querySLSignatureAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:72px;top:4px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="印章申请信息"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeBtn" onClick="closeBtnClick" icon="icon-chevron-left"> 
            <i xid="i4" class="icon-chevron-left"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">印章申请信息</div>  
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
        <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
          xid="orgImage3" orgKind="person" bind-ref="mainData.ref('fApplyPsnID')"> 
          <div class="x-blob-bar" xid="div8"> 
            <i class="x-blob-edit icon-compose" xid="i9"/>  
            <i class="x-blob-del icon-close-round" xid="i10"/> 
          </div>  
          <img class="x-blob-img media-object" xid="image3"/> 
        </div>
        <div class="media-body">
        	<div component="$UI/system/components/justep/output/output" class="media-heading oa-title-data"
              xid="outputName" bind-ref="mainData.ref('fApplyPsnName')"/>
             <div component="$UI/system/components/justep/output/output" xid="outputTime" bind-ref="mainData.ref('fApplyDate')" format="yyyy-MM-dd hh:mm"/>
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit1"> 
            <label class="x-label" xid="label1"><![CDATA[申请印章]]></label>  
            <div class="x-edit" xid="div5"> 
              <div component="$UI/system/components/justep/output/output" class="x-output form-control"
                xid="output1" bind-ref="mainData.ref('fSignatureTypeName')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit2"> 
            <label class="x-label" xid="label2"><![CDATA[印管人]]></label>  
            <div class="x-edit" xid="div6"> 
              <div component="$UI/system/components/justep/output/output" class="x-output form-control"
                xid="output2" bind-ref="mainData.ref('fIndianName')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit3"> 
            <label class="x-label" xid="label3"><![CDATA[用印时间]]></label>  
            <div class="x-edit" xid="div7"> 
              <div component="$UI/system/components/justep/output/output" class="x-output form-control"
                xid="output3" bind-ref="mainData.ref('fUseDate')"/> 
            </div> 
          </div>  
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit5"> 
            <!--             <label class="x-label" xid="label5"><![CDATA[用印文件及事由]]></label>   -->  
            <div class="x-edit" xid="div10"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="textarea1" bind-ref="mainData.ref('fSake')"/> 
            </div> 
          </div>
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" autoFilter="false" autoClose="false" autoStart="false" autoSave="false"/> 
</div>
