<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:188px;top:254px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dArrange"
      concept="OA_MT_RoomArrange" autoNew="false" onValueChanged="dArrangeValueChanged" onDataChange="dArrangeDataChange"> 
      <reader xid="default2" action="/OA/meeting/logic/action/queryMTRoomArrangeAction"/>  
      <writer xid="default3" action="/OA/meeting/logic/action/saveMTRoomArrangeAction"/>  
      <creator xid="default4" action="/OA/meeting/logic/action/createMTRoomArrangeAction"/>  
      <calculateRelation relation="relation0" xid="calculateRelation1"/>  
      <rule xid="rule1"> 
        <col name="fBoardroomID" xid="ruleCol1"> 
          <required xid="required1"> 
            <expr xid="default9">js:true</expr>  
            <message xid="default10"><![CDATA[会议室不能为空]]></message> 
          </required> 
        </col>  
        <col name="fMeetName" xid="ruleCol2"> 
          <required xid="required2"> 
            <expr xid="default11">js:true</expr>  
            <message xid="default12"><![CDATA[会议主题不能为空]]></message> 
          </required> 
        </col>
        <col name="fMeetPsns">
        	<readonly>
        		<expr>true</expr>
        	</readonly>
        </col>  
        <!--         <col name="fMeetPsnNum" xid="ruleCol3">  -->  
        <!--           <readonly xid="readonly1">  -->  
        <!--             <expr xid="default13">js:true</expr>  -->  
        <!--           </readonly>   -->  
        <!--           <calculate xid="calculate1">  -->  
        <!--             <expr xid="default14">  -->  
        <!--                          $row ? justep.String.splitAndTrim($row.val("fMeetPsns"),",").length+justep.String.splitAndTrim($row.val("fOutPsns"),",").length : 0 -->  
        <!--             </expr>  -->  
        <!--           </calculate>  -->  
        <!--         </col>   -->  
        <col name="fBeginTime" xid="ruleCol4"> 
          <required xid="required3"> 
            <expr xid="default15">true</expr>  
            <message xid="default16">开始时间不能为空!</message> 
          </required> 
        </col>  
        <col name="fEndTime" xid="ruleCol5"> 
          <constraint xid="constraint1"> 
            <expr xid="default17">$row.val("fEndTime")&gt; $row.val("fBeginTime")</expr>  
            <message xid="default18">结束时间必须大于开始时间</message> 
          </constraint> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dPerson"
      concept="OA_MT_ArrangePsns" autoLoad="true"> 
      <master xid="default1" data="dArrange" relation="fMasterID"/>  
      <reader xid="default5" action="/OA/meeting/logic/action/queryMTARRANGEPSNSAction"/>  
      <writer xid="default6" action="/OA/meeting/logic/action/saveMTARRANGEPSNSAction"/>  
      <creator xid="default7" action="/OA/meeting/logic/action/createMTARRANGEPSNSAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dBoardroom"
      concept="OA_MT_Boardroom" autoLoad="true"> 
      <reader xid="default8" action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_MT_Boardroom.fUseStatus='1']]></filter> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
        xid="form1"> 
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row1"> 
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit3"> 
              <label class="x-label" xid="label6" style="width:100px;"><![CDATA[主题]]></label>  
              <div class="x-edit" xid="div3"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input1" bind-ref="dArrange.ref('fMeetName')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col2"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit1"> 
              <label class="x-label" xid="label2" style="width:100px;"><![CDATA[会议室]]></label>  
              <div class="x-edit" xid="div1"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                  xid="fBoardroomID" bind-ref="dArrange.ref('fBoardroomID')" bind-labelRef="dArrange.ref('fBoardroom')"> 
                  <option xid="option3" data="dBoardroom" label="fName" value="OA_MT_Boardroom"/> 
                </div> 
              </div>  
              <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
                label="button" xid="showBoardRoomInfo" icon="icon-eye" onClick="showBoardRoomInfoClick"> 
                <i xid="i5" class="icon-eye"/>  
                <span xid="span5"/> 
              </a> 
            </div> 
          </div>  
          <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col3"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit2"> 
              <label class="x-label" xid="label5" style="width:100px;"><![CDATA[开始时间]]></label>  
              <div class="x-edit" xid="div2"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input2" bind-ref="dArrange.ref('fBeginTime')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col4"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit6"> 
              <label class="x-label" xid="label9" style="width:100px;"><![CDATA[结束时间]]></label>  
              <div class="x-edit" xid="div6"> 
                <input component="$UI/system/components/justep/input/input" class="form-control"
                  xid="input3" bind-ref="dArrange.ref('fEndTime')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col5"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit4"> 
              <label class="x-label" xid="label7" style="width:100px;"><![CDATA[使用部门]]></label>  
              <div class="x-edit" xid="div4"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                  xid="fApplyDeptNameL" bind-ref="dArrange.ref('fUseOgnId')" bind-labelRef="dArrange.ref('fUseOrgName')"
                  includeOrgKind="ogn,dpt" includeDisabled="true" onHideOption="fApplyDeptNameLHideOption"> 
                  <div component="$UI/system/components/justep/data/bizData"
                    autoLoad="false" xid="bizData4" limit="-1"> 
                    <filter name="filter0" xid="filter2"><![CDATA[SA_OPOrg.sValidState ='1']]></filter> 
                  </div>  
                  <option xid="option2" value="SA_OPOrg" label="sName"> 
                    <columns xid="columns2"> 
                      <column name="sName" xid="column2"/> 
                    </columns> 
                  </option> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-6 col-sm-6 col-md-6 col-lg-6" xid="col6"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit5"> 
              <label class="x-label" xid="label8" style="width:100px;"><![CDATA[使用人]]></label>  
              <div class="x-edit" xid="div5"> 
                <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                  xid="orgSelectPC1" bind-ref="dArrange.ref('fUsePsnID')" bind-labelRef="dArrange.ref('fUsePsnName')" onShowOption="orgSelectPC1ShowOption" includeOrgKind="psm"> 
                  <div component="$UI/system/components/justep/data/bizData"
                    autoLoad="false" xid="dPsn" limit="-1"><treeOption xid="default13" rootFilter="1=1"></treeOption></div>  
                  <option xid="option1" value="sPersonID" label="sName"> 
                    <columns xid="columns1"> 
                      <column name="sName" xid="column1"/> 
                    </columns> 
                  </option> 
                </div> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit7"> 
              <label class="x-label" xid="label10" style="width:100px;"><![CDATA[参会人员]]></label>  
              <div class="x-edit" xid="div7"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea1" bind-ref="dArrange.ref('fMeetPsns')"/> 
              </div> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon" label="button" xid="selectMeetPsns" icon="icon-search" onClick="selectMeetPsnsClick">
   <i xid="i6" class="icon-search"></i>
   <span xid="span6"></span></a></div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col8"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit8"> 
              <label class="x-label" xid="label11" style="width:100px;white-space:pre-line"><![CDATA[外部参会人员(用逗号隔开)]]></label>  
              <div class="x-edit" xid="div8"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="taOutPsns" bind-ref="dArrange.ref('fOutPsns')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col9"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit9"> 
              <label class="x-label" xid="label12" style="width:100px;"><![CDATA[参会人数]]></label>  
              <div class="x-edit" xid="div9"> 
                <div component="$UI/system/components/justep/output/output"
                  class="form-control" xid="output1" bind-ref="dArrange.ref('fMeetPsnNum')"/> 
              </div> 
            </div> 
          </div>  
          <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col10"> 
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit x-label30" xid="labelEdit10"> 
              <label class="x-label" xid="label13" style="width:100px;"><![CDATA[备注]]></label>  
              <div class="x-edit" xid="div10"> 
                <textarea component="$UI/system/components/justep/textarea/textarea"
                  class="form-control" xid="textarea2" bind-ref="dArrange.ref('fRemark')"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick='{"operation":"wReceiver.windowCancel"}'> 
        <i xid="i2"/>  
        <span xid="span2">取消</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="确定" xid="OKBtn" onClick="OKBtnClick"> 
        <i xid="i1"/>  
        <span xid="span1">确定</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="dlgSelectPerson" title="选择参会人员" multiSelection="true" status="normal" width="60%" height="70%" onReceive="dlgSelectPersonReceive"></span><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgBoardRoom"
    src="$UI/OA/meeting/process/boardroomDetail/boardroomDetail.w" title="会议室信息" status="normal" showTitle="true" width="60%" height="70%"/>
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;" onReceive="wReceiverReceive"/> 
</div>
