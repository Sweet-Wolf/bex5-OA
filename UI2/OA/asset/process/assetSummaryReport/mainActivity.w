<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:49px;top:262px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="rData"> 
      <source> 
        <SQL id="default1"> 
          <DEFAULT id="default2"/>  
          <ORACLE id="default3"/>  
          <MSSQL id="default4"/>  
          <DB2 id="default5"/>  
          <SYBASE id="default6"/> 
        </SQL>  
        <action id="default30" name="assetSummaryMainAction" type="action" columns=""/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rDataD"> 
      <source xid="default10"> 
        <action id="default12" name="assetSummaryDetailAction" columns="" type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rDCharZT"> 
      <source xid="default13"> 
        <action xid="default15" name="assetSummaryZTAction" columns="" type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rDCharBT"> 
      <source xid="default14"> 
        <action xid="default16" name="assetSummaryBTAction" columns="" type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dTemp" idColumn="orgID" limit="1" autoNew="true"> 
      <column label="beginDate" name="beginDate" type="Date" xid="default1"/>  
      <column label="endDate" name="endDate" type="Date" xid="default2"/>  
      <column label="query" name="query" type="String" xid="default3"/>  
      <column label="dayNum" name="dayNum" type="Integer" xid="default4"/>  
      <column label="orgID" name="orgID" type="String" xid="default5"/>  
      <column label="orgName" name="orgName" type="String" xid="default56"/> 
    </div> 
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
          <div class="col col-xs-1" xid="col5"> 
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
          </div>  
          <div class="col col-xs-1" xid="col16" style="width:60px;"> 
            <label class="control-label" xid="controlLabel4"><![CDATA[部门]]></label> 
          </div>  
          <div class="col col-xs-2" xid="col10"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
              xid="orgSelectPC1" bind-ref="dTemp.ref('orgID')" includeOrgKind="ogn,dpt"
              multiselect="true" bind-labelRef="dTemp.ref('orgName')"> 
              <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
                xid="cOrg" limit="-1"> 
                <treeOption xid="default28"/> 
              </div>  
              <option xid="option1" value="SA_OPOrg" label="sName"> 
                <columns xid="columns1"> 
                  <column name="sName" xid="column1"/> 
                </columns> 
              </option> 
            </div> 
          </div>  
          <div class="col col-xs-1" xid="col11"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
              label="button" xid="bSearch" icon="icon-android-search" onClick="bSearchClick"> 
              <i xid="i8" class="icon-android-search"/>  
              <span xid="span8"/> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/report/report" src="main.xml"
    reportName="report" autoLoad="false" dataList="" class="x-report x-scroll-h" xid="report"
    style="height:100%;width:100%;"/>  
  <div xid="chartView"> 
    <div component="$UI/system/components/justep/chart/chart" chart-name="chart"
      autoLoad="false" data-list="" xid="chartZT"> 
      <chart xid="chart2"> 
        <config xid="default6"> 
          <title xid="default9" visible="true" position="TOP">办公用品领用统计柱状图</title> 
        </config>  
        <series-set xid="series-set1"> 
          <series xid="chartSeries1" chart-type="vertical-bar-3d" name="verticalbar3dchart"> 
            <data title="单位：个" categoryAxis="FNAME" numberAxis="CT" ref="rDCharZT"
              color="#1E90FF" id="data1"/>  
            <config id="default19"> 
              <category-title id="default20">统计分类</category-title>  
              <category-item-label-angle id="default21">35</category-item-label-angle>  
              <category-item-label-visible id="default22">true</category-item-label-visible>  
              <category-item-label-number-format id="default23">######</category-item-label-number-format>  
              <category-margin id="default24">0.4</category-margin>  
              <serie-title id="default25">统计数据</serie-title>  
              <category-title-font id="default29" name="黑体" style="0" size="10"/> 
            </config> 
          </series> 
        </series-set> 
      </chart> 
    </div>  
    <div component="$UI/system/components/justep/chart/chart" chart-name="chart"
      autoLoad="false" data-list="" xid="chartBT"> 
      <chart xid="chart4"> 
        <config id="default1113" xid="default22"> 
          <title id="default1118" visible="true" position="TOP" xid="default23">办公用品领用类别统计饼图</title>  
          <title-font id="default28" name="黑体" style="0" size="16" xid="default24"/> 
        </config>  
        <series-set xid="series-set2"> 
          <series xid="chartSeries2" chart-type="pie" name="piechart"> 
            <data categoryAxis="FKINDNAME" numberAxis="AMOUNT" ref="rDCharBT"
              id="default3" xid="seriesData1"/>  
            <config id="default15" xid="default25"> 
              <explode-all-percent id="default119" range="100" value="0.3D" xid="default26"/>  
              <map-tool-tip-number-format id="default17" xid="default27">######.00</map-tool-tip-number-format> 
            </config> 
          </series> 
        </series-set> 
      </chart> 
    </div> 
  </div> 
</div>
