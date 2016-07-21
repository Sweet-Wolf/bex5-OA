<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;" onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AS_Card" columns=""
      limit="20" onAfterRefresh="mainDataAfterRefresh"> 
      <reader action="/OA/asset/logic/action/queryASCardAction"/>  
      <writer action="/OA/asset/logic/action/saveASCardAction"/>  
      <creator action="/OA/asset/logic/action/createASCardAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <filter name="cardStatusFilter" xid="filter1"><![CDATA[OA_AS_Card.fStatus = '0' ]]></filter></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dAssetStatus" idColumn="value"><column label="label" name="label" type="String" xid="default11"></column>
  <column label="value" name="value" type="String" xid="default12"></column>
  <data xid="default14">[{&quot;label&quot;:&quot;闲置&quot;,&quot;value&quot;:&quot;0&quot;},{&quot;label&quot;:&quot;占用&quot;,&quot;value&quot;:&quot;1&quot;}]</data></div></div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgArrange" style="left:379px;top:4px;" src="$UI/OA/asset/process/dialog/assetArrangeDialog/assetArrangeDialog.w" status="normal" width="50%" height="50%" showTitle="true" onReceive="wDlgArrangeReceive">
   <result concept="mainData" operation="new" origin="dAssetArrange" xid="default1">
    <mapping from="deptID" to="fDutyDeptID" xid="default6"></mapping>
    <mapping from="deptName" to="fDutyDeptName" xid="default7"></mapping>
    <mapping from="psnID" to="fDutyPsnID" xid="default8"></mapping>
    <mapping from="psnName" to="fDutyPsnName" xid="default9"></mapping>
    <mapping from="arrangeDate" to="fArrangeDate" xid="default10"></mapping></result> </span><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgSelectPsn" src="$UI/system/components/justep/org/dialog/orgDialog.w" showTitle="true" status="normal" style="left:353px;top:3px;" title="选择资产责任人"></span><div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="bar"> 
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
       
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="trgArrange" label="安排" icon="icon-android-checkmark" onClick="trgArrangeClick">
   <i xid="i10" class="icon-android-checkmark"></i>
   <span xid="span17">安排</span></a>
  <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="mainData" filterCols="fKind,fCode,fName,fSpecType,fUnit,fOriginValue,fRemainValue,fDutyDeptName,fDutyPsnName,fRemark" class="x-smartFilter-clear-hide input-group">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div></div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables" data="mainData" onCellRender="dataTablesCellRender" showRowNumber="true" multiSelect="false" onRowClick="dataTablesRowClick">
   <columns xid="columns1"><column name="fStatusName" xid="column6"></column><column name="fKind" xid="column1"></column>
  <column name="fCode" xid="column2" width="120px"></column>
  <column name="fName" xid="column3"></column>
  <column name="fSpecType" xid="column4"></column>
  <column name="fUnit" xid="column5"></column>
  <column name="fDutyDeptName" xid="column8"></column>
  <column name="fDutyPsnName" xid="column9"></column>
  <column name="fRemark" xid="column10"></column>
  </columns></div></div>  
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
</div>