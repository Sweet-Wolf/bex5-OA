<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:318px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_Pub_BaseCode" columns=""
      onSaveCommit="saveCommit" limit="20"> 
      <reader action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <writer action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"/>  
      <creator action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"/>  
      <calculateRelation relation="calcCheckBox"/> 
    </div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="statusData" idColumn="statusValue"><column label="col0" name="statusValue" type="Integer" xid="default1"></column>
  <column label="col1" name="statusName" type="String" xid="default6"></column>
  <data xid="default7">[{&quot;statusValue&quot;:0,&quot;statusName&quot;:&quot;未启用&quot;},{&quot;statusValue&quot;:1,&quot;statusName&quot;:&quot;启用&quot;}]</data></div></div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline" xid="bar"> 
      <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="mainData" filterCols="fScope,fCode,fName,fDescription,fSequence,fUseStatusName" class="pull-right"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1" /> 
      </div><a component="$UI/system/components/justep/button/button" label=" 新建"
        class="btn btn-link btn-icon-left" icon="icon-plus" onClick="{&quot;operation&quot;:&quot;mainData.new&quot;, args:{index:'js:0'}}"
        xid="newBtn"> 
        <i class="icon-plus"/>  
        <span>新建</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="保存" xid="saveBtn" onClick="saveBtnClick" icon="glyphicon glyphicon-floppy-disk"> 
        <i xid="i3" class="glyphicon glyphicon-floppy-disk"/>  
        <span xid="label7">保存</span> 
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
       
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="启用" xid="startUseBtn" icon="icon-arrow-right-b" onClick="startUseBtnClick">
   <i xid="i1" class="icon-arrow-right-b"></i>
   <span xid="span10">启用</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="全部启用" xid="allUseBtn" icon="icon-arrow-right-b" onClick="allUseBtnClick">
   <i xid="i6" class="icon-arrow-right-b"></i>
   <span xid="span11">全部启用</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="停用" xid="stopUseBtn" icon="icon-ios7-pause" onClick="stopUseBtnClick">
   <i xid="i7" class="icon-ios7-pause"></i>
   <span xid="span12">停用</span></a></div>  
    <div component="$UI/system/components/justep/grid/grid" xid="mainGrid"
      data="mainData" width="100%" hiddenCaptionbar="true" height="auto" class="x-grid-no-bordered" directEdit="false"> 
      <columns xid="column"> 
        <column name="fUseStatusName" editable="false"> 
          </column><column name="fSequence" xid="column3" editable="true"><editor xid="editor1">
    <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="ref('fSequence')" xid="input2"></input></editor></column><column name="fCode" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fCode')"/> 
          </editor> 
        </column> 
        <column name="fName" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fName')"/> 
          </editor> 
        </column>
        <column name="fDescription" editable="true"> 
          <editor> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              bind-ref="ref('fDescription')"/> 
          </editor> 
        </column> 
        
      </columns> 
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
</div>