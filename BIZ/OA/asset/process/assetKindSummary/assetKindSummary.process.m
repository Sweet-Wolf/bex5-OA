<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">
  <process name="assetKindSummaryProcess">
    <label language="zh_CN">类别统计报表</label>
    <static-activity name="assetKindSummaryActivity">
      <label language="zh_CN">类别统计报表</label>
    </static-activity>
     
  





























































































<has-action action="ksqlQueryAction" access-permission="public"><public name="ksql" type="String"></public>
<public name="dataModel" type="String" value="/OA/asset/data"></public>
<public name="variables" type="Map"></public>
<public name="fnModel" type="String"></public>
</has-action>
<has-action log-enabled="true" action="newReportAction" access-permission="public"><public name="variables" type="Map"></public>
<public name="fnModel" type="String"></public>
<public name="tempOrgID" type="String"></public>
</has-action>
</process>
</model>
