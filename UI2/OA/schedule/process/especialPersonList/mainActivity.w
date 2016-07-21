<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:334px;top:174px;">
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="especialPersonData" concept="OA_SD_especialSchedulePerson" onSaveCommit="especialPersonDataSaveCommit" orderBy="fOrderNum desc">
      <reader xid="default1" action="/OA/schedule/logic/action/queryEspecialSchedulePersonAction"/>  
      <writer xid="default2" action="/OA/schedule/logic/action/saveEspecialSchedulePersonAction"/>  
      <creator xid="default3" action="/OA/schedule/logic/action/createEspecialSchedulePersonAction"/>  
      <rule xid="rule1"> 
        <col name="fExecutorID" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default4"/>  
            <message xid="default5"/>
          </required> 
        </col>  
        <col name="fExecutorName" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default6"/>  
            <message xid="default7"/>
          </required> 
        </col> 
      </rule>
    </div>
  </div>  
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="form1">
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="toolBar1">
      <div class="pull-right" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="especialPersonData" filterCols="fExecutorID,fExecutorName">
   
   <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input>
   </div><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="addEspecialPerson" xid="button3" label="新增" icon="icon-plus"> 
        <i xid="i3" class="icon-plus"/>  
        <span xid="span3">新增</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="deleteEspecialPerson" xid="button2" icon="icon-minus" label="删除"> 
        <i xid="i2" class="icon-minus"/>  
        <span xid="span2">删除</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'especialPersonData.save'}" xid="button1"> 
        <i xid="i1"/>  
        <span xid="span1"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'especialPersonData.refresh'}" xid="button4"> 
        <i xid="i4"/>  
        <span xid="span4"/>
      </a>
    </div>
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="especialPersonList" data="especialPersonData" multiSelect="true" showRowNumber="true">
   <columns xid="columns3"><column name="fExecutorName" xid="column3"></column></columns></div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1" data="especialPersonData">
   <div class="row" xid="div1">
    <div class="col-sm-3" xid="div2">
     <div class="x-pagerbar-length" xid="div3">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span5">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default8">10</option>
        <option value="20" xid="default9">20</option>
        <option value="50" xid="default10">50</option>
        <option value="100" xid="default11">100</option></select> 
       <span xid="span6">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div4">
     <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div6">
     <div class="x-pagerbar-pagination" xid="div7">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li1">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span7">«</span>
         <span class="sr-only" xid="span8">Previous</span></a> </li> 
       <li class="next" xid="li2">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span9">»</span>
         <span class="sr-only" xid="span10">Next</span></a> </li> </ul> </div> </div> </div> </div></div>
<span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="selectPersonDlg" title="选择领导人" onReceive="selectPersonDlgReceive" multiSelection="true"></span></div>
