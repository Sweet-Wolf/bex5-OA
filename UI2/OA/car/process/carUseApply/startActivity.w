<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/car/process/carUseApply/parent.w" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

    <rule xid="rule3_5" xui:parent="dCarUseApply" xui:update-mode="insert" >
<col name="fBeginTime" xid="ruleCol4_5" >
<required xid="required4_5" >
<expr xid="default7_5" >

true</expr>
<message xid="default8_5" >

开始时间需要必填</message>
</required>
</col>
<col name="fEndTime" xid="ruleCol5_5" >
<required xid="required5_5" >
<expr xid="default9_5" >

true</expr>
<message xid="default10_5" >

结束时间需要必填</message>
</required>
<constraint xid="constraint1_5" >
<expr xid="default11_5" >

$model.dCarUseApply.val("fEndTime") > $model.dCarUseApply.val("fBeginTime")</expr>
<message xid="default12_5" >

结束时间大于开始时间</message>
</constraint>
</col>
</rule>
   <span xid="dlgSelectCars" style="left:176px;top:135px;"  xui:update-mode="merge"/>
   <span xid="windowReceiver" style="left:63px;top:107px;"  xui:update-mode="merge"/>

</div>