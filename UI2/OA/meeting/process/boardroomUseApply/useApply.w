<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:211px;top:288px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="false" concept="OA_MT_UseApply" orderBy="" columns=""
      autoNew="false" onDataChange="fMeetPsnsHideOption" onValueChanged="mainDataValueChanged"
      onBeforeSave="mainDataBeforeSave"> 
      <reader action="/OA/meeting/logic/action/queryMTUSEAPPLYAction"/>  
      <writer action="/OA/meeting/logic/action/saveMTUSEAPPLYAction"/>  
      <creator action="/OA/meeting/logic/action/createMTUSEAPPLYAction"/>  
      <rule xid="rule1"> 
        <col name="fMeetName" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default5">js:true</expr>  
            <message xid="default6"><![CDATA[会议主题不能为空]]></message> 
          </required> 
        </col>  
        <col name="fMeetPsns" xid="ruleCol2"> 
          <readonly xid="required2"> 
            <expr xid="default7">true</expr> 
          </readonly> 
        </col>  
        <col name="fMeetPsnNum" xid="ruleCol3"> 
          <readonly xid="readonly1"> 
            <expr xid="default9">js:true</expr> 
          </readonly> 
        </col>  
        <col name="fBoardroomID" xid="ruleCol4"> 
          <required xid="required3"> 
            <expr xid="default10">js:true</expr>  
            <message xid="default11"><![CDATA[会议室不能为空]]></message> 
          </required> 
        </col>  
        <col name="fBeginTime" xid="ruleCol5"> 
          <required xid="required4"> 
            <expr xid="default12">true</expr>  
            <message xid="default13"><![CDATA[开始时间不能为空]]></message> 
          </required> 
        </col>  
        <col name="fEndTime" xid="ruleCol6"> 
          <constraint xid="constraint1"> 
            <expr xid="default14">$model.mainData.val("fEndTime") &gt; $model.mainData.val("fBeginTime")</expr>  
            <message xid="default15">结束时间必须大于开始时间</message> 
          </constraint> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dUsePerson"
      concept="OA_MT_UseApplyPsns"> 
      <reader xid="default1" action="/OA/meeting/logic/action/queryMTUSEAPPLYPSNSAction"/>  
      <writer xid="default2" action="/OA/meeting/logic/action/saveMTUSEAPPLYPSNSAction"/>  
      <creator xid="default3" action="/OA/meeting/logic/action/createMTUSEAPPLYPSNSAction"/>  
      <master xid="default16" data="mainData" relation="fMasterID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dBoardroom"
      concept="OA_MT_Boardroom" orderBy="fCode asc" autoLoad="true"> 
      <reader xid="default4" action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_MT_Boardroom.fUseStatus='1']]></filter> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/process/process" xid="process"
    data="mainData"/>  
  <div component="$UI/system/components/justep/popMenu/popMenu" class="x-popMenu"
    xid="moreMenu" opacity="0" anchor="moreBtn" direction="left-bottom"> 
    <div class="x-popMenu-overlay" xid="moreMenuOverlay"/>  
    <ul component="$UI/system/components/justep/menu/menu" class="x-menu dropdown-menu x-popMenu-content"
      xid="moreContent"> 
      <li class="x-menu-item" xid="backItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="backBtn" onClick="{operation:'process.back'}"> 
          <i xid="i8"/>  
          <span xid="span6"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="suspendItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="suspendBtn" onClick="{operation:'process.suspend'}"> 
          <i xid="i3"/>  
          <span xid="span3"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="abortItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="abortBtn" onClick="{operation:'process.abort'}"> 
          <i xid="i4"/>  
          <span xid="span4"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="chartItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link  btn-icon-left"
          xid="chartBtn" onClick="{operation:'process.showChart'}"> 
          <i xid="i5"/>  
          <span xid="span5"/> 
        </a> 
      </li>  
      <li class="x-menu-item" xid="recordItem"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          xid="recordBtn" onClick="{operation:'process.processRecord'}"> 
          <i xid="i55"/>  
          <span xid="span55"/> 
        </a> 
      </li> 
    </ul> 
  </div>  
  <div xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
      xid="mainBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="advanceBtn" onClick="{operation:'process.advance'}"> 
        <i xid="i2"/>  
        <span xid="span2"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="saveBtn" onClick="{operation:'mainData.save'}"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-label"
        label="更多" xid="moreBtn" onClick="{operation:'moreMenu.show'}" icon="icon-ios7-more"> 
        <i xid="i15" class="icon-ios7-more"/>  
        <span xid="span15">更多</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link"
        label="安排查询" xid="button2" onClick="button2Click"> 
        <i xid="i7"/>  
        <span xid="span8">安排查询</span> 
      </a> 
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.showChart'}" xid="button1">
   <i xid="i9"></i>
   <span xid="span11"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'process.processRecord'}" xid="button3">
   <i xid="i10"></i>
   <span xid="span12"></span></a></div>  
    <div xid="content"> 
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup2"> 
        <div class="x-control-group-title" xid="controlGroupTitle2"> 
          <span xid="span10"></span> 
        </div> 
      </div>  
      <div component="$UI/system/components/justep/controlGroup/controlGroup"
        class="x-control-group" xid="controlGroup1"> 
        <div class="x-control-group-title" xid="controlGroupTitle1"> 
          <span xid="span9"><![CDATA[]]></span> 
        </div>  
        <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
          <div component="$UI/system/components/bootstrap/row/row" class="row"
            xid="row1"> 
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelEdit1"> 
                <label class="x-label" xid="fApplyDeptIDL" style="width:100px"><![CDATA[申请部门]]></label>  
                <div class="x-edit" xid="div1"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="fApplyDeptNameL" bind-ref="mainData.ref('fApplyDeptID')"
                    bind-labelRef="mainData.ref('fApplyDeptName')" includeOrgKind="ogn,dpt"
                    includeDisabled="false"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="true" xid="bizData4"/>  
                    <option xid="option2" value="SA_OPOrg" label="sName"> 
                      <columns xid="columns2"> 
                        <column name="sName" xid="column2"/> 
                      </columns> 
                    </option> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelEdit2"> 
                <label xid="fApplyPsnIDL" class="x-label" style="width:100px"><![CDATA[申请人]]></label>  
                <div class="x-edit" xid="div2"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                    xid="fApplyPsnNameL" bind-ref="mainData.ref('fApplyPsnID')" bind-labelRef="mainData.ref('fApplyPsnName')"
                    includeDisabled="false"> 
                    <div component="$UI/system/components/justep/data/bizData"
                      autoLoad="true" xid="bizData3"/>  
                    <option xid="option1" value="SA_OPOrg" label="sName"> 
                      <columns xid="columns1"> 
                        <column name="sName" xid="column1"/> 
                      </columns> 
                    </option> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelEdit3"> 
                <label xid="fApplyDateL" class="x-label" style="width:100px"><![CDATA[申请日期]]></label>  
                <div class="x-edit" xid="div3"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="mainData.ref('fApplyDate')" xid="fApplyDate"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col4"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelEdit4"> 
                <label xid="fMeetNameL" class="x-label" style="width:100px"><![CDATA[会议主题]]></label>  
                <div class="x-edit" xid="div4"> 
                  <input xid="fMeetName" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="mainData.ref('fMeetName')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col5"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelEdit5"> 
                <label xid="fBoardroomIDL" class="x-label" style="width:100px"><![CDATA[会议室]]></label>  
                <div class="x-edit" xid="div5"> 
                  <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                    xid="fBoardroomID" bind-ref="mainData.ref('fBoardroomID')" bind-labelRef="mainData.ref('fBoardroom')"> 
                    <option xid="option3" data="dBoardroom" label="fName" value="OA_MT_Boardroom"/> 
                  </div> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelEdit6"> 
                <label xid="fBeginTimeL" class="x-label" style="width:100px"><![CDATA[开始时间]]></label>  
                <div class="x-edit" xid="div6"> 
                  <input xid="fBeginTime" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="mainData.ref('fBeginTime')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelEdit7"> 
                <label xid="fEndTimeL" class="x-label" style="width:100px"><![CDATA[结束时间]]></label>  
                <div class="x-edit" xid="div7"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="mainData.ref('fEndTime')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelEdit8"> 
                <label xid="fPhoneL" class="x-label" style="width:100px"><![CDATA[联系电话]]></label>  
                <div class="x-edit" xid="div8"> 
                  <input xid="fPhone" class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="mainData.ref('fPhone')" pattern="[0-9]" format="0,000.00"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col9"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelEdit9"> 
                <label xid="fMeetPsnsL" class="x-label" style="width:100px"><![CDATA[参会人员]]></label>  
                <div class="x-edit" xid="div9"> 
                  <!--                 <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC" -->  
                  <!--                   xid="fMeetPsns" bind-ref="mainData.ref('fMeetPsns')" multiselect="true">  -->  
                  <!--                   <div component="$UI/system/components/justep/data/bizData" -->  
                  <!--                     autoLoad="true" xid="bizData6"/>   -->  
                  <!--                   <option xid="option4" value="sName" label="sName">  -->  
                  <!--                     <columns xid="columns3">  -->  
                  <!--                       <column name="sName" xid="column3"/>  -->  
                  <!--                     </columns>  -->  
                  <!--                   </option>  -->  
                  <!--                 </div>  -->  
                   
                <div class="input-group" xid="inputGroup2">
   <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="fMeetPsns" bind-ref="mainData.ref('fMeetPsns')" style="border-right-style:none;"/><div class="input-group-addon" xid="div14" style="background-color:transparent;border-left-style:none;" bind-click="btnSelectPsnClick">
    <i xid="i111" class="icon-android-search"></i></div> </div></div>  
                </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit " xid="labelEdit10"> 
                <label xid="fOutPsnsL" class="x-label" style="width:100px;white-space:pre-line"><![CDATA[外部参会人员(用逗号隔开)]]></label>  
                <div class="x-edit" xid="div10"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="fOutPsns" bind-ref="mainData.ref('fOutPsns')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col11"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelEdit11"> 
                <label xid="fMeetPsnNumL" class="x-label" style="width:100px"><![CDATA[参会人数]]></label>  
                <div class="x-edit" xid="div11"> 
                  <input class="form-control" component="$UI/system/components/justep/input/input"
                    bind-ref="mainData.ref('fMeetPsnNum')" xid="fMeetPsnNum"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col12"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelEdit12"> 
                <label xid="fDescriptionL" class="x-label" style="width:100px"><![CDATA[需求描述]]></label>  
                <div class="x-edit" xid="div12"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="fDescription" bind-ref="mainData.ref('fDescription')"/> 
                </div> 
              </div> 
            </div>  
            <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col13"> 
              <div component="$UI/system/components/justep/labelEdit/labelEdit"
                class="x-label-edit x-label30" xid="labelEdit13"> 
                <label xid="fRemarkL" class="x-label" style="width:100px"><![CDATA[备注]]></label>  
                <div class="x-edit" xid="div13"> 
                  <textarea component="$UI/system/components/justep/textarea/textarea"
                    class="form-control" xid="fRemark" bind-ref="mainData.ref('fRemark')"/> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>  
<!--   <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" -->
<!--     xid="wDlgMeetPsn" onReceive="wDlgMeetPsnReceive" multiSelection="true" status="normal" -->
<!--     cascade="true" title="选择参会人员" width="60%" height="55%"/> -->
    <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="wDlgMeetPsn" style="left:520px;top:186px;" 
  onReceive="wDlgMeetPsnReceive" selectFilter="js:$row.val('sOrgKindID')==='psm'" multiSelection="true" cascade="true" title="选择参会人员" status="normal" width="60%" height="55%"></span>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="boardRoomInfo"
    src="$UI/OA/meeting/process/boardroomDetail/boardroomDetail.w" status="normal"
    width="60%" height="55%"/> 
</div>
