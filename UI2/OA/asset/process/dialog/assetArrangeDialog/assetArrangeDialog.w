<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:577px;top:200px;"><div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dAssetArrange" idColumn="deptID" autoNew="true" onValueChanged="dAssetArrangeValueChanged"><master xid="default15" data="dAssetArrange"></master>
  <column label=" 责任部门ID" name="deptID" type="String" xid="default2"></column>
  <column label="责任部门" name="deptName" type="String" xid="default3"></column>
  <column label="责任人ID" name="psnID" type="String" xid="default4"></column>
  <column label="责任人" name="psnName" type="String" xid="default5"></column>
  <column label="安排时间" name="arrangeDate" type="Date" xid="default6"></column>
  <data xid="default7">[{&quot;arrangeDate&quot;:&quot;2014-12-31T16:00:00.000Z&quot;}]</data></div></div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1">
   <div xid="col1" class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit2">
   <label class="x-label" xid="deptNameL" style="width:100px;"><![CDATA[ 责任部门：]]></label>
   <div class="x-edit" xid="div2"><div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelect" bind-ref="dAssetArrange.ref('deptID')" bind-labelRef="dAssetArrange.ref('deptName')" includeOrgKind="ogn,dpt">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="dOrg" limit="-1"><treeOption xid="default14" delayLoad="false"></treeOption></div>
   <option xid="treeSltDept" value="sCode" label="sName">
    <columns xid="columns1">
     <column name="sName" xid="column1"></column></columns> </option> </div></div></div></div>
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit3">
     <label class="x-label" xid="label3" style="width:100px;"><![CDATA[责任人：]]></label>
     <div class="x-edit" xid="div6">
      <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="psmSelect" bind-ref="dAssetArrange.ref('psnID')" bind-labelRef="dAssetArrange.ref('psnName')" includeOrgKind="dpt,psm" onShowOption="psmSelectShowOption">
   <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dPsm" limit="-1">
    <treeOption xid="default1" rootFilter="1=1"></treeOption></div> 
   <option xid="treeSltPsm" value="sCode" label="sName">
    <columns xid="columns2">
     <column name="sName" xid="column2"></column></columns> </option> </div></div> </div> </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col14">
    <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit4">
     <label class="x-label" xid="label4" style="width:100px;"><![CDATA[安排时间：]]></label>
     <div class="x-edit" xid="div8">
      <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" dataType="Date" bind-ref="dAssetArrange.ref('arrangeDate')"></input></div> </div> </div></div>
  </div>  
    <div class="x-panel-bottom" xid="bottom1">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{operation:'wReceiver.windowCancel'}"> 
        <i xid="i2"/>  
        <span xid="span2">取消</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span>
      </a>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;"/>
</div>