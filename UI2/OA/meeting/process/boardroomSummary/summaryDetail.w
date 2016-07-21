<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:149px;top:248px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dSummary"
      concept="OA_MT_Summary" orderBy="fCreateTime desc" autoLoad="false" onSaveCommit="dSummarySaveCommit"> 
      <reader xid="default1" action="/OA/meeting/logic/action/queryMTSummaryAction"/>  
      <writer xid="default2" action="/OA/meeting/logic/action/saveMTSummaryAction"/>  
      <creator xid="default3" action="/OA/meeting/logic/action/createMTSummaryAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dIssue"
      concept="OA_MT_SummaryIssue"> 
      <reader xid="default5" action="/OA/meeting/logic/action/queryMTSummaryIssueAction"/>  
      <writer xid="default6" action="/OA/meeting/logic/action/saveMTSummaryIssueAction"/>  
      <creator xid="default7" action="/OA/meeting/logic/action/createMTSummaryIssueAction"/>  
      <master xid="default8" data="dSummary" relation="fMasterID"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dArrange"
      concept="OA_MT_RoomArrange" limit="1"> 
      <reader xid="default9" action="/OA/meeting/logic/action/queryMTRoomArrangeAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dBoardroom"
      concept="OA_MT_Boardroom"> 
      <reader xid="default10" action="/OA/meeting/logic/action/queryMTBOARDROOMAction"/>  
      <writer xid="default11"/>  
      <creator xid="default12"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_MT_Boardroom.fUseStatus='1']]></filter> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="summaryDetail"
      concept="OA_MT_Summary" limit="1"> 
      <reader xid="default13" action="/OA/meeting/logic/action/queryMTSummaryAction"/>  
      <writer xid="default14" action="/OA/meeting/logic/action/saveMTSummaryAction"/>  
      <creator xid="default15" action="/OA/meeting/logic/action/createMTSummaryAction"/> 
    </div>  
    </div>  
  <div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"
    xid="detailForm"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="detailBar"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dSummary.new'}" xid="button3" label="添加"> 
        <i xid="i7"/>  
        <span xid="span4">添加</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dSummary.save'}" xid="button1"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dSummary.delete'}" xid="button2"> 
        <i xid="i6"/>  
        <span xid="span3"/> 
      </a> 
    </div>  
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row"> 
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput1"> 
          <label class="x-label" style="width:100px" xid="label1">会议主题</label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="fMeetNameI" bind-ref="dSummary.ref('fMeetName')"/> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput2"> 
          <label class="x-label" style="width:100px" xid="label2">开始时间</label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="fBeginTimeI" bind-ref="dSummary.ref('fBeginTime')"/> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput3"> 
          <label class="x-label" style="width:100px" xid="label3">结束时间</label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="fEndTimeI" bind-ref="dSummary.ref('fEndTime')"/> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput4"> 
          <label class="x-label" style="width:100px" xid="label4">主持人</label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="fCompereI" bind-ref="dSummary.ref('fCompere')"/> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput5"> 
          <label class="x-label" style="width:100px" xid="label5">会议室</label>  
          <div class="x-gridSelect x-edit" component="$UI/system/components/justep/gridSelect/gridSelect"
            xid="selectBoardroom" bind-ref="dSummary.ref('fBoardroomID')" bind-labelRef="dSummary.ref('fBoardroom')"> 
            <option xid="option1" data="dBoardroom" label="fName" value="OA_MT_Boardroom"/> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput9"> 
          <label class="x-label" style="width:100px" xid="label10">使用部门</label>  
          <div class="x-gridSelect x-edit" component="$UI/system/components/justep/org/orgSelectPC"
            xid="orgSelectPC1" bind-ref="dSummary.ref('fUseDeptID')" bind-labelRef="dSummary.ref('fUseDeptName')"
            includeOrgKind="ogn,dpt" onHideOption="orgSelectPC1HideOption"> 
            <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
              xid="bizData1" limit="-1"/>  
            <option xid="option2" value="SA_OPOrg" label="sName"> 
              <columns xid="columns2"> 
                <column name="sName" xid="column9"/> 
              </columns> 
            </option> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput10"> 
          <label class="x-label" style="width:100px" xid="label11">使用人</label>  
          <div class="x-gridSelect x-edit" component="$UI/system/components/justep/org/orgSelectPC"
            xid="orgSelectPC2" bind-ref="dSummary.ref('fUsePsnID')" bind-labelRef="dSummary.ref('fUsePsnName')" includeOrgKind="psm" onShowOption="orgSelectPC2ShowOption"> 
            <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
              xid="bizData2" limit="-1"><treeOption xid="default17" rootFilter="1=1"></treeOption></div>  
            <option xid="option3" label="sName" value="sPersonID" ext="sFID"> 
              <columns xid="columns3"> 
                <column name="sName" xid="column10"/> 
              </columns> 
            </option> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col6"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput6"> 
          <label class="x-label" style="width:100px" xid="label6">与会人员</label>  
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
            xid="fMeetPsnsI" bind-ref="dSummary.ref('fMeetPsns')"/>  
          <a component="$UI/system/components/justep/button/button" class="btn btn-link"
            xid="selectPsns" icon="icon-search" onClick="selectPsnsClick"> 
            <i xid="i9" class="icon-search"/>  
            <span xid="span9"/> 
          </a> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col7"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput7"> 
          <label class="x-label" style="width:100px" xid="label8">正文</label>  
          <div component="$UI/system/components/justep/attachment/attachment"
            access="duud" xid="attachment1" bind-ref="dSummary.ref('fContent')" style="width:100%;"
            subPath="concat('业务附件/OA/会议室管理',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))"> 
            <div class="x-attachment" xid="div46"> 
              <div class="x-attachment-content x-card-border" xid="div47"> 
                <div class="x-doc-process" xid="div48"> 
                  <div class="progress-bar x-doc-process-bar" role="progressbar"
                    style="width:0%;" xid="div49"/> 
                </div>  
                <div data-bind="foreach:$attachmentItems" xid="div50"> 
                  <div class="x-attachment-cell" xid="div51"> 
                    <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                      xid="div52"> 
                      <a data-bind="visible:$model.$state.get() == 'remove'"
                        class="x-remove-barget" xid="a9"/> 
                    </div> 
                  </div> 
                </div>  
                <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                  xid="div53"> 
                  <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                    xid="div54"/> 
                </div>  
                <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                  xid="div55"> 
                  <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                    xid="div56"/> 
                </div>  
                <div style="clear:both;" xid="div57"/> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div>  
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col8"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit"
          xid="labelInput8"> 
          <label class="x-label" style="width:100px" xid="label9">备注</label>  
          <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control x-edit"
            xid="textarea2" bind-ref="dSummary.ref('fRemark')"/> 
        </div> 
      </div> 
    </div> 
  </div>  
<!--   <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" -->
<!--     xid="orgDialog" status="normal" multiSelection="true" onReceive="orgDialogReceive" -->
<!--     width="60%" height="55%" title="选择参会人员" selectFilter="js:$row.val('sOrgKindID')==='psm'"/>   -->
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true" xid="orgDialog" style="left:520px;top:186px;" 
  onReceive="orgDialogReceive" selectFilter="js:$row.val('sOrgKindID')==='psm'" multiSelection="true" cascade="true" title="选择参会人员" status="normal" width="60%" height="55%"></span>
  </div>
