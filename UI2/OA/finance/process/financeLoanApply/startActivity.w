<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:543px;top:17px;">
    <div component="$UI/system/components/justep/data/bizData" xid="dLoanApply"
      directDelete="true" autoLoad="false" concept="OA_FC_LoanApply" orderBy=""
      columns="" autoNew="true" onSaveCommit="dLoanApplySaveCommit"> 
      <reader action="/OA/finance/logic/action/queryFCLoanApplyAction"/>  
      <writer action="/OA/finance/logic/action/saveFCLoanApplyAction"/>  
      <creator action="/OA/finance/logic/action/createFCLoanApplyAction"/> 
    <rule xid="rule1">
   <col name="fNO" xid="ruleCol1">
    <readonly xid="readonly1">
     <expr xid="default1">true</expr></readonly> </col> 
   <col name="fLoanDeptName" xid="ruleCol2">
    <required xid="required1">
     <expr xid="default2">true</expr></required> </col> 
   <col name="fLoanPsnName" xid="ruleCol3">
    <required xid="required2">
     <expr xid="default3">true</expr></required> </col> 
   <col name="fLoanDate" xid="ruleCol4">
    <required xid="required3">
     <expr xid="default4">true</expr></required> </col> 
   <col name="fReturnDate" xid="ruleCol5">
    <required xid="required4">
     <expr xid="default5">true</expr></required> </col> 
   <col name="fLoanPurpose" xid="ruleCol6">
    <required xid="required5">
     <expr xid="default6">true</expr></required> </col> 
   <col name="fLoanAmt" xid="ruleCol7">
    <constraint xid="constraint1">
     <expr xid="default7">$model.dLoanApply.val(&quot;fLoanAmt&quot;) &gt; 0</expr>
     <message xid="default8">借款金额必须大于0！</message></constraint> </col> </rule>
  </div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dLoanType" concept="OA_Pub_BaseCode">
   <reader xid="default9" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default10"></writer>
   <creator xid="default11"></creator>
   <filter name="filter0" xid="filter1">OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='借款类型'</filter></div></div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="dLoanApply"/>  
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
          xid="saveBtn" onClick="{operation:'dLoanApply.save'}"> 
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
     <div class="col col-xs-12 col-md-6 col-lg-4" xid="col3">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit1">
       <label class="x-label" xid="fApplyDeptNamell" title="基础信息" style="width:90px;">基础信息</label>
       <div class="x-edit" xid="div1"></div></div> </div> 
     <div class="col col-xs-12 col-md-6 col-lg-4" xid="col4"></div>
     <div class="col col-xs-12 col-md-6 col-lg-4" xid="col10">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
       <label class="x-label" xid="label3" title="NO:" style="width:100px;">NO:</label>
       <div class="x-edit" xid="div3">
        <output class="form-control" component="$UI/system/components/justep/output/output" data="dLoanApply" bind-ref="dLoanApply.ref('fNO')" xid="fNO"></output></div> </div> </div> 
     <div class="col col-xs-12 col-md-6 col-lg-4" xid="col15">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit6">
       <label class="x-label" xid="fLoanDeptNameL" bind-text="dLoanApply.label('fLoanDeptName')" style="width:100px;"></label>
       <div class="x-edit" xid="div6">
        <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC4" bind-ref="dLoanApply.ref('fLoanDeptID')" bind-labelRef="dLoanApply.ref('fLoanDeptName')" includeOrgKind="ogn,dpt">
         <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dOrg"></div>
         <option xid="option4" value="sCode" label="sName">
          <columns xid="columns6">
           <column name="sName" xid="column5"></column></columns> </option> </div> </div> </div> </div> 
     <div class="col col-xs-12 col-md-6 col-lg-4" xid="col14">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit5">
       <label class="x-label" xid="fLoanPsnNameL" bind-text="dLoanApply.label('fLoanPsnName')" style="width:100px;"></label>
       <div class="x-edit" xid="div5">
        <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC3" bind-ref="dLoanApply.ref('fLoanPsnID')" bind-labelRef="dLoanApply.ref('fLoanPsnName')" includeOrgKind="psm">
         <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
          <treeOption xid="default15" rootFilter="1=1"></treeOption></div> 
         <option xid="option5" value="sCode" label="sName">
          <columns xid="columns5">
           <column name="sName" xid="column6"></column></columns> </option> </div> </div> </div> </div> 
     <div class="col col-xs-12 col-md-6 col-lg-4" xid="col16">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
       <label class="x-label" xid="fLoanDateL" bind-text="dLoanApply.label('fLoanDate')" style="width:100px;"></label>
       <div class="x-edit" xid="div4">
        <input xid="fLoanDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dLoanApply.ref('fLoanDate')"></input></div> </div> </div> 
     <div class="col col-xs-12 col-md-6 col-lg-4" xid="col17">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit8">
       <label class="x-label" xid="fReturnDateL" bind-text="dLoanApply.label('fReturnDate')" style="width:100px;"></label>
       <div class="x-edit" xid="div8" style="width:200px;">
        <input xid="fReturnDate" class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dLoanApply.ref('fReturnDate')" format="yyyy-MM-dd"></input></div> </div> </div> 
     <div class="col col-xs-12 col-md-6 col-lg-4" xid="col18">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit9">
       <label class="x-label" xid="fLoanTypeL" style="width:100px;" bind-text="dLoanApply.label('fLoanType')"></label>
       <div class="x-edit" xid="div9">
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="grdSlfLoanType" bind-ref="dLoanApply.ref('fLoanTypeCode')" bind-labelRef="dLoanApply.ref('fLoanTypeName')">
         <option xid="option3" data="dLoanType" value="fCode" label="fName"></option></div> </div> </div> </div> 
     <div class="col col-xs-12 col-md-6 col-lg-4" xid="col25">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit12">
       <label class="x-label" xid="fLoanAmtL" bind-text="dLoanApply.label('fLoanAmt')" style="width:100px;"></label>
       <div class="x-edit" xid="div12">
        <input class="form-control" component="$UI/system/components/justep/input/input" bind-ref="dLoanApply.ref('fLoanAmt')" xid="fLoanAmt"></input></div> </div> </div> 
     <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col28">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit15">
       <label class="x-label" xid="fLoanPurposeL" bind-text="dLoanApply.label('fLoanPurpose')" style="width:100px;"></label>
       <div class="x-edit" xid="div15">
        <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="dLoanApply.ref('fLoanPurpose')" xid="fLoanPurpose"></textarea></div> </div> </div> 
     <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col38">
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit21">
       <label class="x-label" xid="fRemarkL" bind-text="dLoanApply.label('fRemark')" style="width:100px;"></label>
       <div class="x-edit" xid="div21">
        <textarea class="form-control" component="$UI/system/components/justep/textarea/textarea" bind-ref="dLoanApply.ref('fRemark')" xid="fRemark"></textarea></div> </div> </div> 
  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col19">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput12">
    <label class="x-label" xid="attachmentL" style="width:100px;"><![CDATA[附件]]></label>
    <div component="$UI/system/components/justep/attachment/attachment" access="duud" xid="fExtendStr1" style="width:100%;" bind-ref="dLoanApply.ref('fExtendStr9')" subPath="concat('业务附件/OA/公文管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))">
     <div class="x-attachment" xid="div2">
      <div class="x-attachment-content x-card-border" xid="div14">
       <div class="x-doc-process" xid="div13">
        <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div11"></div></div> 
       <div data-bind="foreach:$attachmentItems" xid="div10">
        <div class="x-attachment-cell" xid="div7">
         <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div7">
          <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
       <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)" xid="div2">
        <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div10"></div></div> 
       <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div11">
        <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024" xid="div16"></div></div> 
       <div style="clear:both;" xid="div13"></div></div> </div> </div> </div> </div></div> </div> </div></div> 
</div>