<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_OSC_BaseInfo" columns="" onSaveCommit="saveCommit"
      limit="20" orderBy="fCreateTime desc"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCBaseInfoAction"/>  
      <writer action="/OA/officeSupplyConsumables/logic/action/saveOSCBaseInfoAction"/>  
      <creator action="/OA/officeSupplyConsumables/logic/action/createOSCBaseInfoAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <a component="$UI/system/components/justep/button/button" label=" 新建"
        class="btn btn-link btn-icon-left" icon="icon-plus" xid="newBtn" onClick="newBtnClick"> 
        <i class="icon-plus"/>  
        <span>新建</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="编辑" xid="editBtn" icon="icon-edit" onClick="editBtnClick"> 
        <i xid="i1" class="icon-edit"/>  
        <span xid="span1">编辑</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="删除" xid="deleteBtn" onClick='{"operation":"mainData.delete"}'> 
        <i xid="i4"/>  
        <span xid="span7">删除</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick='{"operation":"mainData.refresh"}' label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}"> 
        <i xid="i5" class="icon-android-search"/>  
        <span xid="span8">查询</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="启用" xid="trgStartUse" icon="icon-ios7-play" onClick="trgStartUseClick"> 
        <i xid="i8" class="icon-ios7-play"/>  
        <span xid="span12">启用</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="全部启用" xid="trgAllUse" icon="icon-ios7-skipforward" onClick="trgAllUseClick"> 
        <i xid="i9" class="icon-ios7-skipforward"/>  
        <span xid="span13">全部启用</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="停用" xid="trgStopUse" icon="icon-ios7-pause" onClick="trgStopUseClick"> 
        <i xid="i10" class="icon-ios7-pause"/>  
        <span xid="span14">停用</span> 
      </a>  
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="mainData" filterCols="fCode,fName,fDescription,fSequence,fUseStatusName,fCreateOgnName,fCreateDeptName,fCreatePsnName,fCreateTime,fUpdatePsnName,fUpdateTime"
        class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table table-hover table-striped" xid="dataTables"
      data="mainData"> 
      <columns xid="columns1"> 
        <column name="fUseStatusName" label="启用标识" xid="column8"/>  
        <column name="fCode" xid="column1" label="编码"/>  
        <column name="fName" xid="column2" label="名称"/>  
        <column name="fSpecType" xid="column3" label="规格型号"/>  
        <column name="fPrice" xid="column4" label="单价"/>  
        <column name="fKindName" xid="column5" label="类别"/>  
        <column name="fUnitName" xid="column6" label="单位"/>  
        <column name="fStock" xid="column7" label="库存数量"/>  
        <column name="fDescription" xid="column9" label="描述"/>  
        <column name="fCreateDeptName" xid="column10" label="提交部门"/>  
        <column name="fCreatePsnName" xid="column11" label="提交人"/>  
        <column name="fCreateTime" xid="column12" label="提交时间"/> 
      </columns> 
    </div>
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;" filterCols="fCode,fName,fCreatePsnName"/>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="mainData"> 
    <div class="row" xid="div"> 
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    style="left:121px;top:351px;" src="$UI/OA/officeSupplyConsumables/process/officeSupplyBaseInfo/baseInfoDailog.w"
    title="详细" onReceive="windowDialogReceive" height="80%" status="normal" showTitle="true" width="80%"/>
</div>
