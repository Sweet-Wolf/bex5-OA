<?xml version="1.0" encoding="UTF-8"?>
<model xmlns="http://www.justep.com/model">
<action name="receiveDocRptAction" global="false" procedure="receiveDocRptProcedure"><public type="String" name="docID"></public>
<label language="zh_CN">收文报表主表</label>
</action>
<action name="receiveDocRptDetailAction" global="false" procedure="receiveDocRptDetailProcedure"><label language="zh_CN">收文报表从表</label>
<public type="String" name="docID"></public>
</action>
<action name="sendReportDocAction" global="false" procedure="sendReportDocProcedure"><label language="zh_CN">发文审批单</label>
<public type="String" name="rowid" required="true"></public>
</action>
<action name="sendReportDocDetailAction" global="false" procedure="sendReportDocDetailProcedure"><label language="zh_CN">发文审批详细</label>
<public type="String" name="rowid" required="true"></public>
</action>
</model>