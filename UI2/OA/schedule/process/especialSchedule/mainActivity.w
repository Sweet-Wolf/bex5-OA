<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="especialData" concept="OA_SD_ScheduleEsp"> 
      <reader xid="default1" action="/OA/schedule/logic/action/queryOA_SD_ScheduleEspAction"/>  
      <writer xid="default2" action="/OA/schedule/logic/action/saveOA_SD_ScheduleEspAction"/>  
      <creator xid="default3" action="/OA/schedule/logic/action/createOA_SD_ScheduleEspAction"/> 
    </div> 
  </div>  
  <div class="container-fluid" xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="toolBar1"> 
      <div class="pull-right" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="especialData" filterCols="OA_SD_ScheduleEsp,fTitle,fBeginTime,fEndTime,fContent,fExecutors,fIsShared,fIsRemind,fRemindDatePart,fRemindTimePart,fRemindTime,fCreatePsnID,fCreatePsnName,fCreateTime,fCreateURL">
   
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input>
   </div><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="newData" xid="button3" icon="icon-plus" label="新增"> 
        <i xid="i3" class="icon-plus"/>  
        <span xid="span9">新增</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'especialData.delete'}" xid="button2"> 
        <i xid="i2"/>  
        <span xid="span8"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'especialData.save'}" xid="button1"> 
        <i xid="i1"/>  
        <span xid="span7"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'especialData.refresh'}" xid="button4"> 
        <i xid="i4"/>  
        <span xid="span10"/> 
      </a> 
    </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1"
      data="especialData" onRowDblClick="dataTables1RowDblClick"> 
      <columns xid="columns1"> 
        <column name="fTitle" xid="column1" label="主题"/>  
        <column name="fBeginTime" xid="column2" label="开始时间"/>  
        <column name="fEndTime" xid="column3" label="结束时间"/>  
        <column name="fContent" xid="column4" label="内容"/>  
        <column name="fExecutors" xid="column5" label="人员"/>  
        <column name="fCreatePsnName" xid="column6" label="记录人"/>  
        <column name="fCreateTime" xid="column7" label="安排时间"/> 
      </columns> 
    </div>  
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
      xid="pagerBar1" data="especialData"> 
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
</div>
