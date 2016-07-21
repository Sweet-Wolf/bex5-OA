<div 
  xmlns:xui="http://www.justep.com/xui" 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  extends="$UI/OA/knowledge/process/knowledgeMobile/knowledgeMobileBaseActivity.w" 
  __id="id_1" 
  design="device:mobile" 
  class="oa window" >

    <filter name="filter0" xid="filter1_1" xui:parent="KnowledgeNoRead" xui:update-mode="insert" >
<![CDATA[( OA_KM_Knowledge.fFolderID = 'news' OR OA_KM_Knowledge.fFolderFullID LIKE 'public/news%' ) 
 AND OA_KM_Knowledge.fReleaseStatusName = '已发布']]>
</filter>
    <creator action="/OA/knowledge/logic/action/createKMKnowledgeAction" xid="default1_3" xui:parent="KnowledgeNoRead" xui:update-mode="insert" />
    <writer action="/OA/knowledge/logic/action/saveKMKnowledgeAction1" xid="default2_3" xui:parent="KnowledgeNoRead" xui:update-mode="insert" />
   <reader xid="default1" action="/OA/knowledge/logic/action/queryOA_KM_KnowledgeReadAction"  xui:update-mode="merge"/>
    <filter name="filter1" xid="filter2_1" xui:parent="KnowledgeRead" xui:update-mode="insert" >
<![CDATA[( OA_KM_Knowledge.fFolderID = 'news' OR OA_KM_Knowledge.fFolderFullID LIKE 'public/news%' ) 
 AND OA_KM_Knowledge.fReleaseStatusName = '已发布']]>
</filter>
    <creator action="/OA/knowledge/logic/action/createKMKnowledgeAction" xid="default3_3" xui:parent="KnowledgeRead" xui:update-mode="insert" />
    <writer action="/OA/knowledge/logic/action/saveKMKnowledgeAction1" xid="default4_3" xui:parent="KnowledgeRead" xui:update-mode="insert" />
   <div xid="listTitleBar" title="新闻查看"  xui:update-mode="merge"/>
   <div xid="div2"  xui:update-mode="merge-and-replace">

新闻查看</div>
</div>