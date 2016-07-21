<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="mdDoc" style="height:auto;left:235px;top:536px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDoc" concept="OA_DC_Doc"
      orderBy="fCreateTime:desc" autoLoad="true"> 
      <reader xid="default1" action="/OA/doc/logic/action/queryOA_DC_DocAction"/>  
      <writer xid="default2" action="/OA/doc/logic/action/saveOA_DC_DocAction"/>  
    </div>  
<!--     <div component="$UI/system/components/justep/data/data" autoLoad="true" -->
<!--       xid="customFilter" idColumn="persons">  -->
<!--       <column label="persons" name="persons" type="String" xid="default18"/>   -->
<!--       <column label="orgs" name="orgs" type="String" xid="default19"/>   -->
<!--       <column label="currentPersonId" name="currentPersonId" type="String" xid="default20"/>   -->
<!--       <column label="status" name="status" type="String" xid="default21"/>   -->
<!--       <column label="datetime" name="datetime" type="String" xid="default22"/>   -->
<!--       <column label="like" name="like" type="String" xid="default23"/>   -->
<!--       <column label="tmp" name="tmp" type="String" xid="default26"/>   -->
<!--       <column label="filter1" name="filter1" type="String" xid="default27"/>   -->
<!--       <data xid="default25">[{}]</data>  -->
<!--     </div>   -->
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dTypeFilter" idColumn="typeName"> 
      <column label="typeName" name="typeName" type="String" xid="default30"/>  
      <column label="typeValue" name="typeValue" type="String" xid="default31"/>  
      <data xid="default32">[{"typeName":"发文","typeValue":"OA_DC_SendDoc"},{"typeName":"收文","typeValue":"OA_DC_ReceiveDoc"},{"typeName":"签报","typeValue":"OA_DC_SignReport"},{"typeName":"发文稿纸","typeValue":"OA_DC_SendDocPaper"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dBtnState" idColumn="trgReceiveInfo"> 
      <column label="trgReceiveInfo" name="trgReceiveInfo" type="String" xid="default33"/>  
      <data xid="default34">[{"trgReceiveInfo":"trgReceiveInfo"}]</data>  
      <rule xid="rule1"> 
        <col name="trgReceiveInfo" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default45">$model.dDoc.val("fDocTypeName") == '发文'</expr> 
          </readonly> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dBizState" idColumn="stateValue"> 
      <column label="stateName" name="stateName" type="String" xid="default35"/>  
      <column label="stateValue" name="stateValue" type="String" xid="default36"/>  
      <data xid="default37">[{"stateName":"编辑中","stateValue":"bsEditing"},{"stateName":"处理中","stateValue":"bsExecuting"},{"stateName":"已完成","stateValue":"bsFinished"},{"stateName":"已终止","stateValue":"bsAborted"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dFilter" idColumn="typeID"> 
      <column label="typeID" name="typeID" type="String" xid="default38"/>  
      <column label="typeName" name="typeName" type="String" xid="default39"/>  
      <column label="state" name="state" type="String" xid="default40"/>  
      <column label="stateName" name="stateName" type="String" xid="default41"/>  
      <column label="time" name="time" type="String" xid="default42"/>  
      <column label="like" name="like" type="String" xid="default43"/>  
      <data xid="default44">[{"typeID":"OA_DC_SendDoc,OA_DC_ReceiveDoc,OA_DC_SignReport,OA_DC_SendDocPaper","typeName":"发文,收文,签报,发文稿纸","state":"bsEditing,bsExecuting,bsFinished","stateName":"编辑中,处理中,已完成","time":"","like":""}]</data> 
    </div> 
  </div>  
  <div class="container-fluid"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="toolBar1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dDoc.refresh'}" xid="button1"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="grdDocRowDblClick" xid="btnShow" label="查看" icon="icon-eye"> 
        <i xid="i5" class="icon-eye"/>  
        <span xid="span5">查看</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dDocFilter.menu'}" xid="button2"> 
        <i xid="i2"/>  
        <span xid="span2"/> 
      </a>  
      <div class="x-control" component="$UI/system/components/justep/orgFilter/orgFilter"
        xid="orgFilter1" filterData="dDoc" orgFIDCol="fCreatePsnFID" personIDCol="fCreatePsnID"
        useMyself="true" defaultValue="_myself_"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
          xid="orgSelectPC1" multiselect="true" manageCodes="docManagement"> 
          <option xid="option1"> 
            <columns xid="columns1"> 
              <column name="sName" xid="column1"/> 
            </columns> 
          </option> 
        </div> 
      </div>  
      <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter"
        xid="grdFType" filterData="dDoc" filterCol="fDocType"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
          xid="gridSelect1" defaultLabel="'发文,收文,签报,发文稿纸'" multiselect="true"> 
          <option xid="option2" data="dTypeFilter" value="typeValue" label="typeName"/> 
        </div> 
      </div>  
      <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter"
        xid="gridFilter2" filterData="dDoc" filterCol="fBizState"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
          xid="gridSelect2" defaultLabel="'编辑中,处理中,已完成'" multiselect="true"> 
          <option xid="option3" data="dBizState" value="stateValue" label="stateName"/> 
        </div> 
      </div>  
      <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter"
        xid="dateFilter1" filterData="dDoc" dateCol="fCreateTime" defaultValue="thisYear"
        options="all,today,yesterday,thisWeek,lastWeek,thisMonth,lastMonth,thisYear,lastYear,custom"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
          xid="gridSelect3"> 
          <option xid="option4"/> 
        </div> 
      </div>  
      <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="dDoc" filterCols="fDocTypeName,fTitle,fDocNumber,fDocKindName,fSourceDocNumber,fDocExigenceLevelName,fDocSecretLevelName,fCreateDeptName,fCreatePsnName"> 
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
    <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dDocFilter"
      style="left:47px;top:252px;" filterData="dDoc"/>  
    <!--     <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" -->  
    <!--       altRows="true" class="x-grid-no-bordered" xid="grdDoc" data="dDoc" onRowDblClick="grdDocRowDblClick">  -->  
    <!--       <columns xid="columns3">  -->  
    <!--         <column name="recNO" xid="column1" width="39" label="序号">  -->  
    <!--           <editor xid="editor1">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input2" bind-ref="ref('recNO')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fBizStateName" xid="column2" width="50">  -->  
    <!--           <editor xid="editor2">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input3" bind-ref="ref('fBizStateName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fDocTypeName" xid="column3" width="50">  -->  
    <!--           <editor xid="editor3">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input4" bind-ref="ref('fDocTypeName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fDocKindName" xid="column4" width="70">  -->  
    <!--           <editor xid="editor4">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input5" bind-ref="ref('fDocKindName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fTitle" xid="column5" width="315">  -->  
    <!--           <editor xid="editor5">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input6" bind-ref="ref('fTitle')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fKeyword" xid="column6" width="176">  -->  
    <!--           <editor xid="editor6">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input7" bind-ref="ref('fKeyword')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fDocNumber" xid="column7" width="140">  -->  
    <!--           <editor xid="editor7">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input8" bind-ref="ref('fDocNumber')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fSourceDocNumber" xid="column8" editable="true" width="120">  -->  
    <!--           <editor xid="editor8">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input9" bind-ref="ref('fSourceDocNumber')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fDocExigenceLevelName" xid="column9" width="60">  -->  
    <!--           <editor xid="editor9">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input10" bind-ref="ref('fDocExigenceLevelName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fDocSecretLevelName" xid="column10" width="45">  -->  
    <!--           <editor xid="editor10">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input11" bind-ref="ref('fDocSecretLevelName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fIssueDate" xid="column11" width="75">  -->  
    <!--           <editor xid="editor11">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input12" bind-ref="ref('fIssueDate')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fCreateDeptName" xid="column12" width="100">  -->  
    <!--           <editor xid="editor12">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input13" bind-ref="ref('fCreateDeptName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fCreatePsnName" xid="column13" width="60">  -->  
    <!--           <editor xid="editor13">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input14" bind-ref="ref('fCreatePsnName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>   -->  
    <!--         <column name="fCreateTime" xid="column14" width="100">  -->  
    <!--           <editor xid="editor14">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input15" bind-ref="ref('fCreateTime')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>  -->  
    <!--       </columns>  -->  
    <!--     </div>   -->  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1"
      data="dDoc" onRowDblClick="grdDocRowDblClick"> 
      <columns xid="columns2"> 
        <column name="fBizStateName" xid="column2"/>  
        <column name="fDocTypeName" xid="column3"/>  
        <column name="fDocKindName" xid="column4"/>  
        <column name="fTitle" xid="column5"/>  
        <column name="fKeyword" xid="column6"/>  
        <column name="fDocNumber" xid="column7"/>  
        <column name="fSourceDocNumber" xid="column8"/>  
        <column name="fDocExigenceLevelName" xid="column9"/>  
        <column name="fDocSecretLevelName" xid="column10"/>  
        <column name="fIssueDate" xid="column11"/>  
        <column name="fCreateDeptName" xid="column12"/>  
        <column name="fCreatePsnName" xid="column13"/>  
        <column name="fCreateTime" xid="column14"/> 
      </columns> 
    </div>  
    <span component="$UI/system/components/justep/windowDialog/windowDialog"
      xid="dlgDocDetailQuery" style="left:231px;top:227px;" src="$UI/OA/doc/process/docQuery/docDetailQuery.w"
      title="详细信息" showTitle="true" status="normal" width="90%" height="90%" forceRefreshOnOpen="true"/> 
  </div> 
</div>
