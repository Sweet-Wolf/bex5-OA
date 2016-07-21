<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="mdMain" style="height:auto;left:161px;top:396px;"
    onLoad="mdMainLoad"> 
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dTemp" idColumn="orgID"> 
      <data xid="default6">[{"beginDate":""}]</data>  
      <column label="beginDate" name="beginDate" type="Date" xid="default1"/>  
      <column label="endDate" name="endDate" type="Date" xid="default2"/>  
      <column label="query" name="query" type="String" xid="default3"/>  
      <column label="dayNum" name="dayNum" type="String" xid="default4"/>  
      <column label="orgID" name="orgID" type="String" xid="default5"/> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rData"> 
      <source xid="default7"> 
        <action xid="default8" name="docSummaryFWAction" type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rDataSW"> 
      <source xid="default9"> 
        <action xid="default10" name="docSummarySWAction" type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rDChar"> 
      <source xid="default11"> 
        <action xid="default12" name="docSummaryFWChartAction" type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="rDCharSW"> 
      <source xid="default13"> 
        <action xid="default14" name="docSummarySWChartAction" type="action"/> 
      </source> 
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
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="btnDocQuery" label="公文查询" onClick="btnDocQueryClick"> 
      <i xid="i7"/>  
      <span xid="span7">公文查询</span> 
    </a> 
  </div>  
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="form1"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelEdit1"> 
          <label class="x-label" xid="label1" style="width:100px;"><![CDATA[统计区间]]></label>  
          <div class="x-edit" xid="div1"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input1" bind-ref="dTemp.ref('beginDate')"/> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelEdit2"> 
          <label class="x-label" xid="label2" style="width:100px;"><![CDATA[至]]></label>  
          <div class="x-edit" xid="div2"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input2" bind-ref="dTemp.ref('endDate')"/> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput1"> 
          <label class="x-label" xid="label3" style="width:100px;"><![CDATA[预定办理周期（天）]]></label>  
          <div class="x-edit" xid="div3"> 
            <input component="$UI/system/components/justep/input/input" class="form-control"
              xid="input3" bind-ref="dTemp.ref('dayNum')"/> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row2"> 
          <div class="col col-xs-10" xid="col2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelInput2"> 
              <label class="x-label" xid="label4" style="width:100px;"><![CDATA[部门]]></label>  
              <div class="x-edit" xid="div4"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                  xid="orgSelectPC1" bind-ref="dTemp.ref('orgID')" defaultLabel="'全部'"
                  multiselect="true"> 
                  <div component="$UI/system/components/justep/data/bizData"
                    autoLoad="true" xid="bizData1"/>  
                  <option xid="option1" value="SA_OPOrg" label="sName" multiboxonly="true"> 
                    <columns xid="columns1"> 
                      <column name="sName" xid="column1"/> 
                    </columns> 
                  </option> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-2" xid="col3"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
              xid="btnQuery" icon="icon-android-search" onClick="btnQueryClick"> 
              <i xid="i8" class="icon-android-search"/>  
              <span xid="span8"/> 
            </a> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row3"> 
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col8" style="display:none"> 
        <div component="$UI/system/components/justep/chart/chart" chart-name="chart"
          autoLoad="false" data-list="" xid="chartFW" chartName="chart" dataList="rDChar"
          style="height:100%;width:50%;"> 
          <chart xid="chart2"> 
            <config xid="default15"> 
              <title xid="default19" visible="true" position="TOP">发文统计柱状图</title> 
            </config>  
            <series-set xid="series-set1"> 
              <series-set> 
                <series chart-type="vertical-bar-3d" ref="rDChar"> 
                  <data title="单位：个" categoryAxis="FNAME" numberAxis="CT" ref="rDChar"
                    color="#1E90FF" id="data1"/>  
                  <config id="default19"> 
                    <category-title id="default20">统计分类</category-title>  
                    <category-item-label-angle id="default21">30</category-item-label-angle>  
                    <category-item-label-visible id="default22">true</category-item-label-visible>  
                    <category-item-label-number-format id="default23">######</category-item-label-number-format>  
                    <category-margin id="default24">0.4</category-margin>  
                    <serie-title id="default25">统计数据</serie-title> 
                  </config> 
                </series> 
              </series-set> 
            </series-set> 
          </chart> 
        </div>  
        <div component="$UI/system/components/justep/chart/chart" chart-name="chart"
          autoLoad="false" data-list="" xid="chartSW" chartName="chart" dataList="rDCharSW"> 
          <chart xid="chart4"> 
            <config xid="default18"> 
              <title xid="default16" visible="true" position="TOP">收文统计柱状图</title> 
            </config>  
            <series-set xid="series-set2"> 
              <series chart-type="vertical-bar-3d" ref="rDCharSW"> 
                <data title="单位：个" categoryAxis="FNAME" numberAxis="CT" ref="rDCharSW"
                  color="#20B2AA" id="data1"/>  
                <config id="default1119"> 
                  <category-title id="default1120">统计分类</category-title>  
                  <category-item-label-angle id="default1121">30</category-item-label-angle>  
                  <category-item-label-visible id="default1122">true</category-item-label-visible>  
                  <category-item-label-number-format id="default1123">######</category-item-label-number-format>  
                  <category-margin id="default1124">0.4</category-margin>  
                  <serie-title id="default1125">统计数据</serie-title> 
                </config> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col9"> 
        <div component="$UI/system/components/justep/report/report" src="docSummaryReport.xml"
          reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
          xid="report"/> 
      </div> 
    </div> 
  </div> 
</div>
