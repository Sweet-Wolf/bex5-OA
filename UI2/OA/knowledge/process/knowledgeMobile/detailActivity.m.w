<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window"
  design="device:mobile" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:99px;top:297px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dKnowledge"
      concept="OA_KM_Knowledge" limit="1"> 
      <reader xid="default1" action="/OA/knowledge/logic/action/queryKMKnowledgeAction"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive" style="left:84px;top:64px;"/>  
  <div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert">
   <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button2">
    <i class="icon-loading-a" xid="i4"></i>
    <span xid="span511"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1">
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar2"> 
        <div class="x-titlebar-left" xid="div4" style="width:57px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="listBtn" onClick="listBtnClick" icon="icon-chevron-left" style="width:40px;"> 
            <i xid="i2" class="icon-chevron-left"/>  
            <span xid="span3"/>
          </a>  
          <div component="$UI/system/components/justep/bar/bar" class="x-bar"
            xid="bar1" style="width:99px;"/>
        </div>  
        <div class="x-titlebar-title" xid="div5"/>  
        <div class="x-titlebar-right reverse" xid="div6"/>
      </div>
    </div>  
    <div class="x-panel-content" xid="content2" style="display:none;">
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents"> 
        <div class="x-contents-content active" xid="detail"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel2"> 
            <div class="x-panel-content" xid="content3"> 
              <div class="form-horizontal container-fluid" xid="div35"> 
                <div component="$UI/system/components/bootstrap/row/row" class="row"
                  xid="row3"> 
                  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"
                    xid="col8" style="height:auto;"> 
                    <div xid="htmlDiv"/> 
                  </div>  
                  <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12"
                    xid="col13"> 
                    <div component="$UI/system/components/justep/attachment/attachment"
                      access="d" xid="attachment" bind-ref="dKnowledge.ref('fAttachment')"
                      bind-visible="$model.displayAttach()"> 
                      <div class="x-attachment" xid="div24"> 
                        <div class="x-attachment-content x-card-border" xid="div25"> 
                          <div class="x-doc-process" xid="div26"> 
                            <div class="progress-bar x-doc-process-bar" role="progressbar"
                              style="width:0%;" xid="progressBar1"/>
                          </div>  
                          <div data-bind="foreach:$attachmentItems" xid="div27"> 
                            <div class="x-attachment-cell" xid="div28"> 
                              <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                                xid="div29"> 
                                <a data-bind="visible:$model.$state.get() == 'remove'"
                                  class="x-remove-barget" xid="a7"/>
                              </div> 
                            </div> 
                          </div>  
                          <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                            xid="div30"> 
                            <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                              xid="div31"/>
                          </div>  
                          <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                            xid="div32"> 
                            <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                              xid="div33"/>
                          </div>  
                          <div style="clear:both;" xid="div34"/>
                        </div> 
                      </div> 
                    </div> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="urlcontent"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel2"> 
            <div class="x-panel-content" xid="content3"> 
              <div xid="divIframe" style="width:100%;border-style:none none none none;height:100%;"> 
                <iframe frameborder="1" name="staticIframe" id="staticIframe"
                  src="" xid="iframe1" height="99%" width="100%" style="border-style:none none none none;"/>
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="x-contents-content" xid="doccontent">
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel3"> 
            <div class="x-panel-content" xid="content4">
              <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
                xid="panel4"> 
                <div class="x-panel-top" xid="top4">
                  <div component="$UI/system/components/justep/output/output"
                    class="x-output" xid="output1" bind-ref="dKnowledge.ref('fTitle')"/>
                </div>  
                <div class="x-panel-content" xid="content5">
                  <div xid="documentDiv" style="width:100%;border-style:none none none none;height:100%;"> 
                    <iframe frameborder="1" name="docIframe" id="docIframe" src=""
                      xid="dociframe" style="border-style:none none none none;" height="99%"
                      width="100%"/>
                  </div>
                </div> 
              </div>
            </div>  
            <div class="x-panel-bottom" xid="bottom2" bind-visible="$model.displayAttach()">
              <div component="$UI/system/components/justep/attachment/attachment"
                access="d" xid="attachment1" bind-ref="dKnowledge.ref('fAttachment')"
                bind-visible="$model.displayAttach()"> 
                <div class="x-attachment" xid="div9"> 
                  <div class="x-attachment-content x-card-border" xid="div2"> 
                    <div class="x-doc-process" xid="div3"> 
                      <div class="progress-bar x-doc-process-bar" role="progressbar"
                        style="width:0%;" xid="progressBar2"/>
                    </div>  
                    <div data-bind="foreach:$attachmentItems" xid="div7"> 
                      <div class="x-attachment-cell" xid="div8"> 
                        <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                          xid="div1"> 
                          <a data-bind="visible:$model.$state.get() == 'remove'"
                            class="x-remove-barget" xid="a1"/>
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div11"> 
                      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                        xid="div10"/>
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                      xid="div13"> 
                      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                        xid="div14"/>
                    </div>  
                    <div style="clear:both;" xid="div12"/>
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
