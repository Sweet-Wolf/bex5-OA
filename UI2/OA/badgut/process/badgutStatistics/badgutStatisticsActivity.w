<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc" xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="left:18px;top:83px;height:244px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="dReport"> 
      <source> 
        <SQL id="default1"> 
          <DEFAULT id="default2"/>  
          <ORACLE id="default3"/>  
          <MSSQL id="default4"/>  
          <DB2 id="default5"/>  
          <SYBASE id="default6"/> 
        </SQL> 
      <action xid="default22" type="ksqlaction" columns="OA_BG_BadgutM,OA_BG_BadgutM.fCostCenterID as fCostCenterID,OA_BG_BadgutM.fCostCenterCode as fCostCenterCode,OA_BG_BadgutM.fCostCenterName as fCostCenterName,OA_BG_BadgutM.fYear as fYear,OA_BG_BadgutM.fRemark as fRemark,OA_BG_BadgutD.fAccountCode as fAccountCode,OA_BG_BadgutD.fAccountName as fAccountName,OA_BG_BadgutD.fPlan1 as fPlan1,OA_BG_BadgutD.fPlan2 as fPlan2,OA_BG_BadgutD.fPlan3 as fPlan3,OA_BG_BadgutD.fPlan4 as fPlan4,OA_BG_BadgutD.fPlan5 as fPlan5,OA_BG_BadgutD.fPlan6 as fPlan6,OA_BG_BadgutD.fPlan7 as fPlan7,OA_BG_BadgutD.fPlan8 as fPlan8,OA_BG_BadgutD.fPlan9 as fPlan9,OA_BG_BadgutD.fPlan10 as fPlan10,OA_BG_BadgutD.fPlan11 as fPlan11,OA_BG_BadgutD.fPlan12 as fPlan12,OA_BG_BadgutD.fPlanall as fPlanall,OA_BG_BadgutD.fFact1 as fFact1,OA_BG_BadgutD.fFact2 as fFact2,OA_BG_BadgutD.fFact3 as fFact3,OA_BG_BadgutD.fFact4 as fFact4,OA_BG_BadgutD.fFact5 as fFact5,OA_BG_BadgutD.fFact6 as fFact6,OA_BG_BadgutD.fFact7 as fFact7,OA_BG_BadgutD.fFact8 as fFact8,OA_BG_BadgutD.fFact9 as fFact9,OA_BG_BadgutD.fFact10 as fFact10,OA_BG_BadgutD.fFact11 as fFact11,OA_BG_BadgutD.fFact12 as fFact12,OA_BG_BadgutD.fFactall as fFactall"></action></source> 
    </div>
     
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dCost" concept="OA_BG_CostCenter">
   <reader xid="default1" action="/OA/common/logic/action/queryBGCostCenterAction"></reader>
   <writer xid="default2" action="/OA/common/logic/action/saveBGCostCenterAction"></writer>
   <creator xid="default3" action="/OA/common/logic/action/createBGCostCenterAction"></creator>
   <filter name="filter0" xid="filter1">OA_BG_CostCenter.fUseStatus=1</filter></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dAccount" concept="OA_Pub_BaseCode">
   <reader xid="default4" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"></reader>
   <writer xid="default5" action="/OA/common/logic/action/saveOA_Pub_BaseCodeAction"></writer>
   <creator xid="default6" action="/OA/common/logic/action/createOA_Pub_BaseCodeAction"></creator>
   <filter name="filter1" xid="filter2">OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='总账科目'</filter></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="dTemp" idColumn="tempYear" confirmDelete="false" autoNew="true">
   <column label="预算年度" name="tempYear" type="String" xid="xid1"></column>
   <column label="成本中心ID" name="tempAccountID" type="String" xid="xid2"></column>
   <column label="成本中心" name="tempAccount" type="String" xid="xid3"></column>
   <column label="总帐科目ID" name="tempCostID" type="String" xid="xid4"></column>
   <column label="总帐科目" name="tempCost" type="String" xid="xid5"></column></div></div>  
  <div xid="view">
   
      <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2">
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1">
    <label xid="label10" style="line-height:36px;float:left;text-align:center;display:block;width:100%;font-size:16px;">XX公司年度预算执行情况汇总</label></div> 
   
   <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12">
   <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.pageSetup'}" xid="button1"> 
            <i xid="i1" />  
            <span xid="span1" />
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.preview'}" xid="button2"> 
            <i xid="i2" />  
            <span xid="span2" />
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.print'}" xid="button3"> 
            <i xid="i3" />  
            <span xid="span3" />
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.exportPDF'}" xid="button4"> 
            <i xid="i4" />  
            <span xid="span4" />
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.exportWord'}" xid="button5"> 
            <i xid="i5" />  
            <span xid="span5" />
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'report.exportExcel'}" xid="button6"> 
            <i xid="i6" />  
            <span xid="span6" />
          </a>
        </div></div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col13">
    <label xid="label5" style="line-height:36px;float:left;">预算年度：</label>
    <input component="$UI/system/components/justep/input/input" class="form-control" xid="input4" style="width:100px;float:left;margin-right:10px;" bind-ref="dTemp.ref('tempYear')"></input>
    <label xid="label6" style="line-height:36px;float:left;">成本中心：</label>
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect2" style="float:left;margin-right:10px;width:auto;" bind-ref="dTemp.ref('tempCostID')" bind-labelRef="dTemp.ref('tempCost')" defaultLabel="'全部'" multiselect="true">
     <option xid="option2" data="dCost" value="OA_BG_CostCenter" label="fCostCenterName"></option></div> 
    <label xid="label7" style="line-height:36px;float:left;"><![CDATA[总帐科目：]]></label>
    <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" style="float:left;margin-right:10px;width:auto;" bind-ref="dTemp.ref('tempAccountID')" bind-labelRef="dTemp.ref('tempAccount')" defaultLabel="'全部'" multiselect="true">
     <option xid="option1" data="dAccount" value="OA_Pub_BaseCode" label="fName"></option></div> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button7" icon="icon-ios7-search-strong" style="float:left;" onClick="triggerDOMActivate">
     <i xid="i7" class="icon-ios7-search-strong"></i>
     <span xid="span7"></span></a> 
  </div> </div><div component="$UI/system/components/justep/report/report" src="badgutStatisticsActivityReport.xml"
        reportName="report" autoLoad="false" dataList="dReport" class="x-report x-scroll-h"
        xid="report" style="height:100%;width:100%;"/> 
    </div> 
<span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter1" filterData="dReport"></span></div>