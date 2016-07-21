<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="/UI2/OA/doc/process/sendDoc/deptApproveActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

    <span component="$UI/system/components/justep/org/orgDialogPC" multiSelection="true" onReceive="wDlgPsnIDs1Receive" selectFilter="$row.val('sOrgKindID')==='psm'" showTitle="true" status="normal" title="选择领导批示人员" xid="wDlgPsnIDs1" xui:before="tabs" xui:parent="window" xui:update-mode="insert" />
    <span component="$UI/system/components/justep/org/orgDialogPC" multiSelection="true" onReceive="wDlgPsnIDs3Receive" selectFilter="$row.val('sOrgKindID')==='psm'" showTitle="true" status="normal" title="选择部门协办人员" xid="wDlgPsnIDs3" xui:before="tabs" xui:parent="window" xui:update-mode="insert" />
    <span component="$UI/system/components/justep/org/orgDialogPC" multiSelection="true" onReceive="wDlgPsnIDs2Receive" selectFilter="$row.val('sOrgKindID')==='psm'" showTitle="true" status="normal" title="选择部门主办人员" xid="wDlgPsnIDs2" xui:before="tabs" xui:parent="window" xui:update-mode="insert" />
    <h1 style="font-size:14px;" xid="h11_11" xui:parent="col18" xui:update-mode="insert" >
<![CDATA[选择环节审批人员]]>
</h1>
    <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1_2" xui:parent="col18" xui:update-mode="insert" >
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1_2" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1_2" >
<label class="x-label" style="width:100px;" xid="label1_2" >
<![CDATA[部门会签]]>
</label>
<div class="x-edit" xid="div1_2" >
<div bind-ref="dDoc.ref('fExtendPsnNames1')" class="form-control x-output" component="$UI/system/components/justep/output/output" xid="output1_2" />
</div>
<a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-android-search" label="选择部门会签人员" onClick="btnselPsm1Click" xid="btnselPsm1" >
<i class="icon-android-search" xid="i21_1" />
<span xid="span21_1" >

选择部门会签人员</span>
</a>
</div>
</div>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4_2" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit2_2" >
<label class="x-label" style="width:100px;" xid="label2_2" >
<![CDATA[领导签阅]]>
</label>
<div class="x-edit" xid="div2_2" >
<div bind-ref="dDoc.ref('fExtendPsnNames2')" class="form-control x-output" component="$UI/system/components/justep/output/output" xid="output2_2" />
</div>
<a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-android-search" label="选择部门签阅人员" onClick="btnselPsm2Click" xid="btnselPsm2" >
<i class="icon-android-search" xid="i12_1" />
<span xid="span12_1" >

选择部门签阅人员</span>
</a>
</div>
</div>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7_2" >
<div class="x-label-edit x-label30" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit3_2" >
<label class="x-label" style="width:100px;" xid="label3_2" >
<![CDATA[领导签发]]>
</label>
<div class="x-edit" xid="div3_2" >
<div bind-ref="dDoc.ref('fExtendPsnNames3')" class="form-control x-output" component="$UI/system/components/justep/output/output" xid="output3_2" />
</div>
<a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-android-search" label="选择部门签发人员" onClick="btnselPsm3Click" xid="btnselPsm3" >
<i class="icon-android-search" xid="i21_1" />
<span xid="span21_1" >

选择部门签发人员</span>
</a>
</div>
</div>
</div>

</div>