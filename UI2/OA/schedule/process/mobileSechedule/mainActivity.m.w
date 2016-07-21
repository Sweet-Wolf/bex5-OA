<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window oa" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="width:141px;top:301px;left:512px;height:auto;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="scheduleData"
      concept="OA_SD_Schedule" autoLoad="false" limit="-1" confirmDelete="false" onRefreshCreateParam="scheduleDataRefreshCreateParam"
      confirmRefresh="false"> 
      <reader xid="default1" action="/OA/schedule/logic/action/queryOA_ScheduleMonthAction"/>  
      <writer xid="default2" action="/OA/schedule/logic/action/saveSDSCHEDULEAction"/>  
      <creator xid="default3" action="/OA/schedule/logic/action/createSDSCHEDULEAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" xid="calData" idColumn="monthFirstDay"
      autoNew="true"> 
      <column label="col0" name="monthFirstDay" type="DateTime" xid="default15"/>  
      <column label="col1" name="month" type="String" xid="default16"/>  
      <column label="col2" name="monthParam" type="String" xid="default17"/>  
      <column label="col3" name="cMonthFirstDay" type="DateTime" xid="default18"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="publicScheduleData"
      concept="OA_SD_Schedule" onRefreshCreateParam="publicScheduleDataRefreshCreateParam"
      confirmDelete="false" confirmRefresh="false" limit="-1"> 
      <reader xid="default12" action="/OA/schedule/logic/action/queryOA_ScheduleMonthAction"/>  
      <writer xid="default13" action="/OA/schedule/logic/action/saveSDSCHEDULEAction"/>  
      <creator xid="default14" action="/OA/schedule/logic/action/createSDSCHEDULEAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="leadScheduleData"
      concept="OA_SD_Schedule" onRefreshCreateParam="publicScheduleDataRefreshCreateParam"
      confirmDelete="false" confirmRefresh="false" limit="-1"> 
      <reader xid="default20" action="/OA/schedule/logic/action/queryOA_ScheduleMonthAction"/>  
      <writer xid="default19" action="/OA/schedule/logic/action/saveSDSCHEDULEAction"/>  
      <creator xid="default21" action="/OA/schedule/logic/action/createSDSCHEDULEAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="leaderData" concept="OA_SD_especialSchedulePerson" limit="-1">
      <reader xid="default4" action="/OA/schedule/logic/action/queryEspecialSchedulePersonAction"/>
    </div>
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog"
    onReceive="detailDialogReceive" src="$UI/OA/schedule/process/mobileSechedule/detailActivity.m.w"
    style="left:31px;top:179px;"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="newDialog"
    onReceive="newDialogReceive" src="$UI/OA/schedule/process/mobileSechedule/newActivity.m.w"
    style="left:105px;top:208px;"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgDialog"
    style="left:82px;top:261px;" includeOrgKind="psm" onReceive="orgDialogReceive"/>  
  <span component="$UI/system/components/justep/org/orgDialog" xid="orgDialoglead"
    style="left:195px;top:347px;" title="选择领导" includeOrgKind="psm" onReceive="orgDialogleadReceive"/>
  <div xid="waitDiv" style="position:fixed;height:200px;left:42%;">
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="button2" style="position:absolute;font-size:30px;top:42%;left:42%;" icon="icon-loading-a">
    <i xid="i6" class="icon-loading-a"></i>
    <span xid="span5"></span></a> </div><div component="$UI/system/components/justep/contents/contents" class="x-contents x-full "
    active="0" xid="contents" slidable="true" swipe="false"> 
    <div class="x-contents-content" xid="list"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel1"> 
        <div class="x-panel-top" xid="top1"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="listTitleBar" title="日程管理"> 
            <div class="x-titlebar-left" xid="div1" style="width:83px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
                xid="backBtn" style="width:40px;" icon="icon-chevron-left" onClick="{operation:'window.close'}"> 
                <i xid="i3" class="icon-chevron-left"/>  
                <span xid="span3"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div2">日程管理</div>  
            <div class="x-titlebar-right reverse" xid="div3" style="width:124px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="addBtn" style="width:40px;" icon="icon-plus-round" onClick="addBtnClick"> 
                <i xid="i4" class="icon-plus-round"/>  
                <span xid="span4"/> 
              </a> 
            </div> 
          </div> 
        </div>  
        <div class="x-panel-content opa" xid="content3"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel2"> 
            <div class="x-panel-top" xid="topArea"> 
              <div component="$UI/system/components/justep/titleBar/titleBar"
                class="x-titlebar" xid="scheTitleBar" style="background-color:#EBEBEB;color:#808080;"> 
                <div class="x-titlebar-left" xid="div15" style="width:33px;"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" xid="prevBtn" icon="icon-chevron-left" onClick="prevBtnClick"
                    style="margin-left:40px;"> 
                    <i xid="i12" class="icon-chevron-left"/>  
                    <span xid="span15"/> 
                  </a> 
                </div>  
                <div class="x-titlebar-title" xid="div16"/>  
                <div class="x-titlebar-right reverse" xid="div17"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" xid="nextBtn" icon="icon-chevron-right" onClick="nextBtnClick"
                    style="margin-right:40px;"> 
                    <i xid="i13" class="icon-chevron-right"/>  
                    <span xid="span16"/> 
                  </a> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/calendar/calendar"
                view="month" day="now" firstDay="monday" lunarDay="false" xid="calendar"
                onEventsSelected="calendar1EventsSelected" onEventsLoad="calendarEventsLoad"
                views="month" onAfterViewLoad="calendarAfterViewLoad"/> 
            </div>  
            <div class="x-panel-content x-scroll-view" xid="contentArea" style="bottom: 0px; top: 244px;"> 
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="scrollView"> 
                <!--                   <div class="x-content-center x-pull-down container" xid="div11"> 
                    <i class="x-pull-down-img glyphicon x-icon-pull-down"/>  
                    <span class="x-pull-down-label">下拉刷新...</span> 
                  </div>   -->  
                <div class="x-scroll-content" xid="div12"> 
                  <div component="$UI/system/components/justep/list/list" class="x-list"
                    xid="scheduleList" data="scheduleData" disableInfiniteLoad="true"
                    disablePullToRefresh="true" limit="200" bind-click="scheduleListClick"> 
                    <ul class="x-list-template" xid="listTemplateUl4"> 
                      <li xid="li1" data-bind="attr:{flag:val('fScheDay')}"
                        class="title-row" bind-visible="val('fIsTitle') == '1'" style="padding:0px 0px 0px 0px;margin:0px 0px 0px 0px;"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" xid="output1" bind-ref="ref('fScheDay')" style="padding-bottom:5px;padding-top:0px;padding-left:5px;"/> 
                      </li>  
                       
                    <li xid="cheduleRow" class="x-flex list-row" bind-visible="val('fIsTitle') == '0'"> 
                        <div class="head-pic-data" xid="col21"> 
                          <div class="x-blob" component="$UI/system/components/justep/org/orgImage" xid="orgImage1" bind-ref="ref('fCreatePsnID')" orgKind="person"> 
                            <div class="x-blob-bar" xid="div18"> 
                              <i class="x-blob-edit icon-compose" xid="i8" />  
                              <i class="x-blob-del icon-close-round" xid="i9" /> 
                            </div>  
                            <img class="x-blob-img x-autofill" xid="image1" /> 
                          </div> 
                        </div>  
                        <div class="x-flex1" xid="col23" style="position:relative ;"> 
                          <div _component="$UI/system/components/justep/row/row" class="x-flex" xid="row8"> 
                            <div component="$UI/system/components/justep/output/output" class="x-flex1 x-output title-data" xid="output6" bind-ref="ref('fName')" /> 
                          </div>  
                          <div _component="$UI/system/components/justep/row/row" _class="x-row" xid="row9" class="x-flex"> 
                            <div component="$UI/system/components/justep/output/output" class="x-output content-data" xid="output7" bind-ref="ref('fTimePeriod')" />  
                            <div xid="div14" class="x-flex1 content-data" style="padding-left:10px;"> 
                              <i xid="i10" class="icon-ios7-gear" bind-visible="val('fRepeat') != 'none'" /> 
                            </div> 
                          </div> 
                        </div> 
                      </li></ul> 
                  </div> 
                </div>  
                <!--                   <div class="x-content-center x-pull-up" xid="div13"> 
                    <span class="x-pull-up-label">加载更多...</span> 
                  </div>  --> 
              </div> 
            </div> 
          </div> 
        </div>  
         
      <div class="x-panel-bottom" xid="bottom1"> 
          <div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="true" xid="buttonGroup1" style="height:41px;"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="今天" xid="todayBtn" onClick="todayBtnClick"> 
              <i xid="i1" />  
              <span xid="span1">今天</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="领导日程" xid="leadBtn" onClick="leadBtnClick"> 
              <i xid="i2" />  
              <span xid="span2">领导日程</span> 
            </a>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="公开日程" xid="publicScheduleBtn" onClick="publicScheduleBtnClick"> 
              <i xid="i5" />  
              <span xid="span8">公开日程</span> 
            </a> 
          </div> 
        </div></div> 
    </div>  
    <div class="x-contents-content" xid="publicSchedule"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel11"> 
        <div class="x-panel-top" xid="top11"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="publicScheduleTitleBar1" title="公开日程"> 
            <div class="x-titlebar-left" xid="div11" style="width:83px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="publicScheduleBackBtn" style="width:40px;" icon="icon-chevron-left"
                onClick="publicScheduleBackBtnClick"> 
                <i xid="i31" class="icon-chevron-left"/>  
                <span xid="span31"/> 
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div21">公开日程</div>  
            <div class="x-titlebar-right reverse" xid="div31" style="width:124px;"/> 
          </div> 
        </div>  
        <div class="x-panel-content" xid="content31"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel21"> 
            <div class="x-panel-top" xid="publicScheduleTopArea"> 
              <div component="$UI/system/components/justep/titleBar/titleBar"
                class="x-titlebar" xid="publicScheduleTitleBar" style="background-color:#EBEBEB;color:#808080;"> 
                <div class="x-titlebar-left" xid="div151" style="width:33px;"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" xid="publicSchedulePrevBtn" icon="icon-chevron-left"
                    onClick="publicSchedulePrevBtnClick" style="margin-left:40px;"> 
                    <i xid="i121" class="icon-chevron-left"/>  
                    <span xid="span151"/> 
                  </a> 
                </div>  
                <div class="x-titlebar-title" xid="div161"/>  
                <div class="x-titlebar-right reverse" xid="div171"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" xid="publicScheduleNextBtn" icon="icon-chevron-right"
                    onClick="publicScheduleNextBtnClick" style="margin-right:40px;"> 
                    <i xid="i131" class="icon-chevron-right"/>  
                    <span xid="span161"/> 
                  </a> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/calendar/calendar"
                view="month" day="now" firstDay="monday" lunarDay="false" xid="publicScheduleCalendar"
                onEventsSelected="publicScheduleCalendar1EventsSelected" onEventsLoad="publicScheduleCalendarEventsLoad"
                views="month" onAfterViewLoad="publicScheduleCalendarAfterViewLoad"/> 
            </div>  
            <div class="x-panel-content x-scroll-view" xid="publicScheduleContentArea"
              style="bottom: 0px; top: 244px;"> 
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="publicScheduleScrollView"> 
                <div class="x-scroll-content" xid="div121"> 
                  <div component="$UI/system/components/justep/list/list" class="x-list"
                    xid="publicScheduleList" data="publicScheduleData" disableInfiniteLoad="true"
                    disablePullToRefresh="true" limit="200" bind-click="publicScheduleListClick"> 
                    <ul class="x-list-template" xid="listTemplateUl41"> 
                      <li xid="li11" data-bind="attr:{cflag:val('fScheDay')}"
                        class="title-row" bind-visible="val('fIsTitle') == '1'"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" xid="output11" bind-ref="ref('fScheDay')"
                          style="b"/> 
                      </li>  
                      <li xid="publicScheduleRow" class="x-flex list-row"
                        bind-visible="val('fIsTitle') == '0'"> 
                        <div class="head-pic-data" xid="col211"> 
                          <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                            xid="orgImage11" bind-ref="ref('fCreatePsnID')" orgKind="person"> 
                            <div class="x-blob-bar" xid="div181"> 
                              <i class="x-blob-edit icon-compose" xid="i81"/>  
                              <i class="x-blob-del icon-close-round" xid="i91"/> 
                            </div>  
                            <img class="x-blob-img x-autofill" xid="image11"/> 
                          </div> 
                        </div>  
                        <div class="x-flex1" xid="col231" style="position:relative ;"> 
                          <div _component="$UI/system/components/justep/row/row"
                            class="x-flex" xid="row81"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="x-flex1 x-output title-data" xid="output61" bind-ref="ref('fName')"/> 
                          </div>  
                          <div _component="$UI/system/components/justep/row/row"
                            _class="x-row" xid="row91" class="x-flex"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="x-output content-data" xid="output71" bind-ref="ref('fTimePeriod')"/>  
                            <div xid="div141" class="x-flex1 content-data"
                              style="padding-left:10px;"> 
                              <i xid="i101" class="icon-ios7-gear" bind-visible="val('fRepeat') != 'none'"/> 
                            </div> 
                          </div> 
                        </div> 
                      </li> 
                    </ul> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-contents-content" xid="leadSchedule"> 
      <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
        xid="panel4"> 
        <div class="x-panel-top" xid="top4"> 
          <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
            xid="leadScheduleTitleBar1" title="领导日程"> 
            <div class="x-titlebar-left" xid="div30" style="width:83px;"> 
              <a component="$UI/system/components/justep/button/button" class="btn btn-link"
                xid="button3" style="width:40px;" icon="icon-chevron-left" onClick="publicScheduleBackBtnClick"> 
                <i xid="i23" class="icon-chevron-left"/>  
                <span xid="span18"/>
              </a> 
            </div>  
            <div class="x-titlebar-title" xid="div25">领导日程</div>  
            <div class="x-titlebar-right reverse" xid="div26" style="width:124px;"/>
          </div> 
        </div>  
        <div class="x-panel-content" xid="content1"> 
          <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
            xid="panel5"> 
            <div class="x-panel-top" xid="leadScheduleTopArea"> 
              <div component="$UI/system/components/justep/titleBar/titleBar"
                class="x-titlebar" xid="leadScheduleTitleBar" style="background-color:#EBEBEB;color:#808080;"> 
                <div class="x-titlebar-left" xid="div27" style="width:33px;"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" xid="leadSchedulePrevBtn" icon="icon-chevron-left"
                    style="margin-left:40px;" onClick="leadSchedulePrevBtnClick"> 
                    <i xid="i22" class="icon-chevron-left"/>  
                    <span xid="span20"/>
                  </a> 
                </div>  
                <div class="x-titlebar-title" xid="div20"/>  
                <div class="x-titlebar-right reverse" xid="div28"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link" xid="leadScheduleNextBtn" icon="icon-chevron-right"
                    style="margin-right:40px;" onClick="leadScheduleNextBtnClick"> 
                    <i xid="i19" class="icon-chevron-right"/>  
                    <span xid="span19"/>
                  </a> 
                </div> 
              </div>  
              <div component="$UI/system/components/justep/calendar/calendar"
                view="month" day="now" firstDay="monday" lunarDay="false" xid="leadScheduleCalendar"
                views="month" onEventsLoad="leadScheduleCalendarEventsLoad" onEventsSelected="leadScheduleCalendarEventsSelected"
                onAfterViewLoad="leadScheduleCalendarAfterViewLoad"/>
            </div>  
            <div class="x-panel-content x-scroll-view" xid="leadScheduleContentArea"
              style="bottom: 0px; top: 244px;"> 
              <div class="x-scroll" component="$UI/system/components/justep/scrollView/scrollView"
                xid="leadScheduleScrollView"> 
                <div class="x-scroll-content" xid="div33"> 
                  <div component="$UI/system/components/justep/list/list" class="x-list"
                    xid="list2" data="leadScheduleData" disableInfiniteLoad="true"
                    disablePullToRefresh="true" limit="200" bind-click="list2Click"> 
                    <ul class="x-list-template" xid="listTemplateUl2"> 
                      <li xid="li3" data-bind="attr:{cflag:val('fScheDay')}"
                        class="title-row" bind-visible="val('fIsTitle') == '1'"> 
                        <div component="$UI/system/components/justep/output/output"
                          class="x-output" xid="output2" bind-ref="ref('fScheDay')"
                          style="b"/>
                      </li>  
                      <li xid="li4" class="x-flex list-row" bind-visible="val('fIsTitle') == '0'"> 
                        <div class="head-pic-data" xid="div34"> 
                          <div class="x-blob" component="$UI/system/components/justep/org/orgImage"
                            xid="orgImage2" bind-ref="ref('fCreatePsnID')" orgKind="person"> 
                            <div class="x-blob-bar" xid="div23"> 
                              <i class="x-blob-edit icon-compose" xid="i18"/>  
                              <i class="x-blob-del icon-close-round" xid="i21"/>
                            </div>  
                            <img class="x-blob-img x-autofill" xid="image2"/>
                          </div> 
                        </div>  
                        <div class="x-flex1" xid="div32" style="position:relative ;"> 
                          <div _component="$UI/system/components/justep/row/row"
                            class="x-flex" xid="div29"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="x-flex1 x-output title-data" xid="output3" bind-ref="ref('fName')"/>
                          </div>  
                          <div _component="$UI/system/components/justep/row/row"
                            _class="x-row" xid="div24" class="x-flex"> 
                            <div component="$UI/system/components/justep/output/output"
                              class="x-output content-data" xid="output9" bind-ref="ref('fTimePeriod')"/>  
                            <div xid="div22" class="x-flex1 content-data" style="padding-left:10px;"> 
                              <i xid="i20" class="icon-ios7-gear" bind-visible="val('fRepeat') != 'none'"/>
                            </div> 
                          </div> 
                        </div> 
                      </li> 
                    </ul> 
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>
    </div> 
  </div> 
</div>
