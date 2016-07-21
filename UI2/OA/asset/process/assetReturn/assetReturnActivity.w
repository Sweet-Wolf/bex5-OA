<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:702px;top:238px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dAssetCard"
      directDelete="true" autoLoad="true" concept="OA_AS_Card" columns=""
      onSaveCommit="saveCommit" limit="20"> 
      <reader action="/OA/asset/logic/action/queryASCardAction"/>  
      <writer action="/OA/asset/logic/action/saveASCardAction"/>  
      <creator action="/OA/asset/logic/action/createASCardAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    <filter name="cardStatusFilter" xid="filter1"><![CDATA[OA_AS_Card.fStatus = 1]]></filter></div>
  <div component="$UI/system/components/justep/data/bizData" xid="dAssetReturn" concept="OA_AS_Return" autoLoad="true"><reader xid="default1" action="/OA/asset/logic/action/queryASReturnAction"></reader>
  <writer xid="default6" action="/OA/asset/logic/action/saveASReturnAction"></writer>
  <creator xid="default7" action="/OA/asset/logic/action/createASReturnAction"></creator>
  <master xid="default8" data="dAssetCard" relation="fAssetID"></master></div>
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="bar"> 
        
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick='{"operation":"dAssetCard.refresh"}' label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="归还" xid="trgReturn" onClick="trgReturnClick" icon="icon-android-checkmark">
   <i xid="i10" class="icon-android-checkmark"></i>
   <span xid="span17">归还</span></a>
  <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="dAssetCard" filterCols="fKind,fCode,fName,fSpecType,fUnit,fStatusName,fOriginValue,fRemainValue" class="x-smartFilter-clear-hide input-group">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input4"></input></div></div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dataTables" data="dAssetCard" showRowNumber="true" multiSelect="false" onCellRender="dataTablesCellRender" onRowClick="dataTablesRowClick">
   <columns xid="columns1"><column name="fKind" xid="column1"></column>
  <column name="fCode" xid="column2" width="120px"></column>
  <column name="fName" xid="column3"></column>
  <column name="fSpecType" xid="column4"></column>
  <column name="fUnit" xid="column5"></column>
  <column name="fOriginValue" xid="column6"></column>
  <column name="fRemainValue" xid="column7"></column>
  <column name="fDutyDeptName" xid="column8"></column>
  <column name="fDutyPsnName" xid="column9"></column>
  <column name="fRemark" xid="column10"></column></columns></div></div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="dAssetCard" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="dAssetCard"> 
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
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgReturn" title="资产归还信息录入" status="normal" showTitle="true" style="left:384px;top:7px;" onReceive="wDlgReturnReceive" width="50%" height="50%"></span>
  </div>