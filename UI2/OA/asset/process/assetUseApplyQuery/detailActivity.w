<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xui="http://www.justep.com/xui" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:587px;top:20px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div autoLoad="true" autoNew="false" columns="" component="$UI/system/components/justep/data/bizData"
      concept="OA_AS_UseApplyM" directDelete="true" orderBy="" xid="mainData" xui:update-mode="merge" confirmRefresh="false"> 
      <reader action="/OA/asset/logic/action/queryASUseApplyMAction" xid="default1"/>  
      <writer action="/OA/asset/logic/action/saveASUseApplyMAction" xid="default2"/>  
      <creator action="/OA/asset/logic/action/createASUseApplyMAction" xid="default3"/>  
      <rule parent="mainData" update-mode="insert" xid="rule2" xui:parent="mainData"
        xui:update-mode="insert"> 
        <col name="fNO" xid="ruleCol11"> 
          <readonly xid="readonly11"> 
            <expr xid="default11">true</expr>
          </readonly> 
        </col>  
        <col name="fApplyDeptID" xid="ruleCol21"> 
          <readonly xid="readonly21"> 
            <expr xid="default21">true</expr>
          </readonly> 
        </col>  
        <col name="fApplyDeptName" xid="ruleCol31"> 
          <readonly xid="readonly31"> 
            <expr xid="default31">true</expr>
          </readonly> 
        </col>  
        <col name="fApplyPsnID" xid="ruleCol41"> 
          <readonly xid="readonly41"> 
            <expr xid="default41">true</expr>
          </readonly> 
        </col>  
        <col name="fApplyPsnName" xid="ruleCol51"> 
          <readonly xid="readonly51"> 
            <expr xid="default51">true</expr>
          </readonly> 
        </col>  
        <col name="fApplyDate" xid="ruleCol61"> 
          <readonly xid="readonly61"> 
            <expr xid="default61">true</expr>
          </readonly> 
        </col>  
        <col name="fKind" xid="ruleCol71"> 
          <readonly xid="readonly71"> 
            <expr xid="default71">true</expr>
          </readonly> 
        </col>  
        <col name="fName" xid="ruleCol81"> 
          <readonly xid="readonly81"> 
            <expr xid="default81">true</expr>
          </readonly> 
        </col>  
        <col name="fDemandDate" xid="ruleCol91"> 
          <readonly xid="readonly91"> 
            <expr xid="default91">true</expr>
          </readonly> 
        </col>  
        <col name="fReturnDate" xid="ruleCol101"> 
          <readonly xid="readonly101"> 
            <expr xid="default101">true</expr>
          </readonly> 
        </col>  
        <col name="fRequire" xid="ruleCol111"> 
          <readonly xid="readonly111"> 
            <expr xid="default111">true</expr>
          </readonly> 
        </col>  
        <col name="fApplyReason" xid="ruleCol121"> 
          <readonly xid="readonly121"> 
            <expr xid="default121">true</expr>
          </readonly> 
        </col>  
        <col name="fProcessName" xid="ruleCol122"> 
          <readonly xid="readonly122"> 
            <expr xid="default122">true</expr>
          </readonly> 
        </col>  
        <col name="fRemark" xid="ruleCol123"> 
          <readonly xid="readonly123"> 
            <expr xid="default123">true</expr>
          </readonly> 
        </col> 
      </rule> 
    </div>
    <div component="$UI/system/components/justep/data/bizData" xid="dUseArrange"
      concept="OA_AS_UseArrange" limit="1" autoLoad="true">
      <reader xid="default5" action="/OA/asset/logic/action/queryASUseArrangeAction"/>  
      <writer xid="default6" action="/OA/asset/logic/action/saveASUseArrangeAction"/>  
      <creator xid="default7" action="/OA/asset/logic/action/createASUseArrangeAction"/>  
      <master xid="default8" data="mainData" relation="fMasterID"/>  
      <rule xid="rule1"> 
        <col name="fAssetID" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default4">true</expr>
          </readonly> 
        </col>  
        <col name="fKindID" xid="ruleCol2"> 
          <readonly xid="readonly2"> 
            <expr xid="default9">true</expr>
          </readonly> 
        </col>  
        <col name="fKind" xid="ruleCol3"> 
          <readonly xid="readonly3"> 
            <expr xid="default10">true</expr>
          </readonly> 
        </col>  
        <col name="fCode" xid="ruleCol4"> 
          <readonly xid="readonly4"> 
            <expr xid="default12">true</expr>
          </readonly> 
        </col>  
        <col name="fName" xid="ruleCol5"> 
          <readonly xid="readonly5"> 
            <expr xid="default13">true</expr>
          </readonly> 
        </col>  
        <col name="fSpecType" xid="ruleCol6"> 
          <readonly xid="readonly6"> 
            <expr xid="default14">true</expr>
          </readonly> 
        </col>  
        <col name="fUnit" xid="ruleCol7"> 
          <readonly xid="readonly7"> 
            <expr xid="default15">true</expr>
          </readonly> 
        </col>  
        <col name="fArrangeDate" xid="ruleCol8"> 
          <readonly xid="readonly8"> 
            <expr xid="default16">true</expr>
          </readonly> 
        </col>  
        <col name="fArrangePsnID" xid="ruleCol9"> 
          <readonly xid="readonly9"> 
            <expr xid="default17">true</expr>
          </readonly> 
        </col>  
        <col name="fArrangePsnName" xid="ruleCol10"> 
          <readonly xid="readonly10"> 
            <expr xid="default18">true</expr>
          </readonly> 
        </col> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="taskData"
      concept="SA_Task"> 
      <reader xid="default19" action="/system/logic/action/queryTaskAction"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"/>
  <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar"
    class="x-toolbar x-toolbar-spliter form-inline"> 
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
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="mainForm"> 
    <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1"> 
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col3"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit1"> 
          <label class="x-label" style="width:90px;" title="基础信息" xid="fApplyDeptNamell">基础信息</label>  
          <div class="x-edit" xid="div1"/>
        </div> 
      </div>  
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col4"/>  
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit3"> 
          <label class="x-label" style="width:100px;" title="NO:" xid="label3">NO:</label>  
          <div class="x-edit" xid="div3"> 
            <output bind-ref="mainData.ref('fNO')" class="form-control" component="$UI/system/components/justep/output/output"
              data="mainData" xid="fNO"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit6"> 
          <label bind-text="mainData.label('fApplyDeptName')" class="x-label"
            style="width:100px;" xid="label4"/>  
          <div class="x-edit" xid="div6"> 
            <div bind-ref="mainData.ref('fApplyDeptName')" class="form-control"
              component="$UI/system/components/justep/output/output" xid="output41"
              xui:parent="div6" xui:update-mode="insert"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit5"> 
          <label bind-text="mainData.label('fApplyPsnName')" class="x-label"
            style="width:100px;" xid="label5"/>  
          <div class="x-edit" xid="div5"> 
            <div bind-ref="mainData.ref('fApplyPsnName')" class="form-control"
              component="$UI/system/components/justep/output/output" xid="output51"
              xui:parent="div5" xui:update-mode="insert"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit4"> 
          <label bind-text="mainData.label('fApplyDate')" class="x-label" style="width:100px;"
            xid="label6"/>  
          <div class="x-edit" xid="div4"> 
            <div bind-ref="mainData.ref('fApplyDate')" class="form-control"
              component="$UI/system/components/justep/output/output" format="yyyy-MM-dd"
              xid="output61" xui:parent="div4" xui:update-mode="insert"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit9"> 
          <label bind-text="mainData.label('fKind')" class="x-label" style="width:100px;"
            xid="fKindL"/>  
          <div class="x-edit" xid="div9"> 
            <div bind-ref="mainData.ref('fKind')" class="form-control" component="$UI/system/components/justep/output/output"
              xid="output71" xui:parent="div9" xui:update-mode="insert"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col17"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit8"> 
          <label bind-text="mainData.label('fName')" class="x-label" style="width:100px;"
            xid="fNameL"/>  
          <div class="x-edit" style="width:200px;" xid="div8"> 
            <div bind-ref="mainData.ref('fName')" class="form-control" component="$UI/system/components/justep/output/output"
              xid="output81" xui:parent="div8" xui:update-mode="insert"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col25"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit12"> 
          <label bind-text="mainData.label('fDemandDate')" class="x-label" style="width:100px;"
            xid="fDemandDateL"/>  
          <div class="x-edit" xid="div12"> 
            <div bind-ref="mainData.ref('fDemandDate')" class="form-control"
              component="$UI/system/components/justep/output/output" format="yyyy-MM-dd"
              xid="output91" xui:parent="div12" xui:update-mode="insert"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col20"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit11"> 
          <label bind-text="mainData.label('fReturnDate')" class="x-label" style="width:100px;"
            xid="label11"/>  
          <div class="x-edit" xid="div11"> 
            <div bind-ref="mainData.ref('fReturnDate')" class="form-control"
              component="$UI/system/components/justep/output/output" format="yyyy-MM-dd"
              xid="optfReturnDate" xui:parent="div11" xui:update-mode="insert"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit15"> 
          <label bind-text="mainData.label('fRequire')" class="x-label" style="width:100px;"
            xid="fRequireL"/>  
          <div class="x-edit" xid="div15"> 
            <textarea bind-ref="mainData.ref('fRequire')" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              xid="fRequire"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col35"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit18"> 
          <label bind-text="mainData.label('fApplyReason')" class="x-label" style="width:100px;"
            xid="fApplyReasonL"/>  
          <div class="x-edit" xid="div18"> 
            <textarea bind-ref="mainData.ref('fApplyReason')" class="form-control"
              component="$UI/system/components/justep/textarea/textarea" xid="fApplyReason"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col38"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit21"> 
          <label bind-text="mainData.label('fRemark')" class="x-label" style="width:100px;"
            xid="fRemarkL"/>  
          <div class="x-edit" xid="div21"> 
            <textarea bind-ref="mainData.ref('fRemark')" class="form-control" component="$UI/system/components/justep/textarea/textarea"
              xid="fRemark" xui:update-mode="merge"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-md-12 col-lg-12" xid="col211"> 
        <h5>资产分配信息</h5> 
      </div>
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col511"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit211"> 
          <label class="x-label" style="width:100px;" title="处理方式" xid="label411">处理方式</label>  
          <div class="x-edit" xid="div311"> 
            <div bind-ref="mainData.ref('fProcessName')" class="form-control"
              component="$UI/system/components/justep/output/output" xid="output1"/>
          </div> 
        </div> 
      </div>
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col611"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelInput111"> 
          <label class="x-label" style="width:100px;" xid="label311">安排日期</label>  
          <div class="x-edit" style="width:200px;" xid="div411"> 
            <div bind-ref="dUseArrange.ref('fArrangeDate')" class="form-control"
              component="$UI/system/components/justep/output/output" format="yyyy-MM-dd"
              xid="outfArrangeDate"/>
          </div> 
        </div> 
      </div>
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col411"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit51"> 
          <label class="x-label" style="width:100px;" xid="label91">安 排 人</label>  
          <div class="x-edit" xid="div91"> 
            <div bind-ref="dUseArrange.ref('fArrangePsnName')" bind-text="dUseArrange.ref('fArrangePsnName')"
              class="form-control" component="$UI/system/components/justep/output/output"
              xid="outfArrangePsnName"/>
          </div> 
        </div> 
      </div>
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col811"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit311"> 
          <label class="x-label" style="width:100px;" xid="label611">资产编号</label>  
          <div class="x-edit" xid="div511"> 
            <div bind-ref="dUseArrange.ref('fCode')" class="form-control" component="$UI/system/components/justep/output/output"
              xid="outfCode"/>
          </div> 
        </div> 
      </div>
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col911"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelInput211"> 
          <label class="x-label" style="width:100px;" xid="label511">资产分类</label>  
          <div class="x-edit" style="width:200px;" xid="div611"> 
            <div bind-ref="dUseArrange.ref('fKind')" class="form-control" component="$UI/system/components/justep/output/output"
              xid="outSubKind"/>
          </div> 
        </div> 
      </div>
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col711"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit61"> 
          <label class="x-label" style="width:100px;" xid="label101">资产名称</label>  
          <div class="x-edit" xid="div101"> 
            <div bind-ref="dUseArrange.ref('fName')" class="form-control" component="$UI/system/components/justep/output/output"
              xid="outSubName"/>
          </div> 
        </div> 
      </div>
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col1211"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelEdit411"> 
          <label class="x-label" style="width:100px;" xid="label811">规格型号</label>  
          <div class="x-edit" xid="div711"> 
            <div bind-ref="dUseArrange.ref('fSpecType')" class="form-control"
              component="$UI/system/components/justep/output/output" xid="outfSpecType"/>
          </div> 
        </div> 
      </div>
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col1311"> 
        <div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit"
          xid="labelInput311"> 
          <label class="x-label" style="width:100px;" xid="label711">计件单位</label>  
          <div class="x-edit" style="width:200px;" xid="div811"> 
            <div bind-ref="dUseArrange.ref('fUnit')" class="form-control" component="$UI/system/components/justep/output/output"
              xid="outUnit"/>
          </div> 
        </div> 
      </div>
      <div class="col col-xs-12 col-md-6 col-lg-4" xid="col1011"/>
    </div> 
  </div>
</div>
