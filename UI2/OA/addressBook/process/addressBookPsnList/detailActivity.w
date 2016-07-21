<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onLoad="modelLoad"> 
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="mdMain" concept="OA_AB_AddressBook" onSaveCommit="mdMainSaveCommit" limit="1">
      <reader xid="default2" action="/OA/addressBook/logic/action/queryAddressBookAction"/>  
      <writer xid="default3" action="/OA/addressBook/logic/action/saveAddressBookAction"/>  
      <creator xid="default4" action="/OA/addressBook/logic/action/createAddressBookAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="false"
      xid="fSexData" idColumn="name"> 
      <column label="name" name="name" type="String" xid="xid1"/>  
      <column label="value" name="value" type="String" xid="xid2"/>  
      <data xid="default1">[{"name":"男","value":"男"},{"name":"女","value":"女"}]</data> 
    </div> 
  </div>  
  <div class="container-fluid" xid="view"> 
    <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar form-inline x-toolbar-spliter" xid="toolBar1"><a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mdMain.save'}" xid="button1">
   <i xid="i1"></i>
   <span xid="span3"></span></a>
  <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left" onClick="{'operation':'mdMain.refresh'}" xid="button2">
   <i xid="i2"></i>
   <span xid="span4"></span></a></div><div component="$UI/system/components/justep/controlGroup/controlGroup"
      class="x-control-group" title="联系人信息" xid="controlGroup1" collapsible="true"> 
      <div class="x-control-group-title" xid="controlGroupTitle1"> 
        <span xid="span1"><![CDATA[联系人信息]]></span> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;"><![CDATA[姓名]]></label>  
            <div class="x-edit" xid="div1"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fName" bind-ref="mdMain.ref('fName')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit2"> 
            <label class="x-label" xid="label2" style="width:100px;"><![CDATA[性别]]></label>  
            <div class="x-edit" xid="div2"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                xid="fSex" bind-ref="mdMain.ref('fSex')" bind-labelRef="mdMain.ref('fSex')"> 
                <option xid="option1" data="fSexData" value="value" label="name"/> 
              </div> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit3"> 
            <label class="x-label" xid="label3" style="width:100px;"><![CDATA[出生日期]]></label>  
            <div class="x-edit" xid="div3"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fBirthday" bind-ref="mdMain.ref('fBirthday')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit4"> 
            <label class="x-label" xid="label4" style="width:100px;"><![CDATA[公司名称]]></label>  
            <div class="x-edit" xid="div4"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fCompanyName" bind-ref="mdMain.ref('fCompanyName')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit5"> 
            <label class="x-label" xid="label5" style="width:100px;"><![CDATA[部门名称]]></label>  
            <div class="x-edit" xid="div5"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fDeptName" bind-ref="mdMain.ref('fDeptName')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit6"> 
            <label class="x-label" xid="label6" style="width:100px;"><![CDATA[职位名称]]></label>  
            <div class="x-edit" xid="div6"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fPostName" bind-ref="mdMain.ref('fPostName')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit7"> 
            <label class="x-label" xid="label7" style="width:100px;"><![CDATA[行业]]></label>  
            <div class="x-edit" xid="div7"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fIndustry" bind-ref="mdMain.ref('fIndustry')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit8"> 
            <label class="x-label" xid="label8" style="width:100px;"><![CDATA[手机号码]]></label>  
            <div class="x-edit" xid="div8"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fMobilePhone" bind-ref="mdMain.ref('fMobilePhone')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit9"> 
            <label class="x-label" xid="label9" style="width:100px;"><![CDATA[电子信箱]]></label>  
            <div class="x-edit" xid="div9"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input8" bind-ref="mdMain.ref('fMail')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit10"> 
            <label class="x-label" xid="label10" style="width:100px;"><![CDATA[电话]]></label>  
            <div class="x-edit" xid="div10"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fPhone" bind-ref="mdMain.ref('fPhone')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit11"> 
            <label class="x-label" xid="label11" style="width:100px;"><![CDATA[传真]]></label>  
            <div class="x-edit" xid="div11"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fFax" bind-ref="mdMain.ref('fFax')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit12"> 
            <label class="x-label" xid="label12" style="width:100px;"><![CDATA[MSN]]></label>  
            <div class="x-edit" xid="div12"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fMsn" bind-ref="mdMain.ref('fMsn')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div>  
    <div component="$UI/system/components/justep/controlGroup/controlGroup"
      class="x-control-group" title="其他信息" xid="controlGroup2" collapsible="true"> 
      <div class="x-control-group-title" xid="controlGroupTitle2"> 
        <span xid="span2">title</span> 
      </div>  
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row2"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit13"> 
            <label class="x-label" xid="label13" style="width:100px;"><![CDATA[国家/地区]]></label>  
            <div class="x-edit" xid="div13"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fCountry" bind-ref="mdMain.ref('fCountry')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit14"> 
            <label class="x-label" xid="label14" style="width:100px;"><![CDATA[省份]]></label>  
            <div class="x-edit" xid="div14"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="fProvince" bind-ref="mdMain.ref('fProvince')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col15"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit15"> 
            <label class="x-label" xid="label16" style="width:100px;"><![CDATA[城市]]></label>  
            <div class="x-edit" xid="div15"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input14" bind-ref="mdMain.ref('fCity')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit16"> 
            <label class="x-label" xid="label17" style="width:100px;"><![CDATA[语言]]></label>  
            <div class="x-edit" xid="div16"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input15" bind-ref="mdMain.ref('fLanguage')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col17"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit17"> 
            <label class="x-label" xid="label18" style="width:100px;"><![CDATA[家庭住址]]></label>  
            <div class="x-edit" xid="div17"> 
              <input component="$UI/system/components/justep/input/input" class="form-control"
                xid="input16" bind-ref="mdMain.ref('fAddress')"/> 
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col18"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit x-label30" xid="labelEdit18"> 
            <label class="x-label" xid="label19" style="width:100px;"><![CDATA[备注]]></label>  
            <div class="x-edit" xid="div18"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="textarea1" bind-ref="mdMain.ref('fRemark')"/> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
