<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:m;" xmlns:xui="http://www.justep.com/xui">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:506px;left:95px;"
    onLoad="modelLoad" onActive="modelActive"> 
    <div component="$UI/system/components/justep/data/data" xid="mainData"
      idColumn="fID" confirmRefresh="false"> 
      <data xid="default7"/>  
      <column label="id" name="fID" type="String" xid="default1"/>  
      <column label="label" name="fLabel" type="String" xid="default2"/>  
      <column label="content" name="fContent" type="String" xid="default3"/>  
      <column label="time" name="fDate" type="DateTime" xid="default4"/>  
      <column label="count" name="fCount" type="String" xid="default5"/>  
      <column label="iconClass" name="fIconClass" type="String" xid="default6"/>  
      <column label="color" name="fColor" type="String" xid="default9"/>  
      <column label="process" name="fProcess" type="String" xid="default10"/>  
      <column label="activity" name="fActivity" type="String" xid="default11"/>  
      <column label="url" name="fUrl" type="String" xid="default12"/>  
      <column label="subLabel" name="fSubLabel" type="String" xid="default13"/>  
      <column label="tag" name="fTag" type="String" xid="default14"/> 
    </div> 
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="skipData" idColumn="fID" onCustomRefresh="skipDataCustomRefresh"><column label="ID" name="fID" type="String" xid="xid1"></column>
  <column label="名称" name="fLabel" type="String" xid="xid2"></column>
  <column label="地址" name="fUrl" type="String" xid="xid3"></column>
  <column label="图标颜色" name="fColor" type="String" xid="xid4"></column>
  <column label="图标" name="fIconClass" type="String" xid="xid5"></column>
  <column name="fProcess" type="String" xid="xid6"></column>
  <column name="fActivity" type="String" xid="xid7"></column></div>
  <div component="$UI/system/components/justep/data/data" autoLoad="true" xid="headSkipData" idColumn="fID" onCustomRefresh="headSkipDataCustomRefresh"><column label="ID" name="fID" type="String" xid="xid8"></column>
  <column label="名称" name="fLabel" type="String" xid="xid9"></column>
  <column label="图标" name="fIconClass" type="String" xid="xid10"></column>
  <column label="图标颜色" name="fColor" type="String" xid="xid11"></column>
  <column label="路径" name="fUrl" type="String" xid="xid12"></column>
  <column name="fProcess" type="String" xid="xid13"></column>
  <column name="fActivity" type="String" xid="xid14"></column></div></div>  
  <div style="position:relative;height:400px;" xid="waitDiv" xui:before="panel1" xui:parent="window" xui:update-mode="insert">
   <a class="btn btn-link btn-only-icon" component="$UI/system/components/justep/button/button" icon="icon-loading-a" label="button" style="position:absolute;font-size:30px;top:42%;left:42%;" xid="button2">
    <i class="icon-loading-a" xid="i2"></i>
    <span xid="span511"></span></a> </div><div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-top" xid="top1"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" class="x-titlebar"
        xid="titleBar1" title="审批"> 
        <div class="x-titlebar-left" xid="left1"> 
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left btn-only-icon"
            xid="backBtn" onClick="{operation:'window.close'}"> 
            <i xid="i1" class="icon-chevron-left"/>  
            <span xid="span1">关闭</span> 
          </a> 
        </div>  
        <div class="x-titlebar-title" xid="title1">审批</div>  
        <div class="x-titlebar-right reverse" xid="right1"/> 
      </div> 
    </div>  
    <div class="x-panel-content" xid="content1"> 
      <div xid="div1" style="background-color:#2FA4E7;"> 
         
      <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
          <div class="x-col" xid="col1" style="text-align:center;"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" xid="waitMeBtn" style="color:#FFFFFF;position:relative;" onClick="waitMeBtnClick"> 
              <i xid="i4" style="font-size:xx-large;display:block;border-style:solid solid solid solid;border-width:thin thin thin thin;border-color:#FFFFFF #FFFFFF #FFFFFF #FFFFFF;border-radius:40%;padding:10px 15px 10px 15px;" bind-css=' $model.headSkipData.val("fIconClass")' bind-style='{color:$model.headSkipData.val("fColor")}' />  
              <span xid="span4" style="display:block;margin-top:5px;" bind-text='$model.headSkipData.val("fLabel")'></span>  
              <div>
                <div component="$UI/system/components/justep/list/list" class="x-list" xid="list2" data="mainData" limit="1"> 
                  <ul class="x-list-template" xid="listTemplateUl2"> 
                    <li xid="li2">
                    	<div style="position:absolute;top:5px;right:5px;border-radius:50%;height:20px;width:20px;background-color:red;" bind-visible=' val("fCount") &gt;0'>
                    		<span bind-text="ref(&quot;fCount&quot;)" xid="detailSpanNum" />
                    	</div>
                    </li> 
                  </ul> 
                </div>
              </div> 
            </a> 
          </div>  
          <div class="x-col" xid="col3" style="text-align:center;"> 
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-top" xid="launchBtn" style="position:relative;" onClick="launchBtnClick"> 
              <i xid="i5" style="font-size:xx-large;display:block;border-style:solid solid solid solid;border-width:thin thin thin thin;border-color:#FFFFFF #FFFFFF #FFFFFF #FFFFFF;border-radius:40%;padding:10px 18px 10px 18px;"/>  
              <span xid="span6" style="display:block;margin-top:5px;"></span> 
            </a> 
          </div> 
        </div></div>  
      <div xid="div2"> 
        <div component="$UI/system/components/justep/list/list" class="x-list"
          xid="list1" data="skipData"> 
          <ul class="x-list-template" xid="listTemplateUl1"> 
            <li xid="li1" class="col-xs-4"> 
              <div component="$UI/system/components/bootstrap/row/row" class="row"
                xid="row6" style="width:100%;margin:0 auto;"> 
                <div class="col " xid="col18" style="text-align:center;"> 
                  <a component="$UI/system/components/justep/button/button"
                    class="btn btn-link btn-icon-top" xid="leaveBtn" style="color:#808080;margin-top:10px;"
                    onClick="leaveBtnClick"> 
                    <i xid="i10" style="font-size:xx-large;color:#398A42;" bind-css=' val("fIconClass")' bind-style='{color:val("fColor")}'/>  
                    <span xid="span11" bind-text='val("fLabel")'><![CDATA[]]></span> 
                  </a> 
                </div>  
                </div> 
            </li> 
          </ul> 
        </div> 
      </div> 
    </div> 
  </div> 
</div>
