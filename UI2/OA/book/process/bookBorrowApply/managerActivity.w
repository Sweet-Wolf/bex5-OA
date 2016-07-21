<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xmlns:xu="http://www.xmldb.org/xupdate"
  xmlns:xui="http://www.justep.com/xui" __id="id_1" component="$UI/system/components/justep/window/window" extends="$UI/OA/book/process/bookBorrowApply/mainActivity.w"
  xid="window" class="window window window window window" design="device:mobile">  
  <div xid="detailgrid" xui:update-mode="delete"/>  
  <rule xid="rule1_1" xui:parent="dBookApplyM" xui:update-mode="insert"> 
    <readonly xid="readonly1_1"> 
      <expr xid="default1_1">$model.datareadOnly()</expr> 
    </readonly> 
  </rule>  
  <li class="x-menu-item" xid="backItem" xui:parent="moreContent" xui:update-mode="insert"> 
    <a class="btn btn-link" component="$UI/system/components/justep/button/button"
      label="button" onClick="{operation:'process.back'}" xid="backBtn"> 
      <i xid="i1_2"/>  
      <span xid="span1_2">button</span> 
    </a> 
  </li>  
  <label xid="IntendStartDateL" style="width:100px;" xui:update-mode="merge"/>  
  <div class="table table-hover table-striped" component="$UI/system/components/justep/dataTables/dataTables"
    data="dBookApplyD" flexibleWidth="true" rowActiveClass="active" xid="dataTables1_3"
    xui:parent="productGroup" xui:update-mode="insert"> 
    <columns xid="columns1_3"> 
      <column name="fBooksNumber" xid="column1_3"/>  
      <column name="fBooksName" xid="column2_3"/>  
      <column name="fBooksTypeName" xid="column3_3"/>  
      <column name="fAuthor" xid="column5_3"/>  
      <column name="fBookConcern" xid="column4_3"/>  
      <column name="fPrice" xid="column8_3"/>  
      <column name="fPageNum" xid="column6_3"/>  
      <column name="fRemark" xid="column7_3"/> 
    </columns> 
  </div>  
  <a xid="addBookBtn" bind-enable="$model.readOnly()" xui:update-mode="merge"/>  
  <a xid="deleteBtn" bind-enable="$model.readOnly()" xui:update-mode="merge"/> 
</div>
