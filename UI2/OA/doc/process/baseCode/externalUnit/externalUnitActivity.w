<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:122px;top:303px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dExternalUnit"
      concept="OA_DC_ExternalUnit" isTree="true" limit="-1" autoLoad="true"> 
      <reader xid="default1" action="/OA/doc/logic/action/queryOA_DC_ExternalUnitAction"/>  
      <writer xid="default2" action="/OA/doc/logic/action/saveOA_DC_ExternalUnitAction"/>  
      <creator xid="default3" action="/OA/doc/logic/action/createOA_DC_ExternalUnitAction"/>  
      <treeOption xid="default4" parentRelation="fParent" rootFilter="OA_DC_ExternalUnit.fParent is null and OA_DC_ExternalUnit ='externalUnit'"/> 
    <rule xid="rule2">
   <col name="fCode" xid="ruleCol3">
    <readonly xid="readonly3">
     <expr xid="default7">js:val(&quot;fOrgID&quot;)  != ''</expr></readonly> </col> 
   <col name="fName" xid="ruleCol4">
    <readonly xid="readonly4">
     <expr xid="default8"></expr></readonly> </col> </rule></div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dataFilter"
    filterData="dExternalUnit" style="left:28px;top:290px;"/>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="orgDialogPC" includeOrgKind="ogn,dpt" status="normal" width="60%" onReceive="orgDialogPCReceive"></span><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
    <div class="col col-xs-5" xid="col1"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"
        xid="toolBar1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle "
          label="新建" xid="newBtn" icon="icon-android-add" onClick="newBtnClick"> 
          <i xid="i1" class="icon-android-add"/>  
          <span xid="span1">新建</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle "
          label="保存" xid="saveBtn" onClick="{operation:'dExternalUnit.save'}"> 
          <i xid="i2"/>  
          <span xid="span2">保存</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left dropdown-toggle "
          label="删除" xid="delBtn" icon="icon-android-remove" onClick="{operation:'dExternalUnit.delete'}"> 
          <i xid="i3" class="icon-android-remove"/>  
          <span xid="span3">删除</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'dataFilter.menu'}"> 
          <i xid="i5" class="icon-android-search"/>  
          <span xid="span8">查询</span> 
        </a> 
      </div>  
       <div component="$UI/system/components/justep/grid/grid" expandColumn="fName"
        useVirtualRoot="false" xid="orgTreeGrid" height="auto" class="x-grid-no-bordered"
        data="dExternalUnit" multiselect="false" directEdit="true" appearance="tree"> 
        <columns xid="columns1"> 
          <column name="fName" xid="column1"/>
        </columns>  
        <column width="100" name="fName" xid="column2"/>
      </div> 
    </div>  
    <div class="col col-xs-7" xid="col2"> 
      <div xid="content"> 
        <h1 xid="title" style="font-size:medium;"><![CDATA[基本信息]]></h1>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form"> 
          <div class="form-group" xid="formGroup1"> 
            <div class="col-sm-2" xid="col1"> 
              <label class="control-label" xid="codeL"><![CDATA[编号]]></label> 
            </div>  
            <div class="col-sm-4" xid="col2"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="code" bind-ref="dExternalUnit.ref('fCode')"/> 
            </div>  
            <div class="col-sm-2" xid="col3"> 
              <label class="control-label" xid="parentL"><![CDATA[父名称]]></label> 
            </div>  
            <div class="col-sm-4" xid="col4"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fParentName" bind-ref="dExternalUnit.ref('fParentName')"/> 
            </div> 
          </div>  
          <div class="form-group" xid="formGroup2"> 
            <div class="col-sm-2" xid="col6"> 
              <label class="control-label" xid="fNameL"><![CDATA[机构名称]]></label> 
            </div>  
            <div class="col-sm-10" xid="col7"> 
               
            
  <div class="input-group" xid="inputGroup2">
   <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="dExternalUnit.ref('fName')" xid="fName" onChange="fNameChange" style="border-right-style:none;"/><div class="input-group-addon" xid="div10" style="background-color:transparent;border-left-style:none;" bind-click="btnKeyWordClick">
    <i xid="i111" class="icon-android-search"></i></div> </div></div>  
            </div>  
          <div class="form-group" xid="formGroup3"> 
            <div class="col-sm-2" xid="col8"> 
              <label class="control-label" xid="fOrgURLNameL"><![CDATA[机构路径]]></label> 
            </div>  
            <div class="col-sm-10" xid="col9"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                bind-ref="dExternalUnit.ref('fOrgURLName')" xid="fOrgURLName"/> 
            </div> 
          </div>  
          <div class="form-group" xid="formGroup4"> 
            <div class="col-sm-2" xid="col10"> 
              <label class="control-label" xid="fLinkManL"><![CDATA[联系人]]></label> 
            </div>  
            <div class="col-sm-4" xid="col11"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fLinkMan" bind-ref="dExternalUnit.ref('fLinkMan')"/> 
            </div>  
            <div class="col-sm-2" xid="col12"> 
              <label class="control-label" xid="fLinkPhoneL"><![CDATA[联系电话]]></label> 
            </div>  
            <div class="col-sm-4" xid="col13"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fLinkPhone" bind-ref="dExternalUnit.ref('fLinkPhone')"/> 
            </div> 
          </div>  
          <div class="form-group" xid="formGroup5"> 
            <div class="col-sm-2" xid="col14"> 
              <label class="control-label" xid="fRemarkL"><![CDATA[备注]]></label> 
            </div>  
            <div class="col-sm-10" xid="col15"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="dExternalUnit.ref('fRemark')" xid="fRemark" style="height:85px;"
                /> 
            </div> 
          </div>  
          <div class="form-group" xid="formGroup6"> 
            <div class="col-sm-2" xid="col16"> 
              <label class="control-label" xid="fCreatePsnNameL"><![CDATA[提交人]]></label> 
            </div>  
            <div class="col-sm-4" xid="col17"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fCreatePsnName" bind-ref="dExternalUnit.ref('fCreatePsnName')"/> 
            </div>  
            <div class="col-sm-2" xid="col18"> 
              <label class="control-label" xid="fCreateTimeL"><![CDATA[提交时间]]></label> 
            </div>  
            <div class="col-sm-4" xid="col19"> 
              <output component="$UI/system/components/justep/output/output" class="form-control"
                xid="fCreateTime" bind-ref="dExternalUnit.ref('fCreateTime')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
