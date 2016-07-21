<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad" style="height:auto;left:313px;top:130px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" autoNew="false" concept="OA_MT_UseApply"> 
      <reader action="/OA/meeting/logic/action/queryMTUSEAPPLYAction"/>  
      <writer action="/OA/meeting/logic/action/saveMTUSEAPPLYAction"/>  
      <creator action="/OA/meeting/logic/action/createMTUSEAPPLYAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="bar"> 
    <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group"
      tabbed="true" xid="detialBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        icon="icon-image" xid="chart2Btn" onClick="chartBtnClick"> 
        <i xid="i9" icon="icon-image" class="icon-image"/>  
        <span xid="span9">流程图</span> 
      </a> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="流程记录" icon="icon-android-note" xid="processRecord" onClick="processRecordClick"> 
      <i xid="i1" class="icon-android-note"/>  
      <span xid="span1">流程记录</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="会议室安排" xid="boardRoomApply" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span2"><![CDATA[会议室安排]]></span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="mainForm"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="formRow3Flex1"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput1"> 
            <label class="x-label" xid="label1" style="width:100px;"><![CDATA[会议室安排]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output1" bind-ref="mainData.ref('fArrBoardroom')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput2"> 
            <label class="x-label" xid="label2" style="width:100px;"><![CDATA[开始时间]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output2" bind-ref="mainData.ref('fArrBeginTime')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput3"> 
            <label class="x-label" xid="label3" style="width:100px;"><![CDATA[结束时间]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output3" bind-ref="mainData.ref('fArrEndTime')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput4"> 
            <label class="x-label" xid="label4" style="width:100px;"><![CDATA[安排部门]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output4" bind-ref="mainData.ref('fArrDeptName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput7"> 
            <label class="x-label" xid="label7" style="width:100px;"><![CDATA[安排人]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output7" bind-ref="mainData.ref('fArrPsnName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput6"> 
            <label class="x-label" xid="label6" style="width:100px;"><![CDATA[安排时间]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output6" bind-ref="mainData.ref('fArrTime')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelOutput5"> 
            <label class="x-label" xid="label5" style="width:100px;"><![CDATA[安排备注]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output5" bind-ref="mainData.ref('fArrRemark')"/> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="申请信息" xid="applyInfo" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span6"><![CDATA[申请信息]]></span> 
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="detailForm"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="formRow3Flex2"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput8"> 
            <label class="x-label" style="width:100px;" xid="label8"><![CDATA[使用部门]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output8" bind-ref="mainData.ref('fApplyDeptName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput9"> 
            <label class="x-label" style="width:100px;" xid="label9"><![CDATA[使用人]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output9" bind-ref="mainData.ref('fApplyPsnName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput10"> 
            <label class="x-label" style="width:100px;" xid="label10"><![CDATA[申请日期]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output10" bind-ref="mainData.ref('fApplyDate')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col15"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput11"> 
            <label class="x-label" style="width:100px;" xid="label11"><![CDATA[会议主题]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output11" bind-ref="mainData.ref('fMeetName')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput12"> 
            <label class="x-label" style="width:100px;" xid="label12"><![CDATA[会议室]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output12" bind-ref="mainData.ref('fBoardroom')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col17"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput13"> 
            <label class="x-label" style="width:100px;" xid="label13"><![CDATA[开始时间]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output13" bind-ref="mainData.ref('fBeginTime')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col18"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput14"> 
            <label class="x-label" style="width:100px;" xid="label14"><![CDATA[结束时间]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output14" bind-ref="mainData.ref('fEndTime')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col19"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput15"> 
            <label class="x-label" style="width:100px;" xid="label15"><![CDATA[参会人员]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output15" bind-ref="mainData.ref('fMeetPsns')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col20"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput16"> 
            <label class="x-label" style="width:100px;" xid="label16"><![CDATA[外部参会人员]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output16" bind-ref="mainData.ref('fOutPsns')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col21"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput17"> 
            <label class="x-label" style="width:100px;" xid="label17"><![CDATA[参会人数]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output17" bind-ref="mainData.ref('fMeetPsnNum')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col22"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput18"> 
            <label class="x-label" style="width:100px;" xid="label18"><![CDATA[联系电话]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output18" bind-ref="mainData.ref('fPhone')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col23"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput19"> 
            <label class="x-label" style="width:100px;" xid="label19"><![CDATA[需求描述]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output19" bind-ref="mainData.ref('fDescription')"/> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col24"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit " xid="labelOutput20"> 
            <label class="x-label" style="width:100px;" xid="label20"><![CDATA[备注]]></label>  
            <div component="$UI/system/components/justep/output/output" class="form-control x-edit"
              xid="output20" bind-ref="mainData.ref('fRemark')"/> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"/> 
</div>
