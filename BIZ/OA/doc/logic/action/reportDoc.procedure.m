<?xml version="1.0" encoding="utf-8"?>

<model xmlns="http://www.justep.com/model" xmlns:m="http://www.justep.com/model">  
  <procedure name="receiveDocRptProcedure" code-model="/OA/doc/logic/code" code="DocReport.receiveDocRpt"> 
    <parameter name="docID" type="String"/> 
  </procedure>  
  <procedure name="receiveDocRptDetailProcedure" code-model="/OA/doc/logic/code" code="DocReport.receiveDocRptDetail"> 
    <parameter name="docID" type="String"/> 
  </procedure>  
  <procedure name="sendReportDocProcedure" code-model="/OA/doc/logic/code" code="Doc.sendReportDoc"> 
    <parameter name="rowid" type="String"/> 
  </procedure>  
  <procedure name="sendReportDocDetailProcedure" code-model="/OA/doc/logic/code" code="Doc.sendReportDocDetail">
    <parameter name="rowid" type="String"/>
  </procedure>
</model>
