<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AS_Deprecition" columns=""
      onSaveCommit="saveCommit" limit="20"> 
      <reader action="/OA/asset/logic/action/queryASDeprecitionAction"/>  
      <writer action="/OA/asset/logic/action/saveASDeprecitionAction"/>  
      <creator action="/OA/asset/logic/action/createASDeprecitionAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>
  <div component="$UI/system/components/justep/data/bizData" xid="CardData" concept="OA_AS_Card"><reader xid="default1" action="/OA/asset/logic/action/queryASMyAssetAction"></reader>
  <writer xid="default6" action="/OA/asset/logic/action/saveASCardAction"></writer>
  <creator xid="default7" action="/OA/asset/logic/action/createASCardAction"></creator></div></div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="bar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick='{"operation":"mainData.refresh"}' label="刷新" style="margin-right:20px;"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <label xid="year"><![CDATA[年]]></label><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="filterDepreYear" filterData="mainData" filterCols="fDepreYear" class="btn"> 
        <input type="text" class="form-control" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="depreYear" id="depreYear" /> 
      </div>
  <label xid="month"><![CDATA[月]]></label><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="filterDepreMonth" filterData="mainData" filterCols="fDepreMonth" class="btn">
   <input type="text" class="form-control" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="depreMonth" id="depreMonth"></input></div>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="折旧" xid="trgDepreciation" onClick="trgDepreciationClick">
   <i xid="i1"></i>
   <span xid="span7">折旧</span></a>
  </div>  
    </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1" data="mainData" showRowNumber="true">
   <columns xid="columns1"><column name="fCode" xid="column16"></column><column name="fKind" xid="column1"></column>
  <column name="fName" xid="column2"></column>
  <column name="fSpecType" xid="column3"></column>
  
  
  <column name="fDepreYear" xid="column6"></column>
  <column name="fDepreMonth" xid="column7"></column>
  <column name="fOriginValue" xid="column4"></column><column name="fYearDepre" xid="column8"></column>
  <column name="fMonthDepre" xid="column9"></column>
  <column name="fAddDepreValue" xid="column10"></column>
  <column name="fEquity" xid="column11"></column>
  <column name="fServiceYear" xid="column14"></column><column name="fUseMonth" xid="column15"></column><column name="fDutyDeptName" xid="column12"></column>
  <column name="fDutyPsnName" xid="column13"></column>
  
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