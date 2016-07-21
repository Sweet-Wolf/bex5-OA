<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:283px;left:72px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/baasData" autoLoad="true" xid="createOrgData" queryAction="querySa_oporg" saveAction="saveSa_oporg" url="/register/register_action" tableName="sa_oporg" idColumn="SID" isTree="true" onDataChange="createOrgDataDataChange"><column label="SID" name="SID" type="String" xid="default22"></column>
  <column label="SNAME" name="SNAME" type="String" xid="default23"></column>
  <column label="SCODE" name="SCODE" type="String" xid="default24"></column>
  <column label="SLONGNAME" name="SLONGNAME" type="String" xid="default25"></column>
  <column label="SFNAME" name="SFNAME" type="String" xid="default26"></column>
  <column label="SFCODE" name="SFCODE" type="String" xid="default27"></column>
  <column label="SFID" name="SFID" type="String" xid="default28"></column>
  <column label="SORGKINDID" name="SORGKINDID" type="String" xid="default29"></column>
  <column label="SSEQUENCE" name="SSEQUENCE" type="String" xid="default30"></column>
  <column label="SVALIDSTATE" name="SVALIDSTATE" type="Integer" xid="default31"></column>
  <column label="SPARENT" name="SPARENT" type="String" xid="default32"></column>
  <column label="SLEVEL" name="SLEVEL" type="Integer" xid="default33"></column>
  <column label="SPHONE" name="SPHONE" type="String" xid="default34"></column>
  <column label="SFAX" name="SFAX" type="String" xid="default35"></column>
  <column label="SADDRESS" name="SADDRESS" type="String" xid="default36"></column>
  <column label="SZIP" name="SZIP" type="String" xid="default37"></column>
  <column label="SDESCRIPTION" name="SDESCRIPTION" type="String" xid="default38"></column>
  <column label="SPERSONID" name="SPERSONID" type="String" xid="default39"></column>
  <column label="SNODEKIND" name="SNODEKIND" type="String" xid="default40"></column>
  <column label="VERSION" name="VERSION" type="Integer" xid="default41"></column>
  <column label="sWxDeptID" name="sWxDeptID" type="Integer" xid="default42"></column>
  <treeOption xid="default43" parentRelation="SPARENT"></treeOption></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="创建组织"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">创建组织</div>  
        <div class="x-titlebar-right reverse"></div> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1">
      <div component="$UI/system/components/justep/tree/tree" class="x-tree x-inner-scroll" xid="tree2" rootLabel="组织机构" data="createOrgData" labelColumn="SNAME">
   <div class="x-tree-head" xid="headDiv">
    <ul component="$UI/system/components/bootstrap/breadcrumb/breadcrumb" class="breadcrumb"></ul></div> 
   <div class="x-tree-content" xid="div10">
    <div component="$UI/system/components/justep/scrollView/scrollView" supportPullDown="true" supportPullUp="true" hScroll="false" vScroll="true" hScrollbar="false" vScrollbar="true" bounce="true" class="x-scroll" xid="scrollView3">
     <div class="x-content-center x-pull-down container" xid="div11">
      <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i7"></i>
      <span class="x-pull-down-label" xid="span9">下拉刷新...</span></div> 
     <ul class="x-tree-template x-scroll-content" xid="treeTemplateUl3">
      <li xid="li4" class="x-tree-link">
       <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row4" style="width:100%;margin:0 auto;">
        
  <div class="col col-xs-1" xid="col3"></div>
  <div class="col col-xs-1" xid="col12">
   <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox hide" xid="checkbox"></span></div>
  <div class="col col-xs-1" xid="col13">
   <img alt="" xid="classImage" src="$UI/OA/organizationalStructure/process/organizationalStructure/orgKind/dpt.gif"></img></div>
  <div class="col col-xs-6" xid="col14">
   <div component="$UI/system/components/justep/output/output" class="x-output" xid="output4" bind-ref='ref("SNAME")'></div></div>
  <div class="col col-xs-2" xid="col15" style="padding:0;">
   <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup6">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button11" icon="icon-chevron-right" style="color:#808080;width:100%;" bind-visible=" val(&quot;SPARENT&quot;) !='psm'">
     <i xid="i13" class="icon-chevron-right"></i>
     <span xid="span18"></span></a> </div> </div>
  <div class="col col-xs-1" xid="col1"></div></div> </li> </ul> 
     <div class="x-content-center x-pull-up" xid="div12">
      <span class="x-pull-up-label" xid="span10">加载更多...</span></div> </div> </div> </div></div> 
  <div class="x-panel-bottom" xid="bottom2" height="38">
   <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup1" style="border-top:1px solid #ddd;">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="创建组织" xid="createBtn">
     <i xid="i4"></i>
     <span xid="span5">创建组织</span></a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="delBtn" onClick="delBtnClick">
     <i xid="i5"></i>
     <span xid="delSpan" id="delSpan"><![CDATA[]]></span></a> </div> </div></div> 
<div component="$UI/system/components/bootstrap/dialog/dialog" class="modal fade" xid="dialog1">
   <div xid="div13" style="margin:36rem 0.7rem;">
    <div xid="div14" class="modal-content">
     <div class="modal-header" xid="div15">
      <button type="button" class="close" data-dismiss="modal" xid="button4">
       <span class="sr-only" xid="span12">Close</span></button> 
      <h4 class="modal-title" xid="h41"><![CDATA[您可以选择以下操作:]]></h4></div> 
     <div class="modal-body" xid="div16" style="padding:0;"><ul xid="ul1"><li style="padding:5px;border-bottom:1px dotted #ddd;"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup2"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="新建机构" xid="button7">
   <img src="$UI/OA/organizationalStructure/process/organizationalStructure/orgKind/ogn.gif"/>
   <span xid="span14">新建机构</span></a></div></li><li style="padding:5px;border-bottom:1px dotted #ddd;"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup3">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="新建部门" xid="button8">
    <img src="$UI/OA/organizationalStructure/process/organizationalStructure/orgKind/dpt.gif"/>
    <span xid="span15">新建部门</span></a> </div></li><li style="padding:5px;"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group btn-group-justified" tabbed="true" xid="buttonGroup5">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="新建人员" xid="button10">
    <img src="$UI/OA/organizationalStructure/process/organizationalStructure/orgKind/psm.gif"/>
    <span xid="span17">新建人员</span></a> </div></li></ul>
  </div>
     </div> </div> </div></div>
