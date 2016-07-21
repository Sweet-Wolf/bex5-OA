<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:369px;top:9px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dSignature"
      concept="OA_SL_Signature" autoNew="false" autoLoad="true" onValueChanged="dSignatureValueChanged" onBeforeSave="dSignatureBeforeSave"> 
      <reader xid="default1" action="/OA/signature/logic/action/querySLSignatureAction"/>  
      <writer xid="default2" action="/OA/signature/logic/action/saveSLSignatureAction"/>  
      <creator xid="default3" action="/OA/signature/logic/action/createSLSignatureAction"/>  
      <rule xid="rule1"> 
        <col name="fNO" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default6">true</expr> 
          </readonly> 
        </col>  
        <col name="fSake" xid="ruleCol2"> 
          <required xid="required1"> 
            <expr xid="default10">true</expr>  
            <message xid="default11">请填写事由</message> 
          </required> 
        </col>  
        <col name="fIndianName" xid="ruleCol3"> 
          <required xid="required2"> 
            <expr xid="default12">true</expr>  
            <message xid="default13">印管人不能为空</message> 
          </required> 
          
        </col>  
        <col name="fSignatureTypeID" xid="ruleCol4"> 
          <required xid="required3"> 
            <expr xid="default14">true</expr>  
            <message xid="default15">请选择印章</message> 
          </required> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dType"
      concept="OA_Pub_BaseCode" autoLoad="true"> 
      <reader xid="default4" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="selectData" idColumn="value"> 
      <column label="显示" name="lable" type="String" xid="default7"/>  
      <column label="值" name="value" type="Integer" xid="default8"/>  
      <data xid="default9">[{"lable":"是","value":1},{"lable":"否","value":0}]</data> 
    </div> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2">流转</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'dSignature.save'}" label="保存"> 
        <i xid="i1"/>  
        <span xid="span1">保存</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}"> 
        <i xid="i15"/>  
        <span xid="span15">更多</span> 
      </a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.showChart'}" xid="button1">
   <i xid="i6"></i>
   <span xid="span7"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.processRecord'}" xid="button2">
   <i xid="i7"></i>
   <span xid="span8"></span></a></div>  
    <div xid="content"> 
      <h1 xid="title" class="text-center"><![CDATA[印章使用申请]]></h1>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" title="申请信息" xid="controlGroup2"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span4">title</span> 
        </div>  
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form1"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelOutput1"> 
                <label class="x-label" xid="label1" style="width:100px;" bind-text="dSignature.label('fNO')"><![CDATA[]]></label>  
                <div component="$UI/system/components/justep/output/output"
                  class="form-control x-edit" xid="output1" bind-ref="dSignature.ref('fNO')"/>
              </div>
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3">
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit1"> 
                <label class="x-label" xid="label2" bind-text="dSignature.label('fApplyDeptName')"
                  style="width:100px;"/>  
                <div class="x-edit" xid="div1">
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="orgSelectPC1" bind-ref="dSignature.ref('fApplyDeptID')" bind-labelRef="dSignature.ref('fApplyDeptName')"
                    includeOrgKind="ogn,dpt" includeDisabled="true"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="false" xid="dOrg" limit="-1"/>  
                    <option xid="option4" value="SA_OPOrg" label="sName"> 
                      <columns xid="columns1"> 
                        <column name="sName" xid="column1"/>
                      </columns> 
                    </option> 
                  </div>
                </div>
              </div>
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col23">
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit2"> 
                <label class="x-label" xid="label3" bind-text="dSignature.label('fApplyPsnName')"
                  style="width:100px;"/>  
                <div class="x-edit" xid="div2"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="orgSelectPC2" bind-ref="dSignature.ref('fApplyPsnID')" bind-labelRef="dSignature.ref('fApplyPsnName')"
                    includeDisabled="true" onShowOption="orgSelectPC2ShowOption" onHideOption="orgSelectPC2HideOption"
                    includeOrgKind="psm"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="false" xid="dPsm" limit="-1"> 
                      <treeOption xid="default5" rootFilter="1=1"/>
                    </div>  
                    <option xid="option5" value="sPersonID" label="sName"> 
                      <columns xid="columns2"> 
                        <column name="sName" xid="column2"/>
                      </columns> 
                    </option> 
                  </div>
                </div> 
              </div>
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col24">
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit3"> 
                <label class="x-label" xid="label4" bind-text="dSignature.label('fUseDate')"
                  style="width:100px;"/>  
                <div class="x-edit" xid="div3"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="input3" bind-ref="dSignature.ref('fUseDate')"
                    format="yyyy-MM-dd hh:mm"/>
                </div> 
              </div>
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col25"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit4"> 
                <label class="x-label oa-label" xid="label5" style="width:100px;"><![CDATA[主管领导批示]]></label>  
                <div class="x-edit" xid="div4"> 
                  <span component="$UI/system/components/justep/select/radioGroup"
                    class="x-radio-group" xid="iptIsHeadManger" bind-ref="dSignature.ref('fExtendStr1')"
                    bind-itemset="selectData" bind-itemsetValue="ref('value')" bind-itemsetLabel="ref('lable')"/>
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col27"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput2"> 
                <label class="x-label" xid="label7" bind-text="dSignature.label('fApplyDate')"
                  style="width:100px;"/>  
                <div class="x-edit" xid="div6"> 
                  <input component="$UI/system/components/justep/input/input"
                    class="form-control" xid="iptApplyDate" bind-ref="dSignature.ref('fApplyDate')"
                    format="yyyy-MM-dd hh:mm"/>
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelRadioGroup1"> 
                <label class="x-label" xid="label8" bind-text="dSignature.label('fSignatureTypeName')"
                  style="width:100px;"/>  
                <div class="x-edit" xid="div7"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                    xid="gridSelect3" bind-ref="dSignature.ref('fSignatureTypeID')"
                    bind-labelRef="dSignature.ref('fSignatureTypeName')" multiselect="true"> 
                    <option xid="option3" data="dType" value="OA_Pub_BaseCode"
                      label="fName"/>
                  </div>
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col29"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelInput3"> 
                <label class="x-label" xid="label9" bind-text="dSignature.label('fIndianName')"
                  style="width:100px;"/>  
                <div class="x-edit" xid="div8"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="orgSelectPC3" bind-ref="dSignature.ref('fIndianName')" bind-labelRef="dSignature.ref('fIndianName')" multiselect="true"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="true" xid="pOrgData"/>  
                    <option xid="option1" value="sName" label="sName"> 
                      <columns xid="columns3"> 
                        <column name="sName" xid="column3"/>
                      </columns> 
                    </option> 
                  </div>
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col30">
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit5"> 
                <label class="x-label" xid="label10" bind-text="dSignature.label('fSake')"
                  style="width:100px;"><![CDATA[]]></label>  
                <div class="x-edit" xid="div9">
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="textarea1" bind-ref="dSignature.ref('fSake')"/>
                </div>
              </div>
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col31"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit" xid="labelEdit6"> 
                <label class="x-label" xid="label11" bind-text="dSignature.label('fRemark')"
                  style="width:100px;"/>  
                <div class="x-edit" xid="div10"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="textarea3" bind-ref="dSignature.ref('fRemark')"/>
                </div> 
              </div> 
            </div>
          </div>
        </div> 
      </div> 
    </div> 
  </div>  
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
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="chartBtn" onClick="{operation:'process.showChart'}"> 
          <i xid="i5"/>  
          <span xid="span5"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recordBtn" onClick="{operation:'process.processRecord'}"> 
          <i xid="i55"/>  
          <span xid="span55"/> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    style="height:24px;width:24px;left:19px;top:101px;" data="dSignature"/> 
</div>
