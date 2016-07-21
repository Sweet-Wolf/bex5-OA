<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:420px;top:10px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dBoardroom"
      concept="OA_MT_Boardroom" limit="1" columns=""> 
      <reader xid="default1" action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/>  
      <writer xid="default2" action="/OA/meeting/logic/action/saveMTBOARDROOMAction"/>  
      <creator xid="default3" action="/OA/meeting/logic/action/createMTBOARDROOMAction"/>  
      <rule xid="rule1"> 
        <col name="fType" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default7">js:true</expr>  
            <message xid="default8">类型不能为空</message>
          </required> 
        </col>  
        <col name="fName" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default9">js:true</expr>  
            <message xid="default10">名称不能为空</message>
          </required> 
        </col>  
        <readonly xid="readonly1"> 
          <expr xid="default5">$model.dataReadonly($model)</expr>
        </readonly> 
      </rule>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dType"
      concept="OA_Pub_BaseCode" limit="-1" orderBy="fCode asc" autoLoad="true"> 
      <reader xid="default4" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='会议室类型']]></filter> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1">
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="新增" xid="button1" onClick="{operation:'dBoardroom.new'}"> 
          <i xid="i1"/>  
          <span xid="span1">新增</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="删除" xid="button2" onClick="{operation:'dBoardroom.delete'}"> 
          <i xid="i2"/>  
          <span xid="span2">删除</span>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          label="保存" xid="button3" onClick="{operation:'dBoardroom.save'}"> 
          <i xid="i3"/>  
          <span xid="span3">保存</span>
        </a>
      </div>
    </div>
    <div class="x-panel-content" xid="content1"> 
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form1"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row2"> 
          <div class="col col-xs-8 col-sm-8 col-md-8 col-lg-8" xid="col15">
            <div component="$UI/system/components/bootstrap/row/row" class="row"
              xid="row1"> 
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1">
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit1"> 
                  <label class="x-label" xid="label1" style="width:100px;" bind-text="dBoardroom.label('fCode')"/>  
                  <div class="x-edit" xid="div7">
                    <input xid="fCode" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
                      bind-ref="dBoardroom.ref('fCode')"/>
                  </div>
                </div>
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit2"> 
                  <label class="x-label" xid="label2" style="width:100px;" bind-text="dBoardroom.label('fName')"/>  
                  <div class="x-edit" xid="div8"> 
                    <input xid="fName" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
                      bind-ref="dBoardroom.ref('fName')"/>
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelInput1"> 
                  <label class="x-label" xid="label3" style="width:100px;" bind-text="dBoardroom.label('fType')"/>  
                  <div class="x-edit" xid="div9"> 
                    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                      xid="gridSelect1" bind-ref="dBoardroom.ref('fType')"> 
                      <option xid="option1" data="dType" value="fName" label="fName"/>
                    </div>
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelInput2"> 
                  <label class="x-label" xid="label4" style="width:100px;" bind-text="dBoardroom.label('fHoldNum')"/>  
                  <div class="x-edit" xid="div10"> 
                    <input xid="fHoldNum" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
                      bind-ref="dBoardroom.ref('fHoldNum')"/>
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelEdit3"> 
                  <label class="x-label" xid="label5" style="width:100px;" bind-text="dBoardroom.label('fUse')"/>  
                  <div class="x-edit" xid="div11"> 
                    <input xid="fUse" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
                      bind-ref="dBoardroom.ref('fUse')"/>
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelInput3"> 
                  <label class="x-label" xid="label6" style="width:100px;" bind-text="dBoardroom.label('fAddress')"/>  
                  <div class="x-edit" xid="div12"> 
                    <input xid="fAddress" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
                      bind-ref="dBoardroom.ref('fAddress')"/>
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelInput4"> 
                  <label class="x-label" xid="label7" style="width:100px;" bind-text="dBoardroom.label('fFloor')"/>  
                  <div class="x-edit" xid="div13"> 
                    <input xid="fFloor" class="form-control xui-autofill" component="$UI/system/components/justep/input/input"
                      bind-ref="dBoardroom.ref('fFloor')"/>
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelInput5"> 
                  <label class="x-label" xid="label8" style="width:100px;" bind-text="dBoardroom.label('fBaseConfig')"/>  
                  <div class="x-edit" xid="div14"> 
                    <input xid="fBaseConfig" class="form-control xui-autofill"
                      component="$UI/system/components/justep/input/input" bind-ref="dBoardroom.ref('fBaseConfig')"/>
                  </div> 
                </div> 
              </div>  
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelInput6"> 
                  <label class="x-label" xid="label9" style="width:100px;" bind-text="dBoardroom.label('fEquipment')"/>  
                  <div class="x-edit" xid="div15"> 
                    <input xid="fEquipment" class="form-control xui-autofill"
                      component="$UI/system/components/justep/input/input" bind-ref="dBoardroom.ref('fEquipment')"/>
                  </div> 
                </div> 
              </div> 
            </div>
          </div>  
          <div class="col col-xs-4 col-sm-4 col-md-4 col-lg-4" xid="col16">
            <div component="$UI/system/components/justep/attachment/attachmentImage"
              access="duud" xid="BizFile" bind-ref="dBoardroom.ref('fPicture')" subPath="concat('业务附件/OA/会议室管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"
              style="height:100%;width:100%;"> 
              <div class="x-attachment x-attachment-image" xid="div1"> 
                <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}"
                  xid="div2"> 
                  <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)"
                    xid="image1"/>  
                  <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2"
                    class="x-remove-barget" xid="a1"/>
                </div>  
                <div class="x-doc-process" xid="div3"> 
                  <div class="progress-bar x-doc-process-bar" role="progressbar"
                    style="width:0%;" xid="div4"/>
                </div>  
                <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)"
                  xid="div5"> 
                  <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                    xid="div6"/>
                </div> 
              </div> 
            </div>
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col18">
            <div component="$UI/system/components/bootstrap/row/row" class="row"
              xid="row3"> 
              <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelInput7"> 
                  <label class="x-label" xid="label10" style="width:100px;" bind-text="dBoardroom.label('fDescription')"/>  
                  <div class="x-edit" xid="div16"> 
                    <textarea component="$UI/system/components/justep/textarea/textarea"
                      class="form-control" xid="textarea1" bind-ref="dBoardroom.ref('fDescription')"/>
                  </div> 
                </div> 
              </div>
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelInput8"> 
                  <label class="x-label" xid="label11" style="width:100px;" bind-text="dBoardroom.label('fDutyDeptName')"/>  
                  <div class="x-edit" xid="div17"> 
                    <input xid="orgDeptSelect" class="form-control xui-autofill"
                      component="$UI/system/components/justep/input/input" bind-ref="dBoardroom.ref('fDutyDeptName')"/>
                  </div> 
                </div> 
              </div>
              <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
                <div component="$UI/system/components/justep/labelEdit/labelEdit"
                  class="x-label-edit" xid="labelInput9"> 
                  <label class="x-label" xid="label12" style="width:100px;" bind-text="dBoardroom.label('fDutyPsnName')"/>  
                  <div class="x-edit" xid="div18"> 
                    <input xid="orgPsmSelect" class="form-control xui-autofill"
                      component="$UI/system/components/justep/input/input" bind-ref="dBoardroom.ref('fDutyPsnName')"/>
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
