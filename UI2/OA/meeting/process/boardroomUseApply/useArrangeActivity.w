<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="useApplyActivity.w" 
  component="$UI/system/components/justep/window/window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

   <div xid="model" onModelConstructDone="modelModelConstructDone" style="height:auto;left:120px;top:355px;"  xui:update-mode="merge"/>
   <div xid="process" onBeforeAdvanceQuery="processBeforeAdvanceQuery"  xui:update-mode="merge"/>
   <div xid="controlGroup2" title="会议室安排"  xui:update-mode="merge"/>
    <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1_2" xui:parent="controlGroup2" xui:update-mode="insert" >
<div class="row" component="$UI/system/components/bootstrap/row/row" xid="row11_2" >
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11_2" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1_2" >
<label bind-text="mainData.label('fArrBoardroom')" class="x-label" style="width:100px;" xid="label1_2" />
<div class="x-edit" xid="div1_2" >
<div bind-labelRef="mainData.ref('fArrBoardroom')" bind-ref="mainData.ref('fArrBoardroomID')" class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1_2" >
<option data="dBoardroom" label="fName" value="OA_MT_Boardroom" xid="option1_2" />
</div>
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col41_2" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit21_2" >
<label bind-text="mainData.label('fArrTime')" class="x-label" style="width:100px;" xid="label21_2" />
<div class="x-edit" xid="div21_2" >
<input bind-ref="mainData.ref('fArrTime')" class="form-control" component="$UI/system/components/justep/input/input" xid="input1_2" />
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col51_2" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit31_2" >
<label bind-text="mainData.label('fArrBeginTime')" class="x-label" style="width:100px;" xid="label31_2" />
<div class="x-edit" xid="div31_2" >
<input bind-ref="mainData.ref('fArrBeginTime')" class="form-control" component="$UI/system/components/justep/input/input" xid="input21_2" />
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col61_2" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput11_2" >
<label bind-text="mainData.label('fArrEndTime')" class="x-label" style="width:100px;" xid="label41_2" />
<div class="x-edit" xid="div41_2" >
<input bind-ref="mainData.ref('fArrEndTime')" class="form-control" component="$UI/system/components/justep/input/input" xid="input31_2" />
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col71_2" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput21_2" >
<label bind-text="mainData.label('fArrDeptName')" class="x-label" style="width:100px;" xid="label51_2" />
<div class="x-edit" xid="div51_2" >
<div bind-labelRef="mainData.ref('fArrDeptName')" bind-ref="mainData.ref('fArrDeptID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC1_2" >
<div autoLoad="false" component="$UI/system/components/justep/data/bizData" xid="bizData1_2" />
<option xid="option3_2" >
<columns xid="columns1_2" >
<column name="sName" xid="column1_2" />
</columns>
</option>
</div>
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col81_2" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput31_2" >
<label bind-text="mainData.label('fArrPsnName')" class="x-label" style="width:100px;" xid="label61_2" />
<div class="x-edit" xid="div61_2" >
<div bind-labelRef="mainData.ref('fArrPsnName')" bind-ref="mainData.ref('fArrPsnID')" class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" xid="orgSelectPC21_2" >
<div autoLoad="false" component="$UI/system/components/justep/data/bizData" xid="bizData21_2" />
<option xid="option41_2" >
<columns xid="columns21_2" >
<column name="sName" xid="column21_2" />
</columns>
</option>
</div>
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col91_2" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit41_2" >
<label bind-text="mainData.label('fArrRemark')" class="x-label" style="width:100px;" xid="label71_2" />
<div class="x-edit" xid="div71_2" >
<textarea bind-ref="mainData.ref('fArrRemark')" class="form-control" component="$UI/system/components/justep/textarea/textarea" xid="textarea1_2" />
</div>
</div>
</div>
</div>
</div>
   <div xid="controlGroup1" title="申请信息"  xui:update-mode="merge"/>
   <span xid="span9"  xui:update-mode="merge-and-replace">



申请信息</span>
</div>