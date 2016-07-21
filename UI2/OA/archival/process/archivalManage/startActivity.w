<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" xid="window" design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:642px;top:2px;" onLoad="modelLoad">
    <div component="$UI/system/components/justep/data/bizData" xid="dArchivalRoll" directDelete="true" autoLoad="true" concept="OA_AM_Archival" limit="15" columns="" onSaveCommit="saveCommit" isTree="true"> 
      <reader action="/OA/archival/logic/action/queryAMArchivalAction" />  
      <writer action="/OA/archival/logic/action/saveAMArchivalAction" />  
      <creator action="/OA/archival/logic/action/createAMArchivalAction" />  
      <calculateRelation relation="calcCheckBox" /> 
    <treeOption xid="default6" parentRelation="fFileNO"></treeOption></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="false" xid="dvFileCheck" concept="V_OA_AM_FiledCheck" orderBy="fRollName:asc,fRelevanceName:asc,fArchivalNO:asc"><reader xid="default5" action="/OA/archival/logic/action/queryVAMFiledCheckAction"></reader></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dBtnState" idColumn="page"><column label="page" name="page" type="String" xid="xid1"></column>
  <column label="insertRoll" name="insertRoll" type="String" xid="xid2"></column>
  <column label="insertFile" name="insertFile" type="String" xid="xid3"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dFileState" idColumn="label"><column label="label" name="label" type="String" xid="xid4"></column>
  <column label="value" name="value" type="String" xid="xid5"></column>
  <data xid="default7">[{&quot;label&quot;:&quot;編制中&quot;,&quot;value&quot;:&quot;01&quot;},{&quot;label&quot;:&quot;已提交&quot;,&quot;value&quot;:&quot;02&quot;},{&quot;label&quot;:&quot;已归档&quot;,&quot;value&quot;:&quot;03&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="dRollState" idColumn="label"><column label="label" name="label" type="String" xid="xid6"></column>
  <column label="value" name="value" type="String" xid="xid7"></column>
  <data xid="default8">[{&quot;label&quot;:&quot;編制中&quot;,&quot;value&quot;:&quot;11&quot;},{&quot;label&quot;:&quot;已提交&quot;,&quot;value&quot;:&quot;12&quot;},{&quot;label&quot;:&quot;已立卷&quot;,&quot;value&quot;:&quot;13&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="false" xid="dTreeData" idColumn="fName" isTree="true" onAfterRefresh="dTreeDataAfterRefresh">
  <column label="fName" name="fName" type="String" xid="xid8"></column>
  <column label="fType" name="fType" type="String" xid="xid9"></column>
  <column label="fID" name="fID" type="String" xid="xid10"></column>
  <column label="fFondsID" name="fFondsID" type="String" xid="xid11"></column>
  <column label="fFondsName" name="fFondsName" type="String" xid="xid12"></column>
  <column label="fCategoryID" name="fCategoryID" type="String" xid="xid13"></column>
  <column label="fCategoryName" name="fCategoryName" type="String" xid="xid14"></column>
  <column label="fCategoryURLName" name="fCategoryURLName" type="String" xid="xid15"></column>
  
  <treeOption xid="default15" parentRelation="fName" delayLoad="false"></treeOption>
  <data xid="default16">[{&quot;fName&quot;:&quot;档案管理&quot;,&quot;fType&quot;:&quot;root&quot;,&quot;fID&quot;:&quot;root&quot;,&quot;fFondsID&quot;:&quot;&quot;}]</data></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="dExcelTemp" concept="OA_AM_ExcelTemp"><reader xid="default9" action="/OA/archival/logic/action/queryOA_AM_ExcelTempAction"></reader>
  <writer xid="default10" action="/OA/archival/logic/action/saveOA_AM_ExcelTempAction"></writer>
  <creator xid="default11" action="/OA/archival/logic/action/createOA_AM_ExcelTempAction"></creator></div>
  <div component="$UI/system/components/justep/data/bizData" autoLoad="true" xid="treeData" concept="V_OA_AM_CategorySelect" isTree="true" limit="-1">
   <reader xid="default12" action="/OA/archival/logic/action/queryVAMCategorySelectAction"></reader>
   <treeOption xid="default13" parentRelation="fParentID" rootFilter="V_OA_AM_CategorySelect.fParentID='_is_root_' AND V_OA_AM_CategorySelect.fFondsName='c31'" delayLoad="false"></treeOption>
   <master xid="default14" data="treeData"></master></div></div>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgShowFile" src="/OA/archival/process/dialog/archivalFileDetail/archivalFileDetail.w" title="件信息" showTitle="true" status="normal" width="780px" height="440px" top="346px" left="276px" style="left:249px;top:495px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgShowRoll" src="/OA/archival/process/dialog/archivalRollDetail/archivalRollDetail.w" title="卷信息" showTitle="true" status="normal" width="780px" height="470px" top="328px" left="211px" style="left:179px;top:462px;"></span>
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgEditFile" title="件信息" src="/OA/archival/process/dialog/archivalFileDialog/archivalFileDialogForSubmit.w" showTitle="true" status="normal" width="780px" height="480px" left="423px" top="317px" style="left:69px;top:459px;"></span><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgEditRoll" src="/OA/archival/process/dialog/archivalRollDialog/archivalRollDialog.w" title="案卷信息" showTitle="true" status="normal" width="780px" height="480px" style="left:113px;top:460px;"></span><span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgRollsList" src="/OA/archival/process/dialog/archivalSingleDialog/archivalSingleDialog.w" title="案卷列表" showTitle="true" status="normal" width="600px" height="370px" style="left:147px;top:472px;" onLoad="dlgRollsListLoad" onReceive="dlgRollsListReceive"></span>
  <div component="$UI/system/components/justep/excel/importExcel" xid="importExcel1" data="dExcelTemp" mappings="/UI/OA/archival/process/archivalSubmit/archivalRollImport.mapping.xml" style="left:344px;top:496px;"></div>
  <div component="$UI/system/components/justep/excel/importExcel" xid="importExcel2" data="dExcelTemp" mappings="/UI/OA/archival/process/archivalSubmit/archivalRollImport.mapping.xml" style="left:418px;top:502px;"></div><div xid="view">
   <div class="x-panel-content container-fluid" xid="content1">
    
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row2" style="height:100%;overflow: hidden;">
     <div class="col col-xs-12 col-sm-3 col-md-3 col-lg-3" xid="col24" style="padding-left: 0;height:100%;">
      <div class="x-bordered" style="height:7700%;" xid="div12">
       <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grdSCTree" data="dTreeData" appearance="tree" useVirtualRoot="true" virtualRootLabel="档案管理" height="auto" directEdit="false" expandColumn="fName" width="100%">
   <columns xid="columns1">
    <column width="100" name="fName" xid="column10"></column><column width="100" name="fType" xid="column11"></column><column width="100" name="fID" xid="column12"></column></columns> </div></div> 
  </div> 
     <div class="col col-xs-1 col-sm-1 col-md-1 col-lg-1" xid="col24" style="padding:5% 0 0 0;height:100%;width:10px;"></div>
     <div class="col col-xs-12 col-sm-8 col-md-8 col-lg-8" xid="col20" style="height:100%;padding-right: 0;">
      <div component="$UI/system/components/bootstrap/tabs/tabs" xid="tabs">
   <ul class="nav nav-tabs" xid="navs">
    <li class="active" xid="nav-list">
     <a content="list" xid="tabItem1"><![CDATA[案卷管理]]></a></li> 
    <li role="presentation" xid="nav-detail">
     <a content="detail" xid="tabItem2"><![CDATA[未组卷档案]]></a></li> 
  <li xid="nav-list2">
   <a content="tabContent1" xid="tabItem3"><![CDATA[预归档]]></a></li></ul> 
   <div class="tab-content" xid="contents">
    <div class="tab-pane active" xid="list">
     <div xid="bar" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
      <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1" filterData="dArchivalRoll" class="pull-right" filterCols="OA_AM_Archival,version,fFileNO,fDocumentNO,fArchivalNO,fMicroNO,fSequence,fMenuNO,fPageNO,fBoxNO,fAMDate,fAMLevel,fAMYear,fSecret,fDescription,fBusinessID,fFuncURL,fTitle,fSubTitle,fKeyWord,fFondsID,fFondsName,fCategoryID,fCategoryName,fRollID,fRollName,fFileDeptID,fFileDeptName,fResponsibleID,fResponsibleName,fFileDate,fKeepLimit,fCarry,fIsBorrow,fNum,fUnit,fRoom,fChest,fGrid,fVersionCode,fRemark,fState,fStateName,fSign,fIsRoll,fVoucherBegin,fVoucherEnd,fVoucherNum,fVoucherNO,fURL,fRelevanceID,fRelevanceName,fDocLink,fInventory,fCreateOgnID,fCreateOgnName,fCreateDeptID,fCreateDeptName,fCreatePosID,fCreatePosName,fCreatePsnID,fCreatePsnName,fCreatePsnFID,fCreatePsnFName,fCreateTime,fExtendStr1,fExtendStr2,fExtendStr3,fExtendStr4,fExtendStr5,fExtendStr6,fExtendStr7,fExtendStr8,fExtendStr9,fExtendDate1,fExtendDate2,fExtendDate3,fExtendDate4,fExtendDate5,fExtendNum1,fExtendNum2,fExtendNum3,fExtendNum4,fExtendNum5,fCopies,fPages">
       <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input4"></input></div> 
      <a component="$UI/system/components/justep/button/button" label=" 新建" class="btn btn-link btn-icon-left btn-only-icon" icon="icon-plus" onClick="addBtnClick" xid="button6">
       <i class="icon-plus" xid="i9"></i>
       <span xid="span14">新建</span></a> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-icon" xid="button4" onClick="button2Click" label="删除" icon="icon-android-close">
       <i xid="i7" class="icon-android-close"></i>
       <span xid="span11">删除</span></a> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-icon" xid="button3" onClick='{"operation":"dArchivalRoll.refresh"}'>
       <i xid="i6"></i>
       <span xid="span10">刷新</span></a> 
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="导入Excel" xid="rollExcelImport" icon="icon-arrow-down-c">
   <i xid="i1" class="icon-arrow-down-c"></i>
   <span xid="span13">导入Excel</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="封卷" xid="seaming" onClick="seamingClick">
   <i xid="i11"></i>
   <span xid="span16">封卷</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="拆卷" xid="resolution" onClick="resolutionClick">
   <i xid="i12"></i>
   <span xid="span17">拆卷</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="提交" xid="btnMultiRoll">
   <i xid="i13"></i>
   <span xid="span18">提交</span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="批量修改类目" xid="trgUpdateRoll">
   <i xid="i14"></i>
   <span xid="span19">批量修改类目</span></a></div> 
     <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grdvRollCheck" data="dArchivalRoll">
   <columns xid="columns2"><column width="100" name="fFileNO" xid="column20"></column>
  <column width="100" name="fArchivalNO" xid="column21"></column>
  <column width="100" name="fAMYear" xid="column22"></column>
  <column width="100" name="fSecret" xid="column23"></column>
  <column width="100" name="fTitle" xid="column24"></column>
  <column width="100" name="fFondsName" xid="column25"></column>
  <column width="100" name="fCategoryName" xid="column26"></column>
  <column width="100" name="fResponsibleName" xid="column27"></column>
  <column width="100" name="fFileDate" xid="column28"></column>
  <column width="100" name="fKeepLimit" xid="column29"></column>
  <column width="100" name="fCarry" xid="column30"></column>
  <column width="100" name="fStateName" xid="column31"></column>
  <column width="100" name="fVoucherBegin" xid="column32"></column>
  <column width="100" name="fVoucherEnd" xid="column33"></column>
  <column width="100" name="fVoucherNum" xid="column34"></column>
  <column width="100" name="fVoucherNO" xid="column35"></column></columns></div><div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid" xid="pageBar" data="dArchivalRoll">
      <div class="row" xid="div1">
       <div class="col-sm-3" xid="div2">
        <div class="x-pagerbar-length" xid="div3">
         <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect" class="x-pagerlimitselect" xid="limitSelect1">
          <span xid="span2">显示</span>
          <select component="$UI/system/components/justep/select/select" class="form-control input-sm" xid="select1">
           <option value="10" xid="default1">10</option>
           <option value="20" xid="default2">20</option>
           <option value="50" xid="default3">50</option>
           <option value="100" xid="default4">100</option></select> 
          <span xid="span5">条</span></label> </div> </div> 
       <div class="col-sm-3" xid="div4">
        <div class="x-pagerbar-info" xid="div5">当前显示1-10条，共16条</div></div> 
       <div class="col-sm-6" xid="div6">
        <div class="x-pagerbar-pagination" xid="div7">
         <ul class="pagination" component="$UI/system/components/bootstrap/pagination/pagination" xid="pagination1">
          <li class="prev" xid="li1">
           <a href="#" xid="a1">
            <span aria-hidden="true" xid="span6">«</span>
            <span class="sr-only" xid="span7">Previous</span></a> </li> 
          <li class="next" xid="li2">
           <a href="#" xid="a2">
            <span aria-hidden="true" xid="span8">»</span>
            <span class="sr-only" xid="span9">Next</span></a> </li> </ul> </div> </div> </div> </div> </div> 
    <div class="tab-pane" xid="detail">
   <div xid="toolBar1" component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline">
   <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter2" filterData="dArchivalRoll" class="pull-right" filterCols="OA_AM_Archival,version,fFileNO,fDocumentNO,fArchivalNO,fMicroNO,fSequence,fMenuNO,fPageNO,fBoxNO,fAMDate,fAMLevel,fAMYear,fSecret,fDescription,fBusinessID,fFuncURL,fTitle,fSubTitle,fKeyWord,fFondsID,fFondsName,fCategoryID,fCategoryName,fRollID,fRollName,fFileDeptID,fFileDeptName,fResponsibleID,fResponsibleName,fFileDate,fKeepLimit,fCarry,fIsBorrow,fNum,fUnit,fRoom,fChest,fGrid,fVersionCode,fRemark,fState,fStateName,fSign,fIsRoll,fVoucherBegin,fVoucherEnd,fVoucherNum,fVoucherNO,fURL,fRelevanceID,fRelevanceName,fDocLink,fInventory,fCreateOgnID,fCreateOgnName,fCreateDeptID,fCreateDeptName,fCreatePosID,fCreatePosName,fCreatePsnID,fCreatePsnName,fCreatePsnFID,fCreatePsnFName,fCreateTime,fExtendStr1,fExtendStr2,fExtendStr3,fExtendStr4,fExtendStr5,fExtendStr6,fExtendStr7,fExtendStr8,fExtendStr9,fExtendDate1,fExtendDate2,fExtendDate3,fExtendDate4,fExtendDate5,fExtendNum1,fExtendNum2,fExtendNum3,fExtendNum4,fExtendNum5,fCopies,fPages">
    <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']" bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))" xid="input1"></input></div> 
   <a component="$UI/system/components/justep/button/button" label="添加" class="btn btn-link btn-icon-left btn-only-icon" icon="icon-plus" onClick="addBtnClick" xid="insertFile">
    <i class="icon-plus" xid="i15"></i>
    <span xid="span23">添加</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-icon" xid="deleteFile" onClick="button2Click" label="删除" icon="icon-android-close">
    <i xid="i20" class="icon-android-close"></i>
    <span xid="span20">删除</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-icon" xid="refresh-item" onClick='{"operation":"dArchivalRoll.refresh"}'>
    <i xid="i21"></i>
    <span xid="span21">刷新</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="导入Excel" xid="fileExcelImport" icon="icon-arrow-down-c">
    <i xid="i22" class="icon-arrow-down-c"></i>
    <span xid="span24">导入Excel</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="组卷" xid="shiftin" onClick="shiftinClick">
    <i xid="i17"></i>
    <span xid="span22">组卷</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="移除" xid="shiftout">
    <i xid="i18"></i>
    <span xid="span26">移除</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="提交" xid="btnMultiFiled">
    <i xid="i19"></i>
    <span xid="span27">提交</span></a> 
   <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="批量修改类目" xid="trgUpdateFile">
    <i xid="i16"></i>
    <span xid="span25">批量修改类目</span></a> </div><div class="container-fluid" xid="div13">
    
  <div component="$UI/system/components/justep/grid/grid" hiddenCaptionbar="true" altRows="true" class="x-grid-no-bordered" xid="grdvFliedCheck" data="dvFileCheck">
   <columns xid="columns3"><column width="100" name="fFileNO" xid="column36"></column>
  <column width="100" name="fDocumentNO" xid="column37"></column>
  <column width="100" name="fArchivalNO" xid="column38"></column>
  <column width="100" name="fAMYear" xid="column39"></column>
  <column width="100" name="fSecret" xid="column40"></column>
  <column width="100" name="fTitle" xid="column41"></column>
  <column width="100" name="fCategoryName" xid="column42"></column>
  <column width="100" name="fRollName" xid="column43"></column>
  <column width="100" name="fKeepLimit" xid="column44"></column>
  <column width="100" name="fCarry" xid="column45"></column>
  <column width="100" name="fStateName" xid="column46"></column>
  <column width="100" name="fSign" xid="column47"></column>
  <column width="100" name="fRelevanceName" xid="column48"></column>
  <column width="100" name="fCreatePsnName" xid="column49"></column>
  <column width="100" name="fCreateTime" xid="column50"></column></columns></div></div> </div>
  <div class="tab-pane" xid="tabContent1"></div></div> </div></div> </div> </div> </div>  
   
</div>