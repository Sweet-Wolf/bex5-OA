<?xml version="1.0" encoding="utf-8"?>
<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;" xid="window" class="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:477px;left:104px;" onLoad="modelLoad"> 
  <div component="$UI/system/components/justep/data/baasData" autoLoad="false" xid="regData" queryAction="querySa_opperson" saveAction="saveSa_opperson" url="/register/register_action" tableName="sa_opperson" idColumn="sID" autoNew="false"><column label="sID" name="sID" type="String" xid="default42"></column>
  <column label="名称" name="sName" type="String" xid="default43"></column>
  <column label="编码" name="sCode" type="String" xid="default44"></column>
  <column label="身份证号" name="sIDCard" type="String" xid="default45"></column>
  <column label="数字编号" name="sNumb" type="Integer" xid="default46"></column>
  <column label="登录名" name="sLoginName" type="String" xid="default47"></column>
  <column label="密码(MD5)" name="sPassword" type="String" xid="default48"></column>
  <column label="密码时限（天）" name="sPasswordTimeLimit" type="Integer" xid="default49"></column>
  <column label="密码修改时间" name="sPasswordModifyTime" type="DateTime" xid="default50"></column>
  <column label="所属部门" name="sMainOrgID" type="String" xid="default51"></column>
  <column label="密级" name="sSafeLevelID" type="String" xid="default52"></column>
  <column label="序号" name="sSequence" type="Integer" xid="default53"></column>
  <column label="可用状态" name="sValidState" type="Integer" xid="default54"></column>
  <column label="描述" name="sDescription" type="String" xid="default55"></column>
  <column label="照片" name="sPhoto" type="String" xid="default56"></column>
  <column label="照片修改时间" name="sPhotoLastModified" type="DateTime" xid="default57"></column>
  <column label="性别" name="sSex" type="String" xid="default58"></column>
  <column label="出生日期" name="sBirthday" type="Date" xid="default59"></column>
  <column label="参加工作日期" name="sJoinDate" type="Date" xid="default60"></column>
  <column label="出生地" name="sHomePlace" type="String" xid="default61"></column>
  <column label="国家" name="sCountry" type="String" xid="default62"></column>
  <column label="省" name="sProvince" type="String" xid="default63"></column>
  <column label="市" name="sCity" type="String" xid="default64"></column>
  <column label="学历" name="sDegree" type="String" xid="default65"></column>
  <column label="毕业院校" name="sGraduateSchool" type="String" xid="default66"></column>
  <column label="专业" name="sSpeciality" type="String" xid="default67"></column>
  <column label="学年制" name="sSchoolLength" type="String" xid="default68"></column>
  <column label="职称" name="sTitle" type="String" xid="default69"></column>
  <column label="婚姻状况" name="sMarriage" type="String" xid="default70"></column>
  <column label="证件号码" name="sCardNO" type="String" xid="default71"></column>
  <column label="证件类型" name="sCardKind" type="String" xid="default72"></column>
  <column label="家庭住址" name="sFamilyAddress" type="String" xid="default73"></column>
  <column label="邮编" name="sZip" type="String" xid="default74"></column>
  <column label="MSN" name="sMsn" type="String" xid="default75"></column>
  <column label="QQ" name="sQQ" type="String" xid="default76"></column>
  <column label="电子邮件" name="sMail" type="String" xid="default77"></column>
  <column label="移动电话" name="sMobilePhone" type="String" xid="default78"></column>
  <column label="家庭电话" name="sFamilyPhone" type="String" xid="default79"></column>
  <column label="办公电话" name="sOfficePhone" type="String" xid="default80"></column>
  <column label="英文名称" name="sEnglishName" type="String" xid="default81"></column>
  <column label="版本" name="version" type="Integer" xid="default82"></column></div>
  <div component="$UI/system/components/justep/data/baasData" autoLoad="false" xid="orgsData" queryAction="querySa_oporg" saveAction="saveSa_oporg" url="/register/register_action" tableName="sa_oporg" idColumn="SID" autoNew="false"><column label="SID" name="SID" type="String" xid="default1"></column>
  <column label="SNAME" name="SNAME" type="String" xid="default2"></column>
  <column label="SCODE" name="SCODE" type="String" xid="default3"></column>
  <column label="SLONGNAME" name="SLONGNAME" type="String" xid="default4"></column>
  <column label="SFNAME" name="SFNAME" type="String" xid="default5"></column>
  <column label="SFCODE" name="SFCODE" type="String" xid="default6"></column>
  <column label="SFID" name="SFID" type="String" xid="default7"></column>
  <column label="SORGKINDID" name="SORGKINDID" type="String" xid="default8"></column>
  <column label="SSEQUENCE" name="SSEQUENCE" type="String" xid="default9"></column>
  <column label="SVALIDSTATE" name="SVALIDSTATE" type="Integer" xid="default10"></column>
  <column label="SPARENT" name="SPARENT" type="String" xid="default11"></column>
  <column label="SLEVEL" name="SLEVEL" type="Integer" xid="default12"></column>
  <column label="SPHONE" name="SPHONE" type="String" xid="default13"></column>
  <column label="SFAX" name="SFAX" type="String" xid="default14"></column>
  <column label="SADDRESS" name="SADDRESS" type="String" xid="default15"></column>
  <column label="SZIP" name="SZIP" type="String" xid="default16"></column>
  <column label="SDESCRIPTION" name="SDESCRIPTION" type="String" xid="default17"></column>
  <column label="SPERSONID" name="SPERSONID" type="String" xid="default18"></column>
  <column label="SNODEKIND" name="SNODEKIND" type="String" xid="default19"></column>
  <column label="VERSION" name="VERSION" type="Integer" xid="default20"></column>
  <column label="sWxDeptID" name="sWxDeptID" type="Integer" xid="default21"></column></div></div>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="chooseRoleDialog" src="$UI/OA/organizationalStructure/process/organizationalStructure/roleActivity.w"></span><div component="$UI/system/components/justep/panel/panel" 
    class="x-panel x-full" xid="panel1"> 
      <div class="x-panel-top" xid="top1"> 
        <div component="$UI/system/components/justep/titleBar/titleBar" title="注册"
          class="x-titlebar">
          <div class="x-titlebar-left"> 
            <a component="$UI/system/components/justep/button/button"
              label="" class="btn btn-link btn-only-icon" icon="icon-chevron-left"
              onClick="{operation:'window.close'}" xid="backBtn"> 
              <i class="icon-chevron-left"/>  
              <span></span> 
            </a> 
          </div>  
          <div class="x-titlebar-title">注册</div>  
          <div class="x-titlebar-right reverse"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-label" label="下一步" xid="okBtn" icon="icon-android-checkmark" style="font-size:medium;" onClick="okBtnClick">
   <i xid="i2" class="icon-android-checkmark"></i>
   <span xid="span2">下一步</span></a></div>
        </div> 
      </div>  
    <div class="x-panel-content" xid="content1"><div component="$UI/system/components/bootstrap/row/row" class="row" xid="inputRow" style="width:100%;margin:0 auto;">
   <div class="col col-xs-12" xid="col1" style="padding:10px 5px;"><input component="$UI/system/components/justep/input/input" class="form-control" xid="nameInput" placeHolder="请输入您的姓名"></input></div>
  <div class="col col-xs-12" xid="col4" style="padding:10px 5px;">
   <input component="$UI/system/components/justep/input/input" class="form-control" xid="phonenumber" placeHolder="请输入您的手机号"></input></div>
  <div class="col col-xs-12" xid="col8" style="padding:0;">
   <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1">
    <div class="x-col" xid="col6">
     <input component="$UI/system/components/justep/input/input" class="form-control" xid="verifyCode" placeHolder="请输入验证码"></input></div> 
    <div class="x-col x-col-33" xid="col7" style="text-align:center;">
     <a component="$UI/system/components/justep/button/button" class="btn btn-default" label="获取验证码" xid="sendsmsbutton" onClick="sendsmsbuttonClick">
      <i xid="i1"></i>
      <span xid="span1">获取验证码</span></a> </div> </div> </div>
  <div class="col col-xs-12" xid="col9" style="padding:10px 5px;">
   <input component="$UI/system/components/justep/input/password" class="form-control" xid="userPassword" placeHolder="请输入密码（8-16位字母和数字的组合）"></input></div>
  <div class="col col-xs-12" xid="col10" style="padding:10px 5px;">
   <input component="$UI/system/components/justep/input/password" class="form-control" xid="passwordAgain" placeHolder="请确认您的密码（8-16位字母和数字的组合）"></input></div>
  </div>
  <div xid="div1" style="text-align:center;margin-top:30px;padding:20px;">
   <span xid="span3"><![CDATA[温馨提示：本次设置密码，下次登录时可直接使用手机号加密码登录。谢谢。]]></span></div></div>
  </div> 
</div>