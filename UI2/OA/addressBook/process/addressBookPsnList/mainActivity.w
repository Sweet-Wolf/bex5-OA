<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onActive="modelActive"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="mdMain" concept="OA_AB_AddressBook"> 
      <reader xid="default1" action="/OA/addressBook/logic/action/queryAddressBookAction"/>  
      <writer xid="default2" action="/OA/addressBook/logic/action/saveAddressBookAction"/>  
      <creator xid="default3" action="/OA/addressBook/logic/action/createAddressBookAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="mdSubMain" concept="OA_AB_AddressBookShare"> 
      <reader xid="default4" action="/OA/addressBook/logic/action/queryAddressBookShareAction"/>  
      <writer xid="default5" action="/OA/addressBook/logic/action/saveAddressBookShareAction"/>  
      <creator xid="default6" action="/OA/addressBook/logic/action/createAddressBookShareAction"/> 
    </div> 
  </div>  
  <div class="container-fluid" xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
      xid="toolBar1">
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="newBtnClick" xid="newBtn" label="添加" icon="icon-plus-round"> 
        <i xid="i3" class="icon-plus-round"/>  
        <span xid="span3">添加</span>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'mdMain.refresh'}" xid="button4"> 
        <i xid="i4"/>  
        <span xid="span4"/>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'mdMain.delete'}" xid="button2"> 
        <i xid="i2"/>  
        <span xid="span2"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        label="共享" xid="btnAddressBook" onClick="btnAddressBookClick" bind-enable=" $model.isCanShare()"> 
        <i xid="i5"/>  
        <span xid="span5">共享</span>
      </a>
    </div>  
    <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
      rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1"
      data="mdMain" onRowDblClick="dataTables1RowDblClick" onCellRender="dataTables1CellRender"> 
      <columns xid="columns1"> 
        <column name="fCreatePsnID" xid="column1" label="共享"/>  
        <column name="fName" xid="column2" label="名称"/>  
        <column name="fSex" xid="column3" label="性别"/>  
        <column name="fMobilePhone" xid="column4" label="手机号码"/>  
        <column name="fMail" xid="column5" label="电子信箱"/>  
        <column name="fCompanyPhone" xid="column6" label="工作电话"/>  
        <column name="fPhone" xid="column7" label="电话"/>  
        <column name="fFax" xid="column8" label="传真"/>  
        <column name="fGroup" xid="column9" label="分组"/>  
        <column name="fCustomerType" xid="column10" label="客户类型"/> 
      </columns> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="windowDialog"
    src="$UI/OA/addressBook/process/addressBookPsnList/shareActivityDlg.w" title="通讯录共享表"
    showTitle="true" status="normal" forceRefreshOnOpen="true"/>
</div>
