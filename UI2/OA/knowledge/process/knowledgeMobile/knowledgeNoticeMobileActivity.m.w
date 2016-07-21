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

  <div xid="smartFilter" xui:update-mode="delete"/>
  <div xid="content3" xui:update-mode="delete"/>
    <span component="$UI/system/components/justep/windowDialog/windowDialog" forceRefreshOnOpen="true" onReceive="noticeDialogReceive" src="$UI/OA/knowledge/process/knowledgeMobile/noticePulishMobileActivity.m.w" style="top:27px;left:61px;" xid="noticeDialog" xui:before="panel1" xui:parent="window" xui:update-mode="insert" />
    <div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert" >
<a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button2" >
<i class="icon-loading-a" xid="i4" />
<span xid="span51_1" />
</a>
</div>
   <div xid="model" style="height:auto;top:421px;left:270px;"  xui:update-mode="merge"/>
   <div xid="KnowledgeNoRead" confirmRefresh="false" orderBy="fReleaseTime desc" updateMode="whereAll"  xui:update-mode="merge"/>
    <filter name="filter0" xid="filter1_6" xui:parent="KnowledgeNoRead" xui:update-mode="insert" >
<![CDATA[ ( OA_KM_Knowledge.fFolderID = 'notice' OR OA_KM_Knowledge.fFolderFullID LIKE 'public/notice%' ) AND OA_KM_Knowledge.fReleaseStatusName = '已发布']]>
</filter>
   <div xid="numData" confirmRefresh="false"  xui:update-mode="merge"/>
   <div xid="KnowledgeRead" confirmRefresh="false" orderBy="fReleaseTime desc"  xui:update-mode="merge"/>
    <filter name="filter1" xid="filter2_6" xui:parent="KnowledgeRead" xui:update-mode="insert" >
<![CDATA[ ( OA_KM_Knowledge.fFolderID = 'notice' OR OA_KM_Knowledge.fFolderFullID LIKE 'public/notice%' ) AND OA_KM_Knowledge.fReleaseStatusName = '已发布']]>
</filter>
   <span xid="detailDialog" forceRefreshOnOpen="false"  xui:update-mode="merge"/>
    <div class="x-panel-bottom" height="48" style="display:none;" xid="bottom1_4" xui:parent="panel1" xui:update-mode="insert" >
<div class="btn-group x-card btn-group-justified" component="$UI/system/components/justep/button/buttonGroup" tabbed="true" xid="buttonGroup1_1" >
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="未读" target="onReadContent" xid="button1_1" >
<i xid="i2_1" />
<span xid="span3_1" >








未读</span>
</a>
<a class="btn btn-default" component="$UI/system/components/justep/button/button" label="已读" target="readContent" xid="button2_1" >
<i xid="i3_1" />
<span xid="span4_1" >








已读</span>
</a>
</div>
<div class="btn-group btn-group-justified" component="$UI/system/components/justep/button/buttonGroup" style="background-color:#2FA4E7;" tabbed="true" xid="buttonGroup1_4" >
<a class="btn btn-link btn-only-label" component="$UI/system/components/justep/button/button" label="未读" style="font-weight:bold;color:#FFFFFF;" target="onReadContent" xid="onReadBtn" >
<i xid="i1_4" />
<span xid="span1_4" >






















未读</span>
</a>
<a class="btn btn-link btn-only-label" component="$UI/system/components/justep/button/button" label="已读" style="font-weight:bold;color:#FFFFFF;" target="readContent" xid="readBtn" >
<i xid="i2_4" />
<span xid="span2_4" >






















已读</span>
</a>
</div>
</div>
   <div xid="listTitleBar" title="公告查看"  xui:update-mode="merge"/>
   <a xid="backBtn" class="btn btn-link btn-only-icon" onClick="{operation:'window.close'}"  xui:update-mode="merge"/>
   <div xid="div2"  xui:update-mode="merge-and-replace">












公告查看</div>    <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-android-add" label="新公告" onClick="noticeBtnClick" xid="noticeBtn" xui:parent="div3" xui:update-mode="insert" >
<i class="icon-android-add" xid="i1_12" />
<span xid="span1_12" >
























新公告</span>
</a>
   <div xid="content1" _xid="C70A53F3A1E000018EDD174B10506430" style="display:none;" class="x-panel-content x-cards x-scroll-view"  xui:update-mode="merge"/>
    <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView" xid="scrollView1_1" xui:parent="content1" xui:update-mode="insert" >
<div class="x-content-center x-pull-down container" xid="div1_1" >
<i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i1_1" />
<span class="x-pull-down-label" xid="span1_1" >




















下拉刷新...</span>
</div>
<div class="x-scroll-content" xid="div2_1" >
<div class="x-panel x-card" component="$UI/system/components/justep/panel/panel" xid="panel1_4" xui:parent="div5" xui:update-mode="insert" >
<div xid="content1_4" >
<div __id="id_26" class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter" onFilter="smartFilterFilter" xid="smartFilter" >
<span __id="id_27" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))" class="input-group-addon" xid="span6" >
<i __id="id_28" class="icon-android-search" xid="i9" />
</span>
<input __id="id_29" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" bind-value="$model.comp($element.parentElement).searchText" class="form-control" data-bind="valueUpdate: ['input', 'afterkeydown']" placeHolder="搜索" type="text" xid="input2" />
<span __id="id_30" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))" bind-visible="$model.comp($element.parentElement).searchText.get() != ''" class="input-group-addon" xid="span7" >
<i __id="id_31" class="icon-close-circled" xid="i8" />
</span>
</div>
<div active="0" class="x-contents" component="$UI/system/components/justep/contents/contents" xid="contents1_4" >
<div class="x-contents-content" xid="onReadContent" >
<div __id="id_38" class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel" xid="panel2" >
<div __id="id_39" bind-html="&quot;未阅 (&quot; + $model.numData.getValue('noreadNum') + &quot;)&quot;" bind-visible="false" class="title-row" xid="div7" xui:update-mode="merge-and-replace" >












未阅</div>
<div __id="id_40" bind-click="listClick" class="x-list" component="$UI/system/components/justep/list/list" data="KnowledgeNoRead" disableInfiniteLoad="true" disablePullToRefresh="true" filter="$model.dataFilter($row)" limit="200" xid="noReadList" >
<ul __id="id_41" class="x-list-template" xid="listTemplateUl5" >
<li __id="id_42" class="x-flex list-row" xid="li5" >
<div __id="id_43" class="head-pic-data" xid="col32" >
<div __id="id_44" bind-ref="ref('fReleasePsnID')" class="x-blob" component="$UI/system/components/justep/org/orgImage" orgKind="person" xid="orgImage1" >
<div __id="id_45" class="x-blob-bar" xid="div8" >
<i __id="id_46" class="x-blob-edit icon-compose" xid="i6" />
<i __id="id_47" class="x-blob-del icon-close-round" xid="i2" />
</div>
<img __id="id_48" class="x-blob-img x-autofill" xid="image1" />
</div>
<div __id="id_49" bind-ref="ref('fReleasePsnName')" bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count" component="$UI/system/components/justep/output/output" xid="output81" />
</div>
<div __id="id_50" class="x-flex1" xid="col33" >
<div __id="id_51" _component="$UI/system/components/justep/row/row" class="x-flex" xid="row11" >
<div __id="id_52" bind-ref="ref('fReleasePsnName')" class="x-flex1 x-output title-data" component="$UI/system/components/justep/output/output" xid="output9" />
<div __id="id_53" bind-ref="ref('fReleaseTime')" class="x-output right-content-data2" component="$UI/system/components/justep/output/output" xid="output5" />
</div>
<div __id="id_54" _component="$UI/system/components/justep/row/row" class="x-flex" xid="row12" >
<div __id="id_55" bind-ref="ref('fTitle')" class="x-flex1 x-output content-data" component="$UI/system/components/justep/output/output" xid="output10" />
</div>
</div>
</li>
</ul>
</div>
</div>
</div>
<div class="x-contents-content" xid="readContent" >
<div __id="id_56" class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel" xid="panel3" >
<div __id="id_57" bind-html="&quot;已阅 (&quot; + $model.numData.getValue('readNum') + &quot;)&quot;" bind-visible="false" class="title-row" xid="div9" xui:update-mode="merge-and-replace" >












已阅</div>
<div __id="id_58" bind-click="readlistClick" class="x-list x-cards" component="$UI/system/components/justep/list/list" data="KnowledgeRead" disableInfiniteLoad="true" disablePullToRefresh="true" filter="$model.dataFilter($row)" limit="200" xid="readlist" xui:update-mode="merge" >
<ul __id="id_59" class="x-list-template x-min-height list-group" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1" xid="listTemplateUl1" xui:update-mode="merge" >
<li __id="id_60" class="x-flex list-row x-min-height list-group-item " componentname="li(html)" id="undefined_li1" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;" xid="li1" xui:update-mode="merge" >
<div __id="id_61" class="head-pic-data" xid="div13" >
<div __id="id_62" bind-ref="ref('fReleasePsnID')" class="x-blob" component="$UI/system/components/justep/org/orgImage" orgKind="person" xid="orgImage2" >
<div __id="id_63" class="x-blob-bar" xid="div14" >
<i __id="id_64" class="x-blob-edit icon-compose" xid="i5" />
<i __id="id_65" class="x-blob-del icon-close-round" xid="i7" />
</div>
<img __id="id_66" class="x-blob-img x-autofill" xid="image2" />
</div>
<div __id="id_67" bind-ref="ref('fReleasePsnName')" bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count" component="$UI/system/components/justep/output/output" xid="output1" />
</div>
<div __id="id_68" class="x-flex1" xid="div10" >
<div __id="id_69" _component="$UI/system/components/justep/row/row" class="x-flex" xid="div11" >
<div __id="id_70" bind-ref="ref('fReleasePsnName')" class="x-flex1 x-output title-data" component="$UI/system/components/justep/output/output" xid="output4" />
<div __id="id_71" bind-ref="ref('fReleaseTime')" class="x-output right-content-data2" component="$UI/system/components/justep/output/output" xid="output6" />
</div>
<div __id="id_72" _component="$UI/system/components/justep/row/row" class="x-flex" xid="div12" >
<div __id="id_73" bind-ref="ref('fTitle')" class="x-flex1 x-output content-data" component="$UI/system/components/justep/output/output" xid="output2" />
</div>
</div>
</li>
</ul>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="x-content-center x-pull-up" xid="div3_1" >
<span class="x-pull-up-label" xid="span2_1" >

















加载更多...</span>
</div>
</div>
   <div xid="div7" bind-visible="false"  xui:update-mode="merge-and-replace">











未阅
  
  </div>   <div xid="div9" bind-visible="false"  xui:update-mode="merge-and-replace">











已阅
  </div>   <div xid="readlist" class="x-list x-cards"  xui:update-mode="merge"/>
   <ul xid="listTemplateUl1" componentname="$UI/system/components/justep/list/list#listTemplateUl" id="undefined_listTemplateUl1" class="x-list-template x-min-height list-group"  xui:update-mode="merge"/>
   <li xid="li1" componentname="li(html)" id="undefined_li1" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;" class="x-flex list-row x-min-height list-group-item "  xui:update-mode="merge"/>

</div>