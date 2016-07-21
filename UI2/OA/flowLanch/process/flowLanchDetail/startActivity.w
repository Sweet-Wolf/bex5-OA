<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:17px;top:79px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="mainData" concept="OA_FL_FlowLanchApply" limit="-1"> 
      <reader xid="default1" action="/OA/flowLanch/logic/action/queryFlowLanchApplyAction"/>  
      <writer xid="default2" action="/OA/flowLanch/logic/action/saveFlowLanchApplyAction"/>  
      <creator xid="default3" action="/OA/flowLanch/logic/action/createFlowLanchApplyAction"/> 
    <rule xid="rule1">
   <readonly xid="readonly1">
    <expr xid="default4">true</expr></readonly> </rule></div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData" autoClose="false" autoStart="false" autoSave="false" autoFilter="false"/>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1"> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="流程图" xid="button1" icon="icon-android-image" onClick="chartBtnClick"> 
      <i xid="i1" class="icon-android-image"/>  
      <span xid="span1">流程图</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="流程记录" xid="button2" icon="icon-android-note" onClick="recordBtnClick"> 
      <i xid="i2" class="icon-android-note"/>  
      <span xid="span2">流程记录</span> 
    </a> 
  </div>  
  <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col1"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit1"> 
          <label class="x-label" xid="label1" style="width:100px;">申请信息</label>  
          <div class="x-edit" xid="div1"/>
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit2"> 
          <label class="x-label" xid="label2" style="width:100px;">NO:</label>  
          <div class="x-edit" xid="div2"> 
            <input class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fNO')" xid="input1"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col3"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit3"> 
          <label class="x-label" xid="label3" style="width:100px;" bind-text="mainData.label('fTitle')"/>  
          <div class="x-edit" xid="div3"> 
            <input xid="fTitle" class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fTitle')"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit6"> 
          <label class="x-label" xid="label4" style="width:100px;" bind-text="mainData.label('fRemark')">说明</label>  
          <div class="x-edit" xid="div6"> 
            <textarea component="$UI/system/components/justep/textarea/textarea"
              class="form-control" xid="textarea1" bind-ref="mainData.ref('fRemark')"/>
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit5"> 
          <label class="x-label" xid="label5" style="width:100px;">正文</label>  
          <div class="x-edit" xid="div5"> 
            <div component="$UI/system/components/justep/attachment/attachmentSimple"
              access="duud" xid="attachmentSimple1" bind-ref="mainData.ref('fExtendStr9')"> 
              <div class="x-attachment" xid="div10"> 
                <div class="x-attachment-content x-card-border" xid="div11"> 
                  <div class="x-doc-process" xid="div12"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="div13"/>
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div14"> 
                    <div class="x-attachment-cell" xid="div15"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div16"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a1"/>
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
                    xid="div17"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
                      xid="div18"/>
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div19"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')"
                      xid="div20"/>
                  </div>  
                  <div style="clear:both;" xid="div21"/>
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit4"> 
          <label class="x-label" xid="label6" style="width:100px;" bind-text="mainData.label('fApplyDeptName')"/>  
          <div class="x-edit" xid="div4"> 
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="input2" bind-ref="mainData.ref('fApplyDeptName')"></input></div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit9"> 
          <label class="x-label" xid="label7" style="width:100px;" bind-text="mainData.label('fApplyPsnName')"/>  
          <div class="x-edit" xid="div9"> 
            <input component="$UI/system/components/justep/input/input" class="form-control" xid="input3" bind-ref="mainData.ref('fApplyPsnName')"></input></div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit8"> 
          <label class="x-label" xid="label8" style="width:100px;" bind-text="mainData.label('fApplyDate')"/>  
          <div class="x-edit" xid="div8"> 
            <input class="form-control" component="$UI/system/components/justep/input/input"
              bind-ref="mainData.ref('fApplyDate')" xid="input5"/>
          </div> 
        </div> 
      </div>  
      <div xid="col8" class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelEdit7"> 
          <label class="x-label" xid="label9" style="width:100px;" bind-text="mainData.label('fAttachment')"/>  
          <div class="x-edit" xid="div7"> 
            <div component="$UI/system/components/justep/attachment/attachmentSimple"
              access="duud" xid="attachmentSimple2" bind-ref="mainData.ref('fAttachment')"> 
              <div class="x-attachment" xid="div22"> 
                <div class="x-attachment-content x-card-border" xid="div23"> 
                  <div class="x-doc-process" xid="div24"> 
                    <div class="progress-bar x-doc-process-bar" role="progressbar"
                      style="width:0%;" xid="div25"/>
                  </div>  
                  <div data-bind="foreach:$attachmentItems" xid="div26"> 
                    <div class="x-attachment-cell" xid="div27"> 
                      <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}"
                        xid="div28"> 
                        <a data-bind="visible:$model.$state.get() == 'remove'"
                          class="x-remove-barget" xid="a2"/>
                      </div> 
                    </div> 
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'"
                    xid="div29"> 
                    <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'"
                      xid="div30"/>
                  </div>  
                  <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                    xid="div31"> 
                    <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')"
                      xid="div32"/>
                  </div>  
                  <div style="clear:both;" xid="div33"/>
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>
</div>
