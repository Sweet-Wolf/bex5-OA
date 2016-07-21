<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:327px;top:396px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dBookInfo" concept="OA_BK_BookInfo" autoLoad="true"><reader xid="default1" action="/OA/book/logic/action/queryBKBookInfoAction"></reader>
  <filter name="filter0" xid="filter1"><![CDATA[OA_BK_BookInfo.fLoanID='1']]></filter></div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" label="刷新" onClick="{operation:'dBookInfo.refresh'}"> 
      <i xid="i2"/>  
      <span xid="span2">刷新</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'dataFilter.menu'}"> 
      <i xid="i5" class="icon-android-search"/>  
      <span xid="span8">查询</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="归还" xid="btnReturn" icon="icon-android-checkmark" onClick="btnReturnClick"> 
      <i xid="i1" class="icon-android-checkmark"/>  
      <span xid="span7">归还</span>
    </a>
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1"
      filterData="dBookInfo" filterCols="fBooksNumber,fBooksName,fBooksTypeName,fBooksNo,fBookConcern,fEditionOrder,fPageNum,fPrice"
      class="x-smartFilter-clear-hide input-group"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div> 
  </div> 
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover table-striped" xid="maindataTables"
    data="dBookInfo" showRowNumber="true" multiSelect="false"> 
    <columns xid="columns1"> 
      <column name="fLoanName" xid="column1"/>
      <column name="fBooksNumber" xid="column10"/>  
      <column name="fBooksName" xid="column11"/>  
      <column name="fBooksTypeName" xid="column12"/>  
      <column name="fBooksNo" xid="column13"/>  
      <column name="fBookConcern" xid="column14"/>  
      <column name="fAuthor" xid="column15"/>  
      <column name="fPageNum" xid="column16"/>  
      <column name="fPrice" xid="column17"/>  
      <column name="fBuyDate" xid="column18"/> 
    </columns> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dataFilter"
    filterData="dBookInfo" style="left:28px;top:290px;"/>  
   <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar1" data="dBookInfo"> 
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
