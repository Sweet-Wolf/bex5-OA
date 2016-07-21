<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xui="http://www.justep.com/xui" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:626px;top:264px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_AS_UseApplyM" limit="15" columns=""> 
      <reader action="/OA/asset/logic/action/queryASUseApplyMAction"/>  
      <writer action="/OA/asset/logic/action/saveASUseApplyMAction"/>  
      <creator action="/OA/asset/logic/action/createASUseApplyMAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dUseArrange"
      concept="OA_AS_UseArrange" limit="1">
      <reader xid="default5" action="/OA/asset/logic/action/queryASUseArrangeAction"/>  
      <writer xid="default6" action="/OA/asset/logic/action/saveASUseArrangeAction"/>  
      <creator xid="default7" action="/OA/asset/logic/action/createASUseArrangeAction"/>  
      <master xid="default8" data="mainData" relation="fMasterID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dStatus" idColumn="value">
      <column label="label" name="label" type="String" xid="xid1"/>  
      <column label="value" name="value" type="String" xid="xid2"/>  
      <data xid="default9">[{"label":"编辑中","value":"bsEditing"},{"label":"处理中","value":"bsExecuting"},{"label":"已完成","value":"bsFinished"},{"label":"已终止","value":"bsAborted"},{"label":"已暂停","value":"bsSuspend"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="conditionData" idColumn="id"> 
      <data xid="default10">[{"id":"id"}]</data>  
      <column label="id" name="id" type="String" xid="column16"/>  
      <column label="状态" name="status" type="String" xid="column15"/>  
      <column label="条件" name="text" type="String" xid="column13"/>  
      <column label="状态名称" name="statusLabel" type="String" xid="column14"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="toolBar"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" label="刷新" onClick="{operation:'mainData.refresh'}"> 
      <i xid="i2"/>  
      <span xid="span15">刷新</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="btnShow" label="查看" onClick="grid3RowClick" icon="icon-eye"> 
      <i xid="i3" class="icon-eye"/>  
      <span xid="span12">查看</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'dataFilter.menu'}"> 
      <i xid="i5" class="icon-android-search"/>  
      <span xid="span13">查询</span>
    </a>
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
      xid="statusSelect" bind-ref="conditionData.ref('status')" bind-labelRef="conditionData.ref('statusLabel')"
      style="width:100px;" multiselect="true" onUpdateValue="statusSelectUpdateValue"> 
      <option xid="option1" data="dStatus" value="value" label="label"/>
    </div>  
    <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter"
      xid="dateFilter2" filterData="mainData" dateCol="fApplyDate"> 
      <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
        xid="gridSelect4"> 
        <option xid="option6"/>
      </div> 
    </div>
    <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter1"
      class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true"
      filterData="mainData" orgFIDCol="fApplyPsnFID" personIDCol="fApplyPsnID" style="width:auto;"> 
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
        xid="orgSelectPC1" manageCodes="assetManagement" multiselect="true" style="width:140px;"> 
        <option xid="option7"> 
          <columns xid="columns4"> 
            <column name="sName" xid="column11"/>
          </columns> 
        </option> 
      </div> 
    </div>
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter3"
      filterData="mainData" filterCols="OA_AS_UseApplyM,version,fNO,fApplyOgnID,fApplyOgnName,fApplyDeptID,fApplyDeptName,fApplyPosID,fApplyPosName,fApplyPsnID,fApplyPsnName,fApplyPsnFID,fApplyPsnFName,fApplyDate,fKindID,fKind,fName,fDemandDate,fReturnDate,fRequire,fApplyReason,fProcess,fProcessName,fRemark,fBizState,fBizStateName,fCreateOgnID,fCreateOgnName,fCreateDeptID,fCreateDeptName,fCreatePosID,fCreatePosName,fCreatePsnID,fCreatePsnName,fCreatePsnFID,fCreatePsnFName,fCreateTime,fUpdatePsnID,fUpdatePsnName,fUpdateTime,fCurrentActivities,fCurrentExecutors,fExtendStr1,fExtendStr2,fExtendStr3,fExtendStr4,fExtendStr5,fExtendStr6,fExtendStr7,fExtendStr8,fExtendStr9,fExtendDate1,fExtendDate2,fExtendDate3,fExtendDate4,fExtendDate5,fExtendNum1,fExtendNum2,fExtendNum3,fExtendNum4,fExtendNum5"
      class="pull-right"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/>
    </div> 
  </div>
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    class="table table-hover table-striped" xid="listData" data="mainData" rowActiveClass="active"
    onRowDblClick="grid3RowClick" showRowNumber="true"> 
    <columns xid="column"> 
      <column name="fBizStateName" label="状态" width="50px" xid="column1"/>  
      <column name="fNO" label="单号" width="150px" xid="column2"/>  
      <column name="fKind" label="资产类别" width="200px" xid="column3"/>  
      <column name="fName" label="资产名称" width="200px" xid="column4"/>  
      <column name="fApplyDeptName" label="申请部门" width="150px" xid="column5"/>  
      <column name="fApplyPsnName" label="申请人" width="150px" xid="column6"/>  
      <column name="fApplyDate" label="申请日期" width="120px" xid="column7"/>  
<!--       <column name="fDemandDate" label="需求日期" width="120px" xid="column8"/>   -->
      <column name="fReturnDate" label="归还日期" width="120px" xid="column9"/>  
      <column name="fProcessName" label="处理方式" width="100px" xid="column10"/>  
<!--       <column name="fApplyReason" width="150px" label="申请原因" xid="column12"/> -->
    </columns> 
  </div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pageBar" data="mainData"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="limitSelect1"> 
            <span xid="span2">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default1">10</option>  
              <option value="20" xid="default2">20</option>  
              <option value="50" xid="default3">50</option>  
              <option value="100" xid="default4">100</option>
            </select>  
            <span xid="span5">条</span>
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
                <span aria-hidden="true" xid="span6">«</span>  
                <span class="sr-only" xid="span7">Previous</span>
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span8">»</span>  
                <span class="sr-only" xid="span9">Next</span>
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dataFilter"
    filterData="mainData" style="left:28px;top:290px;"/>
</div>
