<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:66px;top:244px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="rptDoc"> 
      <source xid="default1"> 
        <action xid="default3" name="receiveDocRptAction" type="action" columns="fTitle,fKeyword,fDocNumber,fSourceDept, fSourceDocNumber,fSponsorDept,fDocExigenceLevel,fDocExigenceLevelName,fOrgLetterName,fSourceSortName,fIssueDate, fCopies,fPages,fContent,fMainDestDept,fCopyDestDept,fDocSecretLevelName, fSourceDate,fYear,fMonth,fDocKindName,fExtendStr1"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rptDocDetail"> 
      <source xid="default2" name="receiveDocRptDetailAction" type="action" columns="FACTIVITYLABEL,FOPINION,FCREATEPSNNAME,FCREATETIME"><action xid="default4" name="receiveDocRptDetailAction" type="action" columns="FACTIVITYLABEL,FOPINION,FCREATEPSNNAME,FCREATETIME"></action></source> 
    </div> 
  </div>  
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
  <div component="$UI/system/components/justep/report/report" reportName="report"
    autoLoad="true" dataList="" class="x-report x-scroll-h" xid="report" src="receiveDoc.xml"/>
</div>
