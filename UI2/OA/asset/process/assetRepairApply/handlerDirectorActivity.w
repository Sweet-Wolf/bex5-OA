<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="repairApplyActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

  <div xid="orgSelect" xui:update-mode="delete"/>
  <div xid="psmSelect" xui:update-mode="delete"/>
  <div xid="fApplyDate" xui:update-mode="delete"/>
  <div xid="grdSltRepairType" xui:update-mode="delete"/>
  <div xid="fDescription" xui:update-mode="delete"/>
  <div xid="fRemark" xui:update-mode="delete"/>
   <div xid="model" style="height:auto;left:623px;top:617px;"  xui:update-mode="merge"/>
    <div autoLoad="true" component="$UI/system/components/justep/data/bizData" concept="OA_AS_RepairItem" limit="-1" xid="dRepairItem" xui:parent="model" xui:update-mode="insert" >
<reader action="/OA/asset/logic/action/queryASRepairItemAction" xid="default1_2" />
<writer action="/OA/asset/logic/action/saveASRepairItemAction" xid="default2_2" />
<creator action="/OA/asset/logic/action/createASRepairItemAction" xid="default3_2" />
<master data="mainData" relation="fMasterID" xid="default4_2" />
<rule xid="rule1_2" >
<col name="fItem" xid="ruleCol1_2" >
<required xid="required1_2" >
<expr xid="default5_2" >



true</expr>
<message xid="default6_2" >



'维修项目不能为空！'</message>
</required>
</col>
<col name="fAmount" xid="ruleCol2_2" >
<required xid="required2_2" >
<expr xid="default7_2" >



true</expr>
<message xid="default8_2" >
<![CDATA['金额不能为空！']]>
</message>
</required>
</col>
</rule>
</div>
    <div autoLoad="true" component="$UI/system/components/justep/data/bizData" concept="OA_AS_FittingInfo" limit="-1" xid="dFittingInfo" xui:parent="model" xui:update-mode="insert" >
<reader action="/OA/asset/logic/action/queryASFittingInfoAction" xid="default9_2" />
<writer action="/OA/asset/logic/action/saveASFittingInfoAction" xid="default10_2" />
<creator action="/OA/asset/logic/action/createASFittingInfoAction" xid="default11_2" />
<master data="mainData" relation="fMasterID" xid="default12_2" />
<calculateRelation relation="relation1" xid="calculateRelation21_2" />
<rule xid="rule11111111_6" >
<col name="fName" xid="ruleCol111111111_6" >
<required xid="required111111111_6" >
<expr xid="default131111111_6" />
<message xid="default211111111_6" />
</required>
</col>
<col name="fNum" xid="ruleCol211111111_6" >
<constraint xid="constraint111111111_6" >
<expr xid="default311111111_6" >
$data.val("fNum") >0</expr>
<message xid="default411111111_6" >
'数量必须大于0！'</message>
</constraint>
</col>
<col name="fPrice" xid="ruleCol311111111_6" >
<constraint xid="constraint211111111_6" >
<expr xid="default511111111_6" >
$data.val("fPrice")>0</expr>
<message xid="default611111111_6" >
'单价必须大于0！'</message>
</constraint>
</col>
<col name="fAmount" xid="ruleCol411111111_6" >
<required xid="required211111111_6" >
<expr xid="default711111111_6" />
<message xid="default811111111_6" />
</required>
<calculate xid="calculate1111111_6" >
<expr xid="default21121111_6" >
isNaN($row.val("fPrice") * $row.val("fNum"))?0:$row.val("fPrice") * $row.val("fNum")</expr>
</calculate>
<readonly xid="readonly11_6" >
<expr xid="default11_6" >
true</expr>
</readonly>
</col>
</rule>
</div>
    <div component="$UI/system/components/justep/data/bizData" concept="OA_Pub_BaseCode" orderBy="fCode:asc" xid="dUnit" xui:parent="model" xui:update-mode="insert" >
<reader action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction" xid="default27_2" />
<writer xid="default28_2" />
<creator xid="default29_2" />
<filter name="UnitStatusfilter" xid="UnitStatusfilter" >
<![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='固定资产单位']]>
</filter>
</div>
    <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row8" xui:parent="mainForm" xui:update-mode="insert" >
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col21_2" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit21_2" >
<label class="x-label" xid="label31_2" />
<div class="x-edit" xid="div21_2" />
</div>
</div>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1_2" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1_2" >
<label class="x-label" style="width:100px;" xid="repairltile" >
<![CDATA[维修信息]]>
</label>
<div class="x-edit" xid="div1_2" />
</div>
</div>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31_2" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit31_2" >
<label class="x-label" xid="label41_2" />
<div class="x-edit" xid="div31_2" />
</div>
</div>
</div>
    <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row9" xui:parent="mainForm" xui:update-mode="insert" >
<div class="col col-xs-12 col-md-6 col-lg-4" xid="col61_2" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit4_2" >
<label bind-text="mainData.label('fRepairDate')" class="x-label" style="width:100px;" xid="fRepairDateL" />
<div class="x-edit" xid="div4_2" >
<input bind-ref="mainData.ref('fRepairDate')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd" xid="inpfRepairDate" />
</div>
</div>
</div>
<div class="col col-xs-12 col-md-6 col-lg-4" xid="col41_2" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit5_2" >
<label bind-text="mainData.label('fReturnDate')" class="x-label" style="width:100px;" xid="inpfReturnDateL" />
<div class="x-edit" xid="div5_2" >
<input bind-ref="mainData.ref('fReturnDate')" class="form-control" component="$UI/system/components/justep/input/input" format="yyyy-MM-dd" xid="inpReturnDate" />
</div>
</div>
</div>
<div class="col col-xs-12 col-md-6 col-lg-4" xid="col51_2" >
<div class="x-label-edit x-label20" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit6_2" >
<label bind-text="mainData.label('fRepairAmount')" class="x-label" style="width:100px;" xid="iptRepairAmountL" />
<div class="x-edit" xid="div6_2" >
<input bind-ref="mainData.ref('fRepairAmount')" class="form-control" component="$UI/system/components/justep/input/input" xid="inpfRepairAmount" />
</div>
</div>
</div>
</div>
    <div class="row" component="$UI/system/components/bootstrap/row/row" xid="row10" xui:parent="mainForm" xui:update-mode="insert" >
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col91_2" >
<div component="$UI/system/components/bootstrap/tabs/tabs" xid="RepairTabs" >
<ul class="nav nav-tabs" xid="RepairInfoTabNav" >
<li class="active" xid="li1_2" >
<a content="RepairTabContent" xid="RepairTabItem" >
<![CDATA[维修情况]]>
</a>
</li>
<li role="presentation" xid="li2_2" >
<a content="FittingTabContent" xid="FittingTabItem" >
<![CDATA[配件信息]]>
</a>
</li>
</ul>
<div class="tab-content" xid="RepairInfoDiv" >
<div class="tab-pane active" xid="RepairTabContent" >
<div class="x-toolbar form-inline x-toolbar-spliter" component="$UI/system/components/justep/toolBar/toolBar" xid="RepairToolBar" >
<a class="btn btn-link btn-icon-left btn-only-icon" component="$UI/system/components/justep/button/button" onClick="{'operation':'dRepairItem.new'}" xid="rNewbutton" >
<i xid="i3_2" />
<span xid="span3_2" />
</a>
<a class="btn btn-link btn-icon-left btn-only-icon" component="$UI/system/components/justep/button/button" onClick="{'operation':'dRepairItem.save'}" xid="rSavebutton" >
<i xid="i1_2" />
<span xid="span1_2" />
</a>
<a class="btn btn-link btn-icon-left btn-only-icon" component="$UI/system/components/justep/button/button" onClick="{'operation':'dRepairItem.delete'}" xid="rDelbutton" >
<i xid="i2_2" />
<span xid="span2_2" />
</a>
</div>
<div altRows="true" cascade="false" class="x-grid-no-bordered" component="$UI/system/components/justep/grid/grid" data="dRepairItem" height="250" hiddenCaptionbar="true" showRowNumber="true" width="100%" xid="Repairgrid" >
<columns xid="RepairColumns" >
<column editable="true" name="fItem" width="200" xid="column1_2" >
<editor xid="fItem" >
<input bind-ref="ref('fItem')" class="form-control" component="$UI/system/components/justep/input/input" xid="fItem" />
</editor>
</column>
<column editable="true" name="fDescription" width="200" xid="column2_2" >
<editor xid="fDescription" >
<input bind-ref="ref('fDescription')" class="form-control" component="$UI/system/components/justep/input/input" xid="fDescription" />
</editor>
</column>
<column editable="true" name="fAmount" width="100" xid="column3_2" >
<editor xid="fAmount" >
<input bind-ref="ref('fAmount')" class="form-control" component="$UI/system/components/justep/input/input" xid="fAmount" />
</editor>
</column>
<column editable="true" name="fRemark" width="200" xid="column4_2" >
<editor xid="fRemark" >
<input bind-ref="ref('fRemark')" class="form-control" component="$UI/system/components/justep/input/input" xid="fRemark" />
</editor>
</column>
</columns>
</div>
</div>
<div class="tab-pane" xid="FittingTabContent" >
<div class="x-toolbar form-inline x-toolbar-spliter" component="$UI/system/components/justep/toolBar/toolBar" xid="FitToolBar" >
<a class="btn btn-link btn-icon-left btn-only-icon" component="$UI/system/components/justep/button/button" onClick="{'operation':'dFittingInfo.new'}" xid="fNewbutton" >
<i xid="i8_2" />
<span xid="span8_2" />
</a>
<a class="btn btn-link btn-icon-left btn-only-icon" component="$UI/system/components/justep/button/button" onClick="{'operation':'dFittingInfo.save'}" xid="fSavebutton" >
<i xid="i6_2" />
<span xid="span6_2" />
</a>
<a class="btn btn-link btn-icon-left btn-only-icon" component="$UI/system/components/justep/button/button" onClick="{'operation':'dFittingInfo.delete'}" xid="fDelbutton" >
<i xid="i7_2" />
<span xid="span7_2" />
</a>
</div>
<div altRows="true" class="x-grid-no-bordered" component="$UI/system/components/justep/grid/grid" data="dFittingInfo" height="250" hiddenCaptionbar="true" showRowNumber="true" width="100%" xid="Fitgrid" >
<columns xid="FitColumns" >
<column editable="true" name="fName" width="100" xid="column5_2" >
<editor xid="fName" >
<input bind-ref="ref('fName')" class="form-control" component="$UI/system/components/justep/input/input" xid="fName" />
</editor>
</column>
<column editable="true" name="fUnit" width="100" xid="column6_2" >
<editor xid="fUnit" >
<div bind-labelRef="ref('fUnit')" bind-ref="ref('fUnitID')" class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" optionHeight="100" xid="grdSltUnit" >
<option data="dUnit" label="fName" value="rowid" xid="option2_2" />
</div>
</editor>
</column>
<column editable="true" name="fNum" width="100" xid="column7_2" >
<editor xid="fNum" >
<input bind-ref="ref('fNum')" class="form-control" component="$UI/system/components/justep/input/input" xid="fNum" />
</editor>
</column>
<column editable="true" name="fPrice" width="100" xid="column8_2" >
<editor xid="fPrice" >
<input bind-ref="ref('fPrice')" class="form-control" component="$UI/system/components/justep/input/input" xid="fPrice" />
</editor>
</column>
<column editable="true" name="fAmount" width="100" xid="column9_2" >
<editor xid="fAmount" >
<input bind-ref="ref('fAmount')" class="form-control" component="$UI/system/components/justep/input/input" xid="fAmount" />
</editor>
</column>
<column editable="true" name="fRemark" width="100" xid="column10_2" >
<editor xid="fRemark" >
<input bind-ref="ref('fRemark')" class="form-control" component="$UI/system/components/justep/input/input" xid="fRemark" />
</editor>
</column>
</columns>
</div>
</div>
</div>
</div>
</div>
</div>
    <div bind-ref="mainData.ref('fApplyDeptName')" class="form-control" component="$UI/system/components/justep/output/output" xid="outApplyDeptName" xui:parent="div4" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fApplyPsnName')" class="form-control" component="$UI/system/components/justep/output/output" xid="outfApplyPsnName" xui:parent="div5" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fApplyDate')" class="form-control" component="$UI/system/components/justep/output/output" format="yyyy-MM-dd" xid="outfApplyDate" xui:parent="div6" xui:update-mode="insert" />
   <output xid="optCode" style="float:left;"  xui:update-mode="merge"/>
   <div xid="col28" class="col col-xs-12 col-sm-6 col-md-6 col-lg-4"  xui:update-mode="merge"/>
    <div bind-ref="mainData.ref('fRepairType')" class="form-control" component="$UI/system/components/justep/output/output" xid="outRepairType" xui:parent="div11" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fDescription')" class="form-control" component="$UI/system/components/justep/output/output" style="height:60px;" xid="output1_2" xui:parent="div16" xui:update-mode="insert" />
    <div bind-ref="mainData.ref('fRemark')" class="form-control" component="$UI/system/components/justep/output/output" style="height:60px;" xid="output21_2" xui:parent="div24" xui:update-mode="insert" />

</div>