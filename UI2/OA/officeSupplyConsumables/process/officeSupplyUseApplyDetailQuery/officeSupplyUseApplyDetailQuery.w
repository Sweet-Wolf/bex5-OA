<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_OSC_UseApplyD" columns="" onSaveCommit="saveCommit"
      limit="20"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyDetailAction"/>  
      <writer action=""/>  
      <creator action=""/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="itemsetData" idColumn="value">
   <column label="label" name="label" type="String" xid="xid1"></column>
   <column label="value" name="value" type="String" xid="xid2"></column>
   <data xid="default8">[{&quot;label&quot;:&quot;编辑中&quot;,&quot;value&quot;:&quot;bsEditing&quot;},{&quot;label&quot;:&quot;处理中&quot;,&quot;value&quot;:&quot;bsExecuting&quot;},{&quot;label&quot;:&quot;已完成&quot;,&quot;value&quot;:&quot;bsFinished&quot;},{&quot;label&quot;:&quot;已终止&quot;,&quot;value&quot;:&quot;bsAborted&quot;}]</data></div></div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick='{"operation":"mainData.refresh"}' label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnShow" onClick='mainGridRowDblClick' label="查看" icon="icon-eye">
   <i xid="i1" class="icon-eye"></i>
   <span xid="span7">查看</span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}"> 
        <i xid="i5" class="icon-android-search"/>  
        <span xid="span8">查询</span> 
      </a>  
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="mainData" filterCols="fName,fKindName,fDemandNum,fFactNum,fBizStateName,fApplyDeptName,fApplyPsnName,fApplyDate"
        class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/> 
      </div> 
    <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter2" filterData="mainData" filterCol="fBizState">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3" multiselect="true" defaultLabel="'全部'">
    <option xid="option5" data="itemsetData" value="value" label="label"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter2" filterData="mainData" dateCol="fApplyDate">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect4">
    <option xid="option6"></option></div> </div>
  <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter2" class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true" filterData="mainData" orgFIDCol="fApplyPsnFID" personIDCol="fApplyPsnID" style="width:auto;">
   <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" manageCodes="officeManagement" multiselect="true" style="width:140px;">
    <option xid="option7">
     <columns xid="columns4">
      <column name="sName" xid="column8"></column></columns> </option> </div> </div></div>  
    <div component="$UI/system/components/justep/grid/grid" xid="mainGrid"
      data="mainData" width="100%" hiddenCaptionbar="true" height="auto" class="x-grid-no-bordered"
      showRowNumber="true" onRowDblClick="mainGridRowDblClick"> 
      <columns xid="column"> 
        <column name="fBizStateName" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fBizStateName')" readonly="true"/> 
          </editor> 
        </column>  
        <column name="fApplyDeptName" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fApplyDeptName')" readonly="true"/> 
          </editor> 
        </column>  
        <column name="fApplyPsnName" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fApplyPsnName')" readonly="true"/> 
          </editor> 
        </column>  
        <column name="fApplyDate" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fApplyDate')" readonly="true" disabled="true"/> 
          </editor> 
        </column>  
        <column name="fName" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fName')" readonly="true"/> 
          </editor> 
        </column>  
        <column name="fKindName" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fKindName')" readonly="true"/> 
          </editor> 
        </column>  
        <column name="fDemandNum" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fDemandNum')" readonly="true"/> 
          </editor> 
        </column>  
        <column name="fFactNum" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fFactNum')" readonly="true"/> 
          </editor> 
        </column> 
      </columns> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;" filterCols="fName,fKindName,fSpecType,fBizStateName,fApplyDeptName,fApplyPsnName"/>  
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
</div>
