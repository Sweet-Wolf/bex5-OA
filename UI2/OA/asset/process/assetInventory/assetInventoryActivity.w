<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dAssetInventory"
      directDelete="true" autoLoad="true" concept="OA_AS_Card" columns="" onSaveCommit="saveCommit"
      limit="20"> 
      <reader action="/OA/asset/logic/action/queryASMyAssetAction"/>  
      <writer action="/OA/asset/logic/action/saveASCardAction"/>  
      <creator action="/OA/asset/logic/action/createASCardAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dAssetStatus" idColumn="label">
   <column label="col0" name="label" type="String" xid="default8"></column>
   <column label="col1" name="value" type="Integer" xid="default9"></column>
   <data xid="default10">[{&quot;label&quot;:&quot;闲置&quot;,&quot;value&quot;:0},{&quot;label&quot;:&quot;占用&quot;,&quot;value&quot;:1},{&quot;label&quot;:&quot;报废&quot;,&quot;value&quot;:2},{&quot;label&quot;:&quot;处理&quot;,&quot;value&quot;:3}]</data></div>
  <div component="$UI/system/components/justep/data/bizData" xid="kindData" concept="OA_Pub_BaseCode" autoLoad="true">
   <reader xid="default1" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default6" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
   <creator xid="default7" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
   <filter name="filter0" xid="filter1">OA_Pub_BaseCode.fScope='固定资产类别' and OA_Pub_BaseCode.fUseStatusName='启用'</filter></div></div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <a component="$UI/system/components/justep/button/button" label="清查"
        class="btn btn-link btn-icon-left" icon="icon-plus" xid="newBtn" onClick="newBtnClick"> 
        <i class="icon-plus"/>  
        <span>清查</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick='{"operation":"dAssetInventory.refresh"}' label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}">
   <i xid="i5" class="icon-android-search"></i>
   <span xid="span8">查询</span></a>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter" filterData="dAssetInventory" dateCol="fCreateTime">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3">
    <option xid="option6"></option></div> </div>
  
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="statusFilter" filterData="dAssetInventory" filterCol="fStatusName">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" multiselect="true">
    <option xid="option1" data="dAssetStatus" value="label" label="label"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="kindFilter" filterData="dAssetInventory" filterCol="fKind">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" multiselect="true">
    <option xid="option2" data="kindData" value="fName" label="fName"></option></div> </div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter3" filterData="dAssetInventory" filterCols="fName,fSpecType,fUnit,fDutyDeptName,fDutyPsnName,fFactory" class="x-smartFilter-clear-hide input-group">
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input4"></input></div></div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table table-hover table-striped" xid="assetInventoryTables"
      data="dAssetInventory" onCellRender="assetInventoryTablesCellRender" onRowClick="assetInventoryTablesRowClick" multiSelect="true"> 
      <columns xid="columns1"> 
        <column name="inventory" id="inventory" label="清查记录" orderable="false" searchable="false" className="x-dt-cell-center"/> 
        <column name="fStatusName" xid="column5" className="x-dt-cell-center"/>
        <column name="fKind" xid="column11" className="x-dt-cell-center"/>          
        <column name="fName" xid="column2" className="x-dt-cell-center"/>  
        <column name="fCode" xid="column1" className="x-dt-cell-center"/>  
        <column name="fSpecType" xid="column3" className="x-dt-cell-center"/>  
        <column name="fUnit" xid="column4" className="x-dt-cell-center"/>  
        <column name="fOriginValue" xid="column6" className="x-dt-cell-center"/>  
        <column name="fRemainValue" xid="column7" className="x-dt-cell-center"/>  
        <column name="fDutyDeptName" xid="column8" className="x-dt-cell-center"/>  
        <column name="fDutyPsnName" xid="column9" className="x-dt-cell-center"/>  
        <column name="fRemark" xid="column10" className="x-dt-cell-center"/> 
      </columns> 
    </div>
    </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="dAssetInventory" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="dAssetInventory"> 
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
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgInventoryRecord" title="清查记录" showTitle="true" status="normal" style="left:58px;top:66px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wDlgInsertInventory" title="添加清查记录" showTitle="true" status="normal" style="left:120px;top:64px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="assetCardDialog" style="left:194px;top:63px;" title="资产卡片" showTitle="true" status="normal" width="90%" height="90%"></span>
  </div>
