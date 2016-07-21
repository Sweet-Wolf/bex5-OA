<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="$UI/OA/knowledge/process/publishKnowledge/parent.w"
  xid="window" class="window window window window window window window window window"
  design="device:pc">  
  
  <div xid="labelEdit1" xui:update-mode="delete"/>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    onReceive="windowReceiverReceive" xid="windowReceiver" xui:before="controlGroup3"
    xui:parent="window" xui:update-mode="insert"/>  
  <div autoLoad="false" autoNew="true" component="$UI/system/components/justep/data/data"
    idColumn="canRelease" xid="dTemp" xui:parent="model" xui:update-mode="insert"> 
    <column label="canRelease" name="canRelease" type="String" xid="default11_1"/>  
    <column label="canUnrelease" name="canUnrelease" type="String" xid="default21_1"/>  
    <column label="needApprove" name="needApprove" type="String" xid="default31_1"/>  
    <rule xid="rule1111_1"> 
      <col name="canRelease" xid="ruleCol1111_1"> 
        <calculate xid="calculate1111_1"> 
          <expr xid="default5111_1">$model.dKnowledge.val("fReleaseStatus") ==1 || $model.dKnowledge.val("fIsNeedApprove") == '1'</expr> 
        </calculate> 
      </col> 
    </rule> 
  </div>  
  <a bind-disable="dTemp.ref(&quot;canRelease&quot;)" class="btn btn-link btn-icon-left"
    component="$UI/system/components/justep/button/button" label="直接发布" onClick="relaseKnowledge"
    xid="btnRelase" xui:before="btnPreviewStaticPage" xui:parent="toolBar1" xui:update-mode="insert"> 
    <i xid="i6"/>  
    <span xid="span6">直接发布</span> 
  </a>  
  <a bind-disable="$model.dKnowledge.val(&quot;fIsNeedApprove&quot;)  != '1'  || $model.dKnowledge.val(&quot;fReleaseStatus&quot;)  != '0'"
    class="btn btn-link btn-icon-left" component="$UI/system/components/justep/button/button"
    label="审批发布" onClick="approveRelaseKnowledge" xid="btnApproveRelase" xui:before="btnPreviewStaticPage"
    xui:parent="toolBar1" xui:update-mode="insert"> 
    <i xid="i7"/>  
    <span xid="span7">审批发布</span> 
  </a>  
  <a bind-disable="$model.dKnowledge.val(&quot;fReleaseStatus&quot;)  != 1" class="btn btn-link btn-icon-left"
    component="$UI/system/components/justep/button/button" label="取消发布" onClick="cancelRelaseKnowledge"
    xid="btnCancelRelase" xui:before="btnPreviewStaticPage" xui:parent="toolBar1"
    xui:update-mode="insert"> 
    <i xid="i8"/>  
    <span xid="span8">取消发布</span> 
  </a>  
  <div xid="processKW" autoFilter="false" autoStart="false" xui:update-mode="merge"/>  
  <div xid="col6" class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xui:update-mode="merge"/>  
  <div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit"
    xid="labelEdit1_4" xui:parent="col6" xui:update-mode="insert"> 
    <label class="x-label" style="width:100px;" xid="label1_4"> <![CDATA[继承栏目权限]]> </label>  
    <div class="x-edit" xid="div1_4"> 
      <span __id="id_63" bind-itemset="IsInherit" bind-itemsetLabel="ref('lable')"
        bind-itemsetValue="ref('value')" bind-ref="dKnowledge.ref('fIsInheritRights')"
        class="x-radio-group" component="$UI/system/components/justep/select/radioGroup"
        xid="fIsInherit"/> 
    </div> 
  </div>  
  <label xid="label2" xui:update-mode="merge-and-replace">发布栏目</label>  
  <xu:modifications> 
    <xu:remove select="//*[@xid='label2']/@bind-text"/> 
  </xu:modifications> 
</div>
