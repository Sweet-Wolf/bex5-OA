<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:348px;top:319px;" onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dCarUseArrangeDetail"
      concept="OA_CA_CarUseArrange" limit="1" autoLoad="true">
      <reader xid="default1" action="/OA/car/logic/action/queryCACarUseArrangeAction"/>  
      <master xid="default2" data="dCarUseApplyDetail" relation="fMasterID"/>
    <rule xid="rule3">
   <readonly xid="readonly3">
    <expr xid="default8">true</expr></readonly> </rule></div>
  <div component="$UI/system/components/justep/data/bizData" xid="dCarUseApplyDetail" concept="OA_CA_CarUseApply"><reader xid="default3" action="/OA/car/logic/action/queryCACarUseApplyAction"></reader>
  <writer xid="default4" action="/OA/car/logic/action/saveCACarUseApplyAction"></writer>
  <creator xid="default5" action="/OA/car/logic/action/createCACarUseApplyAction"></creator>
  <rule xid="rule2">
   <readonly xid="readonly2">
    <expr xid="default7">true</expr></readonly> </rule></div></div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1">
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dCarUseApplyDetail.refresh'}" xid="button1"> 
      <i xid="i2"/>  
      <span xid="span2"/>
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="chart2Btn" onClick="chart2BtnClick" label="流程图" icon="icon-image"> 
      <i xid="i9" class="icon-image"/>  
      <span xid="span9">流程图</span>
    </a>  
    
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.processRecord'}" xid="button2">
   <i xid="i1"></i>
   <span xid="span5"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" label="打印" xid="printBtn" icon="icon-printer" onClick="printBtnClick"> 
      <i xid="i6" class="icon-printer" />  
      <span xid="span1">打印</span>
    </a></div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="carUseReportWindowDialog"
    src="$UI/OA/car/process/carUseReport/carUseReport.w" status="normal"/>
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dCarUseApplyDetail" autoStart="false" autoClose="false" autoSave="false" autoFilter="false"/>
  <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
    xid="titleBar1" title="用车申请单"> 
    <div class="x-titlebar-left" xid="div1"/>  
    <div class="x-titlebar-title" xid="div2">用车申请单</div>  
    <div class="x-titlebar-right reverse" xid="div3"/>
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="wdFlowchart"/>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="用车安排" xid="controlGroup1" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle1"> 
      <span xid="span3"><![CDATA[用车安排]]></span>
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form1">
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseArrangeDetail.label('fCode')"/>  
            <div class="x-edit" xid="div4">
              <input class="form-control" component="$UI/system/components/justep/input/input"
                data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fCode')"
                xid="fCode"/>
            </div>
          </div>
        </div> 
        
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseArrangeDetail.label('fCarDriverName')"/>  
            <div class="x-edit" xid="div4">
              <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fCarDriverName')"
            xid="input2"/>
            </div>
          </div>
        </div> 
        
         <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseArrangeDetail.label('fName')"/>  
            <div class="x-edit" xid="div4">
              <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fName')"
            xid="input4"/>
            </div>
          </div>
        </div> 
        
         <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseArrangeDetail.label('fCarKindName')"/>  
            <div class="x-edit" xid="div4">
               <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fCarKindName')"
            xid="input3"/>
            </div>
          </div>
        </div> 
        
         <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseArrangeDetail.label('fTelephone')"/>  
            <div class="x-edit" xid="div4">
                <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fTelephone')"
            xid="input6"/>
            </div>
          </div>
        </div> 
        
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseArrangeDetail.label('fArgnPsnName')"/>  
            <div class="x-edit" xid="div4">
                <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseArrangeDetail.ref('fArgnPsnName')"
            xid="fArgnPsnName"/>
        
            </div>
          </div>
        </div> 
        
        
        <!--aaaaaaaaaaaaaaaaaaa  -->
         
        
       
       
        
        
      </div>
    </div> 
  </div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group"
    title="基本信息" xid="controlGroup2" collapsible="true"> 
    <div class="x-control-group-title" xid="controlGroupTitle2"> 
      <span xid="span4"><![CDATA[基本信息]]></span>
    </div>  
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
      xid="form2"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2">
    	<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fApplyDeptName')"/>  
            <div class="x-edit" xid="div4">
                <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fApplyDeptName')"
            xid="input12"/>
        
            </div>
          </div>
        </div> 
        
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fApplyPsnName')"/>  
            <div class="x-edit" xid="div4">
                <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fApplyPsnName')"
            xid="input9"/>
        
            </div>
          </div>
        </div> 
        
         <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fApplyDate')"/>  
            <div class="x-edit" xid="div4">
               <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fApplyDate')"
            xid="input10"/>
        
            </div>
          </div>
        </div> 
        
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fPersonCount')"/>  
            <div class="x-edit" xid="div4">
              <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fPersonCount')"
            xid="input7"/>
            </div>
          </div>
        </div> 
        
         <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fDestination')"/>  
            <div class="x-edit" xid="div4">
              <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fDestination')"
            xid="input11"/>
        
            </div>
          </div>
        </div> 
        
        
       
        
        
        
         <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fBeginTime')"/>  
            <div class="x-edit" xid="div4">
               <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fBeginTime')"
            xid="input13"/>
            </div>
          </div>
        </div> 
        
         <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fEndTime')"/>  
            <div class="x-edit" xid="div4">
         <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fEndTime')"
            xid="input14"/>
            </div>
          </div>
        </div> 
        
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fIsRoundtrip')"/>  
            <div class="x-edit" xid="div4">
   	      <input class="form-control" component="$UI/system/components/justep/input/input"
            data="dCarUseApplyDetail" bind-ref="dCarUseApplyDetail.ref('fIsRoundtrip')"
            xid="input16"/>
            </div>
          </div>
        </div> 
        
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fApplyReason')"/>  
            <div class="x-edit" xid="div4">
   	        <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
            xid="fApplyReason" bind-ref="dCarUseApplyDetail.ref('fApplyReason')"/>
            </div>
          </div>
        </div> 
        
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fDriveCircuit')"/>  
            <div class="x-edit" xid="div4">
   	         <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
            xid="textarea3" bind-ref="dCarUseApplyDetail.ref('fDriveCircuit')"/>
      
            </div>
          </div>
        </div> 
        
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col37">
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dCarUseApplyDetail.label('fRemark')"/>  
            <div class="x-edit" xid="div4">
        <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control"
            xid="textarea2" bind-ref="dCarUseApplyDetail.ref('fRemark')"/>
            </div>
          </div>
        </div> 
        
    
   </div></div>
  </div>
  </div>
