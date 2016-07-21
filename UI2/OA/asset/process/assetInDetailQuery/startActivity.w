<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" concept="OA_AS_InD" columns=""
      onSaveCommit="saveCommit" limit="20" autoNew="false"> 
      <reader action="/OA/asset/logic/action/queryASInDetailAction"/>  
      <writer action="/OA/asset/logic/action/saveASInDAction"/>  
      <creator action="/OA/asset/logic/action/createASInDAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>
  <div component="$UI/system/components/justep/data/bizData" xid="kindData" concept="OA_Pub_BaseCode" autoLoad="true">
   <reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default6" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
   <creator xid="default7" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
   <filter name="filter0" xid="filter1">OA_Pub_BaseCode.fScope='固定资产类别' and OA_Pub_BaseCode.fUseStatusName='启用'</filter></div></div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="bar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick='{"operation":"detailData.refresh"}' label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}">
   <i xid="i5" class="icon-android-search"></i>
   <span xid="span8">查询</span></a>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter" filterData="detailData" dateCol="fDate">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3">
    <option xid="option6"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="kindFilter" filterData="detailData" filterCol="fKind">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" multiselect="true">
    <option xid="option2" data="kindData" value="fName" label="fName"></option></div> </div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter3" filterData="detailData" filterCols="fCode,fName,fSpecType,fUnit,fBuyApplyNO,fAmount,fDutyDeptName,fDutyPsnName" class="x-smartFilter-clear-hide input-group">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input4"></input></div>
  </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables" data="detailData" onRowDblClick="dataTablesRowDblClick" showRowNumber="true">
   <columns xid="columns1"><column name="fDutyDeptName" xid="column14"></column><column name="fDutyPsnName" xid="column15"></column><column name="fDate" xid="column11"></column><column name="fCode" xid="column3"></column>
  
  <column name="fKind" xid="column4"></column><column name="fName" xid="column5"></column>
  <column name="fSpecType" xid="column6"></column>
  <column name="fUnit" xid="column7"></column>
  <column name="fAmount" xid="column9"></column>
  
  <column name="fIsCheckName" xid="column10"></column>
  
  
  <column name="fMode" xid="column13"></column>
  
  <column name="fNO" xid="column12"></column><column name="fBuyApplyNO" xid="column8"></column></columns></div></div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="detailData" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="detailData"> 
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
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgAssetInRecord" title="入库信息" showTitle="true" style="left:206px;top:21px;" status="normal"></span>
  </div>