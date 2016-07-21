<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:270px;left:544px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="OA_OSC_BaseInfo" limit="10" autoLoad="true"> 
      <reader xid="default1" action="/OA/officeSupplyConsumables/logic/action/queryOSCBaseInfoAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_OSC_BaseInfo.fUseStatus='1']]></filter> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="选择领用物品"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button2" onClick="{operation:'windowReceiver.windowCancel'}"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">选择领用物品</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="okBtn" onClick="okBtnClick" icon="icon-checkmark-round"> 
            <i xid="i1" class="icon-checkmark-round"/>  
            <span xid="span1"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
        rowActiveClass="bg-success" class="table" xid="dataTables1"
        data="mainData" responsive="false" multiSelect="true" stateSave="false"> 
        <columns xid="columns1">
          <column name="fName" xid="column1"/>  
          <column name="fStock" xid="column2"/>
        </columns>
      </div>
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" style="left:37px;top:13px;"/> 
</div>
