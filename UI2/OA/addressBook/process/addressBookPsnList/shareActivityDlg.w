<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc;">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:154px;top:160px;"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="mdMain" concept="OA_AB_AddressBook"> 
      <reader xid="default1" action="/OA/addressBook/logic/action/queryAddressBookAction"/>  
      <writer xid="default2" action="/OA/addressBook/logic/action/saveAddressBookAction"/>  
      <creator xid="default3" action="/OA/addressBook/logic/action/createAddressBookAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="subMain" concept="OA_AB_AddressBookShare"> 
      <reader xid="default4" action="/OA/addressBook/logic/action/queryAddressBookShareAction"/>  
      <writer xid="default5" action="/OA/addressBook/logic/action/saveAddressBookShareAction"/>  
      <creator xid="default6" action="/OA/addressBook/logic/action/createAddressBookShareAction"/>  
      <master xid="default7" data="mdMain" relation="fMasterID"/> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/org/orgDialogPC" showTitle="true"
    xid="orgDlgSingleDept" title="选择人员" status="normal" width="60%" height="55%" multiSelection="true" includeOrgKind="ogn,dpt,pos" onReceive="orgDlgSingleDeptReceive"/>
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
        xid="toolBar1"> 
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="addExecutorsClick" xid="addExecutors" icon="icon-plus" label="新增"> 
          <i xid="i5" class="icon-plus"/>  
          <span xid="span5">新增</span> 
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'subMain.save'}" xid="button5"> 
          <i xid="i7"/>  
          <span xid="span13"/>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'subMain.delete'}" xid="button6"> 
          <i xid="i8"/>  
          <span xid="span14"/>
        </a>  
        <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
          onClick="{'operation':'subMain.refresh'}" xid="button7"> 
          <i xid="i9"/>  
          <span xid="span15"/>
        </a>
      </div>  
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
        rowActiveClass="active" class="table table-hover table-striped" xid="dataTables1"
        data="subMain" showRowNumber="true"> 
        <columns xid="columns1"> 
          <column name="fSharedPsnFName" xid="column1" label="共享给组织"/>  
          <column name="fSharedTime" xid="column2" label="共享时间"/> 
        </columns> 
      </div>  
      <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
        xid="pagerBar1"> 
        <div class="row" xid="div1"> 
          <div class="col-sm-3" xid="div2"> 
            <div class="x-pagerbar-length" xid="div3"> 
              <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                <span xid="span7">显示</span>  
                <select component="$UI/system/components/justep/select/select"
                  class="form-control input-sm" xid="select1"> 
                  <option value="10" xid="default8">10</option>  
                  <option value="20" xid="default9">20</option>  
                  <option value="50" xid="default10">50</option>  
                  <option value="100" xid="default11">100</option> 
                </select>  
                <span xid="span8">条</span> 
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
                    <span aria-hidden="true" xid="span9">«</span>  
                    <span class="sr-only" xid="span10">Previous</span> 
                  </a> 
                </li>  
                <li class="next" xid="li2"> 
                  <a href="#" xid="a2"> 
                    <span aria-hidden="true" xid="span11">»</span>  
                    <span class="sr-only" xid="span12">Next</span> 
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label x-dialog-button"
        label="取消" xid="cancelBtn" onClick="{&quot;operation&quot;:&quot;wReceiver.windowCancel&quot;}"> 
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
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="wReceiver" style="left:443px;top:568px;"/> 
</div>
