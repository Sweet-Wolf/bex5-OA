<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"
    style="height:auto;left:667px;top:43px;"> 
    <div component="$UI/system/components/justep/reportData/reportData" xid="dReport"> 
      <source xid="default1"> 
        <action xid="default11" name="reportAction" type="action"/> 
      </source> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dArrange"
      concept="OA_MT_RoomArrange"> 
      <reader xid="default2" action="/OA/meeting/logic/action/queryMTRoomArrangeAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dBoardroom"
      concept="OA_MT_Boardroom" autoLoad="true"> 
      <reader xid="default3" action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/>  
      <writer xid="default4"/>  
      <creator xid="default5"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dList"
      concept="OA_MT_RoomArrange" autoLoad="true" confirmRefresh="false"> 
      <reader xid="default6" action="/OA/meeting/logic/action/queryMTRoomArrangeAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dRoomBoardroom"
      concept="OA_MT_Boardroom"> 
      <reader xid="default7" action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dDateBoardroom"
      concept="OA_MT_Boardroom"> 
      <reader xid="default8" action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/>  
      <writer xid="default9"/>  
      <creator xid="default10"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dCondition" idColumn="dateBegin" autoNew="false" onValueChanged="dConditionValueChanged"> 
      <column label="dateBegin" name="dateBegin" type="Date" xid="default19"/>  
      <column label="dateEnd" name="dateEnd" type="Date" xid="default20"/>  
      <column label="dateRoomID" name="dateRoomID" type="String" xid="default21"/>  
      <column label="dateRoomName" name="dateRoomName" type="String" xid="default22"/>  
      <column label="roomDate" name="roomDate" type="Date" xid="default23"/>  
      <column label="roomIDs" name="roomIDs" type="String" xid="default24"/>  
      <column label="roomNames" name="roomNames" type="String" xid="default25"/>  
      <column label="listBegin" name="listBegin" type="DateTime" xid="default26"/>  
      <column label="listEnd" name="listEnd" type="DateTime" xid="default27"/>  
      <column label="listRoomID" name="listRoomID" type="String" xid="default28"/>  
      <column label="weekDate" name="weekDate" type="Date" xid="default29"/>  
      <column label="tempDateTimeOrcl" name="tempDateTimeOrcl" type="String" xid="default30"/>  
      <column label="tempDateTimeSQL" name="tempDateTimeSQL" type="String" xid="default31"/>  
      <column label="tempDateTimeMySQL" name="tempDateTimeMySQL" type="String"
        xid="default32"/>  
      <data xid="default13">[{}]</data> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs"> 
    <ul class="nav nav-tabs" xid="tabNav1"> 
      <li class="active" xid="tabDateQuery"> 
        <a content="tabContent1" xid="tabItem1"><![CDATA[日程安排]]></a> 
      </li>  
      <li role="presentation" xid="tabArrange" bind-click="tabArrangeClick"> 
        <a content="tabContent2" xid="tabItem2"><![CDATA[会议室安排]]></a> 
      </li>  
      <li xid="tabList"> 
        <a content="tabContent3" xid="tabItem3"><![CDATA[列表]]></a> 
      </li>  
      <li xid="tabPage"> 
        <a content="tabContent4" xid="weekRoomApply"><![CDATA[周会议安排]]></a> 
      </li> 
    </ul>  
    <div class="tab-content" xid="div1" style="height:100%;"> 
      <div class="tab-pane active" xid="tabContent1" style="height:100%;"> 
        <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
          xid="form1"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row3"> 
            <div class="col col-xs-2" xid="col4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="RoomBegin" placeHolder="开始时间" bind-ref="dCondition.ref('dateBegin')"
                format="yyyy-MM-dd"/> 
            </div>  
            <div class="col col-xs-2" xid="col5"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="RoomEnd" placeHolder="结束时间" bind-ref="dCondition.ref('dateEnd')"
                format="yyyy-MM-dd"/> 
            </div>  
            <div class="col col-xs-2" xid="col6"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                xid="RoomBoardroom" bind-ref="dCondition.ref('dateRoomID')" bind-labelRef="dCondition.ref('dateRoomName')"> 
                <option xid="option1" data="dRoomBoardroom" label="fName" value="OA_MT_Boardroom"/> 
              </div> 
            </div>  
            <div class="col col-xs-2" xid="col7"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                label="会议室申请" xid="btnApply" onClick="btnApply"> 
                <i xid="i2"/>  
                <span xid="span2">会议室申请</span> 
              </a> 
            </div> 
          </div>  
          <iframe xid="dateIframe" name="dateIframe" id="dateIframe" width="100%"
            frameborder="no" height="500px"/> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent2"> 
        <div class="container-fluid"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row2"> 
            <div class="col col-xs-2" xid="col1"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input3" bind-ref="dCondition.ref('roomDate')"/> 
            </div>  
            <div class="col col-xs-2" xid="col2"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                xid="gridSelect1" bind-ref="dCondition.ref('roomIDs')" bind-labelRef="dCondition.ref('roomNames')"> 
                <option xid="option3" data="dDateBoardroom" value="OA_MT_Boardroom"
                  label="fName"/> 
              </div> 
            </div>  
            <div class="col col-xs-4" xid="col3"/> 
          </div>  
          <iframe src="" xid="roomIframe" name="roomIframe" id="roomIframe" frameborder="no"
            height="500px" width="100%"/>
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent3"> 
        <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
          xid="toolBar1"> 
          <div component="$UI/system/components/justep/smartFilter/smartFilter"
            xid="smartFilter1" filterData="dList" class="pull-right" filterCols="fBoardroom,fMeetName,fBeginTime,fEndTime,fUseOrgName,fUsePsnName,fPhone,fRemark"> 
            <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
              bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
              xid="input1"/> 
          </div>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
            onClick="{'operation':'dList.refresh'}" xid="button1"> 
            <i xid="i1"/>  
            <span xid="span1"/> 
          </a>  
          <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter"
            xid="gridFilter1" filterData="dList" filterCol="fBoardroomID"> 
            <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
              xid="gridSelect2" multiselect="true"> 
              <option xid="option2" data="dBoardroom" value="OA_MT_Boardroom"
                label="fName"/> 
            </div> 
          </div> 
        </div>  
        <div component="$UI/system/components/justep/dataTables/dataTables"
          flexibleWidth="false" rowActiveClass="active" class="table table-hover hidder-xs"
          xid="dataTables1" data="dList" responsive="true" showRowNumber="true"> 
          <columns xid="columns1"> 
            <column name="fBoardroom" label="会议室" xid="column1"/>  
            <column name="fMeetName" label="会议主题" xid="column2"/>  
            <column name="fBeginTime" label="开始时间" xid="column3" format="yyyy-MM-dd"/>  
            <column name="fEndTime" label="结束时间" xid="column4"/>  
            <column name="fUseOrgName" label="使用部门" xid="column5"/>  
            <column name="fUsePsnName" label="使用人" xid="column6"/>  
            <column name="fPhone" label="电话" xid="column7"/>  
            <column name="fRemark" label="备注" xid="column7"/> 
          </columns> 
        </div>  
        <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
          xid="pagerBar" data="dList"> 
          <div class="row" xid="div3"> 
            <div class="col-sm-3" xid="div4"> 
              <div class="x-pagerbar-length" xid="div5"> 
                <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                  class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                  <span xid="span3">显示</span>  
                  <select component="$UI/system/components/justep/select/select"
                    class="form-control input-sm" xid="select1"> 
                    <option value="10" xid="default12">10</option>  
                    <option value="20" xid="default14">20</option>  
                    <option value="50" xid="default15">50</option>  
                    <option value="100" xid="default16">100</option> 
                  </select>  
                  <span xid="span4">条</span> 
                </label> 
              </div> 
            </div>  
            <div class="col-sm-3" xid="div6"> 
              <div class="x-pagerbar-info" xid="div7">当前显示0条，共0条</div> 
            </div>  
            <div class="col-sm-6" xid="div8"> 
              <div class="x-pagerbar-pagination" xid="div9"> 
                <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
                  xid="pagination1"> 
                  <li class="prev" xid="li1"> 
                    <a href="#" xid="a1"> 
                      <span aria-hidden="true" xid="span5">«</span>  
                      <span class="sr-only" xid="span6">Previous</span> 
                    </a> 
                  </li>  
                  <li class="next" xid="li2"> 
                    <a href="#" xid="a2"> 
                      <span aria-hidden="true" xid="span7">»</span>  
                      <span class="sr-only" xid="span8">Next</span> 
                    </a> 
                  </li> 
                </ul> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="tab-pane" xid="tabContent4"> 
        <div class="container-fluid"> 
          <div component="$UI/system/components/bootstrap/row/row(bootstrap)"
            class="row" xid="row1"> 
            <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
              xid="toolBar2">
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                onClick="{'operation':'mixedChart.pageSetup'}" xid="button2"> 
                <i xid="i3"/>  
                <span xid="span9"/>
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                onClick="{'operation':'mixedChart.preview'}" xid="button3"> 
                <i xid="i4"/>  
                <span xid="span10"/>
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                onClick="{'operation':'mixedChart.print'}" xid="button4"> 
                <i xid="i5"/>  
                <span xid="span11"/>
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                onClick="{'operation':'mixedChart.exportPDF'}" xid="button5"> 
                <i xid="i6"/>  
                <span xid="span12"/>
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                onClick="{'operation':'mixedChart.exportWord'}" xid="button6"> 
                <i xid="i7"/>  
                <span xid="span13"/>
              </a>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
                onClick="{'operation':'mixedChart.exportExcel'}" xid="button7"> 
                <i xid="i8"/>  
                <span xid="span14"/>
              </a>
            </div>  
            <div class="col col-xs-4" xid="div2"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelEdit1"> 
                <label class="x-label" xid="label1"><![CDATA[会议日期]]></label>  
                <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
                  xid="weekRoomDate" bind-ref="dCondition.ref('weekDate')" onChange="weekRoomDateChange" format="yyyy-MM-dd"/> 
              </div> 
            </div> 
          </div>
          <div component="$UI/system/components/justep/report/report" src="boardRoomQuery.xml"
            reportName="report" autoLoad="true" dataList="" class="x-report x-scroll-h"
            xid="mixedChart"/> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
