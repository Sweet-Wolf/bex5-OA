<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile" xid="window" class="window container-fluid oa" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:449px;top:435px;" onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_FC_LoanApply" orderBy=""
      columns="" autoNew="true" onSaveCommit="mainDataSaveCommit"> 
      <reader action="/OA/finance/logic/action/queryFCLoanApplyAction"/>  
      <writer action="/OA/finance/logic/action/saveFCLoanApplyAction"/>  
      <creator action="/OA/finance/logic/action/createFCLoanApplyAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dLoanType" concept="OA_Pub_BaseCode">
   <reader xid="default9" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default10"></writer>
   <creator xid="default11"></creator>
   <filter name="filter0" xid="filter1">OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='借款类型'</filter></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" onAdvanceCommit="processAdvanceCommit"/>
  <div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert">
   <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button1">
    <i class="icon-loading-a" xid="i4"></i>
    <span xid="span511"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="借款申请"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">借款申请</div>  
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
    <div class="x-panel-content" xid="financeLoanContent" style="display:none;"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="详细信息"> 
  
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fLoanTypeL" style="width:100px;"><![CDATA[借款类型]]></label>  
          <div class="x-edit">
            <select component="$UI/system/components/justep/select/select" class="form-control text-right" xid="select1" bind-ref="mainData.ref('fLoanTypeCode')" bind-labelRef="mainData.ref('fLoanTypeName')" bind-options="dLoanType" bind-optionsValue="OA_Pub_BaseCode" bind-optionsLabel="fName"></select></div> 
        </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fLoanDateL" style="width:100px;"><![CDATA[借款日期]]></label>  
          <div class="x-edit">
            <input class="form-control text-right" component="$UI/system/components/justep/input/input"
              xid="" bind-ref="mainData.ref('fLoanDate')"/>
          </div> 
        </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fReturnDateL" style="width:100px;"><![CDATA[归还日期]]></label>  
          <div class="x-edit">
            <input class="form-control text-right" component="$UI/system/components/justep/input/input"
              xid="" bind-ref="mainData.ref('fReturnDate')"/>
          </div> 
        </div> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row" xid="labelInput1">
   <label class="x-label left" xid="fLoanAmtL" style="width:100px;"><![CDATA[ 借款金额]]></label>
   <div class="x-edit" xid="div1">
    <div class="input-group" xid="div19">
     <input class="form-control text-right" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fLoanAmt')" xid="fLoanAmt" style="border-right-style:none;" placeHolder="0.0"></input>
     <div class="input-group-addon" xid="div17" style="background-color:transparent;border-left-style:none;">(元)</div></div> </div> </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30 oa-input-group-row"> 
          <label class="x-label left" xid="fLoanPurposeL" style="width:100px;"><![CDATA[借款用途]]></label>  
          <div class="x-edit">
            <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control text-right" xid="fLoanPurpose" bind-ref="mainData.ref('fLoanPurpose')"></textarea></div> 
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