<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:221px;top:104px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" autoNew="false" concept="OA_MT_UseApply"> 
      <reader action="/OA/meeting/logic/action/queryMTUSEAPPLYAction"/>  
      <writer action="/OA/meeting/logic/action/saveMTUSEAPPLYAction"/>  
      <creator action="/OA/meeting/logic/action/createMTUSEAPPLYAction"/>  
<!--       <rule xid="rule4">  -->
<!--         <readonly xid="readonly3">  -->
<!--           <expr xid="default12">true</expr>  -->
<!--         </readonly>  -->
<!--       </rule>  -->
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dStatus" idColumn="value"><column label="label" name="label" type="String" xid="xid1"></column>
  <column label="value" name="value" type="String" xid="xid2"></column>
  <data xid="default1">[{&quot;label&quot;:&quot;编辑中&quot;,&quot;value&quot;:&quot;bsEditing&quot;},{&quot;label&quot;:&quot;待办中&quot;,&quot;value&quot;:&quot;bsWaiting&quot;},{&quot;label&quot;:&quot;流转中&quot;,&quot;value&quot;:&quot;bsFlowing&quot;},{&quot;label&quot;:&quot;已完成&quot;,&quot;value&quot;:&quot;bsFinished&quot;},{&quot;label&quot;:&quot;已终止&quot;,&quot;value&quot;:&quot;bsAbort&quot;}]</data></div></div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="filter"
    filterData="mainData"/>  
  <div class="tab-pane active container-fluid" xid="listContent"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="listBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick="{operation:'mainData.refresh'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="" xid="filterBtn" icon="icon-search" onClick="{operation:'filter.menu'}"> 
        <i xid="i4" class="icon-search"/>  
        <span xid="span5"/> 
      </a>  
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="mainData" style="float: right;" filterCols="fBizStateName,fApplyDeptName,fApplyPsnName,fApplyDate,fMeetName,fMeetPsns,fBoardroom,fBeginTime,fEndTime"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/> 
      </div> 
    <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter1" filterData="mainData" filterCol="fBizState">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true">
    <option xid="option1" data="dStatus" value="value" label="label"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter1" filterData="mainData" dateCol="fApplyDate">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2">
    <option xid="option2"></option></div> </div>
  <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter" class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true" filterData="mainData" orgFIDCol="fApplyPsnFID" personIDCol="fApplyPsnID">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC1" manageCodes="boardroomManagement" multiselect="true" style="width:140px;">
    <option xid="option3">
     <columns xid="columns2">
      <column name="sName" xid="column1"></column></columns> </option> </div> </div></div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
      rowActiveClass="active" class="table table-hover hidder-xs" xid="list" data="mainData"
      pagingType="simple_numbers" lengthMenu="10,25,50,100" onRowDblClick="listTablesRowDblClick"
      responsive="true"> 
      <columns xid="column"> 
        <column name="fBizStateName" label="状态"/>  
        <column name="fApplyDeptName" label="申请部门"/>  
        <column name="fApplyPsnName" label="申请人员"/>  
        <column name="fApplyDate" label="申请日期"/>  
        <column name="fMeetName" label="会议主题"/>  
        <column name="fBoardroom" label="会议室"/>  
        <column name="fBeginTime" label="开始时间"/>  
        <column name="fEndTime" label="结束时间"/> 
      </columns> 
    </div>  
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
      xid="pagerBar" data="mainData"> 
      <div class="row" xid="div1"> 
        <div class="col-sm-3" xid="div2"> 
          <div class="x-pagerbar-length" xid="div4"> 
            <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
              class="x-pagerlimitselect" xid="pagerLimitSelect2"> 
              <span xid="span7">显示</span>  
              <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
                xid="select2"> 
                <option value="10" xid="default14">10</option>  
                <option value="20" xid="default15">20</option>  
                <option value="50" xid="default16">50</option>  
                <option value="100" xid="default17">100</option> 
              </select>  
              <span xid="span10">条</span> 
            </label> 
          </div> 
        </div>  
        <div class="col-sm-3" xid="div9"> 
          <div class="x-pagerbar-info" xid="div10">当前显示1-10条，共16条</div> 
        </div>  
        <div class="col-sm-6" xid="div11"> 
          <div class="x-pagerbar-pagination" xid="div12"> 
            <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
              xid="pagination1"> 
              <li class="prev" xid="li3"> 
                <a href="#" xid="a1"> 
                  <span aria-hidden="true" xid="span11">«</span>  
                  <span class="sr-only" xid="span12">Previous</span> 
                </a> 
              </li>  
              <li class="next" xid="li4"> 
                <a href="#" xid="a5"> 
                  <span aria-hidden="true" xid="span13">»</span>  
                  <span class="sr-only" xid="span14">Next</span> 
                </a> 
              </li> 
            </ul> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
