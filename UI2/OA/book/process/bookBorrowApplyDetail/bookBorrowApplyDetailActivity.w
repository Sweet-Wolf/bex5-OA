<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xui="http://www.justep.com/xui" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:424px;top:82px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div autoLoad="false" autoNew="false" component="$UI/system/components/justep/data/bizData"
      concept="OA_BK_BookApplyM" limit="1" xid="dBookApplyM" xui:update-mode="merge"> 
      <reader action="/OA/book/logic/action/queryBKBookApplyMAction" xid="default1"/>  
      <writer action="/OA/book/logic/action/saveBKBookApplyMAction" xid="default2"/>  
      <creator action="/OA/book/logic/action/createBKBookApplyMAction" xid="default3"/>  
      <rule xid="rule11" xui:parent="dBookApplyM" xui:update-mode="insert"> 
        <readonly xid="readonly11"> 
          <expr xid="default11">$model.datareadOnly()</expr> 
        </readonly> 
      </rule> 
    </div>  
    <div autoLoad="true" component="$UI/system/components/justep/data/bizData"
      concept="OA_BK_BookApplyD" limit="-1" xid="dBookApplyD"> 
      <reader action="/OA/book/logic/action/queryBKBookApplyDAction" xid="default4"/>  
      <writer action="/OA/book/logic/action/saveBKBookApplyDAction" xid="default5"/>  
      <creator action="/OA/book/logic/action/createBookApplyDAction" xid="default6"/>  
      <calculateRelation relation="relation0" xid="calculateRelation1"/>  
      <master data="dBookApplyM" relation="fMasterID" xid="default18"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="taskData"
      concept="SA_Task"> 
      <reader xid="default7" action="/system/logic/action/queryTaskAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dBookApplyM" style="height:24px;width:24px;left:0px;top:200px;" autoStart="false"
    autoSave="false" autoClose="false" autoFilter="false"/>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="chartBtn" label="流程图" onClick="{operation:'process.showChart', args:{task: 'js:$model.taskData.getCurrentRowID()'}}"> 
        <i xid="i2"/>  
        <span xid="span2">流程图</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="processRecBtn" label="流程记录" onClick="{operation:'process.processRecord', args:{task: 'js:$model.taskData.getCurrentRowID()'}}"> 
        <i xid="i1"/>  
        <span xid="span1">流程记录</span> 
      </a> 
    </div>  
    <div xid="content"> 
      <h1 xid="title" class="text-center"><![CDATA[图书借阅申请]]></h1>  
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form"> 
         <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="default8"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit1"> 
              <label class="x-label" xid="fNOL" style="width:100px;"><![CDATA[申请编号]]></label>  
              <div class="x-edit" xid="div1"> 
                <output component="$UI/system/components/justep/output/output"
                  class="form-control" xid="code" bind-ref="dBookApplyM.ref('fNO')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit2"> 
              <label class="x-label" xid="orderDateL" style="width:100px;"><![CDATA[申请日期]]></label>  
              <div class="x-edit" xid="div2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="orderDate" bind-ref="dBookApplyM.ref('fApplyDate')" format="yyyy-MM-dd"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelEdit3"> 
              <label class="x-label" xid="fApplyDeptNameL" style="width:100px;"><![CDATA[申请部门]]></label>  
              <div class="x-edit" xid="div3"> 
                <output component="$UI/system/components/justep/output/output"
                  class="form-control" bind-ref="dBookApplyM.ref('fApplyDeptName')"
                  xid="fApplyDeptName"/> 
              </div> 
            </div> 
          </div> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit4"> 
              <label class="x-label" xid="ApplyPsnNameL" style="width:100px;"><![CDATA[申请人]]></label>  
              <div class="x-edit" xid="div1"> 
                <output component="$UI/system/components/justep/output/output" class="form-control" bind-ref="dBookApplyM.ref('fApplyPsnName')" xid="ApplyPsnName" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit5"> 
              <label class="x-label" xid="IntendStartDateL" style="width:100px;"><![CDATA[预计借阅时间]]></label>  
              <div class="x-edit" xid="div2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="dBookApplyM.ref('fIntendStartDate')" xid="IntendStartDate" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit6"> 
              <label class="x-label" xid="IntendEndDateL" style="width:100px;"><![CDATA[预计归还时间]]></label>  
              <div class="x-edit" xid="div3"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="dBookApplyM.ref('fIntendEndDate')" xid="IntendEndDate" />
              </div> 
            </div> 
          </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit4"> 
              <label class="x-label" xid="fRemarkL" style="width:100px;"><![CDATA[备注]]></label>  
              <div class="x-edit" xid="div1"> 
                <input component="$UI/system/components/justep/input/input" class="form-control" bind-ref="dBookApplyM.ref('fRemark')" xid="fRemark" style="height:85px;" /> 
              </div> 
            </div> 
          </div></div>  
        <div component="$UI/system/components/justep/controlGroup/controlGroup"
          class="x-control-group" title="图书信息" xid="productGroup" collapsible="true"> 
          <div class="x-control-group-title" xid="productTitle"> 
            <span xid="span7">title</span> 
          </div>  
          <div xid="productContent"> 
            <div component="$UI/system/components/justep/dataTables/dataTables"
              flexibleWidth="true" class="table  table-hover table-striped" xid="detailTable"
              data="dBookApplyD" pagingType="simple" rowActiveClass="active" showRowNumber="true"> 
              <columns xid="columns1"> 
                <column name="fBooksNumber" xid="column7"/>  
                <column name="fBooksName" xid="column8"/>  
                <column name="fBooksTypeName" xid="column9"/>  
                <column name="fAuthor" xid="column11"/>  
                <column name="fBookConcern" xid="column10"/>  
                <column name="fPrice" xid="column14"/>  
                <column name="fPageNum" xid="column12"/>  
                <column name="fRemark" xid="column13"/> 
              </columns> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
