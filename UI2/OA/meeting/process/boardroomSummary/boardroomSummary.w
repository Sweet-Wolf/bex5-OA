<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:182px;top:273px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dSummary"
      concept="OA_MT_Summary" orderBy="fCreateTime desc" autoLoad="true"> 
      <reader xid="default1" action="/OA/meeting/logic/action/queryMTSummaryAction"/>  
      <writer xid="default2" action="/OA/meeting/logic/action/saveMTSummaryAction"/>  
      <creator xid="default3" action="/OA/meeting/logic/action/createMTSummaryAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dIssue"
      concept="OA_MT_SummaryIssue"> 
      <reader xid="default5" action="/OA/meeting/logic/action/queryMTSummaryIssueAction"/>  
      <writer xid="default6" action="/OA/meeting/logic/action/saveMTSummaryIssueAction"/>  
      <creator xid="default7" action="/OA/meeting/logic/action/createMTSummaryIssueAction"/>  
      <master xid="default8" data="dSummary" relation="fMasterID"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dArrange"
      concept="OA_MT_RoomArrange" limit="1"> 
      <reader xid="default9" action="/OA/meeting/logic/action/queryMTRoomArrangeAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dBoardroom"
      concept="OA_MT_Boardroom"> 
      <reader xid="default10" action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/>  
      <writer xid="default11"/>  
      <creator xid="default12"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="summaryDetail"
      concept="OA_MT_Summary" limit="1"> 
      <reader xid="default13" action="/OA/meeting/logic/action/queryMTSummaryAction"/>  
      <writer xid="default14" action="/OA/meeting/logic/action/saveMTSummaryAction"/>  
      <creator xid="default15" action="/OA/meeting/logic/action/createMTSummaryAction"/>
    </div> 
  </div>
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="dSummary" filterCols="fMeetName,fBoardroom,fUseDeptName,fUsePsnName"
        class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/>
      </div>  
      <a component="$UI/system/components/justep/button/button" label=" 新建"
        class="btn btn-link btn-icon-left" icon="icon-plus" xid="newBtn" onClick="newBtnClick"> 
        <i class="icon-plus" xid="i1"/>  
        <span xid="span1">新建</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="保存" xid="saveBtn" onClick="{&quot;operation&quot;:&quot;dSummary.save&quot;}"> 
        <i xid="i3"/>  
        <span xid="label7">保存</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="删除" xid="deleteBtn" onClick="{&quot;operation&quot;:&quot;dSummary.delete&quot;}"> 
        <i xid="i4"/>  
        <span xid="span7">删除</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick="{&quot;operation&quot;:&quot;dSummary.refresh&quot;}" label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}"> 
        <i xid="i5" class="icon-android-search"/>  
        <span xid="span8">查询</span>
      </a>  
      <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter"
        xid="gridFilter1" filterCol="fBoardroomID" filterData="dSummary"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
          xid="gridSelect1" defaultLabel="'全部'"> 
          <option xid="option1" data="dBoardroom" value="OA_MT_Boardroom" label="fName"/>
        </div> 
      </div>  
      <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter"
        class="x-control" useMyself="true" defaultValue="_myself_" autoRefresh="true"
        filterData="dSummary" orgFIDCol="fCreatePsnFID" personIDCol="fCreatePsnID"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
          xid="orgSelectPC1" manageCodes="boardroomManagement" multiselect="true"
          style="width:140px;"> 
          <option xid="option3"> 
            <columns xid="columns2"> 
              <column name="sName" xid="column9"/>
            </columns> 
          </option> 
        </div> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="btnRange" onClick="btnRangeClick" label="发布"> 
        <i xid="i6"/>  
        <span xid="span3">发布</span>
      </a>
    </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
      rowActiveClass="active" class="table table-hover hidder-xs" xid="dataTablesSummary"
      data="dSummary" responsive="true" onRowDblClick="dataTablesSummaryRowDblClick"> 
      <columns xid="columns1"> 
        <column name="fIssueStateName" xid="column1" label="状态"/>  
        <column name="fMeetName" xid="column2" label="会议主题"/>  
        <column name="fBeginTime" xid="column3" label="开始时间"/>  
        <column name="fEndTime" xid="column4" label="结束时间"/>  
        <column name="fBoardroom" xid="column5" label="会议室"/>  
        <column name="fUseDeptName" xid="column6" label="使用部门"/>  
        <column name="fUsePsnName" xid="column7" label="使用人"/>  
        <column name="fRemark" xid="column8" label="备注"/>
      </columns> 
    </div> 
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="dSummary" filterCols="fIssueStateName,fMeetName,fBeginTime,fEndTime,fBoardroom,fUseDeptName,fUsePsnName,fRemark"/>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="wDlgRangeIssue" multiSelection="true" onReceive="wDlgRangeIssueReceive"/>
</div>
