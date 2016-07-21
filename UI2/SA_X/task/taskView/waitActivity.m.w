<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:233px;left:51px;"
    onActive="modelActive" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="taskData"
      autoLoad="true" concept="SA_Task" orderBy="sCreateTime desc" confirmRefresh="false"
      columns="sName,sCreateTime,sExecutorFName,sExecutorNames,sCreatorFName,sProcess,sActivity,sExecutorFID,sEURL,sData1,sData2,sData3,sData4,sKindID,sStatusID" confirmDelete="false"> 
      <reader action="/SA/task/logic/action/queryWaitTask2Action"/> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="closeData" idColumn="fID">
   <column name="fID" type="String" xid="xid21"></column>
   <column name="fApplyPsnID" type="String" xid="xid22"></column>
   <column name="fApplyPsnName" type="String" xid="xid23"></column>
   <column name="fApplyDate" type="DateTime" xid="xid24"></column>
   <column name="fSignatureTypeName" type="String" xid="xid25"></column>
   <column name="sStatusName" type="String" xid="xid26"></column>
   <column name="fNo" type="String" xid="xid31"></column></div>
  </div>  
  <div/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="detailDialog" style="top:16px;left:71px;"></span><div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert">
   <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button2">
    <i class="icon-loading-a" xid="i2"></i>
    <span xid="span511"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1" height="48"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="我的审批"> 
        <div class="x-titlebar-left" xid="div1"> 
          <!-- 	
          <a component="$UI/system/components/justep/button/button" class="btn btn-link" xid="menuBtn" icon="icon-navicon-round" onClick="menuBtnClick"> 
            <i class="icon-navicon-round"/>  
            <span></span> 
          </a> 
          -->  
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" xid="backBtn" onClick="backBtnClick"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="div2">我的审批</div>  
        <div class="x-titlebar-right reverse" xid="div3"/> 
      </div>  
      <div xid="div5" style="background-color:#2FA4E7;color:#FFFFFF;"> 
        </div></div>  
    <div class="x-panel-content" xid="waitContent" style="display:none;"> 
      <div component="$UI/system/components/justep/contents/contents" class="x-contents x-full"
        active="0" xid="contents1" style="position:relative;" onActiveChange="contents1ActiveChange"> 
        <div class="x-contents-content" xid="waitMeContent"> 
          <div class="x-list x-inner-scroll" component="$UI/system/components/justep/list/list"
            data="taskData" limit="20" xid="list1"> 
            <div class="x-list-head" xid="div6"/>  
            <div class="x-list-content x-scroll-view" xid="div7"> 
              <div component="$UI/system/components/justep/scrollView/scrollView"
                supportPullToRefresh="true" supportInfiniteLoad="true" hScroll="false"
                vScroll="true" hScrollbar="false" vScrollbar="true" bounce="true"
                class="x-scroll" xid="scrollView1"> 
                <div class="x-content-center x-pull-down container" xid="div8"> 
                  <i class="x-pull-down-img glyphicon x-icon-pull-down" xid="i4"/>  
                  <span class="x-pull-down-label" xid="span4">下拉刷新...</span> 
                </div>  
                <div class="x-scroll-content" xid="div9"> 
                  <ul class="x-list-template" xid="listTemplateUl1"> 
                    <li class="list-group-item" bind-click="li2Click" xid="li1"> 
                      <div class="x-row x-row-center" component="$UI/system/components/justep/row/row"
                        xid="row2"> 
                        <div class="x-col" style="font-weight:bold" xid="col4"> 
                          <span component="$UI/system/components/justep/output/output"
                            data="taskData" bind-ref="ref('sName')" xid="output1"/> 
                        </div> 
                      </div>  
                      <div class="x-row x-row-center" style="color:gray" component="$UI/system/components/justep/row/row"
                        xid="row3"> 
                        <div class="x-col" xid="col5"> 
                          <span component="$UI/system/components/justep/output/output"
                            data="taskData" bind-ref="ref('sCreatorFName')" xid="output2"/> 
                        </div>  
                        <div class="x-col" xid="col6" style="text-align:right;"> 
                          <span component="$UI/system/components/justep/output/output"
                            data="taskData" bind-ref="ref('sCreateTime')" format="yyyy-MM-dd"
                            xid="output3"/> 
                        </div> 
                      </div> 
                    </li> 
                  </ul> 
                </div>  
                <div class="x-content-center x-pull-up" xid="div10"> 
                  <span class="x-pull-up-label" xid="span5">加载更多...</span> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div><div class="x-contents-content" xid="approvedContent" onInactive="approvedContentInactive"> 
          <div xid="detailDiv" style="position:absolute;top:0px;right:0px;bottom:0px;left:0px;"> 
            <div component="$UI/system/components/justep/contents/contents"
              class="x-contents x-full" active="0" xid="detailContents"> 
              <div class="x-contents-content" xid="allContent"><div component="$UI/system/components/justep/list/list" class="x-list" xid="cloList" data="closeData">
   <ul class="x-list-template" xid="listTemplateUl3">
    <li xid="li3" class="list-group-item" bind-click="cloListClick">
     <div class="media" xid="media1">
      <div class="media-left x-blob" component="$UI/system/components/justep/org/orgImage" xid="corgImage3" orgKind="person" bind-ref="ref('fApplyPsnID')">
       <div class="x-blob-bar" xid="cdiv8">
        <i class="x-blob-edit icon-compose" xid="ci9"></i>
        <i class="x-blob-del icon-close-round" xid="ci10"></i></div> 
       <img class="x-blob-img media-object" xid="cimage3"></img></div> 
      <div xid="cdiv21" class="media-body">
       <div component="$UI/system/components/bootstrap/row/row" class="row" xid="crow3">
        <div class="col col-xs-6" xid="ccol6">
         <div component="$UI/system/components/justep/output/output" class="media-heading oa-title-data" xid="ccrofApplyPsnName" bind-ref='ref("fApplyPsnName")'></div></div> 
        <div class="col col-xs-6" xid="ccol7">
         <div component="$UI/system/components/justep/output/output" class="media-heading pull-right" xid="ccrofApplyDate" bind-ref='ref("fApplyDate")' format="yyyy-MM-dd"></div></div> </div> 
       <div component="$UI/system/components/bootstrap/row/row" class="row" xid="crow4">
        <div class="col col-xs-6" xid="ccol8">
         <div component="$UI/system/components/justep/output/output" xid="ccrofSignatureTypeName" bind-ref='ref("fNo")'></div></div> 
        <div class="col col-xs-6" xid="ccol9">
         <div component="$UI/system/components/justep/output/output" class="pull-right" xid="ccrosStatusName" bind-ref='ref("sStatusName")'></div></div> </div> </div> </div> </li> </ul> </div></div>  
              </div>  
            <div id="listDiv" component="$UI/system/components/bootstrap/row/row"
              class="row " xid="detailBtnGroup" style="width:100%;margin:0 auto;text-align:center;height:100%;background-color:#ffffff;"
              bind-click="detailBtnGroupClick"> 
              <div class="col col-xs-12 borders" xid="col1" style="height:10%;background-color:#ffffff;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-label" label="请假" xid="leaveBtn" style="color:#808080;width:100%;height:100%;" onClick="leaveBtnClick"> 
                  <i xid="i1"/>  
                  <span xid="span21" class="spanMar">请假</span> 
                </a> 
              </div>  
              <div class="col col-xs-12 borders" xid="col9" style="height:10%;background-color:#ffffff;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-label" label="报销" xid="reimbursementBtn"
                  style="color:#808080;width:100%;height:100%;" onClick="reimbursementBtnClick"> 
                  <i xid="i8"/>  
                  <span xid="span25" class="spanMar">报销</span> 
                </a> 
              </div>  
              <div class="col col-xs-12 borders" xid="col8" style="height:10%;background-color:#ffffff;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-label" label="出差" xid="businessBtn"
                  style="color:#808080;width:100%;height:100%;" onClick="businessBtnClick"> 
                  <i xid="i9"/>  
                  <span xid="span26" class="spanMar">出差</span> 
                </a> 
              </div>  
              <div class="col col-xs-12 borders" xid="col3" style="height:10%;background-color:#ffffff;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-label" label="外出" xid="outBtn" style="color:#808080;width:100%;height:100%;" onClick="outBtnClick"> 
                  <i xid="i10"/>  
                  <span xid="span27" class="spanMar">外出</span> 
                </a> 
              </div>  
              <div class="col col-xs-12 borders" xid="col7" style="height:10%;background-color:#ffffff;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-label" label="物品领用" xid="articleCollarBtn"
                  style="color:#808080;width:100%;height:100%;" onClick="articleCollarBtnClick"> 
                  <i xid="i11"/>  
                  <span xid="span28" class="spanMar">物品领用</span> 
                </a> 
              </div>  
              <div class="col col-xs-12 borders" xid="col11" style="height:10%;background-color:#ffffff;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-label" label="会议室申请" xid="conferenceRoomBtn"
                  style="color:#808080;width:100%;height:100%;" onClick="conferenceRoomBtnClick"> 
                  <i xid="i12"/>  
                  <span xid="span29" class="spanMar">会议室申请</span> 
                </a> 
              </div>  
              <div class="col col-xs-12 borders" xid="col10" style="height:10%;background-color:#ffffff;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-label" label="借款" xid="loanBtn" style="color:#808080;width:100%;height:100%;" onClick="loanBtnClick"> 
                  <i xid="i13"/>  
                  <span xid="span30" class="spanMar">借款</span> 
                </a> 
              </div>  
              <div class="col col-xs-12 borders" xid="col2" style="height:10%;background-color:#ffffff;"> 
                <a component="$UI/system/components/justep/button/button"
                  class="btn btn-link btn-only-label" label="印章" xid="sealBtn" style="color:#808080;width:100%;height:100%;" onClick="sealBtnClick"> 
                  <i xid="i14"/>  
                  <span xid="span31" class="spanMar">印章</span> 
                </a> 
              </div> 
            <div class="col col-xs-12 borders" xid="col12" style="background-color:#ffffff;height:20.6%;"></div></div> 
          </div> 
        </div></div></div> 
  <div class="x-panel-bottom" xid="waitBottom" style="display:none;"><div component="$UI/system/components/justep/button/buttonGroup" class="btn-group x-card btn-group-justified" tabbed="true" xid="buttonGroup2"><a component="$UI/system/components/justep/button/button" class="btn btn-default" label="待我审批" xid="waitMeBtn" target="waitMeContent">
   <i xid="i5"></i>
   <span xid="span1">待我审批</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-default" xid="approvedBtn" target="approvedContent">
   <i xid="i6"></i>
    <span xid="span3"><![CDATA[已审批的]]></span> 
   <span xid="lastSpan"></span></a></div></div>
  </div> 

  </div>
