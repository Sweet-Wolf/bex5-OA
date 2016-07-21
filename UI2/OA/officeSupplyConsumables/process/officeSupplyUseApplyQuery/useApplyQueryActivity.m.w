<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:mobile"
  xid="window" class="oa">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:534px;left:202px;"
    onLoad="modelLoad" onActive="modelActive"> 
    <div component="$UI/system/components/justep/data/data" xid="numData" idColumn="croNum"
      autoNew="true" autoLoad="false"> 
      <column label="col0" name="croNum" type="String" xid="default4"/>  
      <column label="col1" name="exeNum" type="String" xid="default5"/>  
      <column label="col2" name="parNum" type="String" xid="default6"/>  
      <column label="col3" name="cloNum" type="String" xid="default7"/>  
      <column label="col4" name="findStr" type="String" xid="default8"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="executorData" idColumn="fID" onCustomRefresh="executorDataCustomRefresh"> 
      <column label="fID" name="fID" type="String" xid="xid3"/>  
      <column label="fApplyPsnID" name="fApplyPsnID" type="String" xid="xid4"/>  
      <column label="fApplyPsnName" name="fApplyPsnName" type="String" xid="xid5"/>  
      <column label="fApplyDate" name="fApplyDate" type="DateTime" xid="xid6"/>  
      <column label="fSignatureTypeName" name="fSignatureTypeName" type="String"
        xid="xid7"/>  
      <column label="sStatusName" name="sStatusName" type="String" xid="xid11"/>  
      <column label="sID" name="sID" type="String" xid="xid7"/>  
      <column label="sEURL" name="sEURL" type="String" xid="xid8"/>  
      <column label="sProcess" name="sProcess" type="String" xid="xid9"/>  
      <column label="sActivity" name="sActivity" type="String" xid="xid10"/>  
      <column label="sActivity" name="sActivity" type="String" xid="xid10"/>  
      <column name="fNo" type="String" xid="xid27"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="creatorData" idColumn="fID" onCustomRefresh="creatorDataCustomRefresh"> 
      <column label="fID" name="fID" type="String" xid="xid1"/>  
      <column label="fApplyPsnID" name="fApplyPsnID" type="String" xid="xid2"/>  
      <column label="fApplyPsnName" name="fApplyPsnName" type="String" xid="xid12"/>  
      <column label="fApplyDate" name="fApplyDate" type="DateTime" xid="xid13"/>  
      <column label="fSignatureTypeName" name="fSignatureTypeName" type="String"
        xid="xid28"/>  
      <column label="sStatusName" name="sStatusName" type="String" xid="xid14"/>  
      <column name="fNo" type="String" xid="xid29"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="parData" idColumn="fID" onCustomRefresh="parDataCustomRefresh"> 
      <column label="fID" name="fID" type="String" xid="xid15"/>  
      <column name="fApplyPsnID" type="String" xid="xid16"/>  
      <column name="fApplyPsnName" type="String" xid="xid17"/>  
      <column name="fApplyDate" type="DateTime" xid="xid18"/>  
      <column name="fSignatureTypeName" type="String" xid="xid19"/>  
      <column name="sStatusName" type="String" xid="xid20"/>  
      <column name="fNo" type="String" xid="xid30"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="closeData" idColumn="fID" onCustomRefresh="closeDataCustomRefresh"> 
      <column name="fID" type="String" xid="xid21"/>  
      <column name="fApplyPsnID" type="String" xid="xid22"/>  
      <column name="fApplyPsnName" type="String" xid="xid23"/>  
      <column name="fApplyDate" type="DateTime" xid="xid24"/>  
      <column name="fSignatureTypeName" type="String" xid="xid25"/>  
      <column name="sStatusName" type="String" xid="xid26"/>  
      <column name="fNo" type="String" xid="xid31"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full x-card"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="领用管理"> 
        <div class="x-titlebar-left" xid="div1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            xid="button1" onClick="{operation:'window.close'}"> 
            <i xid="i1"/>  
            <span xid="span1">关闭</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">领用管理</div>  
        <div class="x-titlebar-right reverse" xid="div3"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="button2" icon="icon-plus-round" onClick="startProcess"> 
            <i xid="i2" class="icon-plus-round"/>  
            <span xid="span2"/> 
          </a> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content x-cards" xid="content1" style="bottom: 0px;"> 
      <div class="input-group smart-filter" component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter" style="margin:0 5px 10px;" onFilter="smartFilterFilter"> 
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
      <div class="x-panel-content x-scroll-view" xid="content4"> 
        <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
          xid="scrollView2"> 
          <div class="x-content-center x-pull-down container" xid="div11"> 
            <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
            <span class="x-pull-down-label">下拉刷新...</span> 
          </div>  
          <div class="x-scroll-content" xid="div12"> 
            <div class="panel panel-default x-card" component="$UI/system/components/bootstrap/panel/panel"
              xid="panel2" bind-visible=" $model.numData.val(&quot;exeNum&quot;) &gt; 0"> 
              <div class="panel-heading" xid="heading1"> 
                <h4 class="panel-title oa-title-heading" xid="h41" bind-html="'我审批(' +  $model.numData.val(&quot;exeNum&quot;) + ')'"><![CDATA[我审批]]></h4> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="executorList" data="executorData"> 
                <ul class="x-list-template" xid="listTemplateUl1"> 
                  <li class="list-group-item" xid="li1" bind-click="intoWork"> 
                    <div class="media" xid="div7"> 
                      <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
                        orgKind="person" xid="orgImage1" bind-ref="ref('fApplyPsnID')"> 
                        <div class="x-blob-bar" xid="div8"> 
                          <i class="x-blob-edit icon-compose" xid="i4"/>  
                          <i class="x-blob-del icon-close-round" xid="i5"/> 
                        </div>  
                        <img class="x-blob-img media-object" xid="image1"/> 
                      </div>  
                      <div class="media-body" xid="div9"> 
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row1"> 
                          <div class="col col-xs-6" xid="col1"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading oa-title-data" xid="output1" bind-ref="ref('fApplyPsnName')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="col2"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading pull-right" xid="output2" bind-ref="ref('fApplyDate')"/> 
                          </div> 
                        </div>  
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row2"> 
                          <div class="col col-xs-6" xid="col3"> 
                            <div component="$UI/system/components/justep/output/output"
                              xid="output3" bind-ref="ref('fNo')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="col4"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="pull-right" xid="output4" bind-ref="ref('sStatusName')"/> 
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
                <h4 class="panel-title oa-title-heading" xid="h42" bind-html="'我发起(' +   $model.numData.val(&quot;croNum&quot;) + ')'"><![CDATA[我发起]]></h4> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="creatorList" data="creatorData"> 
                <ul class="x-list-template" xid="listTemplateUl2"> 
                  <li class="list-group-item" xid="li2" bind-click="creatorListClick"> 
                    <div class="media" xid="div10"> 
                      <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
                        orgKind="person" xid="orgImage2" bind-ref="ref('fApplyPsnID')"> 
                        <div class="x-blob-bar" xid="div11"> 
                          <i class="x-blob-edit icon-compose" xid="i6"/>  
                          <i class="x-blob-del icon-close-round" xid="i7"/> 
                        </div>  
                        <img class="x-blob-img media-object" xid="image2"/> 
                      </div>  
                      <div class="media-body" xid="div12"> 
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row3"> 
                          <div class="col col-xs-6" xid="col5"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading oa-title-data" xid="output5" bind-ref="ref('fApplyPsnName')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="col2"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading pull-right" xid="output6" bind-ref="ref('fApplyDate')"/> 
                          </div> 
                        </div>  
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row4"> 
                          <div class="col col-xs-6" xid="col6"> 
                            <div component="$UI/system/components/justep/output/output"
                              xid="output7" bind-ref="ref('fNo')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="col7"> 
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
              xid="panel4" bind-visible=" $model.numData.val(&quot;parNum&quot;) &gt; 0"> 
              <div class="panel-heading" xid="heading3"> 
                <h4 class="panel-title oa-title-heading" xid="h43" bind-html="'我相关(' +   $model.numData.val(&quot;parNum&quot;) + ')'"><![CDATA[我相关]]></h4> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="list3" data="parData"> 
                <ul class="x-list-template" xid="listTemplateUl3"> 
                  <li class="list-group-item" xid="li3" bind-click="parListClick"> 
                    <div class="media" xid="div13"> 
                      <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage"
                        orgKind="person" xid="orgImage3" bind-ref="ref('fApplyPsnID')"> 
                        <div class="x-blob-bar" xid="div14"> 
                          <i class="x-blob-edit icon-compose" xid="i8"/>  
                          <i class="x-blob-del icon-close-round" xid="i9"/> 
                        </div>  
                        <img class="x-blob-img media-object" xid="image3"/> 
                      </div>  
                      <div class="media-body" xid="div15"> 
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row5"> 
                          <div class="col col-xs-6" xid="col8"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading oa-title-data" xid="output9" bind-ref="ref('fApplyPsnName')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="col2"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="media-heading pull-right" xid="output10" bind-ref="ref('fApplyDate')"/> 
                          </div> 
                        </div>  
                        <div component="$UI/system/components/bootstrap/row/row"
                          class="row" xid="row6"> 
                          <div class="col col-xs-6" xid="col9"> 
                            <div component="$UI/system/components/justep/output/output"
                              xid="output11" bind-ref="ref('fNo')"/> 
                          </div>  
                          <div class="col col-xs-6" xid="col10"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="pull-right" xid="output12" bind-ref="ref('sStatusName')"/> 
                          </div> 
                        </div> 
                      </div> 
                    </div> 
                  </li> 
                </ul> 
              </div> 
            </div>  
            <div class="panel x-card panel-default" component="$UI/system/components/bootstrap/panel/panel"
              xid="panel5" bind-visible=" $model.numData.val(&quot;cloNum&quot;) &gt; 0"> 
              <div class="panel-heading" xid="heading4"> 
                <h4 class="panel-title oa-title-heading" xid="h44" bind-html="'已审批(' +   $model.numData.val(&quot;cloNum&quot;) + ')'"><![CDATA[已审批]]></h4> 
              </div>  
              <div component="$UI/system/components/justep/list/list" class="x-list"
                xid="cloList" data="closeData"> 
                <ul class="x-list-template" xid="listTemplateUl4"> 
                  <li class="list-group-item" xid="li4" bind-click="cloListClick"> 
                    <div class="media" xid="div16"> 
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
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="showDetailDialog"
    src="detailActivity.m.w" style="top:16px;left:327px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newDialog"
    src="$UI/OA/officeSupplyConsumables/process/officeSupplyUseApply/startActivity.m.w"
    process="/OA/officeSupplyConsumables/process/officeSupplyUseApply/officeSupplyUseApplyProcess"
    activity="startActivity" style="top:17px;left:157px;"/> 
</div>
