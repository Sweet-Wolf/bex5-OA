<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <!--(DEFPROCESS officeSupplyUseApplyQueryProcess	(LABEL "办公用品领用查询" "zh_CN")
	(FLOW FALSE)
	(HAS-DEFAULT-ACTIONS "/OA/officeSupplyConsumables/data")
	(DEFACTIVITY-STATIC useApplyQueryActivity
		(LABEL "办公用品领用查询" "zh_CN"))
	(HAS-ACTION queryOSCUseApplyMAction "/OA/officeSupplyConsumables/data")
	(HAS-ACTION queryOSCUseApplyDAction "/OA/officeSupplyConsumables/data"))-->
  <process name="officeSupplyUseApplyQueryProcess">
    <label language="zh_CN">办公用品领用查询</label>
    <static-activity name="useApplyQueryActivity">
      <label language="zh_CN">办公用品领用查询</label>
    </static-activity>
    
    
  








































<has-action action="queryOSCUseApplyMAction" access-permission="public"></has-action>
<has-action action="queryOSCUseApplyDAction" access-permission="public"></has-action>
<has-action action="queryOSCUseApplyExMAction" access-permission="public"></has-action>
<has-action action="queryOSCUseApplyCrMAction" access-permission="public"></has-action>
<has-action action="queryOSCUseApplyPaMAction" access-permission="public"></has-action>
<has-action action="queryOSCUseApplyDetailAction" access-permission="public"></has-action>
<has-action action="queryOSCUseApplyClMAction" access-permission="public"></has-action>
<has-action action="querylistDataExAction" access-permission="public"></has-action>
</process>
</model>
