<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad" style="height:auto;left:58px;top:198px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dShareRange" concept="OA_SD_ShareRange"> 
      <reader xid="default1" action="/OA/schedule/logic/action/querySDSHARERANGEAction"/>  
      <writer xid="default2" action="/OA/schedule/logic/action/saveSDSHARERANGEAction"/>  
      <creator xid="default3" action="/OA/schedule/logic/action/createSDSHARERANGEAction"/> 
    </div> 
  </div>  
  <div class="container-fluid" xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="toolBar1">
      <div class="pull-right" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter2" filterData="dShareRange" filterCols="fShareToOrgFID,fShareToOrgFName">
   
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input2"></input>
   </div><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="addShareToQuery" xid="button3" label="新增" icon="icon-plus"> 
        <i xid="i3" class="icon-plus"/>  
        <span xid="span9">新增</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dShareRange.save'}" xid="button1"> 
        <i xid="i1"/>  
        <span xid="span7"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dShareRange.delete'}" xid="button2"> 
        <i xid="i2"/>  
        <span xid="span8"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dShareRange.refresh'}" xid="button4"> 
        <i xid="i4"/>  
        <span xid="span10"/>
      </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'bizFilter.menu'}" xid="button5">
   <i xid="i5"></i>
   <span xid="span11"></span></a>
  </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1"
      data="dShareRange" showRowNumber="true"> 
      <columns xid="columns1">
        <column name="fShareToOrgFName" xid="column1" label="共享到组织全称"/>
      </columns> 
    </div>  
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
      xid="pagerBar1" data="dShareRange"> 
      <div class="row" xid="div1"> 
        <div class="col-sm-3" xid="div2"> 
          <div class="x-pagerbar-length" xid="div3"> 
            <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
              class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
              <span xid="span1">显示</span>  
              <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
                xid="select1"> 
                <option value="10" xid="default4">10</option>  
                <option value="20" xid="default5">20</option>  
                <option value="50" xid="default6">50</option>  
                <option value="100" xid="default7">100</option> 
              </select>  
              <span xid="span2">条</span> 
            </label> 
          </div> 
        </div>  
        <div class="col-sm-3" xid="div4"> 
          <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div> 
        </div>  
        <div class="col-sm-6" xid="div6"> 
          <div class="x-pagerbar-pagination" xid="div7"> 
            <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
              xid="pagination1"> 
              <li class="prev" xid="li1"> 
                <a href="#" xid="a1"> 
                  <span aria-hidden="true" xid="span3">«</span>  
                  <span class="sr-only" xid="span4">Previous</span> 
                </a> 
              </li>  
              <li class="next" xid="li2"> 
                <a href="#" xid="a2"> 
                  <span aria-hidden="true" xid="span5">»</span>  
                  <span class="sr-only" xid="span6">Next</span> 
                </a> 
              </li> 
            </ul> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
<span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter" filterData="dShareRange" filterCols="fShareToOrgFName"></span>
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="dlgShareRange" title="选择查看人" multiSelection="true" cascade="false" selectFilter="$row.val('sOrgKindID')==='psm'" onReceive="dlgShareRangeReceive"></span>
  </div>
