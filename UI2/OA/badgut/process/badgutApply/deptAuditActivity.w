<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="applyActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc;" >

  <div xid="detailBar" xui:update-mode="delete"/>
  <div xid="detail" xui:update-mode="delete"/>
    <col name="fRemark" xid="ruleCol1_2" xui:parent="rule1" xui:update-mode="insert" >
<readonly xid="readonly4_2" >
<expr xid="default4_2" >


true</expr>
</readonly>
</col>
    <readonly xid="readonly11_2" xui:parent="ruleCol1" xui:update-mode="insert" >
<expr xid="default11_2" >


true</expr>
</readonly>
   <expr xid="default2"  xui:update-mode="merge-and-replace"></expr>    <readonly xid="readonly21_2" xui:parent="ruleCol2" xui:update-mode="insert" >
<expr xid="default21_2" >


true</expr>
</readonly>
   <expr xid="default3"  xui:update-mode="merge-and-replace"></expr>    <readonly xid="readonly31_2" xui:parent="ruleCol3" xui:update-mode="insert" >
<expr xid="default31_2" >


true</expr>
</readonly>
   <expr xid="default4"  xui:update-mode="merge-and-replace"></expr>    <div class="table table-hover table-striped" component="$UI/system/components/justep/dataTables/dataTables" data="detailData" flexibleWidth="false" responsive="false" rowActiveClass="active" scrollCollapse="false" showRowNumber="true" style="width:150%;" xid="dataTables" xui:parent="div17" xui:update-mode="insert" >
<columns xid="columns1_2" >
<column name="fAccountCode" xid="column1_2" />
<column name="fAccountName" xid="column2_2" />
<column name="fPlan1" xid="column3_2" />
<column name="fPlan2" xid="column4_2" />
<column name="fPlan3" xid="column5_2" />
<column name="fPlan4" xid="column6_2" />
<column name="fPlan5" xid="column7_2" />
<column name="fPlan6" xid="column8_2" />
<column name="fPlan7" xid="column9_2" />
<column name="fPlan8" xid="column10_2" />
<column name="fPlan9" xid="column11_2" />
<column name="fPlan10" xid="column12_2" />
<column name="fPlan11" xid="column13_2" />
<column name="fPlan12" xid="column14_2" />
<column name="fPlanall" xid="column15_2" />
</columns>
</div>
<xu:modifications>
  <xu:remove select="//*[@xid='fCostCenterName']/@style"/>
</xu:modifications>

</div>