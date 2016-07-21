<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:413px;top:56px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dShareRange" concept="OA_SD_ShareRange" onBeforeRefresh="dShareRangeBeforeRefresh"> 
      <reader xid="default1" action="/OA/schedule/logic/action/querySDSHARERANGEAction"/>  
      <writer xid="default2" action="/OA/schedule/logic/action/saveSDSHARERANGEAction"/>  
      <creator xid="default3" action="/OA/schedule/logic/action/createSDSHARERANGEAction"/>  
      <filter name="typeFilter" xid="filter1"><![CDATA[OA_SD_ShareRange.fShareType = 0]]></filter>
    </div> 
  </div>  
  <div class="container-fluid"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"
      style="height:100%;"> 
      <div class="col col-xs-3" xid="col1" style="height:100%;overflow: auto;"> 
        <div component="$UI/system/components/justep/org/orgTreePC" xid="orgTree"> 
          <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
            xid="treeData"/>  
          <div component="$UI/system/components/justep/grid/grid" appearance="tree"
            expandColumn="sName" useVirtualRoot="true" virtualRootLabel="组织机构" xid="grid1"
            width="100%" height="auto" class="x-grid-no-bordered" onIndexChanged="grid1IndexChanged"> 
            <columns xid="columns3"> 
              <column name="sName" xid="column11"/> 
            </columns> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-9 col-spliter-left" xid="col2" style="height:100%;"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter"
          xid="toolBar2"> 
          <div class="pull-right" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="dShareRange" filterCols="fShareToOrgKindID,fShareToOrgID,fShareToOrgName,fShareToOrgFID,fShareToOrgFName">
   
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input>
   </div><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="addShareToQuery" xid="button3" label="新增" icon="icon-plus" bind-enable=" $model.treeData.val(&quot;sOrgKindID&quot;) === 'psm'"> 
            <i xid="i3" class="icon-plus"/>  
            <span xid="span3">新增</span> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'dShareRange.save'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'dShareRange.delete'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'dShareRange.refresh'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a> 
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped"
          xid="dataTables1" data="dShareRange"> 
          <columns xid="columns2"> 
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
                  <span xid="span10">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select1"> 
                    <option value="10" xid="default9">10</option>  
                    <option value="20" xid="default10">20</option>  
                    <option value="50" xid="default11">50</option>  
                    <option value="100" xid="default12">100</option> 
                  </select>  
                  <span xid="span11">条</span> 
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
                      <span aria-hidden="true" xid="span12">«</span>  
                      <span class="sr-only" xid="span13">Previous</span> 
                    </a> 
                  </li>  
                  <li class="next" xid="li2"> 
                    <a href="#" xid="a2"> 
                      <span aria-hidden="true" xid="span14">»</span>  
                      <span class="sr-only" xid="span15">Next</span> 
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="dlgShareToPerson" title="选择共享范围" multiSelection="true" selectFilter="$row.val('sOrgKindID')==='psm'"
    onReceive="dlgShareToPersonReceive"/>
</div>
