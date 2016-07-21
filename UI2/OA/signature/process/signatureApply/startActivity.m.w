<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window container-fluid oa" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:100px;top:248px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_SL_Signature" autoNew="true"
      onBeforeSave="mainDataBeforeSave"> 
      <reader action="/OA/signature/logic/action/querySLSignatureAction"/>  
      <writer action="/OA/signature/logic/action/saveSLSignatureAction"/>  
      <creator action="/OA/signature/logic/action/createSLSignatureAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dType"
      concept="OA_Pub_BaseCode" autoLoad="true"> 
      <reader xid="default4" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='印章类别']]></filter> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" onAdvanceCommit="processAdvanceCommit" onBackCommit="processBackCommit" onAbortCommit="processAbortCommit"/>  
  <div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert">
   <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button3">
    <i class="icon-loading-a" xid="i4"></i>
    <span xid="span511"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="印章使用申请"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">印章使用申请</div>  
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
    <div class="x-panel-content x-cards" xid="signatureContent" style="display:none;"> 
      <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
        xid="panel2"> 
<!--         <div class="panel-body" xid="body1"> -->
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit1"> 
            <label class="x-label" xid="label1"><![CDATA[申请印章]]></label>  
            <div class="x-edit" xid="div1"> 
              <div component="$UI/system/components/justep/output/output" class="form-control x-output text-right"
                xid="output2" bind-ref="mainData.ref('fSignatureTypeName')" bind-click="selectfSignatureTypeName"/> 
            </div> 
          </div>
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30 oa-input-group-row" xid="labelEdit2"> 
            <label class="x-label" xid="label2"><![CDATA[用印时间]]></label>  
            <div class="x-edit" xid="div2"> 
              <input component="$UI/system/components/justep/input/input" class="form-control text-right"
                xid="input1" bind-ref="mainData.ref('fUseDate')" placeHolder="请选择用印时间"/> 
            </div> 
          </div>
          <div class="x-label-edit oa-input-row" xid="remarkL" style="width:100%"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control" xid="textarea1" bind-ref="mainData.ref('fSake')"
              placeHolder="请输入用印文件及事由" style="height:80px;"/> 
          </div>
          <div component="$UI/system/components/justep/list/list" class="x-list"
            xid="list1" data="dType"> 
            <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
              xid="popMenu" anchor="output2"> 
              <div class="x-popMenu-overlay" xid="div1"/>  
              <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content x-list-template"
                xid="menu1"> 
                <li class="x-menu-item" xid="item1"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" label="" xid="button1" onClick="selectItemClick"> 
                    <i xid="i1"/>  
                    <span xid="span1" bind-text="ref('fName')"/>  
                    <!-- 按钮名 --> 
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div>
<!--         </div>  -->
      </div>
    </div> 
  </div>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="personDialog"
    includeDisabled="false" style="top:5px;left:157px;"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgDialog" style="top:8px;left:77px;"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="processMenu" anchor="moreBtn"> 
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
