<?xml version="1.0" encoding="UTF-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onModelConstructDone="modelModelConstructDone"><div component="$UI/system/components/justep/reportData/reportData" xid="rptDoc">
   <source xid="default1"><action xid="default3" name="sendReportDocAction" type="action" columns="FEXTENDSTR1,FSIGNPERNAME,FDOCEXIGENCELEVELNAME,FDOCSECRETLEVELNAME,FORGLETTERNAME,FDOCNUMBER,FTITLE,FKEYWORD,FDOCKINDNAME,FSPONSORDEPT,FREASON,FMAINDESTDEPT,FCOPYDESTDEPT,FDRAFTPERNAME,FDRAFTTIME,FDRAFTPERPHONE,FCOPIES,FISSUEDATE"></action></source></div>
  <div component="$UI/system/components/justep/reportData/reportData" xid="rptDocDetail">
   <source xid="default2"><action xid="default4" name="sendReportDocDetailAction" type="action" columns="FACTIVITYLABEL,FOPINION,FCREATEPSNNAME,FCREATETIME"></action></source></div></div> 
<div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.pageSetup'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span1"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.preview'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span2"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.print'}" xid="button3">
   <i xid="i3"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.exportPDF'}" xid="button4">
   <i xid="i4"></i>
   <span xid="span4"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.exportWord'}" xid="button5">
   <i xid="i5"></i>
   <span xid="span5"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.exportExcel'}" xid="button6">
   <i xid="i6"></i>
   <span xid="span6"></span></a></div>
  <div component="$UI/system/components/justep/report/report" reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h" xid="report" src="sendDoc.xml"></div>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver" xid="windowReceiver" onReceive="windowReceiverReceive"></span></div>