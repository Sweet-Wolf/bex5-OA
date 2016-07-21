<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_WM_LeaveApply" columns=""
      onSaveCommit="saveCommit" limit="20">
      <reader action="/OA/workTime/logic/action/queryOA_WM_LeaveApplyAction"/>  
      <writer action="/OA/workTime/logic/action/saveOA_WM_LeaveApplyAction"/>  
      <creator action="/OA/workTime/logic/action/createOA_WM_LeaveApplyAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <filter name="filter0" xid="filter1"><![CDATA[OA_WM_LeaveApply.fBizStateName='已完成']]></filter></div>
  </div>  
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
    <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter" filterData="mainData" dateCol="fApplyDate">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2">
    <option xid="option6"></option></div> </div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="mainData" filterCols="fNO,fApplyPersonName,fApplyDate,fApplyDeptID,fStartTime,fEndTime,fLeaveDays,fLeaveHours,fLeaveTypeName,fRelationTel,fFactStartTime,fFactEndTime,fBizStateName" class="x-smartFilter-clear-hide input-group"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1" /> 
      </div></div>  
    </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="mainData" showRowNumber="true" onRowDblClick="dataTables1RowDblClick">
   <columns xid="columns1"><column name="fBizStateName" xid="column13"></column><column name="fNO" xid="column2"></column>
  <column name="fApplyDeptName" xid="column5"></column><column name="fApplyPersonName" xid="column3"></column>
  <column name="fApplyDate" xid="column4"></column>
  
  <column name="fStartTime" xid="column6"></column>
  <column name="fEndTime" xid="column7"></column>
  <column name="fLeaveDays" xid="column8"></column>
  <column name="fLeaveHours" xid="column9"></column>
  <column name="fLeaveTypeName" xid="column14"></column><column name="fRelationTel" xid="column12"></column>
  </columns></div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
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