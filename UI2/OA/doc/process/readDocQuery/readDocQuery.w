<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:382px;top:295px;" onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/bizData" xid="dDoc" concept="OA_DC_Doc"
      orderBy="fCreateTime:desc" autoLoad="true" confirmDelete="false" confirmRefresh="false">
      <reader xid="default1" action="/OA/doc/logic/action/queryReadDocAction"/>  
      <calculateRelation relation="recNO" xid="calculateRelation1" type="Integer"/>  
      <rule xid="rule1">
   <col name="fReaderIDs" xid="ruleCol2">
    <calculate xid="calculate2">
     <expr xid="default12">$model.dtDocfReaderIDsRender(val('fReaderIDs'))</expr></calculate> </col> 
   <col name="recNO" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default8">$row.index() + 1</expr></calculate> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dTypeFilter" idColumn="typeValue" confirmDelete="false" confirmRefresh="false">
      <column label="typeValue" name="typeValue" type="String" xid="default2"/>  
      <column label="typeName" name="typeName" type="String" xid="default3"/>
    <data xid="default13">[{&quot;typeValue&quot;:&quot;OA_DC_SendDoc&quot;,&quot;typeName&quot;:&quot;发文&quot;},{&quot;typeValue&quot;:&quot;OA_DC_SendDocPaper&quot;,&quot;typeName&quot;:&quot;发文稿纸&quot;},{&quot;typeValue&quot;:&quot;OA_DC_ReceiveDoc&quot;,&quot;typeName&quot;:&quot;收文&quot;},{&quot;typeValue&quot;:&quot;OA_DC_SignReport&quot;,&quot;typeName&quot;:&quot;签报&quot;}]</data></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dReadState" idColumn="state" confirmDelete="false" confirmRefresh="false">
      <column label="stateName" name="stateName" type="String" xid="default4"/>  
      <column label="state" name="state" type="String" xid="default5"/>
    <data xid="default14">[{&quot;stateName&quot;:&quot;未阅&quot;,&quot;state&quot;:&quot;0&quot;},{&quot;stateName&quot;:&quot;已阅&quot;,&quot;state&quot;:&quot;1&quot;}]</data></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dReadFilter" idColumn="readValue" confirmDelete="false" confirmRefresh="false">
      <column label="readValue" name="readValue" type="String" xid="default6"/>  
      <column label="readName" name="readName" type="String" xid="default7"/>
    <data xid="default15">[{&quot;readValue&quot;:&quot;0&quot;,&quot;readName&quot;:&quot;未阅&quot;}]</data></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dQueryState" idColumn="stateValue" confirmRefresh="false" confirmDelete="false">
      <column label="stateValue" name="stateValue" type="String" xid="default9"/>  
      <column label="stateName" name="stateName" type="String" xid="default10"/>  
      <data xid="default11">[{"stateValue":"bsEditing","stateName":"编辑中"},{"stateValue":"bsExecuting","stateName":"处理中"},{"stateValue":"bsFinished","stateName":"已完成"},{"stateValue":"bsAborted","stateName":"已终止"}]</data>
    </div>
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'dReadFilter.refresh'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span1"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="dtDocRowDblClick" xid="btnShow" label="查看" icon="icon-eye">
   <i xid="i5" class="icon-eye"></i>
   <span xid="span5">查看</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'docFilter.menu'}" xid="button2"> 
      <i xid="i2"/>  
      <span xid="span2"/>
    </a>  
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
      xid="gsReadFilter" bind-ref="dReadFilter.ref('readValue')" bind-labelRef="dReadFilter.ref('readName')"
      defaultLabel="'全部'" multiselect="true" onHideOption="gsReadFilterHideOption"> 
      <option xid="option1" data="dReadState" value="state" label="stateName" autoLoad="false"/>
    </div>  
    <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter"
      xid="queryState" filterData="dDoc" filterCol="fBizState" defaultValue="'bsEditing','bsExecuting','bsFinished'" autoRefresh="true" onFilter="queryStateFilter"> 
      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
        xid="gridSelect2" defaultLabel="'状态'" multiselect="true"> 
        <option xid="option2" data="dQueryState" value="stateValue" label="stateName"/>
      </div> 
    </div>  
    <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter"
      xid="queryDate" filterData="dDoc" dateCol="fCreateTime" defaultValue="all" options="all,today,yesterday,thisWeek,lastWeek,thisMonth,lastMonth,thisYear,lastYear,custom" autoRefresh="true" onFilter="queryDateFilter"> 
      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
        xid="gridSelect3"> 
        <option xid="option3"/>
      </div> 
    </div>  
    <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter"
      xid="queryType" filterData="dDoc" filterCol="fDocType" autoRefresh="true"> 
      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
        xid="gridSelect4" defaultLabel="'选择类型'" multiselect="true"> 
        <option xid="option4" data="dTypeFilter" value="typeValue" label="typeName"/>
      </div> 
    </div>  
    <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
      xid="queryLike" filterData="dDoc" filterCols="fDocTypeName,fTitle,fDocNumber,fDocExigenceLevelName,fDocSecretLevelName,fCreateDeptName,fCreatePsnName"> 
      <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
        xid="span3"> 
        <i class="icon-android-search" xid="i3"/>
      </span>  
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/>  
      <span class="input-group-addon x-smartFilter-clear" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))"
        bind-visible="$model.comp($element.parentElement).searchText.get() != ''"
        xid="span4"> 
        <i class="icon-close-circled" xid="i4"/>
      </span> 
    </div>
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="docFilter"
    style="left:247px;top:160px;" filterData="dDoc"/>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover table-striped" xid="dtDoc" data="dDoc" onRowDblClick="dtDocRowDblClick"> 
    <columns xid="columns1">
      <column name="recNO" xid="column1" label="序号"/>
      <column name="fReaderIDs" xid="column1" label="传阅状态"/>
      <column name="fBizStateName" xid="column1"/>
      <column name="fDocTypeName" xid="column1"/>
      <column name="fTitle" xid="column1"/>
      <column name="fDocNumber" xid="column1"/>
      <column name="fDocExigenceLevelName" xid="column1"/>
      <column name="fDocSecretLevelName" xid="column1"/>
      <column name="fIssueDate" xid="column1"/>
      <column name="fCreateDeptName" xid="column1"/>
      <column name="fCreatePsnName" xid="column1"/>
      <column name="fCreateTime" xid="column1"/>
    </columns>
  </div>
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgReadDocDetailQuery" src="$UI/OA/doc/process/readDocQuery/readDocDetailQuery.w" title="详细信息" showTitle="true" status="normal" width="90%" height="90%" forceRefreshOnOpen="true"></span></div>
