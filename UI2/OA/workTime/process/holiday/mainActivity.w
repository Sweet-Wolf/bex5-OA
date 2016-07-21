<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;" onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_WM_Holiday" columns=""
      onSaveCommit="saveCommit" limit="20" onValueChanged="mainDataValueChanged">
      <reader action="/OA/workTime/logic/action/queryOA_WM_HolidayAction"/>  
      <writer action="/OA/workTime/logic/action/saveOA_WM_HolidayAction"/>  
      <creator action="/OA/workTime/logic/action/createOA_WM_HolidayAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="leaveTypeData" idColumn="value"><column label="值" name="value" type="String" xid="xid1"></column>
  <column label="显示名称" name="label" type="String" xid="xid2"></column>
  <data xid="default1">[{&quot;value&quot;:&quot;1&quot;,&quot;label&quot;:&quot;法定假日&quot;},{&quot;value&quot;:&quot;2&quot;,&quot;label&quot;:&quot;正常上班&quot;},{&quot;value&quot;:&quot;3&quot;,&quot;label&quot;:&quot;休息日&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="stateData" idColumn="value"><column label="值" name="value" type="String" xid="xid3"></column>
  <column label="显示名称" name="label" type="String" xid="xid4"></column>
  <data xid="default6">[{&quot;value&quot;:&quot;1&quot;,&quot;label&quot;:&quot;休息&quot;},{&quot;value&quot;:&quot;2&quot;,&quot;label&quot;:&quot;上班&quot;}]</data></div></div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="mainData" filterCols="fName,fStateName,fLeaveTypeName"
        class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/> 
      </div>  
      <a component="$UI/system/components/justep/button/button" label=" 新建"
        class="btn btn-link btn-icon-left" icon="icon-plus" onClick="{&quot;operation&quot;:&quot;mainData.new&quot;, args:{index:'js:0'}}"
        xid="newBtn"> 
        <i class="icon-plus"/>  
        <span>新建</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="保存" xid="saveBtn" onClick='{"operation":"mainData.save"}'> 
        <i xid="i3"/>  
        <span xid="label7">保存</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="删除" xid="deleteBtn" onClick="deleteBtnClick"> 
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
    <a component="$UI/system/components/justep/button/button" class="btn btn-link" label="批量添加" xid="newsBtn" onClick="newsBtnClick">
   <i xid="i1"></i>
   <span xid="span10">批量添加</span></a></div>  
    <div component="$UI/system/components/justep/grid/grid" xid="mainGrid"
      data="mainData" width="100%" hiddenCaptionbar="true" height="auto" class="x-grid-no-bordered" multiselect="true" multiboxonly="false" showRowNumber="true"> 
      <columns xid="column"> 
        <column name="fDate" xid="column7" editable="true">
        	<editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fDate')" xid="fDate"/> 
          </editor>
        </column>
        <column name="fName" xid="column1" editable="true">
        	<editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fName')"/> 
          </editor>
        </column>
  
  
  
  
  <column name="fLeaveTypeName" xid="column6" editable="true">
  <editor> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="typeSelect" bind-ref="ref('fLeaveTypeID')" bind-labelRef="ref('fLeaveTypeName')" onUpdateValue="typeSelectUpdateValue">
   <option xid="option1" data="leaveTypeData" value="value" label="label"></option></div></editor>
  </column>
  
  <column name="fMultiple" xid="column8" editable="true">
  <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fTypeCode')"/> 
          </editor>
  </column>
  <column name="fStateName" xid="column3" editable="true">
  <editor> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="stateSelect" bind-ref="ref('fState')" bind-labelRef="ref('fStateName')" onUpdateValue="stateSelectUpdateValue">
   <option xid="option2" data="stateData" value="value" label="label"></option></div></editor>
  </column>
  <column name="fBrefExplain" xid="column2" editable="true">
  <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fTypeCode')"/> 
          </editor>
  </column>
  <column name="fYear" xid="column9" editable="false"></column>
  <column name="fCreatePsnName" xid="column4"></column><column name="fCreateTime" xid="column5"></column></columns> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;"/>  
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
<span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newsDialog" title='批量添加' status="normal" width="40%" height="55%" showTitle="true" onReceive="newsDialogReceive"></span></div>