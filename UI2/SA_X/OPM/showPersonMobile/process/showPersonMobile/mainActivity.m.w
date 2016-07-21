<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" component="$UI/system/components/justep/window/window" design="device:m;"
  xid="window">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;top:372px;left:213px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="mainData"
      directDelete="true" autoLoad="true" concept="SA_OPPerson"
      onSaveCommit="saveCommit" autoNew="false"> 
      <reader action="/SA/OPM/logic/action/queryOPPersonAction"/>  
      <writer action="/SA/OPM/logic/action/saveOPPersonAction"/>  
      <creator/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" autoLoad="true"
      xid="orgData" concept="SA_OPOrg">
      <creator xid="default1" action="/SA/OPM/logic/action/createOPOrgAction"/>  
      <reader xid="default2" action="/system/logic/action/queryOrgAction"/>  
      <writer xid="default3" action="/SA/OPM/logic/action/saveOPOrgAction"/>
    </div>
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    style="background-color:#eeeeee;"> 
    <div class="x-panel-top"> 
      <div component="$UI/system/components/justep/titleBar/titleBar" title="我"
        class="x-titlebar"> 
        <div class="x-titlebar-left"> 
          <a component="$UI/system/components/justep/button/button" label=""
            class="btn btn-link btn-only-icon" icon="icon-chevron-left" onClick="{operation:'window.close'}"
            xid="backBtn"> 
            <i class="icon-chevron-left"/>  
            <span/> 
          </a> 
        </div>  
        <div class="x-titlebar-title">我</div>  
        <div class="x-titlebar-right reverse">
          <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
            label="保存" xid="saveBtn" icon="icon-android-checkmark" onClick="{operation:'mainData.save'}"> 
            <i xid="i1" class="icon-android-checkmark"/>  
            <span xid="span1">保存</span>
          </a>
        </div> 
      </div> 
    </div>  
    <div class="x-panel-content"> 
      
       
    <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="title" xid="controlGroup1" style="margin-bottom:10px;">
    <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card" xid="panel1" style="border-bottom-width:0px;background-color:#FFFFFF;"> 
        <div xid="div" style="height:120px;">
          <div component="$UI/system/components/justep/row/row" class="x-row" xid="row1"> 
            <div class="x-col" xid="col2" style="text-align:center;">
<!--               <div component="$UI/system/components/justep/attachment/attachmentImage" -->
<!--                 access="duud" xid="attachmentImage10" bind-ref="$model.mainData.ref(&quot;sPhoto&quot;)">  -->
<!--                 <div class="x-attachment x-attachment-image" xid="div63">  -->
<!--                   <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" -->
<!--                     xid="div64">  -->
<!--                     <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" -->
<!--                       xid="image10" height="100px" style="width:100px;border-radius:50%;"/>   -->
<!--                     <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" -->
<!--                       class="x-remove-barget" xid="a11"/> -->
<!--                   </div>   -->
<!--                   <div class="x-doc-process" xid="div65">  -->
<!--                     <div class="progress-bar x-doc-process-bar" role="progressbar" -->
<!--                       style="width:0%;" xid="progressBar11"/> -->
<!--                   </div>   -->
<!--                   <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" -->
<!--                     xid="div66">  -->
<!--                     <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" -->
<!--                       xid="div67"/> -->
<!--                   </div>  -->
<!--                 </div>  -->
<!--               </div> -->
            
            </div>  
            <div class="x-col" xid="col3">
              
  <div class="x-blob" component="$UI/system/components/justep/blob/blobImage" style="width:100px;height:100px;" xid="blobImageSPhoto" bind-ref="mainData.ref('sPhoto')" blobConcept="SA_OPPerson" blobRelation="sPhoto" blobLastModifiedRelation="sPhotoLastModified" limitSize="1m"> 
                <div class="x-blob-bar" xid="div1"> 
                  <i class="x-blob-edit icon-compose" xid="i3" />  
                  <i class="x-blob-del icon-close-round" xid="i4" /> 
                </div>  
                <img class="x-blob-img x-autofill" xid="image1" style="border:dashed thin #C0C0C0;border-radius:50%" /> 
              </div></div>
          <div class="x-col" xid="col1"></div></div>
        </div>
        
          
        
      <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text="$model.mainData.label('sName')" xid="labelName" />  
          <div class="x-edit"> 
            <input class="form-control" component="$UI/system/components/justep/input/input" data="mainData" bind-ref="mainData.ref('sName')" readonly="true" xid="sName" /> 
          </div> 
        </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text="$model.mainData.label('sSex')" xid="labelSex" />  
          <div class="x-edit"> 
            <input class="form-control" component="$UI/system/components/justep/input/input" data="mainData" bind-ref="mainData.ref('sSex')" xid="sSex" /> 
          </div> 
        </div><div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20" xid="labelEdit"> 
          <label class="x-label left" xid="labelSFName"><![CDATA[主要岗位]]></label>  
          <div class="x-edit" xid="div8"> 
            <input class="form-control" component="$UI/system/components/justep/input/input" data="mainData" bind-ref="$model.orgData.ref(&quot;sFName&quot;)" xid="sFName" readonly="true" />
          </div> 
        </div></div></div>
  <div component="$UI/system/components/justep/controlGroup/controlGroup" class="x-control-group" title="title" xid="controlGroup2">
    <div component="$UI/system/components/justep/panel/panel" class="x-panel x-card" xid="panel2" style="background-color:#FFFFFF;margin-bottom:10px;"> 
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text="$model.mainData.label(&quot;sIDCard&quot;)" xid="labelIDCard" />  
          <div class="x-edit"> 
            <input class="form-control" component="$UI/system/components/justep/input/input" data="mainData" bind-ref="$model.mainData.ref(&quot;sIDCard&quot;)" xid="sIDCard" /> 
          </div> 
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text="$model.mainData.label('sMobilePhone')" xid="labelMobilePhone" />  
          <div class="x-edit"> 
            <input class="form-control" component="$UI/system/components/justep/input/input" data="mainData" bind-ref="mainData.ref('sMobilePhone')" xid="sMobilephone" /> 
          </div> 
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text="$model.mainData.label('sOfficePhone')" xid="labelOfficePhone" />  
          <div class="x-edit"> 
            <input class="form-control" component="$UI/system/components/justep/input/input" data="mainData" bind-ref="mainData.ref('sOfficePhone')" xid="sOfficePhone" /> 
          </div> 
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text="$model.mainData.label('sQQ')" xid="labelQQ" />  
          <div class="x-edit"> 
            <input class="form-control" component="$UI/system/components/justep/input/input" data="mainData" bind-ref="mainData.ref('sQQ')" xid="sQQ" /> 
          </div> 
        </div>
        <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label20"> 
          <label class="x-label left" bind-text="$model.mainData.label('sMail')" xid="labelMail" />  
          <div class="x-edit"> 
            <input class="form-control" component="$UI/system/components/justep/input/input" data="mainData" bind-ref="mainData.ref('sMail')" xid="sMail" /> 
          </div> 
        </div>
      </div></div></div>  
    <div class="x-panel-bottom" xid="bottom1" style="background-color:white;">
      <a component="$UI/system/components/justep/button/button" class="btn btn-warning btn-block"
        label="注销" xid="logout" icon="icon-power" onClick="logoutClick"> 
        <i xid="i4" class="icon-power"/>  
        <span xid="span4">注销</span>
      </a>
    </div>
  </div> 
</div>
