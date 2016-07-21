<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:130px;top:251px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dUseStatus" idColumn="useStatus"> 
      <column label="useStatus" name="useStatus" type="String" xid="default5"/>  
      <column label="carBasicInfoID" name="carBasicInfoID" type="String" xid="default6"/>  
      <column label="trgInsert" name="trgInsert" type="String" xid="default7"/>  
      <data xid="default8">[{"useStatus":"","carBasicInfoID":"","trgInsert":""}]</data>  
      <rule xid="rule2"/>
    </div>
    <div component="$UI/system/components/justep/data/bizData" xid="dCarSafetyInfo"
      concept="OA_CA_CarYearCheckInfo"> 
      <reader xid="default1" action="/OA/car/logic/action/queryCACarSafetyInfoAction"/>  
      <writer xid="default2" action="/OA/car/logic/action/saveCACarSafetyInfoAction"/>  
      <creator xid="default3" action="/OA/car/logic/action/createCACarSafetyInfoAction"/>  
      <calculateRelation relation="safetyNO" xid="calculateRelation1" type="Integer"/>  
      <rule xid="rule3">
   <col name="safetyNO" xid="ruleCol1">
    <calculate xid="calculate1">
     <expr xid="default10">$row.index() + 1</expr></calculate> </col> 
   <readonly xid="readonly1">
    <expr xid="default4">$model.isReadOnly()</expr></readonly> </rule></div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1">
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="addBtn" onClick="addBtnClick" label="新增" icon="icon-android-add"> 
          <i xid="i3" class="icon-android-add" />  
          <span xid="span3">新增</span>
        </a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'dCarSafetyInfo.save'}" xid="button1"> 
          <i xid="i1"/>  
          <span xid="span1"/>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'dCarSafetyInfo.delete'}" xid="button2"> 
          <i xid="i2"/>  
          <span xid="span2"/>
        </a>  
          
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{operation:'dCarSafetyInfo.refresh'}" xid="button4"> 
          <i xid="i4"/>  
          <span xid="span4"/>
        </a>
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        altRows="true" class="table table-hover table-striped" xid="grdCarYearCheckInfo"
        data="dCarSafetyInfo" height="auto" width="100%"> 
         <columns xid="columns1">
        <column name="safetyNO" xid="column6" label="序号"><editor xid="editor6">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input6" bind-ref="ref('safetyNO')"></input></editor></column><column name="fJoinSafetyDate" xid="column1" editable="true"><editor xid="editor1">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input1" dataType="Date" bind-ref="ref('fJoinSafetyDate')"></input></editor></column>  
        <column name="fInsurer" xid="column2" editable="true"><editor xid="editor2">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="ref('fInsurer')"></input></editor></column>  
        <column name="fPolicyHolderCircs" xid="column3" editable="true"><editor xid="editor3">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="ref('fPolicyHolderCircs')"></input></editor></column>  
        <column name="fOutSafetyDate" xid="column4" editable="true"><editor xid="editor4">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" dataType="Date" bind-ref="ref('fOutSafetyDate')"></input></editor></column>  
        <column name="fRemark" xid="column5" editable="true"><editor xid="editor5">
   <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="ref('fRemark')"></textarea>
  </editor></column>  
        
        </columns>
      </div>
    </div>  
    <div class="x-panel-bottom" xid="bottom2"> 
      </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/>
</div>
