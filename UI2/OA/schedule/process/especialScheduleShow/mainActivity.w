<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:365px;top:294px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="showData" concept="OA_v_especialSchedule"> 
      <reader xid="default1" action="/OA/schedule/logic/action/queryOA_v_especialScheduleAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="personData" concept="OA_SD_especialSchedulePerson"> 
      <reader xid="default2" action="/OA/schedule/logic/action/queryEspecialSchedulePersonAction"/>  
      <writer xid="default3" action="/OA/schedule/logic/action/saveEspecialSchedulePersonAction"/>  
      <creator xid="default4" action="/OA/schedule/logic/action/createEspecialSchedulePersonAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="weekOrMonthData" idColumn="fWeekOrMonth" limit="2"> 
      <column label="fWeekOrMonth" name="fWeekOrMonth" type="String" xid="xid1"/>  
      <column label="fWeekOrMonthCode" name="fWeekOrMonthCode" type="String" xid="xid2"/>  
      <data xid="default5">[{"fWeekOrMonth":"按周查看","fWeekOrMonthCode":"week"},{"fWeekOrMonth":"按月查看","fWeekOrMonthCode":"month"}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="tempData" idColumn="fDate0" onValueChanged="tempDataValueChanged"> 
      <column label="fDate0" name="fDate0" type="Date" xid="xid3"/>  
      <column label="fDate1" name="fDate1" type="String" xid="xid4"/>  
      <column label="fDate2" name="fDate2" type="String" xid="xid5"/>  
      <column label="fYear" name="fYear" type="String" xid="xid6"/>  
      <column label="fWeekNum" name="fWeekNum" type="String" xid="xid7"/>  
      <column label="fWeekOrMonth" name="fWeekOrMonth" type="String" xid="xid8"/>  
      <column label="fWeekOrMonthName" name="fWeekOrMonthName" type="String" xid="xid9"/>  
      <column label="fWeekOrMonthCode" name="fWeekOrMonthCode" type="String" xid="xid10"/>  
      <data xid="default6">[{}]</data> 
    </div> 
  </div>  
  <div class="container-fluid" xid="view"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
      <div class="col col-xs-3" xid="col1"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelInput2"> 
          <label class="x-label" xid="label2" style="width:100px;"><![CDATA[选择日期：]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input3" bind-ref="tempData.ref('fDate0')"/> 
        </div> 
      </div>  
      <div class="col col-xs-6 text-center" xid="col2"> 
<!--         <div component="$UI/system/components/justep/output/output" class="x-output" -->
<!--           xid="output2" bind-html="  $model.tempData.val(&quot;fYear&quot;)+ '年,第' +  $model.tempData.val(&quot;fWeekNum&quot;)  + '周，起始时间：' +  $model.tempData.val(&quot;fDate1&quot;)  +'至' +  $model.tempData.val(&quot;fDate2&quot;) "/>  -->
      	<label bind-html="  $model.tempData.val(&quot;fYear&quot;)+ '年,第' +  $model.tempData.val(&quot;fWeekNum&quot;)  + '周，起始时间：' +  $model.tempData.val(&quot;fDate1&quot;)  +'至' +  $model.tempData.val(&quot;fDate2&quot;) " style="padding-top:10px"></label>
      </div>  
<!--       <div class="col col-xs-1" xid="col3">年第</div>   -->
<!--       <div class="col col-xs-1" xid="col4">  -->
<!--         <div component="$UI/system/components/justep/output/output" class="x-output" -->
<!--           xid="output3" bind-ref="tempData.ref('fWeekNum')"/>  -->
<!--       </div>   -->
<!--       <div class="col col-xs-1" xid="col5">周，起始时间</div>   -->
<!--       <div class="col col-xs-1" xid="col6">  -->
<!--         <div component="$UI/system/components/justep/output/output" class="x-output" -->
<!--           xid="output4" bind-ref="tempData.ref('fDate1')"/>  -->
<!--       </div>   -->
<!--       <div class="col col-xs-1" xid="col7">至</div>   -->
<!--       <div class="col col-xs-1" xid="col8">  -->
<!--         <div component="$UI/system/components/justep/output/output" class="x-output" -->
<!--           xid="output5" bind-ref="tempData.ref('fDate2')"/>  -->
<!--       </div>   -->
      <div class="col col-xs-3" xid="col9"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
          xid="gridSelect1" bind-ref="tempData.ref('fWeekOrMonth')" bind-labelRef="tempData.ref('fWeekOrMonthName')"> 
          <option xid="option1" data="weekOrMonthData" value="fWeekOrMonthCode"
            label="fWeekOrMonth"/> 
        </div> 
      </div> 
    </div>  
  </div>  
  <table class="table table-bordered table-hover table-striped" component="$UI/system/components/bootstrap/table/table"
    xid="table1"> 
    <thead class="thead" xid="thead1"> 
      <tr xid="tr1"> 
        <th id="week0">姓名</th>  
        <th id="week1">星期一</th>  
        <th id="week2">星期二</th>  
        <th id="week3">星期三</th>  
        <th id="week4">星期四</th>  
        <th id="week5">星期五</th>  
        <th id="week6">星期六</th>  
        <th id="week7">星期日</th> 
      </tr> 
    </thead>  
    <tbody class="tbody"/> 
  </table> 
</div>
