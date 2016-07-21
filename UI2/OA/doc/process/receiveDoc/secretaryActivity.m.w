<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/doc/process/receiveDoc/regActivity.m.w" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

    <span component="$UI/system/components/justep/org/orgDialog" multiSelection="true" onReceive="wDlgPsnIDs1Receive" selectFilter="$row.val('sOrgKindID')==='psm'" title="选择领导批示人员" xid="wDlgPsnIDs1" xui:before="panel1" xui:parent="window" xui:update-mode="insert" />
    <span component="$UI/system/components/justep/org/orgDialog" multiSelection="true" onReceive="wDlgPsnIDs2Receive" selectFilter="$row.val('sOrgKindID')==='psm'" style="left:86px;top:14px;" title="选择部门主办人员" xid="wDlgPsnIDs2" xui:before="panel1" xui:parent="window" xui:update-mode="insert" />
    <span component="$UI/system/components/justep/org/orgDialog" multiSelection="true" onReceive="wDlgPsnIDs3Receive" selectFilter="$row.val('sOrgKindID')==='psm'" style="left:165px;top:20px;" title="选择部门协办人员" xid="wDlgPsnIDs3" xui:before="panel1" xui:parent="window" xui:update-mode="insert" />
    <span component="$UI/system/components/justep/org/orgDialog" multiSelection="true" onReceive="wDlgPsnIDs4Receive" selectFilter="$row.val('sOrgKindID')==='psm'" style="left:256px;top:28px;" title="选择传阅人员" xid="wDlgPsnIDs4" xui:before="panel1" xui:parent="window" xui:update-mode="insert" />
    <div _component="$UI/system/components/justep/labelEdit/labelEdit" class="input-group input-group-row" xid="deptLabelInput" xui:before="endLabelInput" xui:parent="div8" xui:update-mode="insert" >
<span class="input-group-addon" xid="span1-1" >
<![CDATA[部门主办：]]>
</span>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col9" >
<div class="input-group" xid="div18" >
<input bind-ref="dDoc.ref('fExtendPsnNames2')" class="form-control x-edit" component="$UI/system/components/justep/input/input" style="border-right-style:none;" xid="Deptinput" />
<div bind-click="div16Click" class="input-group-addon" style="background-color:transparent;border-left-style:none;" xid="div16" >
<i class="icon-android-search" xid="i5" />
</div>
</div>
</div>
</div>
    <div _component="$UI/system/components/justep/labelEdit/labelEdit" class="input-group input-group-row" xid="leadLabelInput" xui:before="endLabelInput" xui:parent="div8" xui:update-mode="insert" >
<span class="input-group-addon" xid="span1-2" >

部门协办：</span>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10" >
<div class="input-group" xid="div20" >
<input bind-ref="dDoc.ref('fExtendPsnNames3')" class="form-control x-edit" component="$UI/system/components/justep/input/input" style="border-right-style:none;" xid="leadinput" />
<div bind-click="div21Click" class="input-group-addon" style="background-color:transparent;border-left-style:none;" xid="div21" >
<i class="icon-android-search" xid="i6" />
</div>
</div>
</div>
</div>
    <div _component="$UI/system/components/justep/labelEdit/labelEdit" class="input-group input-group-row" xid="cyLabelInput" xui:before="endLabelInput" xui:parent="div8" xui:update-mode="insert" >
<span class="input-group-addon" xid="span1-3" >

传阅人员：</span>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11" >
<div class="input-group" xid="div22" >
<input bind-ref="dDoc.ref('fExtendPsnNames4')" class="form-control x-edit" component="$UI/system/components/justep/input/input" style="border-right-style:none;" xid="cyinput" />
<div bind-click="div23Click" class="input-group-addon" style="background-color:transparent;border-left-style:none;" xid="div23" >
<i class="icon-android-search" xid="i7" />
</div>
</div>
</div>
</div>
    <div _component="$UI/system/components/justep/labelEdit/labelEdit" class="input-group input-group-row" xid="leaderLabelInput" xui:before="endLabelInput" xui:parent="div8" xui:update-mode="insert" >
<span class="input-group-addon" xid="span1-3" >

领导批示：</span>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12" >
<div class="input-group" xid="div24" >
<input bind-ref="dDoc.ref('fExtendPsnNames1')" class="form-control x-edit" component="$UI/system/components/justep/input/input" style="border-right-style:none;" xid="leaderinput" />
<div bind-click="div25Click" class="input-group-addon" style="background-color:transparent;border-left-style:none;" xid="div25" >
<i class="icon-android-search" xid="i8" />
</div>
</div>
</div>
</div>

</div>