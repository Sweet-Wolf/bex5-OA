<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window container-fluid x-full-screen" component="$UI/system/components/justep/window/window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:494px;top:135px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="psnListData"
      concept="SA_OPPerson" autoLoad="false" limit="20" orderBy="sName asc,mainOrgName asc"> 
      <reader xid="default5" action="/SA/OPM/logic/action/queryOPPersonAction"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"
    style="height:100%;"> 
    <div class="col col-xs-3" xid="col1" style="height:100%;overflow: auto;"> 
      <div component="$UI/system/components/justep/smartContainer/smartContainer"
        class="x-smartcontainer" xid="smartContainer1"> 
        <div component="$UI/system/components/justep/org/orgTreePC" xid="orgTreePC1" includeOrgKind="ogn,dpt,pos"> 
          <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
            xid="orgTreeData" limit="-1"> 
            <filter name="filter0" xid="filter2"><![CDATA[SA_OPOrg.sValidState = 1]]></filter>  
          </div>  
          <div component="$UI/system/components/justep/grid/grid" appearance="tree"
            expandColumn="sName" useVirtualRoot="true" virtualRootLabel="组织机构" xid="orgTreeGrid"
            height="auto" class="x-grid-no-bordered" onIndexChanged="orgTreeGridIndexChanged"> 
            <columns xid="columns1"> 
              <column name="sName" xid="column1"/> 
            </columns> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div class="col col-xs-9 col-spliter-left" xid="col2" style="height:100%;"> 
      <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
        rowActiveClass="active" class="table table-hover" xid="orgListDataTables"
        data="psnListData"> 
        <columns xid="columns3"> 
          <column name="sOrgKindID" xid="column9" label="　" width="20px" orderable="false"
            className="x-dt-cell-center"/>  
          <column name="sName" xid="column6" label="名称"/>  
          <column name="sOfficePhone" xid="column7" label="办公电话"/>  
          <column name="sMobilePhone" xid="column8" label="移动电话"/> 
          <column name="sMail" xid="column9" label="Email"/> 
          <column name="mainOrgFName" xid="column10" label="岗位信息"/> 
        </columns> 
      </div>  
      <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
        xid="pagerBar1" data="psnListData"> 
        <div class="row" xid="div1"> 
          <div class="col-sm-3" xid="div2"> 
            <div class="x-pagerbar-length" xid="div3" style="height:104px;width:456px;"> 
              <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
                class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
                <span xid="span1">显示</span>  
                <select component="$UI/system/components/justep/select/select"
                  class="form-control input-sm" xid="select1"> 
                  <option value="10" xid="default1">10</option>  
                  <option value="20" xid="default2">20</option>  
                  <option value="50" xid="default3">50</option>  
                  <option value="100" xid="default16">100</option> 
                </select>  
                <span xid="span2">条</span> 
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
                    <span aria-hidden="true" xid="span4">«</span>  
                    <span class="sr-only" xid="span9">Previous</span> 
                  </a> 
                </li>  
                <li class="next" xid="li2"> 
                  <a href="#" xid="a2"> 
                    <span aria-hidden="true" xid="span18">»</span>  
                    <span class="sr-only" xid="span19">Next</span> 
                  </a> 
                </li> 
              </ul> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
