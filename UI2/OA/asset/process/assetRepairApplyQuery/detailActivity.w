<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/asset/process/assetRepairApply/noticeActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

   <div xid="model" onLoad="modelLoad"  xui:update-mode="merge"/>
   <div xid="process" autoClose="false" autoFilter="false" autoSave="false" autoStart="false"  xui:update-mode="merge"/>
   <span xid="wDlgAssetCard" style="left:240px;top:8px;"  xui:update-mode="merge"/>
   <a xid="button5" icon="icon-android-image" label="流程图" onClick="chartBtnClick"  xui:update-mode="merge"/>
   <i xid="i11" class="icon-android-image"  xui:update-mode="merge"/>
   <span xid="span11"  xui:update-mode="merge-and-replace">流程图</span>   <a xid="button6" icon="icon-android-note" label="流程记录" onClick="processRecord"  xui:update-mode="merge"/>
   <i xid="i12" class="icon-android-note"  xui:update-mode="merge"/>
   <span xid="span12"  xui:update-mode="merge-and-replace">流程记录</span>
</div>