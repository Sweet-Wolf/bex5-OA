<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:118px;top:247px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dVBookStatus"
      concept="V_OA_Book_ApplyStatus" autoLoad="true" orderBy="fBooksNumber asc,fBookApplyStatus asc,fApplyDate desc">
      <reader xid="default1" action="/OA/book/logic/action/queryVBookApplyStatusAction"/>
    </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="conditionData" idColumn="id">
   <data xid="default7">[{&quot;id&quot;:&quot;id&quot;}]</data>
   <column label="id" name="id" type="String" xid="column5"></column>
   <column label="状态" name="status" type="String" xid="column2"></column>
   <column label="条件" name="text" type="String" xid="default6"></column>
   <column label="状态名称" name="statusLabel" type="String" xid="default8"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="statusData" idColumn="id">
   <column label="id" name="id" type="String" xid="column3"></column>
   <column label="name" name="name" type="String" xid="column4"></column>
   <data xid="default9">[{&quot;id&quot;:&quot;0&quot;,&quot;name&quot;:&quot;申请中&quot;},{&quot;id&quot;:&quot;1&quot;,&quot;name&quot;:&quot;未归还&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;name&quot;:&quot;已归还&quot;}]</data></div></div> 
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" label="刷新" onClick="{operation:'dVBookStatus.refresh'}"> 
      <i xid="i2"/>  
      <span xid="span2">刷新</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnShow" label="查看" onClick="maindataTablesRowDblClick" icon="icon-eye">
   <i xid="i1" class="icon-eye"></i>
   <span xid="span7">查看</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'dataFilter.menu'}"> 
      <i xid="i5" class="icon-android-search"/>  
      <span xid="span8">查询</span> 
    </a>  
    <div component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter"
      class="x-control" filterData="dVBookStatus" filterMode="singleDate" dateCol="fApplyDate"
      defaultValue="all" autoRefresh="true"> 
      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
        xid="gridSelect" style="width:70px;" optionHeight="390"> 
        <option xid="option2"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter"
      class="x-control" useMyself="true" defaultValue="_myself_"
      autoRefresh="true" filterData="dVBookStatus" orgFIDCol="fCreatePsnFID" personIDCol="fCreatePsnID"> 
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
        xid="orgSelectPC1" manageCodes="businessManagement" multiselect="true" style="width:140px;"> 
        <option xid="option3"> 
          <columns xid="columns2"> 
            <column name="sName" xid="column1"/> 
          </columns> 
        </option> 
      </div> 
    </div>  
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
      xid="statusSelect" bind-ref="conditionData.ref('status')" bind-labelRef="conditionData.ref('statusLabel')"
      style="width:100px;" multiselect="true" onUpdateValue="statusSelectUpdateValue"> 
      <option xid="option1" data="statusData" value="id" label="name"/> 
    </div>  
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1"
      filterData="dVBookStatus" class="x-smartFilter-clear-hide input-group" filterCols="fBooksNumber,fBooksName,fBooksTypeName,fBookConcern,fAuthor,fBookApplyStatusName,fApplyDeptName,fApplyPsnName,fApplyDate"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div> 
  </div>  
   <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dataFilter"
    filterData="dVBookStatus" style="left:28px;top:290px;"/>  
     <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover table-striped" xid="maindataTables"
    data="dVBookStatus" showRowNumber="true" multiSelect="false" onRowDblClick="maindataTablesRowDblClick"> 
    <columns xid="columns1"> 
      <column name="fBookApplyStatusName" xid="column12"></column><column name="fBooksNumber" xid="column6"></column>
  <column name="fBooksName" xid="column7"></column>
  <column name="fBooksTypeName" xid="column8"></column>
  <column name="fAuthor" xid="column11"></column><column name="fBookConcern" xid="column9"></column>
  <column name="fPrice" xid="column10"></column>
  
  
  <column name="fApplyDeptName" xid="column13"></column>
  <column name="fApplyPsnName" xid="column14"></column>
  <column name="fApplyDate" xid="column15"></column></columns> 
  </div>  
   <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar1" data="dVBookStatus"> 
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
