<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:436px;top:72px;">
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="mainData" concept="OA_VS_Paper" limit="-1">
      <reader xid="default1" action="/OA/survey/logic/action/queryVSPaperAction"/>  
      <writer xid="default2" action="/OA/survey/logic/action/saveVSPaperAction"/>  
      <creator xid="default3" action="/OA/survey/logic/action/createVSPaperAction"/>  
      <rule xid="rule1"> 
        <col name="fPState" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default12">true</expr>
          </readonly> 
        </col>  
        <col name="fCreateDeptName" xid="ruleCol2"> 
          <readonly xid="readonly2"> 
            <expr xid="default13">true</expr>
          </readonly> 
        </col>  
        <col name="fCreatePsnName" xid="ruleCol3"> 
          <readonly xid="readonly3"> 
            <expr xid="default14">true</expr>
          </readonly> 
        </col>  
        <col name="fCreateTime" xid="ruleCol4"> 
          <readonly xid="readonly4"> 
            <expr xid="default15">true</expr>
          </readonly> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dQuestion" concept="OA_VS_Question">
      <reader xid="default4" action="/OA/survey/logic/action/queryVSQuestionAction"/>  
      <writer xid="default5" action="/OA/survey/logic/action/saveVSQuestionAction"/>  
      <creator xid="default6" action="/OA/survey/logic/action/createVSQuestionAction"/>  
      <master xid="default16" data="mainData" relation="fPaperID"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="dItem" concept="OA_VS_Items">
      <reader xid="default7" action="/OA/survey/logic/action/queryVSItemsAction"/>  
      <writer xid="default8" action="/OA/survey/logic/action/saveVSItemsAction"/>  
      <creator xid="default9" action="/OA/survey/logic/action/createVSItemsAction"/>  
      <master xid="default17" data="dQuestion" relation="fQuestionID"/>
    </div>
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dPublicType" idColumn="label">
      <column label="名称" name="label" type="String" xid="xid1"/>  
      <column label="值" name="value" type="String" xid="xid2"/>  
      <data xid="default10">[{"label":"完全公开","value":"AllPublic"},{"label":"统计结果公开","value":"SumPublic"},{"label":"不公开","value":"NoPublic"},{"label":"匿名","value":"Anonymity"},{"label":"匿名,结果公开","value":"AnonyPublic"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dQuestionType" idColumn="label">
      <column label="名称" name="label" type="String" xid="xid3"/>  
      <column label="值" name="value" type="String" xid="xid4"/>  
      <data xid="default11">[{"label":"单选题","value":"signal"},{"label":"多选题","value":"mutilate"},{"label":"问答题","value":"talk"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dBtn" idColumn="preview">
      <column name="preview" type="String" xid="xid5"/>  
      <column name="sendSurvey" type="String" xid="xid6"/>  
      <column name="finishSurvey" type="String" xid="xid7"/>  
      <column name="abortSurvey" type="String" xid="xid8"/>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    title="调查发布" status="normal" showTitle="true"/>
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="bar"> 
    <a component="$UI/system/components/justep/button/button" label=" 新建"
      class="btn btn-link btn-icon-left" icon="icon-plus" onClick="newBtnClick" xid="newBtn"> 
      <i class="icon-plus" xid="i3"/>  
      <span xid="span1">新建</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{'operation':'mainData.save'}" xid="saveBtn"> 
      <i xid="i14"/>  
      <span xid="span14"/>
    </a>
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="删除" xid="deleteBtn" onClick='{"operation":"mainData.delete"}'> 
      <i xid="i4"/>  
      <span xid="span7">删除</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="refreshBtn" onClick='{"operation":"mainData.refresh"}' label="刷新"> 
      <i xid="i2"/>  
      <span xid="span2">刷新</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="问卷预览" xid="copyBtn" icon="icon-ios7-browsers" onClick="trgPreviewDOMActivate"> 
      <i xid="i1" class="icon-ios7-browsers"/>  
      <span xid="span10">问卷预览</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="调查发布" xid="surveyBtn" icon="icon-ios7-browsers" onClick="button1Click"> 
      <i xid="i5" class="icon-ios7-browsers"/>  
      <span xid="span3">调查发布</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="结束调查" xid="trgFinish" icon="icon-ios7-browsers" onClick="trgFinishDOMActivate"> 
      <i xid="i6" class="icon-ios7-browsers"/>  
      <span xid="span4">结束调查</span>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="撤销问卷" xid="trgAbort" icon="icon-ios7-browsers" onClick="trgAbortDOMActivate"> 
      <i xid="i7" class="icon-ios7-browsers"/>  
      <span xid="span5">撤销问卷</span>
    </a> 
  </div>  
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1">
      <h5 xid="h5"><![CDATA[基本信息]]></h5>
    </div>  
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col2">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelEdit1"> 
        <label class="x-label" xid="label1" style="width:100px;" bind-text="mainData.label('fTitle')"/>  
        <div class="x-edit" xid="div1">
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input1" bind-ref="mainData.ref('fTitle')"/>
        </div>
      </div>
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelEdit2"> 
        <label class="x-label" xid="label2" style="width:100px;" bind-text="mainData.label('fPState')"/>  
        <div class="x-edit" xid="div2"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input2" bind-ref="mainData.ref('fPState')"/>
        </div> 
      </div>
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelEdit4"> 
        <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fEndTime')"/>  
        <div class="x-edit" xid="div4"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input4" bind-ref="mainData.ref('fEndTime')"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelEdit3"> 
        <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fPublicTypeName')"/>  
        <div class="x-edit" xid="div3"> 
          <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
            xid="gridSelect1" bind-ref="mainData.ref('fPublicType')" bind-labelRef="mainData.ref('fPublicTypeName')"> 
            <option xid="option1" data="dPublicType" value="value" label="label"/>
          </div>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelEdit6"> 
        <label class="x-label" xid="label5" style="width:100px;" bind-text="mainData.label('fDescribe')"/>  
        <div class="x-edit" xid="div6"> 
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
            xid="textarea1" bind-ref="mainData.ref('fDescribe')" style="height:150px;"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelEdit5"> 
        <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fCreateDeptName')"/>  
        <div class="x-edit" xid="div5"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input5" bind-ref="mainData.ref('fCreateDeptName')"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelEdit8"> 
        <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fCreatePsnName')"/>  
        <div class="x-edit" xid="div8"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input8" bind-ref="mainData.ref('fCreatePsnName')"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
        xid="labelEdit7"> 
        <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fCreateTime')"/>  
        <div class="x-edit" xid="div7"> 
          <input component="$UI/system/components/justep/input/input" class="form-control"
            xid="input7" bind-ref="mainData.ref('fCreateTime')"/>
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
      <h5 xid="h51"><![CDATA[详细信息]]></h5>
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col11"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1">
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dQuestion.new'}" xid="button6"> 
          <i xid="i10"/>  
          <span xid="span9"/>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dQuestion.save'}" xid="button4"> 
          <i xid="i8"/>  
          <span xid="span6"/>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dQuestion.delete'}" xid="button5"> 
          <i xid="i9"/>  
          <span xid="span8"/>
        </a> 
      </div>  
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        altRows="true" class="x-grid-no-bordered" xid="grid1" data="dQuestion" showRowNumber="false"
        width="100%" height="400"> 
        <columns xid="columns1">
          <column width="100" name="fSequence" xid="column3" editable="true"> 
            <editor> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="ref('fSequence')"/> 
            </editor> 
          </column>
          <column width="100" name="fQTypeName" xid="column1" editable="true">
          	<editor> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" bind-labelRef="ref('fQTypeName')" bind-ref="ref('fQType')">
   <option xid="option2" data="dQuestionType" value="value" label="label"></option></div></editor>
          </column>
          <column name="fContent" xid="column2" editable="true">
          	<editor> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="ref('fContent')"/> 
            </editor> 
          </column> 
        </columns>
      </div>
    </div>  
    <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col12"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar2">
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dItem.new'}" xid="button9"> 
          <i xid="i13"/>  
          <span xid="span13"/>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dItem.save'}" xid="button7"> 
          <i xid="i11"/>  
          <span xid="span11"/>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'dItem.delete'}" xid="button8"> 
          <i xid="i12"/>  
          <span xid="span12"/>
        </a> 
      </div>  
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true"
        altRows="true" class="x-grid-no-bordered" xid="grid2" data="dItem" height="400"
        width="100%"> 
        <columns xid="columns2">
          <column width="100" name="fSequence" xid="column4" editable="true">
          	<editor> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="ref('fSequence')"/> 
            </editor> 
          </column>  
          <column name="fContent" xid="column5" editable="true">
          	<editor> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                bind-ref="ref('fContent')"/> 
            </editor> 
          </column>
        </columns>
      </div>
    </div>
  </div> 
</div>
