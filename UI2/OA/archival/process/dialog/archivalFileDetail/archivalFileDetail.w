<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:374px;top:-3px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="archivalData" concept="OA_AM_Archival" confirmRefresh="false"> 
      <reader xid="default1" action="/OA/archival/logic/action/queryAMArchivalAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span><div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs2"> 
    <ul class="nav nav-tabs" xid="ul2"> 
      <li class="active" xid="li3"> 
        <a content="tabContent3" xid="tabItem3"><![CDATA[基本信息]]></a> 
      </li>  
      <li role="presentation" xid="li4"> 
        <a content="tabContent4" xid="tabItem4"><![CDATA[附件信息]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div2"> 
      <div class="tab-pane active" xid="tabContent3"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col1"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit1"> 
              <label class="x-label" xid="label1" style="width:100px;" bind-text="archivalData.label('fTitle')"/>  
              <div class="x-edit" xid="div1"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input1" bind-ref="archivalData.ref('fTitle')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit2"> 
              <label class="x-label" xid="label2" style="width:100px;" bind-text="archivalData.label('fStateName')"/>  
              <div class="x-edit" xid="div3"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input2" bind-ref="archivalData.ref('fStateName')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-8" xid="col3"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit3"> 
              <label class="x-label" xid="label3" style="width:100px;" bind-text="archivalData.label('fArchivalNO')"/>  
              <div class="x-edit" xid="div3"> 
                <input xid="fBorrowTime" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fArchivalNO')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit6"> 
              <label class="x-label" xid="label4" style="width:100px;" bind-text="archivalData.label('fFileNO')"/>  
              <div class="x-edit" xid="div6"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input3" bind-ref="archivalData.ref('fFileNO')"/> 
              </div> 
            </div> 
          </div>  
          <div xid="col6" class="col col-xs-12 col-sm-6 col-md-6 col-lg-4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit5"> 
              <label class="x-label" xid="label5" style="width:100px;" bind-text="archivalData.label('fSubTitle')"/>  
              <div class="x-edit" xid="div5"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input4" bind-ref="archivalData.ref('fSubTitle')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit4"> 
              <label class="x-label" xid="label6" style="width:100px;" bind-text="archivalData.label('fKeyWord')"/>  
              <div class="x-edit" xid="div4"> 
                <input xid="fEffect" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fKeyWord')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit9"> 
              <label class="x-label" xid="label7" style="width:100px;" bind-text="archivalData.label('fMenuNO')"/>  
              <div class="x-edit" xid="div9"> 
                <input xid="fBizStateName" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fMenuNO')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit8"> 
              <label class="x-label" xid="label8" style="width:100px;" bind-text="archivalData.label('fDocumentNO')"/>  
              <div class="x-edit" xid="div8"> 
                <input xid="fCreateDeptName" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fDocumentNO')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit7"> 
              <label class="x-label" xid="label9" style="width:100px;" bind-text="archivalData.label('fMicroNO')"/>  
              <div class="x-edit" xid="div7"> 
                <input xid="fCreatePsnName" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fMicroNO')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit10"> 
              <label class="x-label" xid="label10" style="width:100px;" bind-text="archivalData.label('fPageNO')"/>  
              <div class="x-edit" xid="div10"> 
                <input xid="fCreateTime" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fPageNO')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput4"> 
              <label class="x-label" xid="label18" style="width:100px;" bind-text="archivalData.label('fFondsName')"/>  
              <div class="x-edit" xid="div18"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input14" bind-ref="archivalData.ref('fFondsName')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col18"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput3"> 
              <label class="x-label" xid="label19" style="width:100px;" bind-text="archivalData.label('fExtendStr9')"/>  
              <div class="x-edit" xid="div17"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input12" bind-ref="archivalData.ref('fExtendStr9')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col17"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput2"> 
              <label class="x-label" xid="label20" style="width:100px;" bind-text="archivalData.label('fRollName')"/>  
              <div class="x-edit" xid="div17"> 
                <input xid="input9" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fRollName')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelTextarea2"> 
              <label class="x-label" xid="label15" style="width:100px;" bind-text="archivalData.label('fAMLevel')"/>  
              <div class="x-edit" xid="div14"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input11" bind-ref="archivalData.ref('fAMLevel')"/> 
              </div> 
            </div> 
          </div>  
          <div xid="col15" class="col col-xs-12 col-sm-6 col-md-6 col-lg-4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelTextarea1"> 
              <label class="x-label" xid="label14" style="width:100px;" bind-text="archivalData.label('fAMYear')"/>  
              <div class="x-edit" xid="div15"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input13" bind-ref="archivalData.ref('fAMYear')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput1"> 
              <label class="x-label" xid="label13" style="width:100px;" bind-text="archivalData.label('fSecret')"/>  
              <div class="x-edit" xid="div16"> 
                <input xid="input8" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fSecret')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput5"> 
              <label class="x-label" xid="label12" style="width:100px;" bind-text="archivalData.label('fAMDate')"/>  
              <div class="x-edit" xid="div11"> 
                <input xid="input10" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fAMDate')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col19"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput6"> 
              <label class="x-label" xid="label17" style="width:100px;" bind-text="archivalData.label('fCarry')"/>  
              <div class="x-edit" xid="div12"> 
                <input xid="input6" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fCarry')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col20"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput7"> 
              <label class="x-label" xid="label16" style="width:100px;" bind-text="archivalData.label('fKeepLimit')"/>  
              <div class="x-edit" xid="div13"> 
                <input xid="input5" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fKeepLimit')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput8"> 
              <label class="x-label" xid="label11" style="width:100px;" bind-text="archivalData.label('fFileDeptName')"/>  
              <div class="x-edit" xid="div19"> 
                <input xid="input7" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fFileDeptName')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col21"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput10"> 
              <label class="x-label" xid="label21" style="width:100px;" bind-text="archivalData.label('fResponsibleName')"/>  
              <div class="x-edit" xid="div21"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input16" bind-ref="archivalData.ref('fResponsibleName')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col22"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput9"> 
              <label class="x-label" xid="label22" style="width:100px;" bind-text="archivalData.label('fFileDate')"/>  
              <div class="x-edit" xid="div20"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input15" bind-ref="archivalData.ref('fFileDate')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col28"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput15"> 
              <label class="x-label" xid="label30" style="width:100px;" bind-text="archivalData.label('fNum')"/>  
              <div class="x-edit" xid="div29"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input26" bind-ref="archivalData.ref('fNum')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col30"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput14"> 
              <label class="x-label" xid="label31" style="width:100px;" bind-text="archivalData.label('fUnit')"/>  
              <div class="x-edit" xid="div28"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input24" bind-ref="archivalData.ref('fUnit')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col29"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput13"> 
              <label class="x-label" xid="label32" style="width:100px;" bind-text="archivalData.label('fVersionCode')"/>  
              <div class="x-edit" xid="div28"> 
                <input xid="input21" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fVersionCode')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col25"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput19"> 
              <label class="x-label" xid="label27" style="width:100px;" bind-text="archivalData.label('fRoom')"/>  
              <div class="x-edit" xid="div25"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input23" bind-ref="archivalData.ref('fRoom')"/>
              </div> 
            </div> 
          </div>  
          <div xid="col27" class="col col-xs-12 col-sm-6 col-md-6 col-lg-4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput11"> 
              <label class="x-label" xid="label26" style="width:100px;" bind-text="archivalData.label('fChest')"/>  
              <div class="x-edit" xid="div26"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input25" bind-ref="archivalData.ref('fChest')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col24"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput12"> 
              <label class="x-label" xid="label25" style="width:100px;" bind-text="archivalData.label('fGrid')"/>  
              <div class="x-edit" xid="div27"> 
                <input xid="input20" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fGrid')"/>
              </div> 
            </div> 
          </div>  
          <div xid="col26" class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput16"> 
              <label class="x-label" xid="label24" style="width:100px;" bind-text="archivalData.label('fRemark')"/>  
              <div class="x-edit" xid="div22"> 
                <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="textarea1" bind-ref="archivalData.ref('fRemark')" style="height:100px;"></textarea></div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col31"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput17"> 
              <label class="x-label" xid="label29" style="width:100px;" bind-text="archivalData.label('fCreateDeptName')"/>  
              <div class="x-edit" xid="div23"> 
                <input xid="input18" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fCreateDeptName')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col32"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput18"> 
              <label class="x-label" xid="label28" style="width:100px;" bind-text="archivalData.label('fCreatePsnName')"/>  
              <div class="x-edit" xid="div24"> 
                <input xid="input17" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fCreatePsnName')"/>
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col23"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelInput20"> 
              <label class="x-label" xid="label23" style="width:100px;" bind-text="archivalData.label('fCreateTime')"/>  
              <div class="x-edit" xid="div30"> 
                <input xid="input19" class="form-control" component="$UI/system/components/justep/input/input"
                  bind-ref="archivalData.ref('fCreateTime')" format="yyyy-MM-dd"/>
              </div> 
            </div> 
          </div>
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent4"><div component="$UI/system/components/justep/attachment/attachmentSimple" access="duud" xid="attachmentSimple" bind-ref="archivalData.ref('fDocLink')">
   <div class="x-attachment" xid="div31">
    <div class="x-attachment-content x-card-border" xid="div32">
     <div class="x-doc-process" xid="div33">
      <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div34"></div></div> 
     <div data-bind="foreach:$attachmentItems" xid="div35">
      <div class="x-attachment-cell" xid="div36">
       <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{backgroundImage:($model.previewPicture.bind($model,$object))()}" xid="div37">
        <a data-bind="visible:$model.$state.get() == 'remove'" class="x-remove-barget" xid="a1"></a></div> </div> </div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload'" xid="div38">
      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload'" xid="div39"></div></div> 
     <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0" xid="div40">
      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove')" xid="div41"></div></div> 
     <div style="clear:both;" xid="div42"></div></div> </div> </div></div> 
    </div> 
  </div> 
</div>
