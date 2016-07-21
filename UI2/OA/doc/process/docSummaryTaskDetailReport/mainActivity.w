<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="rData"> 
      <source xid="default1"> 
        <action xid="default3" type="action" name="docSummaryTaskDetailAction"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rDataTitle"> 
      <source xid="default2"> 
        <action type="action" name="docSummaryTaskDetailTitleAction"/> 
      </source> 
    </div> 
  </div>  
  <div class="container-fluid" xid="view"> 
    <div component="$UI/system/components/justep/report/report" src="taskDetail.xml" reportName="report"
      autoLoad="true" dataList="" class="x-report x-scroll-h" xid="report1"/> 
  </div> 
</div>
