<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:337px;top:254px;"
    onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dFees"
      concept="OA_CA_FeesRegister" onSaveCommit="dFeesSaveCommit"> 
      <reader xid="default1" action="/OA/car/logic/action/queryOA_CA_FeesRegisterAction"/>  
      <writer xid="default2" action="/OA/car/logic/action/saveOA_CA_FeesRegisterAction"/>  
      <creator xid="default3" action="/OA/car/logic/action/createOA_CA_FeesRegisterAction"/>  
      <calculateRelation relation="recNO" xid="calculateRelation1" type="Integer"/>  
      <rule xid="rule1"> 
        <col name="recNO" xid="ruleCol1"> 
          <calculate xid="calculate1"> 
            <expr xid="default5">$row.index() + 1</expr> 
          </calculate> 
        </col> 
      </rule>  
      <calculateRelation relation="show" xid="calculateRelation2"/>
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dCarInfo"
      concept="OA_CA_CarBasicInfo"> 
      <reader xid="default4" action="/OA/car/logic/action/queryCACarBasicInfoAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dTemp" idColumn="year"> 
      <column label="年份" name="year" type="String" xid="default10"/>  
      <column label="月份" name="month" type="String" xid="default11"/>  
      <column label="initFlag" name="initFlag" type="String" xid="default12"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter"
    xid="toolBar1"> 
    <div component="$UI/system/components/justep/smartFilter/smartFilter" xid="smartFilter1"
      filterData="dFees" class="pull-right"> 
      <input type="text" class="form-control" placeholder="搜索" data-bind="valueUpdate: ['input', 'afterkeydown']"
        bind-value="$model.comp($element.parentElement).searchText" bind-change="$model.comp($element.parentElement).onInputChange.bind($model.comp($element.parentElement))"
        xid="input1"/> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      xid="newBtn" icon="icon-android-add" label="新增" onClick="newBtnClick"> 
      <i xid="i3" class="icon-android-add"/>  
      <span xid="span9">新增</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dFees.save'}" xid="button1"> 
      <i xid="i1"/>  
      <span xid="span7"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dFees.delete'}" xid="button2"> 
      <i xid="i2"/>  
      <span xid="span8"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'dFees.refresh'}" xid="button4"> 
      <i xid="i4"/>  
      <span xid="span10"/> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      onClick="{operation:'bizFilter.menu'}" xid="button5"> 
      <i xid="i5"/>  
      <span xid="span11"/> 
    </a>  
    <div class="form-group" xid="formGroup1"> 
      <div class="col-sm-2" xid="col1" style="width:120px;"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelInput1"> 
          <label class="x-label" xid="label2"><![CDATA[年]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input2" bind-ref="dTemp.ref('year')" onChange="input2Change"/> 
        </div> 
      </div>  
      <div class="col-sm-4" xid="col2" style="width:100px;"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30"
          xid="labelInput2"> 
          <label class="x-label" xid="label3"><![CDATA[月]]></label>  
          <input component="$UI/system/components/justep/input/input" class="form-control x-edit"
            xid="input3" bind-ref="dTemp.ref('month')" onChange="input3Change"/> 
        </div> 
      </div> 
    </div>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="初始化车辆信息" xid="button3" onClick="button3Click"> 
      <i xid="i7"/>  
      <span xid="span13">初始化车辆信息</span> 
    </a> 
  </div>  
  <div component="$UI/system/components/justep/dataTables/dataTables" flexibleWidth="true"
    rowActiveClass="active" class="table table-hover table-striped" xid="feesDT" data="dFees" onCellRender="feesDTCellRender" onRowClick="feesDTRowClick"> 
    <columns xid="columns1"> 
      <column name="recNO" xid="column27" label="序号"/>  
      <column name="show" xid="column28" label="查看" className="toDetail"/>
      <column name="fYear" xid="column1"/>  
      <column name="fMonth" xid="column2"/>  
      <column name="fCarName" xid="column3"/>  
      <column name="fCarNO" xid="column4"/>  
      <column name="fUsersName" xid="column25"/> 
      <column name="fFixedParkFee" xid="column5"/>  
      <column name="fTempParkFee" xid="column6"/>  
      <column name="fReimbLoadToll" xid="column7"/>  
      <column name="fETCRoadToll" xid="column8"/>  
      <column name="fDriverRepairFee" xid="column9"/>  
      <column name="fManagerFee" xid="column10"/>  
      <column name="fOilFee" xid="column11"/>  
      <column name="fLiters" xid="column12"/>  
      <column name="fVehicleFee" xid="column13"/>  
      <column name="fReimbFee" xid="column14"/>  
      <column name="fPassageFee" xid="column15"/>  
      <column name="fVehicleTax" xid="column16"/>  
      <column name="fTransportFee" xid="column17"/>  
      <column name="fMedicalExamFee" xid="column18"/>  
      <column name="fOfficeFee" xid="column19"/>  
      <column name="fCommunicatFee" xid="column20"/>  
      <column name="fAccidentInsurance" xid="column21"/>  
      <column name="fOverTimeDays" xid="column22"/>  
      <column name="fOtherFees" xid="column23"/>  
      <column name="fHundredKmOilFeul" xid="column24"/>  
       
      <column name="fRemark" xid="column26"/>  
      
    </columns> 
  </div>  
  <div component="$UI/system/components/justep/pagerBar/pagerBar" class="x-pagerbar container-fluid"
    xid="pagerBar1" data="dFees"> 
    <div class="row" xid="div1"> 
      <div class="col-sm-3" xid="div2"> 
        <div class="x-pagerbar-length" xid="div3"> 
          <label component="$UI/system/components/justep/pagerLimitSelect/pagerLimitSelect"
            class="x-pagerlimitselect" xid="pagerLimitSelect1"> 
            <span xid="span1">显示</span>  
            <select component="$UI/system/components/justep/select/select" class="form-control input-sm"
              xid="select1"> 
              <option value="10" xid="default6">10</option>  
              <option value="20" xid="default7">20</option>  
              <option value="50" xid="default8">50</option>  
              <option value="100" xid="default9">100</option> 
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
                <span aria-hidden="true" xid="span3">«</span>  
                <span class="sr-only" xid="span4">Previous</span> 
              </a> 
            </li>  
            <li class="next" xid="li2"> 
              <a href="#" xid="a2"> 
                <span aria-hidden="true" xid="span5">»</span>  
                <span class="sr-only" xid="span6">Next</span> 
              </a> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgDetail"
    style="left:574px;top:246px;" src="$UI/OA/car/process/carFeesRegister/carFeesDetailActivity.w"
    status="normal" width="90%" height="90%" onReceive="dlgDetailReceive"/>  
  <span component="$UI/system/components/justep/bizFilter/bizFilter" xid="bizFilter"
    filterData="dFees"/> 
</div>
