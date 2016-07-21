<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="mdKnowledge"
    style="height:auto;left:143px;top:459px;" onModelConstructDone="mdKnowledgeModelConstructDone">
    <div component="$UI/system/components/justep/data/bizData" xid="dKnowledge"
      concept="OA_KM_Knowledge" columns="fTitle,fKeyword,fDocNumber,fImportant,fImportantName,fWriter,fFolderID,fFolderName,fFolderFullID,fFolderFullName,fRightsText,fIsNeedApprove,fContentType,fContentTypeName,fTemplateID,fTemplateName,fLinkURL,fContentURL,fIsTop,fTopBeginTime,fTopEndTime,fCreateOgnID,fCreateOgnName,fCreateDeptID,fCreateDeptName,fCreatePsnID,fCreatePsnName,fCreatePsnFID,fCreatePsnFName,fCreateTime,fReleaseOgnID,fReleaseOgnName,fReleaseDeptID,fReleaseDeptName,fReleasePsnID,fReleasePsnName,fReleasePsnFID,fReleasePsnFName,fReleaseTime,fReleaseStatus,fReleaseStatusName,fApproverID,fApproverName,fApproveTime,fBizState,fBizStateName,fIsDisplayOnPortal,fIsInheritRights,fOtherFolders,fBizID,fBizType,fBizTypeName,fReaderCount,fRepliesCount,version,fGZPsnIDs"
      orderBy="fReleaseTime:desc" confirmRefresh="false">
      <reader xid="default1" action="/OA/knowledge/logic/action/queryKnowledgeAction"/>  
      <calculateRelation relation="rec" xid="calculateRelation1" type="Integer"/>  
      <writer xid="default13"/>  
      <rule xid="rule1"> 
        <col name="rec" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default6">$row.index() + 1</expr>
          </calculate> 
        </col> 
      </rule>
    </div>  
<div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dFolder" idColumn="folderID" onIndexChanged="dFolderIndexChanged" isTree="true" onCreate="dFolderCreate">
   <column label="fName" name="fName" type="String" xid="default5"></column>
   <column label="folderFullID" name="folderFullID" type="String" xid="default12"></column>
   <column label="folderID" name="folderID" type="String" xid="column2"></column>
   <column label="fParent" name="fParent" type="String" xid="default14"></column>
   <treeOption xid="default15" parentRelation="fParent"></treeOption></div></div>  
    
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dKnowledgeFilter"
    style="left:64px;top:223px;" filterData="dKnowledge"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgKnowledgeBase"
    style="left:87px;top:78px;" src="$UI/OA/knowledge/process/knowledgeBase/knowledgeBaseActivity.w"
    title="知识中心" showTitle="true" status="normal" width="90%" height="90%"/>
<div class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form" xid="form1"><div component="$UI/system/components/bootstrap/row/row(bootstrap)" class="row" xid="row1"> 
    <div class="col col-xs-3" xid="div1">
      <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grdFolder" data="dFolder" width="100%" height="auto" appearance="tree" expandColumn="fName" onRowExpand="grdFolderRowExpand" onRowClick="grdFolderRowClick"> 
        <columns xid="columns1">
          <column width="100" name="fName" xid="column1" label="名称" editable="true" /> 
        </columns>
      </div>
    </div>  
    <div class="col col-xs-9" xid="div2">
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dKnowledge.refresh'}" xid="button1"> 
          <i xid="i1" />  
          <span xid="span1" />
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'dKnowledgeFilter.menu'}" xid="button2"> 
          <i xid="i2" />  
          <span xid="span2" />
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnCancel" label="取消关注" onClick="btnCancelClick"> 
          <i xid="i3" />  
          <span xid="span3">取消关注</span>
        </a>
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" xid="btnZSK" label="进入知识中心增加关注" onClick="btnZSKClick"> 
          <i xid="i4" />  
          <span xid="span4">进入知识中心增加关注</span>
        </a>  
        <span component="$UI/system/components/justep/button/checkbox" class="x-checkbox" xid="displaySubChb" checked="true" bind-click="displayKnowledge" value="true" checkedValue="true" />  
        <label xid="label1"><![CDATA[显示下级]]></label>  
        <div component="$UI/system/components/justep/dateFilter/dateFilter" xid="dateFilter" class="x-control" filterData="dKnowledge" filterMode="singleDate" dateCol="fReleaseTime" defaultValue="all" autoRefresh="true"> 
          <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect" style="width:70px;" optionHeight="390"> 
            <option xid="option2" />
          </div> 
        </div>  
        <div class="x-smartFilter-clear-hide input-group" component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter" filterData="dKnowledge" filterCols="fFolderName,fTitle,fDocNumber,fWriter" style="width:140px;" autoRefresh="true"> 
          <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input14" />  
          <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))" xid="span14"> 
            <i class="icon-android-search" xid="i9" />
          </span> 
        </div>
      </div>  
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true" rowActiveClass="active" class="table table-hover table-striped" xid="dtKnowledge" data="dKnowledge" onRowDblClick="dtKnowledgeRowDblClick"> 
        <columns xid="columns4"> 
          <column name="rec" xid="column12" label="序号" />
          <column name="fTitle" xid="column3" />
          <column name="fDocNumber" xid="column5" />
          <column name="fWriter" xid="column6" />
          <column name="fReleaseDeptName" xid="column8" />
          <column name="fReleasePsnName" xid="column9" />
          <column name="fReleaseTime" xid="column10" /> 
        </columns>
      </div>  
      <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pagerBar" data="dKnowledge"> 
        <div class="row" xid="div6"> 
          <div class="col-sm-3" xid="div7"> 
            <div class="x-pagerbar-length" xid="div8"> 
              <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                <span xid="span5">显示</span>  
                <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1"> 
                  <option value="10" xid="default7">10</option>  
                  <option value="20" xid="default8">20</option>  
                  <option value="50" xid="default9">50</option>  
                  <option value="100" xid="default10">100</option>
                </select>  
                <span xid="span6">条</span>
              </label> 
            </div> 
          </div>  
          <div class="col-sm-3" xid="div9"> 
            <div class="x-pagerbar-info" xid="div10">当前显示0条，共0条</div>
          </div>  
          <div class="col-sm-6" xid="div11"> 
            <div class="x-pagerbar-pagination" xid="div12"> 
              <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1"> 
                <li class="prev" xid="li1"> 
                  <a href="#" xid="a1"> 
                    <span aria-hidden="true" xid="span7">«</span>  
                    <span class="sr-only" xid="span8">Previous</span>
                  </a> 
                </li>  
                <li class="next" xid="li2"> 
                  <a href="#" xid="a2"> 
                    <span aria-hidden="true" xid="span9">»</span>  
                    <span class="sr-only" xid="span10">Next</span>
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div> 
        </div> 
      </div>
    </div> 
  </div></div></div>
