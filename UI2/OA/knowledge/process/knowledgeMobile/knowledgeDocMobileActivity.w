<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  component="$UI/system/components/justep/window/window" 
  extends="$UI/OA/knowledge/process/knowledgeMobile/knowledgeMobileBaseActivity.w" 
  xid="window" 
  class="window window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:mobile" >

    <filter name="filter0" xid="filter1_5" xui:parent="KnowledgeNoRead" xui:update-mode="insert" >
<![CDATA[( OA_KM_Knowledge.fFolderID = 'doc' OR OA_KM_Knowledge.fFolderFullID LIKE 'public/doc%' ) 
 AND OA_KM_Knowledge.fReleaseStatusName = '已发布']]>
</filter>
    <filter name="filter1" xid="filter2_5" xui:parent="KnowledgeRead" xui:update-mode="insert" >
<![CDATA[( OA_KM_Knowledge.fFolderID = 'doc' OR OA_KM_Knowledge.fFolderFullID LIKE 'public/doc%' ) 
 AND OA_KM_Knowledge.fReleaseStatusName = '已发布']]>
</filter>
   <div xid="listTitleBar" title="文件中心"  xui:update-mode="merge"/>
   <div xid="div2"  xui:update-mode="merge-and-replace">文件中心</div>
</div>