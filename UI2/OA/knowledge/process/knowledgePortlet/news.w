<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:230px;top:223px;"
    onLoad="modelLoad" onModelConstruct="modelModelConstruct"> 
    <div component="$UI/system/components/justep/data/bizData" xid="main" concept="OA_KM_Knowledge"
      limit="6" autoLoad="false"> 
      <reader xid="default2" action="/OA/knowledge/logic/action/queryKMKnowledgeAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_KM_Knowledge.fSmallPic is not null ]]></filter> 
    </div> 
  </div>  
  <div class="form-group" xid="formGroup2"> 
    <div class="col-sm-12" xid="col7" style="height:215px;"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel(bootstrap)"
        class="x-carousel carousel" xid="carousel"> 
        <ol class="carousel-indicators" xid="ol1"/>  
        <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
          active="0" slidable="true" wrap="true" swipe="true" xid="contents" style="height:100%;width:100%;"> 
          <div class="x-contents-content" xid="contentPage1" style="height:100%;width:100%;"> 
            <div component="$UI/system/components/justep/attachment/attachmentImage"
              access="r" xid="attachmentImage1" subPath="concat('业务附件/OA/知识中心',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"
              bind-ref="main.ref('fSmallPic')" style="width:100%;height:200px;"> 
              <div class="x-attachment x-attachment-image" xid="div23"> 
                <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}"
                  xid="div24"> 
                  <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)"
                    xid="image9"/> 
                </div>  
                <div class="x-doc-process" xid="div25"> 
                  <div class="progress-bar x-doc-process-bar" role="progressbar"
                    style="width:0%;" xid="div26"/> 
                </div>  
                <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)"
                  xid="div27"> 
                  <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                    xid="div28"/> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="x-contents-content" xid="contentPage2" style="height:100%;width:100%;"> 
            <div component="$UI/system/components/justep/attachment/attachmentImage"
              access="duud" xid="attachmentImage2" bind-ref="main.ref('fSmallPic')"
              subPath="concat('业务附件/OA/知识中心',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"
              style="height:200px;width:100%;"> 
              <div class="x-attachment x-attachment-image" xid="div29"> 
                <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}"
                  xid="div30"> 
                  <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)"
                    xid="image10"/> 
                </div>  
                <div class="x-doc-process" xid="div31"> 
                  <div class="progress-bar x-doc-process-bar" role="progressbar"
                    style="width:0%;" xid="div32"/> 
                </div>  
                <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)"
                  xid="div33"> 
                  <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                    xid="div34"/> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="x-contents-content" xid="contentPage3"> 
            <div component="$UI/system/components/justep/attachment/attachmentImage"
              access="duud" xid="attachmentImage3" bind-ref="main.ref('fSmallPic')"
              subPath="concat('业务附件/OA/知识中心',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"
              style="height:200px;width:100%;"> 
              <div class="x-attachment x-attachment-image" xid="div29_1"> 
                <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}"
                  xid="div30_1"> 
                  <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)"
                    xid="image10_1"/>  
                  <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2"
                    class="x-remove-barget" xid="a7"/> 
                </div>  
                <div class="x-doc-process" xid="div31_1"> 
                  <div class="progress-bar x-doc-process-bar" role="progressbar"
                    style="width:0%;" xid="div32_1"/> 
                </div>  
                <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)"
                  xid="div33_1"> 
                  <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                    xid="div34_1"/> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div>  
        <!--  <a class="left carousel-control" role="button" xid="a1"> 
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"
            xid="span1"/>  
          <span class="sr-only" xid="span2">Previous</span> 
        </a>  
        <a class="right carousel-control" role="button" xid="a2"> 
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
            xid="span3"/>  
          <span class="sr-only" xid="span4">Next</span> 
        </a>  --> 
      </div> 
    </div>  
    <div class="col-sm-12" xid="col11" style="height:260px;"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list" data="main"> 
        <div class="x-list-content"> 
          <ul class="x-list-template"> 
            <li class="list" bind-click="li2Click"> 
              <div class="x-row x-responsive-sm" component="$UI/system/components/justep/row/row"
                style="height:35px;"> 
                <div class="x-col" xid="col1"> 
                  <img src="1.png"/> 
                </div>  
                <div class="x-col x-col-90"> 
                  <span component="$UI/system/components/justep/output/output"
                    data="taskData" bind-ref="ref('fTitle')"/> 
                </div> 
              </div> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
