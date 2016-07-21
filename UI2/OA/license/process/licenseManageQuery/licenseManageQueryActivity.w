<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_LS_LicenseManage" columns=""
      onSaveCommit="saveCommit" limit="20"> 
      <reader action="/OA/license/logic/action/queryLSLicenseManageAction"/>  
      <writer action="/OA/license/logic/action/saveLSLicenseManageAction"/>  
      <creator action="/OA/license/logic/action/createLSLicenseManageAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dTypeFilter" idColumn="typeName">
   <column label="typeName" name="typeName" type="String" xid="column10"></column>
   <column label="typeValue" name="typeValue" type="String" xid="default6"></column>
   <data xid="default7">[{&quot;typeName&quot;:&quot;闲置&quot;,&quot;typeValue&quot;:&quot;Unused&quot;},{&quot;typeName&quot;:&quot;借出&quot;,&quot;typeValue&quot;:&quot;Lended&quot;}]</data></div></div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="mainData" filterCols="fUseStatusName,fLicenseNo,fSerialNumber,fLicenseName,fReleaseDeptName,fReleaseDate,fValidityDate,fNextExamDate,fIsCopyName"
        class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick="{&quot;operation&quot;:&quot;mainData.refresh&quot;}" label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}"> 
        <i xid="i5" class="icon-android-search"/>  
        <span xid="span8">查询</span> 
      </a> 
    <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter1" filterData="mainData" dateCol="fOperateDate" defaultValue="all" options="all,today,yesterday,thisWeek,lastWeek,thisMonth,lastMonth,thisYear,lastYear,custom">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1">
    <option xid="option1"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter1" filterData="mainData" filterCol="fUseStatus">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" defaultLabel="'选择状态'" multiselect="true">
    <option xid="option2" data="dTypeFilter" value="typeValue" label="typeName"></option></div> </div></div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
    rowActiveClass="active" class="table table-hover hidder-xs" xid="mainGrid" data="mainData"
    showRowNumber="true" onRowDblClick="mainGridRowDblClick" responsive="true"> 
    <columns xid="columns1"> 
      <column name="fUseStatusName" label="状态" xid="column1"/>  
      <column name="fSerialNumber" label="编号" xid="column2"/>  
      <column name="fLicenseName" label="证照名称" xid="column3"/>  
      <column name="fLicenseNo" label="证照号" xid="column4"/>  
      <column name="fIsCopyName" label="标示" xid="column5"/>  
      <column name="fReleaseDeptName" label="颁发部门" xid="column6"/>  
      <column name="fReleaseDate" label="颁发日期" xid="column7"/>  
      <column name="fValidityDate" label="有效期" xid="column8"/>  
      <column name="fNextExamDate" label="下次年检时间" xid="column9"/> 
    </columns> 
  </div>  
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="showDetailInfo"
    src="$UI/OA/license/process/licenseManageQuery/licenseManageQueryDetail.w"
    status="normal" title="证照详细信息" showTitle="true" width="60%" height="55%">
  </span>
</div>
