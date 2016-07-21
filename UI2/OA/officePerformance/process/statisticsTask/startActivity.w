<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:49px;top:262px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="dCountTaskReport"> 
      <source> 
        <SQL id="default1"> 
          <DEFAULT id="default2"/>  
          <ORACLE id="default3"/>  
          <MSSQL id="default4"/>  
          <DB2 id="default5"/>  
          <SYBASE id="default6"/> 
        </SQL>  
        <action id="default30" name="countTaskReportAction" type="action" columns=""/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="dCountTaskChart"> 
      <source xid="default10"> 
        <action id="default12" name="countTaskPieReportAction" columns="" type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/reportData/reportData" xid="dCountTaskChart2"> 
      <source xid="default13"> 
        <action xid="default15" name="countTaskSeriesReportAction" columns=""
          type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="dTemp" idColumn="orgID" limit="1" autoNew="true"> 
      <column label="beginDate" name="beginDate" type="Date" xid="default1"/>  
      <column label="endDate" name="endDate" type="Date" xid="default2"/>  
      <column label="orgName" name="orgName" type="String" xid="default4"/>  
      <column label="orgID" name="orgID" type="String" xid="default5"/> 
    </div> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2"> 
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
          <div class="col col-xs-1" xid="col16" style="width:60px;"> 
            <label class="control-label" xid="controlLabel4"><![CDATA[部门]]></label> 
          </div>  
          <div class="col col-xs-3" xid="col10"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
              xid="orgSelectPC1" bind-ref="dTemp.ref('orgID')" includeOrgKind="ogn,dpt"
              multiselect="false"> 
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
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs1" style="height:100%;width:100%;"> 
    <ul class="nav nav-tabs" xid="ul1"> 
      <li class="active" xid="li1" bind-click="li1Click"> 
        <a content="tabContent1" xid="a1"><![CDATA[办公绩效:任务统计报表]]></a> 
      </li>  
      <li role="presentation" xid="li2" bind-click="li2Click"> 
        <a content="tabContent2" xid="a2"><![CDATA[办公绩效:任务时间饼图]]></a> 
      </li>  
      <li xid="li3" bind-click="li3Click"> 
        <a content="tabContent3" xid="a3"><![CDATA[办公绩效:任务时间圆柱图]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1"> 
      <div class="tab-pane active" xid="tabContent1" style="height:100%;width:100%;"> 
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
        <div component="$UI/system/components/justep/report/report" src="main.xml"
          reportName="report" autoLoad="false" dataList="" class="x-report x-scroll-h"
          xid="report" style="width:100%;height:816%;"/> 
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
        <div component="$UI/system/components/justep/chart/chart" chart-name="chart"
          autoLoad="false" data-list="" xid="taskChart" style="height:438px;width:647px;" dataList="dCountTaskChart"> 
          <chart xid="chart2"> 
            <config xid="default6"> 
              <title id="default58" visible="true" position="TOP">任务处理时间分布图</title> 
            </config>  
            <series-set id="series-set2"> 
              <series id="chartSeries5" chart-type="pie" name="piechart" ref="dCountTaskChart"> 
                <data categoryAxis="ATALLXY" numberAxis="ATALLNUM" ref="dCountTaskChart"
                  id="default57"/>  
                <config id="default59"/> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent3" style="height:100%;width:100%;"> 
        <!-- <div component="$UI/system/components/justep/chart/chart" chart-name="chart"
          autoLoad="false" xid="taskChart2" style="height:400px;width:600px;"> 
          <chart xid="chart4"> 
            <config id="default13" xid="default22"> 
              <title id="default26" visible="true" position="TOP">任务处理时间柱状图</title> 
            </config>  
            <series-set id="series-set4"> 
              <series chart-type="vertical-bar" ref="dCountTaskChart2"> 
                <data title="0~8(小时)" categoryAxis="ORGNAME" numberAxis="TIMELYTASK8HN"
                  id="default12"/>  
                <data title="8~24(小时)" categoryAxis="ORGNAME" numberAxis="TIMELYTASK24N"
                  id="default30"/>  
                <data title="1~2(天)" categoryAxis="ORGNAME" numberAxis="TIMELYTASK48N"
                  id="default31"/>  
                <data title="2~7(天)" categoryAxis="ORGNAME" numberAxis="TIMELYTASK7DN"
                  id="default32"/>  
                <data title="7天以后" categoryAxis="ORGNAME" numberAxis="TIMELYTASK7AN"
                  id="default33"/>  
                <config id="default27"> 
                  <category-title id="default38">部门</category-title>  
                  <serie-title id="default39">任务数量</serie-title> 
                </config> 
              </series> 
            </series-set> 
          </chart> 
        </div>  -->  
        <div component="$UI/system/components/justep/chart/chart" autoLoad="false"  xid="taskChart2" dataList="dCountTaskChart2" style="height:423px;width:630px;"> 
          <chart xid="chart3"> 
            <config xid="default3"> 
              <title id="default26" visible="true" position="TOP">任务处理时间柱状图</title> 
            </config>  
            <series-set xid="series-set1"> 
              <series xid="chartSeries2" chart-type="vertical-bar" name="verticalbarchart" ref="dCountTaskChart2">  
                <data title="0~8(小时)" categoryAxis="ORGNAME" numberAxis="TIMELYTASK8HN"
                  id="default12"/>  
                <data title="8~24(小时)" categoryAxis="ORGNAME" numberAxis="TIMELYTASK24N"
                  id="default30"/>  
                <data title="1~2(天)" categoryAxis="ORGNAME" numberAxis="TIMELYTASK48N"
                  id="default31"/>  
                <data title="2~7(天)" categoryAxis="ORGNAME" numberAxis="TIMELYTASK7DN"
                  id="default32"/>  
                <data title="7天以后" categoryAxis="ORGNAME" numberAxis="TIMELYTASK7AN"
                  id="default33"/>  
                <config id="default27"> 
                  <category-title id="default38">部门</category-title>  
                  <serie-title id="default39">任务数量</serie-title> 
                </config> 
              </series> 
            </series-set> 
          </chart> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
