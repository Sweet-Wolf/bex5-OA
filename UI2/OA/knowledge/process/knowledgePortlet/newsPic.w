<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:362px;top:46px;"
    onLoad="modelLoad" onModelConstruct="modelModelConstruct" onunLoad="modelUnLoad"> 
    <!-- <div component="$UI/system/components/justep/data/bizData" xid="main" concept="OA_KM_Knowledge"
      limit="6" autoLoad="false"> 
      <reader xid="default2" action="/OA/knowledge/logic/action/queryKMKnowledgeAction"/> 
    </div>  -->  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="main" idColumn="OA_KM_Knowledge"> 
      <column label="OA_KM_Knowledge" name="OA_KM_Knowledge" type="String" xid="default1"/>  
      <column label="fTitle" name="fTitle" type="String" xid="default2"/> 
    </div> 
  </div>  
  <div class="container-fluid">
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
    <div class="col col-xs-5" xid="col1"> 
      <div component="$UI/system/components/bootstrap/carousel/carousel" class="x-carousel carousel"
        xid="carousel"> 
        <ol class="carousel-indicators" xid="ol1"/>  
        <div class="x-contents carousel-inner" role="listbox" component="$UI/system/components/justep/contents/contents"
          active="0" slidable="true" wrap="true" swipe="true" xid="contents" bind-click="openUrl"
          > 
          <div class="x-contents-content text-center" xid="contentPage1"> 
            <img class="img-responsive" src="" alt="" xid="image0" style="height:160px"/>  
            <label class="text-hidden" xid="label0"/> 
          </div>  
          <div class="x-contents-content text-center" xid="contentPage2"> 
            <img class="img-responsive" src="" alt="" xid="image1" style="height:160px"/>  
            <label class="text-hidden" xid="label1"/> 
          </div>  
          <div class="x-contents-content text-center" xid="contentPage3"> 
            <img class="img-responsive" src="" alt="" xid="image2" style="height:160px"/>  
            <label class="text-hidden" xid="label2"/> 
          </div> 
        </div>  
<!--         <a class="left carousel-control" role="button" xid="a1">  -->
<!--           <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" -->
<!--             xid="span1"/>   -->
<!--           <span class="sr-only" xid="span2">Previous</span>  -->
<!--         </a>   -->
<!--         <a class="right carousel-control" role="button" xid="a2">  -->
<!--           <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" -->
<!--             xid="span3"/>   -->
<!--           <span class="sr-only" xid="span4">Next</span>  -->
<!--         </a>  -->
      </div> 
    </div>  
    <div class="col col-xs-7" xid="col2"> 
      <div component="$UI/system/components/justep/list/list" class="x-list"
        xid="list" data="main" limit="6"> 
        <div class="x-list-content"> 
          <ul class="x-list-template"> 
            <li class="list" bind-click="li2Click"> 
              <div class="x-row x-responsive-sm" component="$UI/system/components/justep/row/row"
                style="height:30px;font-family:微软雅黑;border-bottom:1px dashed #CECECE;"> 
                <div class="x-col x-col-center" style="font-weight:bold; cursor:pointer;"> 
                  <img src="image\pig.png"/>  
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
</div>
