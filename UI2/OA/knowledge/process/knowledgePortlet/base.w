<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:27px;top:165px;"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="main" idColumn="OA_KM_Knowledge"> 
      <column label="OA_KM_Knowledge" name="OA_KM_Knowledge" type="String" xid="default1"/>  
      <column label="fTitle" name="fTitle" type="String" xid="default2"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/list/list" class="x-list" xid="list"
    data="main"> 
    <div class="x-list-head"/>  
    <div class="x-list-content"> 
      <ul class="x-list-template"> 
        <li class="list" bind-click="li1Click"> 
          <div class="x-row x-responsive-sm" component="$UI/system/components/justep/row/row"
            style="height:30px;font-family:微软雅黑;border-bottom:1px dashed #CECECE;"> 
            <!--   <div class="x-col x-col-center" xid="col1">
              <img src="1.png"/>
            </div>   -->  
            <div class="x-col x-col-90 x-col-center" style="font-weight:bold; cursor:pointer;"> 
              <img src="image\pig.png"/>  
              <span component="$UI/system/components/justep/output/output" data="taskData"
                bind-ref="ref('fTitle')"/> 
            </div> 
          </div> 
        </li> 
      </ul> 
    </div> 
  </div> 
</div>
