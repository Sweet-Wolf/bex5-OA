<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_VS_Paper" columns=""
      onSaveCommit="saveCommit" limit="20">
      <reader action="/OA/survey/logic/action/queryVSPaperAction"/>  
      <writer action="/OA/survey/logic/action/saveVSPaperAction"/>  
      <creator action="/OA/survey/logic/action/createVSPaperAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <filter name="filter0" xid="filter1"><![CDATA[OA_VS_Paper.fPState='已发布' or OA_VS_Paper.fPState='已完成']]></filter></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="publicData" idColumn="fName"><column label="名称" name="fName" type="String" xid="xid1"></column>
  <column label="编码" name="fCode" type="String" xid="xid2"></column>
  <data xid="default1">[{&quot;fName&quot;:&quot;不公开&quot;,&quot;fCode&quot;:&quot;NoPublic&quot;},{&quot;fName&quot;:&quot;完全公开&quot;,&quot;fCode&quot;:&quot;AllPublic&quot;},{&quot;fName&quot;:&quot;统计结果公开&quot;,&quot;fCode&quot;:&quot;SumPublic&quot;}]</data></div></div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
        
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick='{"operation":"mainData.refresh"}' label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}"> 
        <i xid="i5" class="icon-android-search"/>  
        <span xid="span8">查询</span> 
      </a> 
    <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter1" filterData="mainData" filterCol="fPublicType">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true">
    <option xid="option1" data="publicData" value="fCode" label="fName"></option></div> </div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="mainData" filterCols="fTitle" class="x-smartFilter-clear-hide input-group"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1" /> 
      </div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="问卷明细" xid="button1" onClick="button1Click">
   <i xid="i1"></i>
   <span xid="span7">问卷明细</span></a></div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="mainData" onCellRender="dataTables1CellRender" onRowClick="dataTables1RowClick" showRowNumber="true">
   <columns xid="columns1"><column name="fPState" xid="column4"></column><column name="fTitle" xid="column1"></column>
  <column name="fPublicTypeName" xid="column2"></column>
  <column name="fEndTime" xid="column3"></column>
  
  <column name="fCreateDeptName" xid="column5"></column>
  <column name="fCreatePsnName" xid="column6"></column>
  <column name="fCreateTime" xid="column7"></column></columns></div></div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="mainData"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span1">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default2">10</option>  
              <option value="20" xid="default3">20</option>  
              <option value="50" xid="default4">50</option>  
              <option value="100" xid="default5">100</option> 
            </select>  
            <span xid="span3">条</span> 
          </label> 
        </div> 
      </div>  
      <div class="col-sm-3" xid="div4"> 
        <div class="x-pagerbar-info" xid="div5">当前显示1-10条，共16条</div> 
      </div>  
      <div class="col-sm-6" xid="div6"> 
        <div class="x-pagerbar-pagination" xid="div7"> 
          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
            xid="pagination1"> 
            <li class="prev" xid="li1"> 
              <a href="#" xid="a1"> 
                <span aria-hidden="true" xid="span4">«</span>  
                <span class="sr-only" xid="span5">Previous</span> 
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span6">»</span>  
                <span class="sr-only" xid="span9">Next</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div> 
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog" style="left:605px;top:13px;" showTitle="true" status="normal" title="问卷明细"></span></div>