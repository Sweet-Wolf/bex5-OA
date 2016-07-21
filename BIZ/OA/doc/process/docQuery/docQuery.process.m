<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model">  
  <process name="docQueryProcess"> 
    <label language="zh_CN">公文查询</label>  
    <static-activity name="docQueryActivity"> 
      <label language="zh_CN">公文查询</label> 
    </static-activity>  
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
     
     
     
    <static-activity name="docSendQueryActivity"><label language="zh_CN">发文查询</label>
</static-activity>
<static-activity name="docRecvQueryActivity"><label language="zh_CN">收文查询</label>
</static-activity>
  










































































































































































































































































































<has-action action="createOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="queryOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="saveOA_DC_DocAction" access-permission="public"></has-action>
<has-action action="queryOA_DC_ReceiveRangeAction" access-permission="public"></has-action>
<has-action action="addRelevanceAction" access-permission="public"></has-action>
<has-action action="deleteRelevanceAction" access-permission="public"></has-action>
<has-action action="updateRelevanceAction" access-permission="public"></has-action>
<has-action action="getDocReaderRangeAction" access-permission="public"></has-action>
<has-action action="setDocReaderRangeAction" access-permission="public"></has-action>
<has-action action="getDocReceiveRangeAction" access-permission="public"></has-action>
<has-action action="setDocReceiveRangeAction" access-permission="public"></has-action>
<has-action action="isPublishedByBizAction" access-permission="public"></has-action>
<has-action action="deleteKWInfoAction" access-permission="public"></has-action>
<has-action action="getPublishedRangeByBizAction" access-permission="public"></has-action>
<has-action action="publishKnowledgeInterfaceAction" access-permission="public"></has-action>
<has-action action="queryOA_DC_DocExecuteAction" access-permission="public"></has-action>
<has-action action="getMeetingPsnIDsAction" access-permission="public"></has-action>
<has-action action="sqlQueryAction" access-permission="public"><public name="dataModel" type="String" value="/OA/doc/data"></public>
</has-action>
<has-action action="queryV_OA_DC_ReadOpinionAction" access-permission="public"></has-action>
<has-action action="docQueryFlowTrackAction" access-permission="public"></has-action>
<has-action action="docQueryDetailFlowTrackAction" access-permission="public"></has-action>
<has-action action="receiveDocRptAction" access-permission="public"></has-action>
<has-action action="receiveDocRptDetailAction" access-permission="public"></has-action>
<has-action action="sendReportDocAction" access-permission="public"></has-action>
<has-action action="sendReportDocDetailAction" access-permission="public"></has-action>
</process> 
</model>
