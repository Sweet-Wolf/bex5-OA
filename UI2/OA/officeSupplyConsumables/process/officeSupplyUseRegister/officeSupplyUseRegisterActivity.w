<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc;"
  xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:409px;top:63px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="OA_OSC_UseApplyM" columns="" autoNew="false"
      onSaveCommit="DataSaveCommit" orderBy="fBizState desc,fNO desc,fApplyDate desc"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyMAction"/>  
      <writer action="/OA/officeSupplyConsumables/logic/action/saveOSCUseApplyMAction"/>  
      <creator action="/OA/officeSupplyConsumables/logic/action/createOSCUseApplyMAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="detailData"
      directDelete="true" autoLoad="true" concept="OA_OSC_UseApplyD" columns="" autoNew="false"
      onValueChanged="detailDataValueChanged"> 
      <reader action="/OA/officeSupplyConsumables/logic/action/queryOSCUseApplyDAction"/>  
      <writer action="/OA/officeSupplyConsumables/logic/action/saveOSCUseApplyDAction"/>  
      <creator action="/OA/officeSupplyConsumables/logic/action/createOSCUseApplyDAction"/>  
      <master data="mainData" relation="fMasterID"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="mainData" style="left:28px;top:290px;" filterCols="fNO,fBizStateName,fApplyDeptName,fApplyPsnName"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="DialogList"
    style="left:116px;top:364px;" src="$UI/OA/officeSupplyConsumables/process/dialog/selectBaseInfoDialog/selectBaseInfo.w"
    title="用品信息" showTitle="true" height="80%" status="normal" forceRefreshOnOpen="true"> 
    <result concept="detailData" operation="edit" origin="mainData" xid="default2"> 
      <mapping from="OA_OSC_BaseInfo" to="fItemID" xid="default3"/>  
      <mapping from="fName" to="fName" xid="default4"/>  
      <mapping from="fCode" to="fCode" xid="default5"/>  
      <mapping from="fSpecType" to="fSpecType" xid="default6"/>  
      <mapping from="fKindID" to="fKindID" xid="default7"/>  
      <mapping from="fKindName" to="fKindName" xid="default8"/>  
      <mapping from="fUnitID" to="fUnitID" xid="default9"/>  
      <mapping from="fUnitName" to="fUnitName" xid="default10"/> 
    </result> 
  </span>  
  <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
    active="0" xid="contents"> 
    <div class="x-contents-content" xid="content1">
      <div class="tab-pane active" xid="ListTabContent"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
          xid="toolBar1"> 
          <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="mainData" filterCols="fBizStateName,fDemandDate,fApplyReason,fRemark,fApplyDeptName,fApplyPsnName,fApplyDate" class="pull-right"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input2" />
          </div><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="newBtn" label="新建" onClick="newBtnClick" icon="icon-plus"> 
            <i xid="i8" class="icon-plus"/>  
            <span xid="span8">新建</span>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            xid="saveBtn" onClick='{"operation":"mainData.save"}' label="保存"> 
            <i xid="i7"/>  
            <span xid="span7">保存</span>
          </a>  
            
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'mainData.refresh'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/>
          </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="btnProvideClick" xid="btnProvide" label="发放" icon="icon-thumbsup">
   <i xid="i2" class="icon-thumbsup"></i>
   <span xid="span2">发放</span></a></div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="true" rowActiveClass="active" class="table table-condensed table-hover"
          xid="mainTables" data="mainData" pagingType="simple_numbers" lengthMenu="10,25,50,100" onRowDblClick="mainTablesRowDblClick"> 
          <columns xid="column"> 
            <column name="fBizStateName" xid="column2" label="状态"/>  
            <column name="fNO" xid="column1"/>  
            <column name="fApplyDeptName" xid="column3"/>  
            <column name="fApplyPsnName" xid="column4"/>  
            <column name="fApplyDate" xid="column5"/>  
            <column name="fDemandDate" xid="column6"/>  
            <column name="fApplyReason" xid="column7" orderable="false"/>
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="pagerBar" data="mainData"> 
          <div class="row" xid="div1"> 
            <div class="col-sm-3" xid="div2"> 
              <div class="x-pagerbar-length" xid="div4"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                  <span xid="span15">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select1"> 
                    <option value="10" xid="default11">10</option>  
                    <option value="20" xid="default1">20</option>  
                    <option value="50" xid="default14">50</option>  
                    <option value="100" xid="default15">100</option>
                  </select>  
                  <span xid="span16">条</span>
                </label> 
              </div> 
            </div>  
            <div class="col-sm-3" xid="div5"> 
              <div class="x-pagerbar-info" xid="div6">当前显示1-10条，共16条</div>
            </div>  
            <div class="col-sm-6" xid="div7"> 
              <div class="x-pagerbar-pagination" xid="div8"> 
                <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                  xid="pagination1"> 
                  <li class="prev" xid="li1"> 
                    <a href="#" xid="a1"> 
                      <span aria-hidden="true" xid="span17">«</span>  
                      <span class="sr-only" xid="span18">Previous</span>
                    </a> 
                  </li>  
                  <li class="next" xid="li2"> 
                    <a href="#" xid="a3"> 
                      <span aria-hidden="true" xid="span19">»</span>  
                      <span class="sr-only" xid="span20">Next</span>
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
</div>
