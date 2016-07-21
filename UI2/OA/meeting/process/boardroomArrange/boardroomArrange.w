<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dList"
      directDelete="true" autoLoad="true" concept="OA_MT_RoomArrange" limit="20"> 
      <reader action="/OA/meeting/logic/action/queryMTRoomArrangeAction"/>  
      <writer action="/OA/meeting/logic/action/saveMTRoomArrangeAction"/>  
      <creator action="/OA/meeting/logic/action/createMTRoomArrangeAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dBoardroom"
      concept="OA_MT_Boardroom"> 
      <reader xid="default1" action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dStatus" idColumn="label"> 
      <column label="label" name="label" type="String" xid="default6"/>  
      <column label="value" name="value" type="String" xid="default7"/>  
      <data xid="default8">[{"label":"已安排","value":"1"},{"label":"已取消","value":"0"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dFilter" idColumn="roomIDs"> 
      <column name="roomIDs" label="roomIDs" type="String" xid="default9"/>  
      <column name="status" label="status" type="String" xid="default10"/>  
      <column name="keyword" label="keyword" type="String" xid="default11"/>  
      <data xid="default12">[{"status":"1"}]</data>
    </div> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="dList" filterCols="fEffect,fBoardroom,fMeetName,fUseOrgName,fUsePsnName,fBeginTime,fEndTime,fRemark"
        class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick="{&quot;operation&quot;:&quot;dList.refresh&quot;}" label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}"> 
        <i xid="i5" class="icon-android-search"/>  
        <span xid="span8">查询</span> 
      </a>  
      <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter"
        xid="gridFilter" filterData="dList" filterCol="fBoardroomID" > 
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
          xid="gridSelect3" defaultLabel="'选择会议室'" multiselect="true"> 
          <option xid="option3" data="dBoardroom" value="OA_MT_Boardroom" label="fName"/>
        </div> 
      </div>  
      <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter"
        xid="statusFilter" filterData="dList" filterCol="fEffect" defaultValue="'1'"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
          xid="gridSelect4" defaultLabel="'选择状态'" multiselect="true"> 
          <option xid="option4" data="dStatus" value="value" label="label"/>
        </div> 
      </div>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="安排" xid="btnArrange" onClick="btnArrangeClick"> 
        <i xid="i1"/>  
        <span xid="span7">安排</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="调配" xid="btnRearrange" onClick="btnRearrangeClick"> 
        <i xid="i3"/>  
        <span xid="span10">调配</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="取消" xid="btnCancel" onClick="btnCancelClick"> 
        <i xid="i4"/>  
        <span xid="span11">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="安排查询" xid="btnSearch" onClick="btnSearchClick"> 
        <i xid="i6"/>  
        <span xid="span12">安排查询</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="dList" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
    rowActiveClass="active" class="table table-hover table-striped hidder-xs" xid="mainTables"
    data="dList" responsive="true" onCellRender="dataTables1CellRender" onRowClick="mainTablesRowClick"> 
    <columns xid="columns1"> 
      <column name="fEffect" xid="column1" label="状态"/>  
      <column name="fBoardroom" xid="column2" label="会议室" className="toDetail"/>  
      <column name="fMeetName" xid="column3" label="会议主题"/>  
      <column name="fUseOrgName" xid="column4" label="使用部门"/>  
      <column name="fUsePsnName" xid="column5" label="使用人"/>  
      <column name="fBeginTime" xid="column6" label="开始时间"/>  
      <column name="fEndTime" xid="column7" label="结束时间"/>  
      <column name="fRemark" xid="column8" label="备注"/> 
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="dList"> 
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgArrangeInfo"
    src="$UI/OA/meeting/process/boardroomArrangeDialog/arrangeDetail.w" status="normal"
    title="会议室安排" showTitle="true" onReceive="dlgArrangeInfoReceive" width="60%" height="70%" forceRefreshOnOpen="true"/>
</div>
