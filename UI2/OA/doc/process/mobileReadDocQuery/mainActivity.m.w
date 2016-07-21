<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:415px;top:287px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDocRead"
      concept="OA_DC_Doc" orderBy="fCreateTime:desc" autoLoad="false" confirmDelete="false"
      confirmRefresh="false"> 
      <reader xid="default1" action="/OA/doc/logic/action/queryReadDocAction"/>  
      <calculateRelation relation="recNO" xid="calculateRelation1" type="Integer"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDocNoRead"
      concept="OA_DC_Doc" orderBy="fCreateTime:desc" autoLoad="false" confirmDelete="false"
      confirmRefresh="false"> 
      <reader xid="default3" action="/OA/doc/logic/action/queryReadDocAction"/>  
      <calculateRelation relation="recNO" xid="calculateRelation2" type="Integer"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="numData" idColumn="readNum"
      autoNew="true"> 
      <column label="readNum" name="readNum" type="String" xid="xid1"/>  
      <column label="noreadNum" name="noreadNum" type="String" xid="xid2"/>  
      <column label="col4" name="findStr" type="String" xid="column1"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog" src="$UI/OA/doc/process/mobileReadDocQuery/detailActivity.m.w" onClose="detailDialogClose" style="left:132px;top:47px;"></span><div component="$UI/system/components/justep/panel/panel" class="x-panel x-card x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="待阅公文"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="backBtn" style="width:40px;" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i8" class="icon-chevron-left"/>  
            <span xid="span5"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">待阅公文</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" xid="content1"> 
  
    
          <div class="input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="smartFilter1" onFilter="smartFilter1Filter"> 
            <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
              xid="span1"> 
              <i class="icon-android-search" xid="i1"/> 
            </span>  
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input1"/>  
            <span class="input-group-addon x-smartFilter-clear" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))"
              bind-visible="$model.comp($element.parentElement).searchText.get() != ''"
              xid="span2"> 
              <i class="icon-close-circled" xid="i2"/> 
            </span> 
          </div> 
      
        <div class="x-panel-content xui-hignlight-selected x-scroll-view" xid="content2"
          style="bottom: 0px;"> 
          <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
            xid="scrollView1"> 
            <div class="x-content-center x-pull-down container" xid="div4"> 
              <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i4"/>  
              <span class="x-pull-down-label" xid="span4">下拉刷新...</span> 
            </div>  
            <div class="x-scroll-content" xid="div5"> 
             <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
              xid="panel2" > 
              <div xid="div7" class="title-row" bind-html="&quot;未阅 (&quot; + $model.numData.getValue('noreadNum') + &quot;)&quot;"
                bind-visible="$model.numData.getValue('noreadNum')&gt;0">未阅</div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="noReadList" data="dDocNoRead" limit="200" disablePullToRefresh="true"
                disableInfiniteLoad="true" bind-click="listClick" filter='js:$model.dataFilter($row)'> 
                <ul class="x-list-template" xid="listTemplateUl5"> 
                  <li xid="li5" class="x-flex list-row"> 
                    <div xid="col32" class="head-pic-data"> 
                      <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                        xid="orgImage1" orgKind="person" bind-ref="ref('fCreatePsnID')"> 
                        <div class="x-blob-bar" xid="div8"> 
                          <i class="x-blob-edit icon-compose" xid="i6"/>  
                          <i class="x-blob-del icon-close-round" xid="i3"/> 
                        </div>  
                        <img class="x-blob-img x-autofill" xid="image1"/> 
                      </div>  
                      <div component="$UI/system/components/justep/output/output"
                        bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                        xid="output81" bind-ref="ref('fCreatePsnName')"/> 
                    </div>  
                    <div class="x-flex1" xid="col33"> 
                      <div _component="$UI/system/components/justep/row/row"
                        class="x-flex" xid="row11"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-flex1 x-output title-data" xid="output9" bind-ref="ref('fCreatePsnName')"/>  
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output right-content-data2" xid="output5" bind-ref="ref('fCreateTime')"/> 
                      </div>  
                      <div _component="$UI/system/components/justep/row/row"
                        class="x-flex" xid="row12"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-flex1 x-output content-data" xid="output10" bind-ref="ref('fTitle')"/> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div>  
              </div>
              
              <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
              xid="panel3" > 
              <div xid="div9" class="title-row" bind-html="&quot;已阅 (&quot; + $model.numData.getValue('readNum') + &quot;)&quot;"
                bind-visible="$model.numData.getValue('readNum')&gt;0">已阅</div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="readlist" data="dDocRead" limit="200" disablePullToRefresh="true"
                disableInfiniteLoad="true" bind-click="readlistClick" filter='js:$model.dataFilter($row)'> 
                <ul class="x-list-template" xid="listTemplateUl1"> 
                  <li xid="li1" class="x-flex list-row"> 
                    <div xid="div13" class="head-pic-data"> 
                      <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                        xid="orgImage2" orgKind="person" bind-ref="ref('fCreatePsnID')"> 
                        <div class="x-blob-bar" xid="div14"> 
                          <i class="x-blob-edit icon-compose" xid="i5"/>  
                          <i class="x-blob-del icon-close-round" xid="i7"/> 
                        </div>  
                        <img class="x-blob-img x-autofill" xid="image2"/> 
                      </div>  
                      <div component="$UI/system/components/justep/output/output"
                        bind-visible="val('sMessageNumber') &gt; 0" class="x-output message-count"
                        xid="output1" bind-ref="ref('fCreatePsnName')"/> 
                    </div>  
                    <div class="x-flex1" xid="div10"> 
                      <div _component="$UI/system/components/justep/row/row"
                        class="x-flex" xid="div11"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-flex1 x-output title-data" xid="output4" bind-ref="ref('fCreatePsnName')"/>  
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output right-content-data2" xid="output6" bind-ref="ref('fCreateTime')"/> 
                      </div>  
                      <div _component="$UI/system/components/justep/row/row"
                        class="x-flex" xid="div12"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-flex1 x-output content-data" xid="output2" bind-ref="ref('fTitle')"/> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
              </div>
            </div>  
            <div class="x-content-center x-pull-up" xid="div6"> 
              <span class="x-pull-up-label" xid="span3">加载更多...</span> 
            </div> 
          </div> 
        </div> 
     
    </div> 
  </div> 
</div>
