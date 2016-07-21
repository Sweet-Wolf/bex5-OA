<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="publishKnowledgeProcess" start="start1" end="end1"> 
    <label language="zh_CN">知识发布</label>  
    <place name="start1"> 
      <label language="zh_CN">开始</label>  
      <has-token token="init"/> 
    </place>  
    <token name="init"/>  
    <business-activity name="applyActivity" condition="true"> 
      <label language="zh_CN">发布申请</label>  
      <input name="x" unit="start1"/>  
      <output name="x" unit="deptApvActivity"/> 
    </business-activity>  
    <business-activity name="deptApvActivity" condition="true"> 
      <label language="zh_CN">部门领导审批</label>  
      <input name="x" unit="applyActivity"/>  
      <output name="x" unit="chargeApvActivity"/> 
    </business-activity>  
    <business-activity name="chargeApvActivity" condition="true"> 
      <label language="zh_CN">主管领导审批</label>  
      <listener action="advanceProcessAction" event="after" handler="chargeApvActivityAfterAdvanceProcedure"/>  
      <input name="x" unit="deptApvActivity"/>  
      <output name="x" unit="publishActivity"/> 
    </business-activity>  
    <business-activity name="publishActivity" condition="true"> 
      <label language="zh_CN">管理员发布</label>  
      <listener action="advanceProcessAction" event="after" handler="publishActivityAfterAdvanceProcedure"/>  
      <input name="x" unit="chargeApvActivity"/>  
      <output name="x" unit="end1"/>  
      <execute-rule condition="true" task-assign-mode="together"> 
        <executor-range range-expr="getKWReleaseRange(:sData1)" default-expr=""> 
          <kind>PSM</kind> 
        </executor-range>  
        <task-relation-value> 
          <item relation="sPreemptMode">'tpmOpen'</item>  
          <item relation="sExecuteMode">'temPreempt'</item>  
          <item relation="sName">'管理员发布:知识发布'</item> 
        </task-relation-value> 
      </execute-rule> 
    </business-activity>  
    <place name="end1"> 
      <label language="zh_CN">结束</label> 
    </place>  
    <listener action="abortProcessAction" event="after" handler="publishKnowledgeProcessAfterAbortProcedure"/>  
    <listener action="advanceProcessAction" event="after" handler="publishKnowledgeProcessAfterAdvanceProcedure"/>  
    <static-activity name="docActivity"/>  
    <static-activity name="urlActivity"/>  
    <static-activity name="htmlActivity"/>  
    <static-activity name="publishKWActivity"> 
      <label language="zh_CN">发布申请</label> 
    </static-activity>  
    <has-action action="queryKMREADERSAction" access-permission="public"/>  
    <has-action action="createKMKnowledgeAction" access-permission="public"/>  
    <has-action action="queryKMKnowledgeAction" access-permission="public"/>  
    <has-action action="saveKMKnowledgeAction" access-permission="public"/>  
    <has-action action="saveKMKnowledgeAction1" access-permission="public"/>  
    <has-action action="queryFolderAction" access-permission="public"/>  
    <has-action action="canCreateKWAction" access-permission="public"/>  
    <has-action action="createKMRightsAction" access-permission="public"/>  
    <has-action action="queryKMRightsAction" access-permission="public"/>  
    <has-action action="saveKMRightsAction" access-permission="public"/>  
    <has-action action="getFolderRightsSetAction" access-permission="public"/>  
    <has-action action="canReleaseKWAction" access-permission="public"/>  
    <has-action action="getAttachedFDRightsAction" access-permission="public"/>  
    <has-action action="getNoReadersAction" access-permission="public"/>  
    <has-action action="getNoReaderCountAction" access-permission="public"/>  
    <has-action action="getKWFolderIDsAction" access-permission="public"/>  
    <has-action action="queryOA_Pub_BaseCodeAction" access-permission="public"/>   
    <has-action action="addKnowledgeGZAction" access-permission="public"/> 
  </process> 
</model>
