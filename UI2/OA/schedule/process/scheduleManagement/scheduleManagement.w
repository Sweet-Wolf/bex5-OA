<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:816px;top:260px;" onActive="modelActive"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dList" concept="OA_SD_Schedule"> 
      <reader xid="default1" action="/OA/schedule/logic/action/querySDSCHEDULEAction"/>  
      <writer xid="default2" action="/OA/schedule/logic/action/saveSDSCHEDULEAction"/>  
      <creator xid="default3" action="/OA/schedule/logic/action/createSDSCHEDULEAction"/> 
    </div> 
  </div>  
  <div class="container-fluid" xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="toolBar1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="newData" xid="button3" icon="icon-plus" label="新增"> 
        <i xid="i3" class="icon-plus"/>  
        <span xid="span9">新增</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="deleteSchedule" xid="button2" label="删除" icon="icon-minus"> 
        <i xid="i2" class="icon-minus"/>  
        <span xid="span8">删除</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dList.refresh'}" xid="button4"> 
        <i xid="i4"/>  
        <span xid="span10"/> 
      </a>  
      <div class="input-group pull-right" component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="dList" filterCols="fTitle,fBeginTime,fEndTime,fContent,fExecutors,fCreatePsnName,fCreateTime"> 
        <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
          xid="span11"> 
          <i class="icon-android-search" xid="i5"/> 
        </span>  
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/>  
        <span class="input-group-addon x-smartFilter-clear" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))"
          bind-visible="$model.comp($element.parentElement).searchText.get() != ''"
          xid="span12"> 
          <i class="icon-close-circled" xid="i6"/> 
        </span> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="button5" onClick="{operation:'bizFilter1.menu'}"> 
        <i xid="i7"/>  
        <span xid="span13">查询</span> 
      </a>  
      <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter"
        xid="dateFilter1" filterData="dList" filterMode="dateRange" beginDateCol="fBeginTime"
        endDateCol="fEndTime" defaultValue="all" options="all,today,yesterday,thisWeek,lastWeek,thisMonth,lastMonth,thisYear,lastYear,custom"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
          xid="gridSelect1"> 
          <option xid="option1"/> 
        </div> 
      </div>  
      <div class="x-control" component="$UI/system/components/justep/orgFilter/orgFilter"
        xid="orgFilter1" filterData="dList" orgFIDCol="fCreatePsnID" useMyself="true"
        defaultValue="_myself_" personIDCol="fCreatePsnID"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
          xid="orgSelectPC1" multiselect="true" includeOrgKind="psm"> 
          <option xid="option2"> 
            <columns xid="columns2"> 
              <column name="sName" xid="column7"/> 
            </columns> 
          </option> 
        </div> 
      </div>  
    </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1"
      data="dList" onRowDblClick="openDetail"> 
      <columns xid="columns1"> 
        <column name="fTitle" xid="column1" label="日程主题"/>  
        <column name="fBeginTime" xid="column2" label="开始时间"/>  
        <column name="fEndTime" xid="column3" label="结束时间"/>  
        <column name="fExecutors" xid="column4" label="执行人"/>  
        <column name="fCreatePsnName" xid="column5" label="创建人"/>  
        <column name="fCreateTime" xid="column6" label="创建时间"/> 
      </columns> 
    </div>  
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
      xid="pagerBar1" data="dList"> 
      <div class="row" xid="div1"> 
        <div class="col-sm-3" xid="div2"> 
          <div class="x-pagerbar-length" xid="div3"> 
            <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
              class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
              <span xid="span1">显示</span>  
              <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
                xid="select1"> 
                <option value="10" xid="default4">10</option>  
                <option value="20" xid="default5">20</option>  
                <option value="50" xid="default6">50</option>  
                <option value="100" xid="default7">100</option> 
              </select>  
              <span xid="span2">条</span> 
            </label> 
          </div> 
        </div>  
        <div class="col-sm-3" xid="div4"> 
          <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div> 
        </div>  
        <div class="col-sm-6" xid="div6"> 
          <div class="x-pagerbar-pagination" xid="div7"> 
            <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
              xid="pagination1"> 
              <li class="prev" xid="li1"> 
                <a href="#" xid="a1"> 
                  <span aria-hidden="true" xid="span3">«</span>  
                  <span class="sr-only" xid="span4">Previous</span> 
                </a> 
              </li>  
              <li class="next" xid="li2"> 
                <a href="#" xid="a2"> 
                  <span aria-hidden="true" xid="span5">»</span>  
                  <span class="sr-only" xid="span6">Next</span> 
                </a> 
              </li> 
            </ul> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1"
    filterData="dList" filterCols="OA_SD_Schedule,version,fTitle,fBeginDatePart,fBeginTimePart,fBeginTime,fEndDatePart,fEndTimePart,fEndTime,fContent,fExecutors,fIsShared,fIsRemind,fRemindDatePart,fRemindTimePart,fRemindTime,fCreatePsnID,fCreatePsnName,fCreateTime,fCreateURL,fBizID,fBizType,fIsOutSide"/> 
<span component="$UI/system/components/justep/messageDialog/messageDialog" xid="ensureDeleteAlert" type="YesNo" message="确实要删除选 中的日程吗？" title="提示：" style="left:17px;top:109px;"></span></div>
