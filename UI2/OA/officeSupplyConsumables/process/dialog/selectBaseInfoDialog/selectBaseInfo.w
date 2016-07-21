<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:71px;top:109px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="OA_OSC_BaseInfo" limit="10" autoLoad="true" onAfterRefresh="mainDataAfterRefresh"> 
      <reader xid="default1" action="/OA/officeSupplyConsumables/logic/action/queryOSCBaseInfoAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_OSC_BaseInfo.fUseStatus='1']]></filter> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter1" filterData="mainData" filterCols="fCode,fName,fSpecType,fKindName,fUnitName,fUseStatus,fDescription"> 
        <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
          xid="span3"> 
          <i class="icon-android-search" xid="i3"/> 
        </span>  
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input1"/>  
        <span class="input-group-addon x-smartFilter-clear" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))"
          bind-visible="$model.comp($element.parentElement).searchText.get() != ''"
          xid="span4"> 
          <i class="icon-close-circled" xid="i4"/> 
        </span> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="false"
        rowActiveClass="active" class="table table-hover hidder-xs" xid="dataTables"
        data="mainData" multiSelect="true" showRowNumber="false" ordering="false" lengthMenu="10" responsive="true" onRowChecked="dataTablesRowChecked"> 
        <columns xid="columns1"> 
          <column name="fCode" xid="column1"/>  
          <column name="fName" xid="column2"/>  
          <column name="fSpecType" xid="column3"/>  
          <column name="fPrice" xid="column4"/>  
          <column name="fKindName" xid="column5"/>  
          <column name="fUnitName" xid="column6"/>  
          <column name="fStock" xid="column7"/> 
        </columns> 
      </div>  
      <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
        xid="pagerBar1" data="mainData"> 
        <div class="row" xid="div1"> 
          <div class="col-sm-3" xid="div2"> 
            <div class="x-pagerbar-length" xid="div3"> 
              <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                class="x-pagerlimitselect" xid="pagerLimitSelect1" defaultValue="10"> 
                <span xid="span9">显示</span>  
                <select component="$UI/system/components/justep/select/select"
                  class="form-control input-sm" xid="select1"> 
                  <option value="10" xid="default2">10</option>  
                  <option value="20" xid="default3">20</option>  
                  <option value="50" xid="default4">50</option>  
                  <option value="100" xid="default5">100</option> 
                </select>  
                <span xid="span10">条</span> 
              </label> 
            </div> 
          </div>  
          <div class="col-sm-3" xid="div4"> 
            <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div> 
          </div>  
          <div class="col-sm-6" xid="div6"> 
            <div class="x-pagerbar-pagination" xid="div7"> 
              <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                xid="pagination2"> 
                <li class="prev" xid="li7"> 
                  <a href="#" xid="a7"> 
                    <span aria-hidden="true" xid="span11">«</span>  
                    <span class="sr-only" xid="span12">Previous</span> 
                  </a> 
                </li>  
                <li class="next" xid="li8"> 
                  <a href="#" xid="a8"> 
                    <span aria-hidden="true" xid="span13">»</span>  
                    <span class="sr-only" xid="span14">Next</span> 
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"windowReceiver.windowCancel"}'> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div> 
</div>
