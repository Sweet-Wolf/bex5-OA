<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:75px;top:219px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dSchedule" concept="OA_SD_ScheduleEsp" limit="1" onBeforeSave="dScheduleBeforeSave"> 
      <reader xid="default1" action="/OA/schedule/logic/action/queryOA_SD_ScheduleEspAction"/>  
      <writer xid="default2" action="/OA/schedule/logic/action/saveOA_SD_ScheduleEspAction"/>  
      <creator xid="default3" action="/OA/schedule/logic/action/createOA_SD_ScheduleEspAction"/>  
      <rule xid="rule1"> 
        <readonly>
        	<expr>!(($data ? val("fCreatePsnID") : '' ) == $model.getContext().getCurrentPersonID())</expr>
        </readonly>
        <col name="fTitle" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default8">true</expr>  
            <message xid="default9">日程主题不能为空</message> 
          </required> 
        </col>  
        <col name="fBeginDatePart" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default10">true</expr>  
            <message xid="default11">开始日期不能为空</message> 
          </required> 
        </col>  
        <col name="fBeginTimePart" xid="ruleCol3"> 
          <required xid="required3"> 
            <expr xid="default12">true</expr>  
            <message xid="default13">开始时间不能为空</message> 
          </required> 
        </col>  
        <col name="fEndDatePart" xid="ruleCol4"> 
          <required xid="required4"> 
            <expr xid="default14">true</expr>  
            <message xid="default15">结束日期不能为空</message> 
          </required>  
        </col>  
        <col name="fEndTimePart" xid="ruleCol5"> 
          <required xid="required5"> 
            <expr xid="default16">true</expr>  
            <message xid="default17">结束时间不能为空</message> 
          </required> 
        </col>  
        <col name="fExecutors" xid="ruleCol6"> 
          <readonly> 
            <expr>true</expr> 
          </readonly>  
          <required xid="required6"> 
            <expr xid="default17">true</expr>  
            <message xid="default18">执行人不能为空</message> 
          </required> 
        </col>
        <col name="fIsShared">
        	<required>
        		<expr>true</expr>
        		<message>必须选择是否公开</message>
        	</required>
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dExecutor" concept="OA_SD_Executor"> 
      <reader xid="default4" action="/OA/schedule/logic/action/querySDEXECUTORAction"/>  
      <writer xid="default5" action="/OA/schedule/logic/action/saveSDEXECUTORAction"/>  
      <creator xid="default6" action="/OA/schedule/logic/action/createSDEXECUTORAction"/>  
      <master xid="default23" data="dSchedule" relation="fSDMasterID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="TimePartData" idColumn="startTime"> 
      <column label="startTime" name="startTime" type="String" xid="xid1"/>  
      <column label="endTime" name="endTime" type="String" xid="xid2"/>  
      <data xid="default7">[{"startTime":"08:00","endTime":"08:00"},{"startTime":"08:30","endTime":"08:30"},{"startTime":"09:00","endTime":"09:00"},{"startTime":"09:30","endTime":"09:30"},{"startTime":"10:00","endTime":"10:00"},{"startTime":"10:30","endTime":"10:30"},{"startTime":"11:00","endTime":"11:00"},{"startTime":"11:30","endTime":"11:30"},{"startTime":"12:00","endTime":"12:00"},{"startTime":"12:30","endTime":"12:30"},{"startTime":"13:00","endTime":"13:00"},{"startTime":"13:30","endTime":"13:30"},{"startTime":"14:00","endTime":"14:00"},{"startTime":"14:30","endTime":"14:30"},{"startTime":"15:00","endTime":"15:00"},{"startTime":"15:30","endTime":"15:30"},{"startTime":"16:00","endTime":"16:00"},{"startTime":"16:30","endTime":"16:30"},{"startTime":"17:00","endTime":"17:00"},{"startTime":"17:30","endTime":"17:30"},{"startTime":"18:00","endTime":"18:00"},{"startTime":"18:30","endTime":"18:30"},{"startTime":"19:00","endTime":"19:00"},{"startTime":"19:30","endTime":"19:30"},{"startTime":"20:00","endTime":"20:00"},{"startTime":"20:30","endTime":"20:30"},{"startTime":"21:00","endTime":"21:00"},{"startTime":"21:30","endTime":"21:30"},{"startTime":"22:00","endTime":"22:00"},{"startTime":"22:30","endTime":"22:30"},{"startTime":"23:00","endTime":"23:00"},{"startTime":"23:30","endTime":"23:30"},{"startTime":"00:00","endTime":"00:00"},{"startTime":"00:30","endTime":"00:30"},{"startTime":"01:00","endTime":"01:00"},{"startTime":"01:30","endTime":"01:30"},{"startTime":"02:00","endTime":"02:00"},{"startTime":"02:30","endTime":"02:30"},{"startTime":"03:00","endTime":"03:00"},{"startTime":"03:30","endTime":"03:30"},{"startTime":"04:00","endTime":"04:00"},{"startTime":"04:30","endTime":"04:30"},{"startTime":"05:00","endTime":"05:00"},{"startTime":"05:30","endTime":"05:30"},{"startTime":"06:00","endTime":"06:00"},{"startTime":"06:30","endTime":"06:30"},{"startTime":"07:00","endTime":"07:00"},{"startTime":"07:30","endTime":"07:30"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="shareData" idColumn="value"> 
      <column label="value" name="value" type="String" xid="xid3"/>  
      <column label="label" name="label" type="String" xid="xid4"/>  
      <data xid="default21">[{"value":"1","label":"是"},{"value":"0","label":"否"}]</data> 
    </div> 
  </div>  
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="toolBar1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dSchedule.save'}" xid="button1"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dSchedule.refresh'}" xid="button2"> 
        <i xid="i2"/>  
        <span xid="span2"/> 
      </a> 
    </div>  
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit1"> 
          <label class="x-label" xid="label1" style="width:100px;"><![CDATA[日程主题]]></label>  
          <div class="x-edit" xid="div1"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input1" bind-ref="dSchedule.ref('fTitle')"/> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit2"> 
          <label class="x-label" xid="label2" style="width:100px;"><![CDATA[开始日期]]></label>  
          <div class="x-edit" xid="div2"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="fBeginDatePart" bind-ref="dSchedule.ref('fBeginDatePart')"/> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit3"> 
          <label class="x-label" xid="label3" style="width:100px;"><![CDATA[开始时间]]></label>  
          <div class="x-edit" xid="div3"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
              xid="fBeginTimePart" bind-ref="dSchedule.ref('fBeginTimePart')" bind-labelRef="dSchedule.ref('fBeginTimePart')"> 
              <option xid="option1" data="TimePartData" value="startTime" label="startTime"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit4"> 
          <label class="x-label" xid="label4" style="width:100px;"><![CDATA[结束日期]]></label>  
          <div class="x-edit" xid="div4"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="fEndDatePart" bind-ref="dSchedule.ref('fEndDatePart')"/> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit5"> 
          <label class="x-label" xid="label5" style="width:100px;"><![CDATA[结束时间]]></label>  
          <div class="x-edit" xid="div5"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
              xid="gridSelect2" bind-ref="dSchedule.ref('fEndTimePart')" bind-labelRef="dSchedule.ref('fEndTimePart')"> 
              <option xid="option2" data="TimePartData" value="endTime" label="endTime"/> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit8"> 
          <label class="x-label" xid="label9" style="width:100px;"><![CDATA[是否公开]]></label>  
          <div class="x-edit" xid="div10"> 
            <span component="$UI/system/components/justep/select/radioGroup"
              class="x-radio-group" xid="radioGroup1" bind-ref="dSchedule.ref('fIsShared')"
              bind-itemset="shareData" bind-itemsetValue="ref('value')" bind-itemsetLabel="ref('label')"/> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit6"> 
          <label class="x-label" xid="label6" style="width:100px;"><![CDATA[日程说明]]></label>  
          <div class="x-edit" xid="div6"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control" xid="textarea1" bind-ref="dSchedule.ref('fContent')"/> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit7"> 
          <label class="x-label" xid="label7" style="width:100px;"><![CDATA[执行人]]></label>  
          <div class="x-edit" xid="div7"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control" xid="fExecutors" bind-ref="dSchedule.ref('fExecutors')"/> 
          </div>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button4" icon="icon-search" onClick="addExecutors"> 
            <i xid="i4" class="icon-search"/>  
            <span xid="span4"/> 
          </a> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="orgDlgSingleDept" width="60%" height="55%" status="normal" showTitle="true" title="领导日程：选择人员" src="$UI/OA/schedule/process/especialPersonList/especialPersonListDialog.w" onReceive="orgDlgSingleDeptReceive"></span></div>
