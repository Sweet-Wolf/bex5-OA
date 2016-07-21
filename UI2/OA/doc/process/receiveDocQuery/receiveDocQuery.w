<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;"
    onModelConstructDone="modelModelConstructDone" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDoc" directDelete="true"
      autoLoad="true" concept="OA_DC_Doc" columns="" onSaveCommit="saveCommit" limit="20"> 
      <reader action="/OA/doc/logic/action/queryReadDocAction"/>  
      <writer action="/OA/doc/logic/action/saveOA_DC_DocAction"/>  
      <creator action="/OA/doc/logic/action/createOA_DC_DocAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="selectStatus" idColumn="id"><column label="id" name="id" type="String" xid="default1"></column>
  <column label="状态" name="status" type="String" xid="default6"></column>
  <data xid="default7">[{&quot;id&quot;:&quot;1&quot;,&quot;status&quot;:&quot;编辑中&quot;},{&quot;id&quot;:&quot;2&quot;,&quot;status&quot;:&quot;处理中&quot;},{&quot;id&quot;:&quot;3&quot;,&quot;status&quot;:&quot;已完成&quot;},{&quot;id&quot;:&quot;4&quot;,&quot;status&quot;:&quot;已终止&quot;}]</data></div>
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="bar"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="dDoc" filterCols="fReceiveOgnIDs,fBizStateName,fDocTypeName,fTitle,fDocNumber,fDocExigenceLevelName,fDocSecretLevelName,fIssueDate,fCreateDeptName,fCreatePsnName,fCreateTime"
        class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/> 
      </div>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="refreshBtn" onClick='{"operation":"dDoc.refresh"}' label="刷新"> 
        <i xid="i2"/>  
        <span xid="span2">刷新</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="查询" xid="filterBtn" icon="icon-android-search" onClick="{operation:'bizFilter.menu'}"> 
        <i xid="i5" class="icon-android-search"/>  
        <span xid="span8">查询</span> 
      </a>  
      <div class="x-control" component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter1" filterData="dDoc" dateCol="fCreateTime" defaultValue="all">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" style="width:80px;">
    <option xid="option2"></option></div> </div>
  <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter" xid="gridFilter1" filterData="dDoc" filterCol="fBizStateName">
   <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect3" multiselect="true" clearButton="false" defaultLabel='"选择状态"'>
    <option xid="option3" data="selectStatus" value="status" label="status"></option></div> </div><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="btnDocReceive" label="公文接收" onClick="btnDocReceiveClick" bind-visible=" !($model.dDoc.getCount() == 0)"> 
        <i xid="i1"/>  
        <span xid="span7">公文接收</span>
      </a>
    </div>  
    <!--     <div component="$UI/system/components/justep/grid/grid" xid="mainGrid" -->  
    <!--       data="mainData" width="100%" hiddenCaptionbar="true" height="auto" class="x-grid-no-bordered">  -->  
    <!--       <columns xid="column">  -->  
    <!--         <column name="fReceiveOgnIDs" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fReceiveOgnIDs')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column> -->  
    <!--         <column name="fBizStateName" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fBizStateName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>  -->  
    <!--         <column name="fDocTypeName" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fDocTypeName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column> -->  
    <!--         <column name="fTitle" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fTitle')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>  -->  
    <!--         <column name="fDocNumber" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fDocNumber')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column> -->  
    <!--         <column name="fDocExigenceLevelName" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fDocExigenceLevelName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>  -->  
    <!--         <column name="fDocSecretLevelName" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fDocSecretLevelName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column> -->  
    <!--         <column name="fIssueDate" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fIssueDate')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>  -->  
    <!--         <column name="fCreateDeptName" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fCreateDeptName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column> -->  
    <!--         <column name="fCreatePsnName" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fCreatePsnName')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column>  -->  
    <!--         <column name="fCreateTime" editable="true">  -->  
    <!--           <editor>  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               bind-ref="ref('fCreateTime')"/>  -->  
    <!--           </editor>  -->  
    <!--         </column> -->  
    <!--       </columns>  -->  
    <!--     </div>  -->  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
      rowActiveClass="active" class="table table-hover table-striped hidder-xs" xid="mainTables"
      data="dDoc" responsive="true" onCellRender="mainTablesCellRender"> 
      <columns xid="columns1"> 
        <column name="fReceiveOgnIDs" xid="column1" label="收文"/>  
        <column name="fBizStateName" xid="column2" label="流程状态"/>  
        <column name="fDocTypeName" xid="column3" label="类型"/>  
        <column name="fTitle" xid="column4" label="文件标题"/>  
        <column name="fDocNumber" xid="column5" label="文号"/>  
        <column name="fDocExigenceLevelName" xid="column6" label="紧急程度"/>  
        <column name="fDocSecretLevelName" xid="column7" label="密级"/>  
        <column name="fIssueDate" xid="column8" label="收发文日期" format="yyyy-MM-dd"/>  
        <column name="fCreateDeptName" xid="column9" label="提交部门"/>  
        <column name="fCreatePsnName" xid="column10" label="提交人"/>  
        <column name="fCreateTime" xid="column11" label="提交时间" format="yyyy-MM-dd hh:mm"/> 
      </columns> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="dDoc" style="left:28px;top:290px;"/>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar" data="dDoc"> 
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
