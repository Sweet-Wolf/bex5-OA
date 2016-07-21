<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:102px;height:auto;left:316px;top:83px;"
    onLoad="modelLoad" onActive="modelActive"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="executorData" idColumn="fID" onCustomRefresh="executorDataCustomRefresh"> 
      <column label="fID" name="fID" type="String" xid="xid3"></column>
  <column label="fApplyPsnID" name="fApplyPsnID" type="String" xid="xid4"></column>
  <column label="fApplyPsnName" name="fApplyPsnName" type="String" xid="xid5"></column>
  <column label="fApplyDate" name="fApplyDate" type="DateTime" xid="xid6"></column>
  <column label="fSignatureTypeName" name="fSignatureTypeName" type="String" xid="xid7"></column>
  <column label="sStatusName" name="sStatusName" type="String" xid="xid11"></column>
  <column label="sID" name="sID" type="String" xid="xid7"></column>
  <column label="sEURL" name="sEURL" type="String" xid="xid8"></column>
  <column label="sProcess" name="sProcess" type="String" xid="xid9"></column>
  <column label="sActivity" name="sActivity" type="String" xid="xid10"></column>
  <column label="sActivity" name="sActivity" type="String" xid="xid10"></column>
  <column name="fNo" type="String" xid="xid27"></column></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="creatorData" idColumn="fID" onCustomRefresh="creatorDataCustomRefresh"> 
      <column label="fID" name="fID" type="String" xid="xid1"></column>
  <column label="fApplyPsnID" name="fApplyPsnID" type="String" xid="xid2"></column>
  <column label="fApplyPsnName" name="fApplyPsnName" type="String" xid="xid12"></column>
  <column label="fApplyDate" name="fApplyDate" type="DateTime" xid="xid13"></column>
  <column label="fSignatureTypeName" name="fSignatureTypeName" type="String" xid="xid28"></column>
  <column label="sStatusName" name="sStatusName" type="String" xid="xid14"></column>
  <column name="fNo" type="String" xid="xid29"></column></div>  
    <div component="$UI/system/components/justep/data/data" xid="numData" idColumn="croNum"
      autoNew="true"> 
      <column label="col0" name="croNum" type="String" xid="default4"/>  
      <column label="col1" name="exeNum" type="String" xid="default5"/>  
      <column label="col2" name="parNum" type="String" xid="default6"/>  
      <column label="col3" name="cloNum" type="String" xid="default7"/>  
      <column label="col4" name="findStr" type="String" xid="default8"/> 
    </div>  
    <!--     <div component="$UI/system/components/justep/data/bizData" xid="closeData" -->  
    <!--       concept="OA_SL_Signature" limit="-1" onCustomRefresh="closeDataCustomRefresh">  -->  
    <!--       <reader xid="default15" action="/OA/signature/logic/action/querySLSignatureAction"/>  -->  
    <!--     </div>   -->  
    <!--     <div component="$UI/system/components/justep/data/bizData" xid="parData" -->  
    <!--       concept="OA_SL_Signature" limit="-1" autoLoad="true">  -->  
    <!--       <reader xid="default15" action="/OA/signature/logic/action/querySLSignatureAction"/>  -->  
    <!--     </div>  -->  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="parData" idColumn="fID" onCustomRefresh="parDataCustomRefresh"> 
      <column label="fID" name="fID" type="String" xid="xid15"></column>
  <column name="fApplyPsnID" type="String" xid="xid16"></column>
  <column name="fApplyPsnName" type="String" xid="xid17"></column>
  <column name="fApplyDate" type="DateTime" xid="xid18"></column>
  <column name="fSignatureTypeName" type="String" xid="xid19"></column>
  <column name="sStatusName" type="String" xid="xid20"></column>
  <column name="fNo" type="String" xid="xid30"></column></div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="closeData" idColumn="fID" onCustomRefresh="closeDataCustomRefresh"> 
      <column name="fID" type="String" xid="xid21"></column>
  <column name="fApplyPsnID" type="String" xid="xid22"></column>
  <column name="fApplyPsnName" type="String" xid="xid23"></column>
  <column name="fApplyDate" type="DateTime" xid="xid24"></column>
  <column name="fSignatureTypeName" type="String" xid="xid25"></column>
  <column name="sStatusName" type="String" xid="xid26"></column>
  <column name="fNo" type="String" xid="xid31"></column></div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog"
    style="left:63px;top:448px;" src="detailActivity.m.w" forceRefreshOnOpen="true"
    routable="true"/>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="listTitleBar" title="请假管理"> 
        <div class="x-titlebar-left" xid="div1" style="width:83px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link x-card"
            xid="backBtn" icon="icon-chevron-left" onClick="backBtnClick"> 
            <i xid="i3" class="icon-chevron-left"/>  
            <span xid="span3"/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">请假管理</div>  
        <div class="x-titlebar-right reverse" xid="div3" style="width:124px;"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link x-card"
            xid="addBtn" icon="icon-plus-round" onClick="addBtnClick"> 
            <i xid="i4" class="icon-plus-round"/>  
            <span xid="span4"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" xid="content3"> 
      <div class="input-group smart-filter" component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter" onFilter="smartFilterFilter" style="margin:0 5px 10px;"> 
        <span class="oa-input-group-addon input-group-addon" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
          xid="span6"> 
          <i class="icon-android-search" xid="i7"/> 
        </span>  
        <input type="text" class="form-control" data-bind="valueUpdate: ['input', 'afterkeydown']"
          placeHolder="搜索" bind-value="$model.comp($element.parentElement).searchText"
          bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input2"/>  
        <span class="input-group-addon" bind-click="$model.comp($element.parentElement).clear.bind($model.comp($element.parentElement))"
          bind-visible="$model.comp($element.parentElement).searchText.get() != ''"
          xid="span7"> 
          <i class="icon-close-circled" xid="i8"/> 
        </span> 
      </div>  
      <div class="x-panel-content x-scroll-view" xid="content4" style="bottom: 0px;"> 
        <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
          xid="scrollView2"> 
          <div class="x-content-center x-pull-down container" xid="div11"> 
            <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
            <span class="x-pull-down-label">下拉刷新...</span> 
          </div>  
          <div class="x-scroll-content" xid="div12"> 
            <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
              xid="panel2" bind-visible="$model.numData.getValue('exeNum')&gt;0"> 
              <div class="panel-heading" xid="heading1"> 
                <h4 class="panel-title oa-title-heading" xid="h41" bind-html="&quot;我审批 (&quot; + $model.numData.getValue('exeNum') + &quot;)&quot;"><![CDATA[我审批]]></h4> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="executorList" data="executorData"> 
                <ul class="x-list-template"> 
                  <li xid="li6" class="list-group-item" bind-click="executoristClick"> 
                    <div class="media"> 
                      <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
                        xid="orgImage1" orgKind="person" bind-ref="ref('fApplyPsnID')"> 
                        <div class="x-blob-bar" xid="div18"> 
                          <i class="x-blob-edit icon-compose" xid="i19"/>  
                          <i class="x-blob-del icon-close-round" xid="i20"/> 
                        </div>  
                        <img class="x-blob-img media-object" xid="image1"/> 
                      </div>  
                      <div xid="div19" class="media-body"> 
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row1"> 
                          <div class="col col-xs-6" xid="col1"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading oa-title-data" xid="output6" bind-ref="ref('fApplyPsnName')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="col2"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading pull-right" xid="output5" bind-ref="ref('fApplyDate')"
                              format="yyyy-MM-dd"/> 
                          </div> 
                        </div>  
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row2"> 
                          <div class="col col-xs-6" xid="col4"> 
                            <div component="$UI/system/components/justep/output/output"
                              xid="output7" bind-ref="ref('fNo')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="col5"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="pull-right" xid="output8" bind-ref="ref('sStatusName')"/> 
                          </div> 
                        </div> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
              xid="panel3" bind-visible="$model.numData.getValue('croNum')&gt;0"> 
              <div class="panel-heading" xid="heading2"> 
                <h4 class="panel-title oa-title-heading" xid="h42" bind-html="&quot;我发起 (&quot; + $model.numData.getValue('croNum') + &quot;)&quot;"><![CDATA[我发起]]></h4> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="creatorList" data="creatorData"> 
                <ul class="x-list-template" xid="listTemplateUl5"> 
                  <li xid="li5" bind-click="creatorListClick" class="list-group-item"> 
                    <div class="media"> 
                      <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
                        xid="orgImage3" orgKind="person" bind-ref="ref('fApplyPsnID')"> 
                        <div class="x-blob-bar" xid="div8"> 
                          <i class="x-blob-edit icon-compose" xid="i9"/>  
                          <i class="x-blob-del icon-close-round" xid="i10"/> 
                        </div>  
                        <img class="x-blob-img media-object" xid="image3"/> 
                      </div>  
                      <div xid="div21" class="media-body"> 
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row3"> 
                          <div class="col col-xs-6" xid="col6"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading oa-title-data" xid="crofApplyPsnName"
                              bind-ref="ref('fApplyPsnName')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="col7"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading pull-right" xid="crofApplyDate"
                              bind-ref="ref('fApplyDate')" format="yyyy-MM-dd"/> 
                          </div> 
                        </div>  
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row4"> 
                          <div class="col col-xs-6" xid="col8"> 
                            <div component="$UI/system/components/justep/output/output"
                              xid="crofSignatureTypeName" bind-ref="ref('fNo')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="col9"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="pull-right" xid="crosStatusName" bind-ref="ref('sStatusName')"/> 
                          </div> 
                        </div> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
              xid="panel4" bind-visible="$model.numData.getValue('parNum')&gt;0"> 
              <div class="panel-heading" xid="heading3"> 
                <h4 class="panel-title oa-title-heading" xid="h43" bind-html="&quot;我相关 (&quot; + $model.numData.getValue('parNum') + &quot;)&quot;"><![CDATA[我相关]]></h4> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="parList" data="parData" limit="10"> 
                <ul class="x-list-template" xid="listTemplateUl1"> 
                  <li xid="li1" class="list-group-item" bind-click="parListClick"> 
                    <div class="media"> 
                      <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
                        xid="porgImage3" orgKind="person" bind-ref="ref('fApplyPsnID')"> 
                        <div class="x-blob-bar" xid="pdiv8"> 
                          <i class="x-blob-edit icon-compose" xid="pi9"/>  
                          <i class="x-blob-del icon-close-round" xid="pi10"/> 
                        </div>  
                        <img class="x-blob-img media-object" xid="pimage3"/> 
                      </div>  
                      <div xid="pdiv21" class="media-body"> 
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="prow3"> 
                          <div class="col col-xs-6" xid="pcol6"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading oa-title-data" xid="pcrofApplyPsnName"
                              bind-ref="ref('fApplyPsnName')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="pcol7"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading pull-right" xid="pcrofApplyDate"
                              bind-ref="ref('fApplyDate')" format="yyyy-MM-dd"/> 
                          </div> 
                        </div>  
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="prow4"> 
                          <div class="col col-xs-6" xid="pcol8"> 
                            <div component="$UI/system/components/justep/output/output"
                              xid="pcrofSignatureTypeName" bind-ref="ref('fNo')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="pcol9"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="pull-right" xid="pcrosStatusName" bind-ref="ref('sStatusName')"/> 
                          </div> 
                        </div> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
              xid="panel5" bind-visible="$model.numData.getValue('cloNum')&gt;0"> 
              <div class="panel-heading" xid="heading4"> 
                <h4 class="panel-title oa-title-heading" xid="h44" bind-html="&quot;已审批 (&quot; + $model.numData.getValue('cloNum') + &quot;)&quot;"><![CDATA[已审批]]> </h4> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="cloList" data="closeData"> 
                <ul class="x-list-template" xid="listTemplateUl2"> 
                  <li xid="li2" class="list-group-item" bind-click="cloListClick"> 
                    <div class="media"> 
                      <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
                        xid="corgImage3" orgKind="person" bind-ref="ref('fApplyPsnID')"> 
                        <div class="x-blob-bar" xid="cdiv8"> 
                          <i class="x-blob-edit icon-compose" xid="ci9"/>  
                          <i class="x-blob-del icon-close-round" xid="ci10"/> 
                        </div>  
                        <img class="x-blob-img media-object" xid="cimage3"/> 
                      </div>  
                      <div xid="cdiv21" class="media-body"> 
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="crow3"> 
                          <div class="col col-xs-6" xid="ccol6"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading oa-title-data" xid="ccrofApplyPsnName"
                              bind-ref="ref('fApplyPsnName')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="ccol7"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading pull-right" xid="ccrofApplyDate"
                              bind-ref="ref('fApplyDate')" format="yyyy-MM-dd"/> 
                          </div> 
                        </div>  
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="crow4"> 
                          <div class="col col-xs-6" xid="ccol8"> 
                            <div component="$UI/system/components/justep/output/output"
                              xid="ccrofSignatureTypeName" bind-ref="ref('fNo')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="ccol9"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="pull-right" xid="ccrosStatusName" bind-ref="ref('sStatusName')"/> 
                          </div> 
                        </div> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div>  
          <div class="x-content-center x-pull-up" xid="div13"> 
            <span class="x-pull-up-label">加载更多...</span> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div xid="dialog"/> 
</div>
