<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:297px;top:6px;" onModelConstructDone="modelModelConstructDone">
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_FL_FlowLanchApply" orderBy=""
      columns="" autoNew="true" onValueChanged="mainDataValueChanged" onAfterSave="saveCommit"> 
      <reader action="/OA/flowLanch/logic/action/queryFlowLanchApplyAction"/>  
      <writer action="/OA/flowLanch/logic/action/saveFlowLanchApplyAction"/>  
      <creator action="/OA/flowLanch/logic/action/createFlowLanchApplyAction"/> 
    <rule xid="rule1">
   <col name="fNO" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default1">true</expr></readonly> </col> 
   <col name="fTitle" xid="ruleCol2">
    <required xid="required1">
     <expr xid="default2">true</expr></required> </col> </rule></div>
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      
    </ul> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="advanceBtn" onClick="{operation:'process.advance'}"> 
          <i xid="i2"/>  
          <span xid="span2"/> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="saveBtn" onClick="{operation:'mainData.save'}"> 
          <i xid="i1"/>  
          <span xid="span1"/> 
        </a>  
         
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.showChart'}" xid="button1">
   <i xid="i6"></i>
   <span xid="span7"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.processRecord'}" xid="button2">
   <i xid="i7"></i>
   <span xid="span8"></span></a><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label" label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
          <i xid="i15" class="icon-ios7-more" />  
          <span xid="span15">更多</span> 
        </a></div>  
    <div xid="content"> 
      <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col1"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   <label class="x-label" xid="label1" style="width:100px;"><![CDATA[申请信息]]></label>
   <div class="x-edit" xid="div1"></div></div></div>
   <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit2">
   <label class="x-label" xid="label2" style="width:100px;"><![CDATA[NO:]]></label>
   <div class="x-edit" xid="div2"><input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fNO')" xid="input1"></input></div></div></div>
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col3"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit3">
   <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fTitle')"></label>
   <div class="x-edit" xid="div3"><input xid="fTitle" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fTitle')"></input></div></div></div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit6">
    <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fRemark')"><![CDATA[说明]]></label>
    <div class="x-edit" xid="div6"><textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="mainData.ref('fRemark')"></textarea></div></div> </div>
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit5">
    <label class="x-label" xid="label5" style="width:100px;"><![CDATA[正文]]></label>
    <div class="x-edit" xid="div5">
  <div component="$UI/system/components/justep/attachment/attachmentSimple" access="duud" xid="attachmentSimple1" bind-ref="mainData.ref('fExtendStr9')">
   <div class="x-attachment" xid="div10">
    <div class="x-attachment-content x-card-border" xid="div11">
     <div class="x-doc-process" xid="div12">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div13"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div14">
      <div class="x-attachment-cell" xid="div15">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div16">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'" xid="div17">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'" xid="div18"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div19">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')" xid="div20"></div></div> 
     <div style="clear:both;" xid="div21"></div></div> </div> </div></div></div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit4">
    <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fApplyDeptName')"></label>
    <div class="x-edit" xid="div4"><div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC4" bind-ref="mainData.ref('fApplyDeptID')" bind-labelRef="mainData.ref('fApplyDeptName')" includeOrgKind="ogn,dpt" onUpdateValue="orgSelectPC4UpdateValue">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg"></div>
   <option xid="option4" value="sCode" label="sName">
    <columns xid="columns6">
     <column name="sName" xid="column5"></column></columns> </option> </div></div></div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit9">
    <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fApplyPsnName')"></label>
    <div class="x-edit" xid="div9"><div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" bind-ref="mainData.ref('fApplyPsnID')" bind-labelRef="mainData.ref('fApplyPsnName')" includeOrgKind="psm">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
    <treeOption xid="default15" rootFilter="1=1"></treeOption></div> 
   <option xid="option5" value="sCode" label="sName">
    <columns xid="columns5">
     <column name="sName" xid="column6"></column></columns> </option> </div></div></div> </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit8">
    <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fApplyDate')"></label>
    <div class="x-edit" xid="div8"><input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="mainData.ref('fApplyDate')" xid="input5"></input></div></div> </div>
  <div xid="col8" class="col col-xs-12 col-sm-12 col-md-12 col-lg-12">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit7">
    <label class="x-label" xid="label9" style="width:100px;" bind-text="mainData.label('fAttachment')"></label>
    <div class="x-edit" xid="div7"><div component="$UI/system/components/justep/attachment/attachmentSimple" access="duud" xid="attachmentSimple2" bind-ref="mainData.ref('fAttachment')">
   <div class="x-attachment" xid="div22">
    <div class="x-attachment-content x-card-border" xid="div23">
     <div class="x-doc-process" xid="div24">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div25"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div26">
      <div class="x-attachment-cell" xid="div27">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div28">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a2"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'" xid="div29">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'" xid="div30"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div31">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')" xid="div32"></div></div> 
     <div style="clear:both;" xid="div33"></div></div> </div> </div></div></div> </div></div></div> 
    </div> 
  </div> 
</div>