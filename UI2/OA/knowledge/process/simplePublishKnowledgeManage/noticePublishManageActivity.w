<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/knowledge/process/simplePublishKnowledgeManage/basePublishManageActivity.w" 
  xid="window" 
  class="window window window window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

    <filter name="filter0" xid="filter1_3" xui:parent="dKnowledge" xui:update-mode="insert" >
<![CDATA[OA_KM_Knowledge.fFolderID = 'notice'  or OA_KM_Knowledge.fFolderFullID like 'public/notice%']]>
</filter>
   <a xid="button3" onClick="addNews"  xui:update-mode="merge"/>
   <div xid="grdKnowledge" onRowDblClick="RowDbleClick"  xui:update-mode="merge"/>

</div>