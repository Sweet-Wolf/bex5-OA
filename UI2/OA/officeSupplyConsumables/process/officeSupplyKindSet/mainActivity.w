<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:313px;top:-1px;"><div component="$UI/system/components/justep/data/bizData" xid="bizData1" concept="OA_OSC_BaseInfo"><reader xid="default1" action="/OA/officeSupplyConsumables/logic/action/queryOSCBaseInfoAction"></reader>
  <writer xid="default2" action="/OA/officeSupplyConsumables/logic/action/saveOSCBaseInfoAction"></writer>
  <creator xid="default3" action="/OA/officeSupplyConsumables/logic/action/createOSCBaseInfoAction"></creator></div></div> 
<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'bizData1.save'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'bizData1.delete'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'bizData1.new'}" xid="button3">
   <i xid="i3"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'bizData1.refresh'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span4"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'bizData1.loadAllPage'}" xid="button5">
   <i xid="i5"></i>
   <span xid="span5"></span></a></div>
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grid1" data="bizData1">
   <columns xid="columns1"><column width="100" name="fCode" xid="column1"></column>
  <column width="100" name="fName" xid="column2"></column>
  <column width="100" name="fSpecType" xid="column3"></column>
  <column width="100" name="fPrice" xid="column4"></column>
  <column width="100" name="fKindID" xid="column5"></column>
  <column width="100" name="fKindName" xid="column6"></column></columns></div>
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar1">
   <div class="row" xid="div1">
    <div class="col-sm-3" xid="div2">
     <div class="x-pagerbar-length" xid="div3">
      <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1">
       <span xid="span6">显示</span>
       <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
        <option value="10" xid="default4">10</option>
        <option value="20" xid="default5">20</option>
        <option value="50" xid="default6">50</option>
        <option value="100" xid="default7">100</option></select> 
       <span xid="span7">条</span></label> </div> </div> 
    <div class="col-sm-3" xid="div4">
     <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div></div> 
    <div class="col-sm-6" xid="div6">
     <div class="x-pagerbar-pagination" xid="div7">
      <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
       <li class="prev" xid="li1">
        <a href="#" xid="a1">
         <span aria-hidden="true" xid="span8">«</span>
         <span class="sr-only" xid="span9">Previous</span></a> </li> 
       <li class="next" xid="li2">
        <a href="#" xid="a2">
         <span aria-hidden="true" xid="span10">»</span>
         <span class="sr-only" xid="span11">Next</span></a> </li> </ul> </div> </div> </div> </div></div>