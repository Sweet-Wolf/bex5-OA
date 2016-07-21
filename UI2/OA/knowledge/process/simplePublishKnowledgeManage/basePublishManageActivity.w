<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:137px;top:466px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dKnowledge"
      concept="OA_KM_Knowledge" orderBy="fCreateTime:desc" autoLoad="true"> 
      <reader xid="default1" action="/OA/knowledge/logic/action/queryKMKnowledgeAction"/>  
      <writer xid="default2" action="/OA/knowledge/logic/action/saveKMKnowledgeAction"/>  
      <creator xid="default3" action="/OA/knowledge/logic/action/createKMKnowledgeAction"/>  
      <calculateRelation relation="recNo" xid="calculateRelation1" type="Integer"/>  
      <rule xid="rule1"> 
        <col name="recNo" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default21">$row.index() +1</expr> 
          </calculate> 
        </col> 
      </rule> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dFolder"
      concept="OA_KM_Folder" isTree="true"> 
      <reader xid="default4" action="/OA/knowledge/logic/action/queryFolderAction"/>  
      <treeOption xid="default5" parentRelation="fParent" rootFilter="OA_KM_Folder.fParent = 'public'"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dFilter" idColumn="folderID"> 
      <column label="folderID" name="folderID" type="String" xid="default6"/>  
      <column label="folderName" name="folderName" type="String" xid="default7"/>  
      <column label="canRelease" name="canRelease" type="String" xid="default8"/>  
      <data xid="default9">[{"folderID":"","folderName":"","canRelease":""}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dReleaseStatus" idColumn="label"> 
      <column label="label" name="label" type="String" xid="default10"/>  
      <column label="value" name="value" type="Integer" xid="default11"/>  
      <data xid="default12">[{"label":"未发布","value":0},{"label":"已发布","value":1},{"label":"已取消","value":2}]</data> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dTemp" idColumn="firstFolderFullID"> 
      <column label="firstFolderFullID" name="firstFolderFullID" type="String"
        xid="default13"/>  
      <column label="firstFolderName" name="firstFolderName" type="String" xid="default14"/>  
      <column label="secondFolderName" name="secondFolderName" type="String" xid="default15"/>  
      <data xid="default16">[{}]</data> 
    </div> 
  </div>  
  <div class="container-fluid" xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="toolBar1" style="height:auto;"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="openPublishKnowledgeByNew" xid="button3" label="新增" icon="icon-android-add"> 
        <i xid="i3" class="icon-android-add"/>  
        <span xid="span3">新增</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dKnowledge.save'}" xid="button1"> 
        <i xid="i1"/>  
        <span xid="span1"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dKnowledge.delete'}" xid="button2"> 
        <i xid="i2"/>  
        <span xid="span2"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dKnowledge.refresh'}" xid="button4"> 
        <i xid="i4"/>  
        <span xid="span4"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dKnowledgeFilter.menu'}" xid="button5"> 
        <i xid="i5"/>  
        <span xid="span5"/> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="btnPublish" label="发布知识" onClick="relaseKnowledge"> 
        <i xid="i6"/>  
        <span xid="span6">发布知识</span> 
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="btnStopPublish" label="取消发布" onClick="cancelRelaseKnowledge"> 
        <i xid="i7"/>  
        <span xid="span7">取消发布</span> 
      </a>  
      <div component="$UI/system/components/justep/orgFilter/orgFilter" xid="orgFilter"
        class="x-control" useMyself="true" onFilter="orgFilterFilter" defaultValue="_myself_"
        autoRefresh="true" filterData="dKnowledge" orgFIDCol="fCreatePsnFID" personIDCol="fCreatePsnID"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
          xid="orgSelectPC1" manageCodes="knowledgeManagement" multiselect="true"
          style="width:140px;"> 
          <option xid="option3"> 
            <columns xid="columns2"> 
              <column name="sName" xid="column1"/> 
            </columns> 
          </option> 
        </div> 
      </div>  
      <div class="x-control" component="$UI/system/components/justep/gridFilter/gridFilter"
        xid="gdfRelaseStatus" filterData="dKnowledge" filterCol="fReleaseStatus"> 
        <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
          xid="gridSelect1" multiselect="true" defaultLabel="'未发布,已发布'"> 
          <option xid="option1" data="dReleaseStatus" value="value" label="label"/> 
        </div> 
      </div>  
      <div class="x-smartFilter-clear-hide input-group" component="$UI/system/components/justep/smartFilter/smartFilter"
        xid="smartFilter" filterData="dKnowledge" filterCols="fFolderName,fTitle,fDocNumber,fWriter"
        style="width:140px;" autoRefresh="true"> 
        <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
          bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
          xid="input14"/>  
        <span class="input-group-addon x-smartFilter-refresh" bind-click="$model.comp($element.parentElement).refresh.bind($model.comp($element.parentElement))"
          xid="span14"> 
          <i class="icon-android-search" xid="i9"/> 
        </span> 
      </div> 
    </div>  
    <!--     <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" -->  
    <!--       altRows="true" class="x-grid-no-bordered" xid="grdKnowledge" data="dKnowledge" -->  
    <!--       height="auto" width="100%" onRowDblClick="grdKnowledgeRowDblClick">  -->  
    <!--       <columns xid="columns3"> -->  
    <!--         <column width="100" name="fReleaseStatusName" xid="column13" label="状态"> -->  
    <!--           <editor xid="editor5">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input5" bind-ref="ref('fReleaseStatusName')"/> -->  
    <!--           </editor> -->  
    <!--         </column> -->  
    <!--         <column width="100" name="fFolderFullName" xid="column6"> -->  
    <!--           <editor xid="editor4">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input4" bind-ref="ref('fFolderFullName')"/> -->  
    <!--           </editor> -->  
    <!--         </column> -->  
    <!--         <column width="100" name="fTitle" xid="column2"> -->  
    <!--           <editor xid="editor1">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input1" bind-ref="ref('fTitle')"/> -->  
    <!--           </editor> -->  
    <!--         </column>   -->  
    <!--         <column width="100" name="fKeyword" xid="column3"> -->  
    <!--           <editor xid="editor2">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input2" bind-ref="ref('fKeyword')"/> -->  
    <!--           </editor> -->  
    <!--         </column>   -->  
    <!--         <column width="100" name="fDocNumber" xid="column4"> -->  
    <!--           <editor xid="editor6">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input6" bind-ref="ref('fDocNumber')"/> -->  
    <!--           </editor> -->  
    <!--         </column>   -->  
    <!--         <column width="100" name="fWriter" xid="column5"> -->  
    <!--           <editor xid="editor7">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input7" bind-ref="ref('fWriter')"/> -->  
    <!--           </editor> -->  
    <!--         </column>   -->  
    <!--         <column width="100" name="fReleaseTime" xid="column12"> -->  
    <!--           <editor xid="editor13">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input13" bind-ref="ref('fReleaseTime')"/> -->  
    <!--           </editor> -->  
    <!--         </column> -->  
    <!--         <column width="100" name="fReleaseDeptName" xid="column10"> -->  
    <!--           <editor xid="editor11">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input11" bind-ref="ref('fReleaseDeptName')"/> -->  
    <!--           </editor> -->  
    <!--         </column>   -->  
    <!--         <column width="100" name="fReleasePsnName" xid="column11"> -->  
    <!--           <editor xid="editor12">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input12" bind-ref="ref('fReleasePsnName')"/> -->  
    <!--           </editor> -->  
    <!--         </column>   -->  
    <!--         <column width="100" name="fCreateDeptName" xid="column7"> -->  
    <!--           <editor xid="editor8">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" xid="input8" bind-ref="ref('fCreateDeptName')" /> -->  
    <!--           </editor> -->  
    <!--         </column><column width="100" name="fCreatePsnFName" xid="column8" label="提交人员全名称"> -->  
    <!--           <editor xid="editor9">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" xid="input9" bind-ref="ref('fCreatePsnName')" /> -->  
    <!--           </editor> -->  
    <!--         </column><column width="100" name="fCreateTime" xid="column9"> -->  
    <!--           <editor xid="editor10">  -->  
    <!--             <input component="$UI/system/components/justep/input/input" class="form-control" -->  
    <!--               xid="input10" bind-ref="ref('fCreateTime')"/> -->  
    <!--           </editor> -->  
    <!--         </column> -->  
    <!--       </columns> -->  
    <!--     </div> -->  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table table-hover table-striped" xid="grdKnowledge"
      data="dKnowledge" showRowNumber="true"> 
      <columns xid="columns1"> 
        <column name="fReleaseStatusName" xid="column2"/>  
        <column name="fFolderFullName" xid="fFolderFullName"/>  
        <column name="fTitle" xid="fTitle"/>  
<!--         <column name="fKeyword" xid="fKeyword"/>   -->
        <column name="fDocNumber" xid="fDocNumber"/>  
        <column name="fWriter" xid="fWriter"/>  
        <column name="fReleaseTime" xid="fReleaseTime"/>  
        <column name="fReleaseDeptName" xid="fReleaseDeptName"/>  
        <column name="fReleasePsnName" xid="fReleasePsnName"/>  
<!--         <column name="fCreateDeptName" xid="fCreateDeptName"/>   -->
        <column name="fCreateTime" xid="fCreateTime"/> 
      </columns> 
    </div>  
    <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
      xid="pagerBar" data="dKnowledge"> 
      <div class="row" xid="div1"> 
        <div class="col-sm-3" xid="div2"> 
          <div class="x-pagerbar-length" xid="div3"> 
            <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
              class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
              <span xid="span12">显示</span>  
              <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
                xid="select1"> 
                <option value="10" xid="default17">10</option>  
                <option value="20" xid="default18">20</option>  
                <option value="50" xid="default19">50</option>  
                <option value="100" xid="default20">100</option> 
              </select>  
              <span xid="span13">条</span> 
            </label> 
          </div> 
        </div>  
        <div class="col-sm-3" xid="div4"> 
          <div class="x-pagerbar-info" xid="div5">当前显示0条，共0条</div> 
        </div>  
        <div class="col-sm-6" xid="div6"> 
          <div class="x-pagerbar-pagination" xid="div7"> 
            <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination"
              xid="pagination1"> 
              <li class="prev" xid="li1"> 
                <a href="#" xid="a1"> 
                  <span aria-hidden="true" xid="span10">«</span>  
                  <span class="sr-only" xid="span11">Previous</span> 
                </a> 
              </li>  
              <li class="next" xid="li2"> 
                <a href="#" xid="a2"> 
                  <span aria-hidden="true" xid="span8">»</span>  
                  <span class="sr-only" xid="span9">Next</span> 
                </a> 
              </li> 
            </ul> 
          </div> 
        </div> 
      </div> 
    </div>  
    <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="dKnowledgeFilter"
      filterData="dKnowledge"/> 
  </div> 
</div>
