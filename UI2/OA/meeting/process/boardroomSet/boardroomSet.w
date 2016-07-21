<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="false" autoLoad="true" concept="OA_MT_Boardroom" columns="" onSaveCommit="saveCommit"
      limit="20"> 
      <reader action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/>  
      <writer action="/OA/meeting/logic/action/saveMTBOARDROOMAction"/>  
      <creator action="/OA/meeting/logic/action/createMTBOARDROOMAction"/> 
    </div> 
  </div>  
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="mainData" filterCols="fUseStatusName,fCode,fName,fType,fHoldNum,fUse,fFloor,fAddress,fRemark"
        class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/> 
      </div>  
      <a component="$UI/system/components/justep/button/button" label=" 新建"
        class="btn btn-link btn-icon-left" icon="icon-plus" xid="newBtn" onClick="newBtnClick"> 
        <i class="icon-plus"/>  
        <span>新建</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="保存" xid="saveBtn" onClick="{&quot;operation&quot;:&quot;mainData.save&quot;}"> 
        <i xid="i3"/>  
        <span xid="label7">保存</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="删除" xid="deleteBtn" onClick="{&quot;operation&quot;:&quot;mainData.delete&quot;}"> 
        <i xid="i4"/>  
        <span xid="span7">删除</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick="{&quot;operation&quot;:&quot;mainData.refresh&quot;}" label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}"> 
        <i xid="i5" class="icon-android-search"/>  
        <span xid="span8">查询</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        xid="btnStartUse" icon="img:$UI/OA/common/images/start_use.gif|$UI/OA/common/images/un_start_use.gif"
        label="启用" onClick="btnStartUseClick" bind-disable=" $model.mainData.val(&quot;fUseStatus&quot;) == '1'"> 
        <i xid="i1"/>  
        <img src="$UI/OA/common/images/start_use.gif" xid="image1"/>  
        <span xid="span10">启用</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        xid="btnAllUse" icon="img:$UI/OA/common/images/all_use.gif|$UI/OA/common/images/all_use.gif"
        label="全部启用" onClick="btnAllUseClick"> 
        <i xid="i6"/>  
        <img src="$UI/OA/common/images/all_use.gif" xid="image3"/>  
        <span xid="span11">全部启用</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        xid="btnStopUse" icon="img:$UI/OA/common/images/stop_use.gif|$UI/OA/common/images/un_stop_use.gif"
        label="停用" onClick="btnStopUseClick" bind-disable=" !($model.mainData.val(&quot;fUseStatus&quot;) == '1')"> 
        <i xid="i7"/>  
        <img src="$UI/OA/common/images/stop_use.gif" xid="image2"/>  
        <span xid="span12">停用</span> 
      </a> 
    </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
      rowActiveClass="active" class="table table-hover hidder-xs" xid="list"
      data="mainData" showRowNumber="true" responsive="true" onCellRender="listCellRender" onRowClick="listRowClick"> 
      <columns xid="columns1"> 
        <column name="fCode" xid="column1"/>  
        <column name="fName" xid="column2" className="toDetail"/>  
        <column name="fType" xid="column3"/>  
        <column name="fHoldNum" xid="column4"/>  
        <column name="fUse" xid="column5"/>  
        <column name="fFloor" xid="column6"/>  
        <column name="fAddress" xid="column7"/>  
        <column name="fRemark" xid="column8"/>  
        <column name="fUseStatusName" xid="column9"/> 
      </columns> 
    </div> 
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;" filterCols="fType,fHoldNum,fUse,fFloor,fUseStatusName,fAddress,fCode,fName,fRemark"/>  
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
