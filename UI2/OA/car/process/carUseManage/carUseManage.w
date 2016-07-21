<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:204px;top:225px;">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_CA_CarManageArrange" limit="10" autoNew="false" orderBy="fApplyDate desc" confirmRefresh="false"> 
      <reader action="/OA/car/logic/action/queryCACarManageArrangeDetailAction"/>  
      <writer action="/OA/car/logic/action/saveCACarManageArrangeAction"/>  
      <creator action="/OA/car/logic/action/createCACarManageArrangeAction"/>  
    <calculateRelation relation="carUseNO" xid="calculateRelation1" type="Integer"></calculateRelation>
  <rule xid="rule8">
   <col name="fEffect" xid="ruleCol13">
    <calculate xid="calculate13">
     <expr xid="default17"><![CDATA[val("fEffect")==0?"已取消":"已安排"]]></expr></calculate> </col> 
   <col name="carUseNO" xid="ruleCol14">
    <calculate xid="calculate14">
     <expr xid="default18">$row.index()+1</expr></calculate> </col> </rule></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dCarUseStatus" idColumn="value"><column label="label" name="label" type="String" xid="xid1"></column>
  <column label="value" name="value" type="String" xid="xid2"></column>
  <data xid="default5">[{&quot;label&quot;:&quot;已安排&quot;,&quot;value&quot;:&quot;1&quot;},{&quot;label&quot;:&quot;已取消&quot;,&quot;value&quot;:&quot;0&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dCarCode" concept="OA_CA_CarBasicInfo" limit="-1"><reader xid="default6" action="/OA/car/logic/action/queryCACarDriverInfoAction"></reader>
  <writer xid="default7"></writer>
  <creator xid="default8"></creator></div></div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="bar"> 
    <a component="$UI/system/components/justep/button/button" label=" 新建"
      class="btn btn-link btn-icon-left" icon="icon-plus" onClick="addBtn"
      xid="newBtn"> 
      <i class="icon-plus"/>  
      <span>新建</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="编辑" xid="editBtn" icon="icon-edit" onClick="editBtnClick"> 
      <i xid="i1" class="icon-edit"/>  
      <span xid="span1">编辑</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="删除" xid="deleteBtn" onClick='{operation:"mainData.delete"}'> 
      <i xid="i4"/>  
      <span xid="span7">删除</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" onClick='{operation:"mainData.refresh"}' label="刷新"> 
      <i xid="i2"/>  
      <span xid="span2">刷新</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="查询" xid="filterBtn" icon="icon-android-search" onClick='{operation:"filter.menu"}'> 
      <i xid="i5" class="icon-android-search"/>  
      <span xid="span8">查询</span> 
    </a>
    <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter1" filterData="mainData" filterCol="fEffect" defaultValue="'1'">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" defaultLabel="'已安排'" multiselect="true">
    <option xid="option1" data="dCarUseStatus" value="value" label="label"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilterCode" filterData="mainData" filterCol="fCode">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" defaultLabel="'选择车牌号'" multiselect="true">
    <option xid="option2" data="dCarCode" value="fCode" label="fCode"></option></div> </div><div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter"
      filterData="mainData" filterCols="fCarDriverName,fCode,fName,fCarKindName,fEffect,fApplyDeptName,fApplyPsnName,fBeginTime,fEndTime" class="pull-right"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="取消安排" xid="btnCancel" icon="icon-android-search" onClick='btnCancelDOMActivate'>
   <i xid="i3" class="icon-android-search"></i>
   <span xid="span11">取消安排</span></a></div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="filter"
    filterData="mainData"/>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover table-striped" xid="list"
    data="mainData" onRowDblClick="editBtnClick" onCellRender="listCellRender" onRowClick="listRowClick"> 
    <columns xid="column">
      <column name="carUseNO" xid="column1" label="排序"></column><column name="fEffect" label="状态" /><column name="fCarDriverName" label="司机"/>
      <column name="fCode" label="车牌号" className="toDetail"/>
      <column name="fName" label="品牌"/>
      <column name="fCarKindName" label="车辆类型"/>
      
      <column name="fApplyDeptName" label="申请部门"/>
      <column name="fApplyPsnName" label="申请人员"/>
      <column name="fBeginTime" label="开始时间"/>
      <column name="fEndTime" label="结束时间"/>
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="mainData"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span3">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default1">10</option>  
              <option value="20" xid="default2">20</option>  
              <option value="50" xid="default3">50</option>  
              <option value="100" xid="default4">100</option>
            </select>  
            <span xid="span4">条</span>
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
                <span aria-hidden="true" xid="span5">«</span>  
                <span class="sr-only" xid="span6">Previous</span>
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span9">»</span>  
                <span class="sr-only" xid="span10">Next</span>
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    title="详细" status="normal" showTitle="true" height="90%" width="90%" src="carUseManageArrange.w"
    onReceive="windowDialogReceive" style="left:104px;top:308px;"/>
</div>