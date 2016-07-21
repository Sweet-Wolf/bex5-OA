<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:178px;top:379px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      concept="OA_OSC_BaseInfo" limit="-1" autoLoad="true" onSaveCommit="mainDataSaveCommit"> 
      <reader xid="default1" action="/OA/officeSupplyConsumables/logic/action/queryOSCBaseInfoAction"/>  
      <writer xid="default2" action="/OA/officeSupplyConsumables/logic/action/saveOSCBaseInfoAction"/>  
      <creator xid="default3" action="/OA/officeSupplyConsumables/logic/action/createOSCBaseInfoAction"/>  
      <!--     <rule xid="rule2"> 
        <col name="fCode" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default4">true()</expr>  
            <message xid="default5"><![CDATA[用品编码不能为空！]]></message> 
          </required> 
        </col> 
      </rule>  -->  
      <rule xid="rule5"> 
        <col name="fCode" xid="ruleCol9"> 
          <required xid="required8"> 
            <expr xid="default21">true</expr>  
            <message xid="default22"/> 
          </required> 
        </col>  
        <col name="fName" xid="ruleCol10"> 
          <required xid="required9"> 
            <expr xid="default23">true</expr>  
            <message xid="default24"/> 
          </required> 
        </col>  
        <col name="fPrice" xid="ruleCol11"> 
          <required xid="required10"> 
            <expr xid="default25">true</expr>  
            <message xid="default26">单价必填</message> 
          </required> 
        </col>  
        <col name="fKindID" xid="ruleCol12"> 
          <required xid="required11"> 
            <expr xid="default27">true</expr>  
            <message xid="default28"/> 
          </required> 
        </col>  
        <col name="fUnitID" xid="ruleCol13"> 
          <required xid="required12"> 
            <expr xid="default29">true</expr>  
            <message xid="default30"/> 
          </required> 
        </col>  
        <col name="fCreateTime" xid="ruleCol1"> 
          <readonly xid="readonly1"> 
            <expr xid="default4">true</expr> 
          </readonly> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dKind"
      concept="OA_Pub_BaseCode" limit="-1"> 
      <reader xid="default6" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='办公用品类别']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dUnit"
      concept="OA_Pub_BaseCode" limit="-1"> 
      <reader xid="default7" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="filter1" xid="filter2"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='办公用品计量单位']]></filter> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel2"> 
        <div class="x-panel-content" xid="content2"> 
          <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
            xid="toolBar1"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
              onClick="{'operation':'mainData.save'}" xid="button1"> 
              <i xid="i1"/>  
              <span xid="span1">保存</span> 
            </a> 
          </div>  
          <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
            xid="form2"> 
            <div component="$UI/system/components/bootstrap/row/row" class="row"
              xid="row1"> 
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit1"> 
                  <label class="x-label" style="width:100px;" xid="label1"><![CDATA[用品编码]]></label>  
                  <div class="x-edit" xid="div1"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="input4" bind-ref="mainData.ref('fCode')"/> 
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" style="width:100px;" xid="label2">用品名称</label>  
                  <div class="x-edit" xid="div2"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="input1" bind-ref="mainData.ref('fName')"/> 
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" style="width:100px;" xid="label2">用品类别</label>  
                  <div class="x-edit" xid="div2"> 
                    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                      xid="gridSelect1" bind-ref="mainData.ref('fKindID')" bind-labelRef="mainData.ref('fKindName')"> 
                      <option xid="option1" data="dKind" value="OA_Pub_BaseCode"
                        label="fName"/> 
                    </div> 
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" style="width:100px;" xid="label2">计量单位</label>  
                  <div class="x-edit" xid="div2"> 
                    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                      xid="gridSelect2" bind-ref="mainData.ref('fUnitID')" bind-labelRef="mainData.ref('fUnitName')"> 
                      <option xid="option2" data="dUnit" value="OA_Pub_BaseCode"
                        label="fName"/>
                    </div>
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" style="width:100px;" xid="label2">用品单价</label>  
                  <div class="x-edit" xid="div2"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="input10" bind-ref="mainData.ref('fPrice')"/> 
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" style="width:100px;" xid="controlLabel8"
                    bind-text="mainData.label(&quot;fSpecType&quot;)">label</label>  
                  <div class="x-edit" xid="div2"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="input11" bind-ref="mainData.ref('fSpecType')"/> 
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" style="width:100px;" xid="controlLabel8"
                    bind-text="mainData.label(&quot;fStock&quot;)">label</label>  
                  <div class="x-edit" xid="div2"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="input11" bind-ref="mainData.ref('fStock')"/> 
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" style="width:100px;" xid="controlLabel8"
                    bind-text="mainData.label(&quot;fUseStatusName&quot;)">label</label>  
                  <div class="x-edit" xid="div2"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="input11" bind-ref="mainData.ref('fUseStatusName')"/> 
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" style="width:100px;" xid="controlLabel8"
                    bind-text="mainData.label(&quot;fCreatePsnName&quot;)">label</label>  
                  <div class="x-edit" xid="div2"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="input11" bind-ref="mainData.ref('fCreatePsnName')"/> 
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" style="width:100px;" xid="controlLabel8"
                    bind-text="mainData.label(&quot;fDescription&quot;)">label</label>  
                  <div class="x-edit" xid="div2"> 
                    <textarea component="$UI/system/components/justep/textarea/textarea"
                      class="form-control" xid="textarea1" bind-ref="mainData.ref('fDescription')"/> 
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" style="width:100px;" xid="controlLabel12"><![CDATA[提交时间]]></label>  
                  <div class="x-edit" xid="div2"> 
                    <input component="$UI/system/components/justep/input/input"
                      class="form-control" xid="input15" bind-ref="mainData.ref('fCreateTime')"
                      format="yyyy-MM-dd hh:mm"/> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
