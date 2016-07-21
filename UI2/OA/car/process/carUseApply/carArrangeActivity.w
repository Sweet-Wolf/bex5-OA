<div 
  xmlns:xu="http://www.xmldb.org/xupdate" 
  xmlns:xui="http://www.justep.com/xui" 
  __id="id_1" 
  extends="$UI/OA/car/process/carUseApply/parent.w" 
  component="$UI/system/components/justep/window/window" 
  xid="window" 
  class="window" 
  xmlns="http://www.w3.org/1999/xhtml" 
  design="device:pc" >

    <rule xid="rule1_3" xui:parent="dCarUseApply" xui:update-mode="insert" >
<readonly xid="readonly1_3" >
<expr xid="default1_3" >



true</expr>
</readonly>
</rule>
    <div class="x-control-group" collapsible="true" component="$UI/system/components/justep/controlGroup/controlGroup" title="用车安排" xid="controlGroup21_1" xui:before="controlGroup1" xui:parent="content" xui:update-mode="insert" >
<div class="x-control-group-title" xid="controlGroupTitle21_1" >
<span xid="span21_1" >



用车安排</span>
</div>
<div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1" >
<div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1_3" >
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col41_3" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelInput21_3" >
<label bind-text="dCarUseArrange.label('fCode')" class="x-label" style="width:100px;" xid="label21_3" />
<div class="x-edit" xid="div21_3" >
<div class="row" component="$UI/system/components/bootstrap/row/row" xid="row1_1" >
<div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1_1" >
<div class="input-group" xid="inputGroup2" >
<input bind-ref="dCarUseArrange.ref('fCode')" class="form-control" component="$UI/system/components/justep/input/input" style="border-right-style:none;" xid="fCode" />
<div bind-click="selectCarClick" class="input-group-addon" style="background-color:transparent;border-left-style:none;" xid="div11_7" >
<i class="icon-android-search" xid="i111" />
</div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4_1" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit1_1" >
<label bind-text="dCarUseArrange.label('fCarDriverName')" class="x-label" style="width:100px;" xid="label1_1" />
<div class="x-edit" xid="div1_1" >
<div bind-labelRef="dCarUseArrange.ref('fCarDriverName')" bind-ref="dCarUseArrange.ref('fCarDriverID')" class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect11_1" >
<option data="dDriverInfo" label="fName" value="fCode" xid="option11_1" />
</div>
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col52_1" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit21_1" >
<label bind-text="dCarUseArrange.label('fName')" class="x-label" style="width:100px;" xid="label21_1" />
<div class="x-edit" xid="div21_1" >
<input bind-ref="dCarUseArrange.ref('fName')" class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApply" xid="input4" />
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col52_1" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit21_1" >
<label bind-text="dCarUseArrange.label('fCarKindName')" class="x-label" style="width:100px;" xid="label21_1" />
<div class="x-edit" xid="div21_1" >
<input bind-ref="dCarUseArrange.ref('fCarKindName')" class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApply" xid="input3" />
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col52_1" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit21_1" >
<label bind-text="dCarUseArrange.label('fTelephone')" class="x-label" style="width:100px;" xid="label21_1" />
<div class="x-edit" xid="div21_1" >
<input bind-ref="dCarUseArrange.ref('fTelephone')" class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApply" xid="input6" />
</div>
</div>
</div>
<div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col52_1" >
<div class="x-label-edit" component="$UI/system/components/justep/labelEdit/labelEdit" xid="labelEdit21_1" >
<label bind-text="dCarUseArrange.label('fArgnPsnName')" class="x-label" style="width:100px;" xid="label21_1" />
<div class="x-edit" xid="div21_1" >
<input bind-ref="dCarUseArrange.ref('fArgnPsnName')" class="form-control" component="$UI/system/components/justep/input/input" data="dCarUseApply" xid="fArgnPsnName" />
</div>
</div>
</div>
</div>
</div>
</div>

</div>