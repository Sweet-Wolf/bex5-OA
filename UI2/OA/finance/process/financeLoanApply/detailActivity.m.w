<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:319px;top:67px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dataMain" concept="OA_FC_LoanApply"> 
      <reader xid="default1" action="/OA/finance/logic/action/queryFCLoanApplyAction"/>  
      <writer xid="default2" action="/OA/finance/logic/action/saveFCLoanApplyAction"/>  
      <creator xid="default3" action="/OA/finance/logic/action/createFCLoanApplyAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:72px;top:4px;"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="借款申请详细"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="closeBtn" onClick="closeBtnClick" icon="icon-chevron-left"> 
            <i xid="i4" class="icon-chevron-left"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">借款申请详细</div>  
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
            xid="orgImage3" orgKind="person" bind-ref="dataMain.ref('fLoanPsnID')"> 
            <div class="x-blob-bar" xid="div8"> 
              <i class="x-blob-edit icon-compose" xid="i9"/>  
              <i class="x-blob-del icon-close-round" xid="i10"/> 
            </div>  
            <img class="x-blob-img media-object" xid="image3"/> 
          </div> 
        </a>  
        <div component="$UI/system/components/justep/output/output" class="media-heading oa-title-data"
          xid="outputName" bind-ref="dataMain.ref('fLoanPsnName')"/>  
        <div component="$UI/system/components/justep/output/output" xid="outputTime"
          bind-ref="dataMain.ref('fLoanDate')" format="yyyy-MM-dd hh:mm"/> 
      </div>  
      <div class="media-body"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fLoanTypeL" style="width:100px;"><![CDATA[借款类型]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output2" bind-ref="dataMain.ref('fLoanTypeName')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fLoanDateL" style="width:100px;"><![CDATA[借款日期]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output3" bind-ref="dataMain.ref('fLoanDate')"/>
          </div> 
        </div>  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fReturnDateL" style="width:100px;"><![CDATA[归还日期]]></label>  
          <div class="x-edit"> 
            <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control"
              xid="output4" bind-ref="dataMain.ref('fReturnDate')"/>
          </div> 
        </div>  
        
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelOutput1">
   <label class="x-label left" xid="fLoanAmtL" style="width:100px;"><![CDATA[ 借款金额]]></label>
   <div class="x-edit" xid="div4">
    <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control" xid="output1" bind-ref="dataMain.ref('fLoanAmt')"></div></div> </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelOutput2">
   <label class="x-label left" xid="fLoanPurposeL" style="width:100px;"><![CDATA[借款用途]]></label>
   <div class="x-edit" xid="div5">
    <div component="$UI/system/components/justep/output/output" class="x-output text-right form-control" xid="output5" bind-ref="dataMain.ref('fLoanPurpose')"></div></div> </div></div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dataMain" autoFilter="false" autoClose="false" autoStart="false" autoSave="false"/> 
</div>
