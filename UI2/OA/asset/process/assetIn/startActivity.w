<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc;"
  xid="window">  
    
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:422px;top:316px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AS_InM" columns="" autoNew="false"
      onAfterDelete="mainDataAfterDelete"> 
      <reader action="/OA/asset/logic/action/queryASInMAction"/>  
      <writer action="/OA/asset/logic/action/saveASInMAction"/>  
      <creator action="/OA/asset/logic/action/createASInMAction"/> 
    </div>  
    </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="toolBar1"> 
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter"
      filterData="mainData" filterCols="fNO,fDutyDeptName,fDutyPsnName,fDate,fMode,fAmount,fStateName,fRemark"
      class="pull-right"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input2"/>
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="newBtn" label="新建" onClick="newBtnClick" icon="icon-plus"> 
      <i xid="i8" class="icon-plus"/>  
      <span xid="span8">新建</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="button1" onClick="{&quot;operation&quot;:&quot;mainData.delete&quot;}"> 
      <i xid="i12"/>  
      <span xid="span12">保存</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
      xid="refreshBtn" onClick="{operation:'mainData.refresh'}"> 
      <i xid="i1"/>  
      <span xid="span1"/>
    </a>  
    </div>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-condensed table-hover" xid="mainTables"
    data="mainData" pagingType="simple_numbers" lengthMenu="10,25,50,100" onRowDblClick="orderTablesRowDblClick"> 
    <columns xid="column"> 
      <column name="fNO" xid="column1"/>  
      <column name="fDutyDeptName" xid="column2"/>  
      <column name="fDutyPsnName" xid="column3"/>  
      <column name="fDate" xid="column4"/>  
      <column name="fMode" xid="column5"/>  
      <column name="fAmount" xid="column6"/>  
      <column name="fStateName" xid="column7"/>  
      <column name="fRemark" xid="column8"/>
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="mainData"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div4"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span15">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default9">10</option>  
              <option value="20" xid="default10">20</option>  
              <option value="50" xid="default14">50</option>  
              <option value="100" xid="default15">100</option>
            </select>  
            <span xid="span16">条</span>
          </label> 
        </div> 
      </div>  
      <div class="col-sm-3" xid="div5"> 
        <div class="x-pagerbar-info" xid="div6">当前显示1-10条，共16条</div>
      </div>  
      <div class="col-sm-6" xid="div7"> 
        <div class="x-pagerbar-pagination" xid="div8"> 
          <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
            xid="pagination1"> 
            <li class="prev" xid="li1"> 
              <a href="#" xid="a1"> 
                <span aria-hidden="true" xid="span17">«</span>  
                <span class="sr-only" xid="span18">Previous</span>
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a3"> 
                <span aria-hidden="true" xid="span19">»</span>  
                <span class="sr-only" xid="span20">Next</span>
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>
</div>
