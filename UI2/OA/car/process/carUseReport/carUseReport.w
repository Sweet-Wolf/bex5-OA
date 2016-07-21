<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onModelConstructDone="modelModelConstructDone"
    style="height:auto;left:188px;top:339px;"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="dReport"> 
      <source> 
        <action id="default6" name="queryCarUseReportAction" type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="dReportArr"> 
      <source id="default5"> 
        <ACTION id="default8"/>  
        <action xid="default1" name="queryCarUseDetailReportAction" type="action"/>
      </source> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
   
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar1">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/>
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'report.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/>
          </a>
        </div>
   
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/report/report" src="carArrangeActivity.xml"
        reportName="report" autoLoad="false" dataList="" class="x-report x-scroll-h"
        xid="report"/> 
    </div>  
    <div class="x-panel-bottom" xid="div1" height="42"></div>
  </div> 
</div>
