<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:500px;top:211px;" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="dReport"> 
      <source> 
        <SQL id="default1"> 
          <DEFAULT id="default2"/>  
          <ORACLE id="default3"/>  
          <MSSQL id="default4"/>  
          <DB2 id="default5"/>  
          <SYBASE id="default6"/> 
        </SQL> 
      <action xid="default2" type="ksqlaction"></action></source> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dTemp" idColumn="tempYear" limit="1" autoNew="true"> 
      <column label="tempYear" name="tempYear" type="String" xid="default5"></column>
  <column label="tempMonth" name="tempMonth" type="String" xid="default1"></column></div> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2"> 
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{operation:'report.pageSetup'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{operation:'report.preview'}" xid="button2"> 
            <i xid="i2"/>  
            <span xid="span2"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{operation:'report.print'}" xid="button3"> 
            <i xid="i3"/>  
            <span xid="span3"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{operation:'report.exportPDF'}" xid="button4"> 
            <i xid="i4"/>  
            <span xid="span4"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{operation:'report.exportWord'}" xid="button5"> 
            <i xid="i5"/>  
            <span xid="span5"/> 
          </a>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{operation:'report.exportExcel'}" xid="button6"> 
            <i xid="i6"/>  
            <span xid="span6"/> 
          </a> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col13"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <!--   <div class="col col-xs-1" xid="col5"> 
            <label class="control-label" xid="controlLabel1"><![CDATA[统计区间]]></label> 
          </div>  
          <div class="col col-xs-2" xid="col6"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="iYear" bind-ref="dTemp.ref('beginDate')" format="yyyy-MM-dd"/> 
          </div>  
          <div class="col col-xs-1" xid="col7" style="width:30px;"> 
            <label class="control-label" xid="controlLabel2"><![CDATA[至]]></label> 
          </div>  
          <div class="col col-xs-2" xid="col8"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input1" bind-ref="dTemp.ref('endDate')"/> 
          </div>  
          <div class="col col-xs-1" xid="col9"> 
            <label class="control-label" xid="controlLabel3"><![CDATA[预定办理周期(天)]]></label> 
          </div>  
          <div class="col col-xs-1" xid="col15"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input2" bind-ref="dTemp.ref('dayNum')"/> 
          </div>   -->  
          <div class="col col-xs-2" xid="col16" style="width:100px;"> 
            <label class="control-label" xid="controlLabel4"><![CDATA[预算年度：]]></label> 
          </div>  
          <div class="col col-xs-2" xid="col10"> 
            <div component="$UI/system/components/justep/output/output" class="form-control" xid="optYear" bind-ref="dTemp.ref('tempYear')"></div></div>  
          <div class="col col-xs-2" xid="col2" style="width:140px;">
   <label class="control-label" xid="controlLabel1"><![CDATA[当前执行月份：]]></label></div><div class="col col-xs-1" xid="col1">
   <div component="$UI/system/components/justep/output/output" class="form-control" xid="optMonth" bind-ref="dTemp.ref('tempMonth')"></div></div><div class="col col-xs-2" xid="col11"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default"
              label="结算" xid="bSearch" onClick="bSearchClick"> 
              <i xid="i8"/>  
              <span xid="span8">结算</span> 
            </a> 
          </div> 
        
  </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/report/report" src="badgutMonthManageActivity.xml"
    reportName="图表混合报表" autoLoad="false" class="x-report x-scroll-h" xid="report"
    style="width:100%;height:100%;" dataList="dReport"/>  
  </div>
