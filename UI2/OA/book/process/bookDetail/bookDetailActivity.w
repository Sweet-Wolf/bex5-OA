<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:mobile">  
  <div component="$UI/system/components/justep/model/model" xid="model" style="height:auto;left:615px;top:247px;"
    onModelConstructDone="modelModelConstructDone"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dBookInfo"
      concept="OA_BK_BookInfo" autoLoad="true" onValueChanged="dBookInfoValueChanged"
      onSaveCommit="dBookInfoSaveCommit"> 
      <reader xid="default1" action="/OA/book/logic/action/queryBKBookInfoAction"/>  
      <writer xid="default2" action="/OA/book/logic/action/saveBKBookInfoAction"/>  
      <creator xid="default3" action="/OA/book/logic/action/createBKBookInfoAction"/>  
      <rule xid="rule1">
   <readonly xid="readonly1">
    <expr xid="default5">$model.readOnly()</expr></readonly> 
   <col name="fBooksName" xid="ruleCol1">
    <required xid="required1">
     <expr xid="default6">js:true</expr>
     <message xid="default7">图书名称不能为空！</message></required> </col> 
   <col name="fBooksTypeName" xid="ruleCol2">
    <required xid="required2">
     <expr xid="default8">js:true</expr>
     <message xid="default9">图书类别不能为空！</message></required> </col> 
   <col name="fLoanName" xid="ruleCol3">
    <readonly xid="readonly2">
     <expr xid="default10">js:true</expr></readonly> </col> 
   <col name="fLoanReadDeptName" xid="ruleCol4">
    <readonly xid="readonly3">
     <expr xid="default11">js:true</expr></readonly> </col> 
   <col name="fLoanReadPerName" xid="ruleCol5">
    <readonly xid="readonly4">
     <expr xid="default12">js:true</expr></readonly> </col> </rule></div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dBookKind"
      concept="OA_Pub_BaseCode"> 
      <reader xid="default4" action="/OA/common/logic/action/queryOA_Pub_BaseCodeAction"/>  
      <filter name="filter0" xid="filter1"><![CDATA[OA_Pub_BaseCode.fUseStatus = '1' and OA_Pub_BaseCode.fScope='图书类型']]></filter> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/toolBar/toolBar" class="x-toolbar x-toolbar-spliter form-inline"
    xid="mainBar"> 
    <a component="$UI/system/components/justep/button/button" label=" 新建"
      class="btn btn-link btn-icon-left" icon="icon-plus" xid="newBtn" onClick="{operation:'dBookInfo.new'}"
      bind-visible=" $model.btnvisible()"> 
      <i class="icon-plus" xid="i2"/>  
      <span xid="span2">新建</span> 
    </a>  
    <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
      label="保存" xid="saveBtn" onClick="{operation:'dBookInfo.save'}" bind-visible=" $model.btnvisible()"> 
      <i xid="i6"/>  
      <span xid="span4">保存</span> 
    </a> 
  </div>  
  <div xid="content"> 
    <div component="$UI/system/components/bootstrap/row/row" class="row" xid="row1"> 
      <div class="col col-xs-12 col-sm-8 col-md-8 col-lg-8" xid="col1">
        <div component="$UI/system/components/bootstrap/row/row" class="row"
          xid="row4"> 
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col23">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelInput2"> 
              <label class="x-label" xid="label2" bind-text="dBookInfo.label('fBooksNumber')"
                style="width:100px;"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit"
                xid="input2" bind-ref="dBookInfo.ref('fBooksNumber')"/>
            </div>
          </div>  
          <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col24">
            <div component="$UI/system/components/justep/labelEdit/labelEdit"
              class="x-label-edit" xid="labelInput3"> 
              <label class="x-label" xid="label3" bind-text="dBookInfo.label('fBooksName')"
                style="width:100px;"/>  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit"
                xid="input3" bind-ref="dBookInfo.ref('fBooksName')"/>
            </div>
          </div> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col26">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label30" xid="labelEdit1">
   
   <label class="x-label" xid="label4" bind-text="dBookInfo.label('fBooksTypeName')" style="width:100px;" /><div class="x-edit" xid="div2"><div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect" xid="gridSelect1" bind-ref="dBookInfo.ref('fBooksTypeID')" bind-labelRef="dBookInfo.ref('fBooksTypeName')">
   <option xid="option1" data="dBookKind" value="OA_Pub_BaseCode" label="fName"></option></div></div></div></div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col27">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput5"> 
              <label class="x-label" xid="label5" bind-text="dBookInfo.label('fLoanName')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input5" bind-ref="dBookInfo.ref('fLoanName')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col29">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput15"> 
              <label class="x-label" xid="label15" bind-text="dBookInfo.label('fBooksNo')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input15" bind-ref="dBookInfo.ref('fBooksNo')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col30">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput14"> 
              <label class="x-label" xid="label14" bind-text="dBookInfo.label('fAuthor')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input14" bind-ref="dBookInfo.ref('fAuthor')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col32">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput6"> 
              <label class="x-label" xid="label6" bind-text="dBookInfo.label('fFormat')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input6" bind-ref="dBookInfo.ref('fFormat')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col33">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput7"> 
              <label class="x-label" xid="label7" bind-text="dBookInfo.label('fBookConcern')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input7" bind-ref="dBookInfo.ref('fBookConcern')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col35">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput8"> 
              <label class="x-label" xid="label8" bind-text="dBookInfo.label('fEditionOrder')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input8" bind-ref="dBookInfo.ref('fEditionOrder')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col36">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput11"> 
              <label class="x-label" xid="label10" bind-text="dBookInfo.label('fPageNum')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input10" bind-ref="dBookInfo.ref('fPageNum')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col38">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput10"> 
              <label class="x-label" xid="label11" bind-text="dBookInfo.label('fPrice')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input11" bind-ref="dBookInfo.ref('fPrice')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col39">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput9"> 
              <label class="x-label" xid="label19" bind-text="dBookInfo.label('fBuyDate')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input9" bind-ref="dBookInfo.ref('fBuyDate')" />
            </div>
          </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col41">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label10" xid="labelInput19"> 
              <label class="x-label" xid="label9" style="width:100px;">附属物品</label>  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input19" bind-ref="dBookInfo.ref('fPertainGoods')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col44">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput16"> 
              <label class="x-label" xid="label16" bind-text="dBookInfo.label('fLoanReadDeptName')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input16" bind-ref="dBookInfo.ref('fLoanReadDeptName')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col45">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput17"> 
              <label class="x-label" xid="label17" bind-text="dBookInfo.label('fLoanReadPerName')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input17" bind-ref="dBookInfo.ref('fLoanReadPerName')" />
            </div>
          </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col47">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit x-label10" xid="labelInput20"> 
              <label class="x-label" xid="label20" bind-text="dBookInfo.label('fCatalog')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input20" bind-ref="dBookInfo.ref('fCatalog')" />
            </div>
          </div><div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col53">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput1"> 
              <label class="x-label" xid="label1" bind-text="dBookInfo.label('fBriefIntro')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input1" bind-ref="dBookInfo.ref('fBriefIntro')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col50">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput12"> 
              <label class="x-label" xid="label12" bind-text="dBookInfo.label('fCreatePsnName')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input13" bind-ref="dBookInfo.ref('fCreatePsnName')" />
            </div>
          </div><div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col51">
            <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput13"> 
              <label class="x-label" xid="label13" bind-text="dBookInfo.label('fCreateTime')" style="width:100px;" />  
              <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input18" bind-ref="dBookInfo.ref('fCreateTime')" />
            </div>
          </div>
  <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-6" xid="col3">
   <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelInput4">
    <label class="x-label" xid="label18" bind-text="dBookInfo.label('fCreateDeptName')" style="width:100px;"></label>
    <input component="$UI/system/components/justep/input/input" class="form-control input-sm x-edit" xid="input4" bind-ref="dBookInfo.ref('fCreateDeptName')"></input></div> </div></div>  
        </div>  
      <div class="col col-xs-12 col-sm-4 col-md-4 col-lg-4" xid="col2">
        <div component="$UI/system/components/justep/attachment/attachmentImage" access="duud" xid="attachmentImage1" bind-ref="dBookInfo.ref('fPhoto')" subPath="concat('业务附件/OA/图书管理/',toString(yearOf(currentDate())),'/',toString(monthOf(currentDate())))">
   <div class="x-attachment x-attachment-image" xid="div3">
    <div data-bind="foreach:$attachmentItems,event:{mouseover:function(){$model.$state.set('remove')},mouseout:function(){$model.$state.set('browse')}}" xid="div4">
     <img class="x-item-attachment-img" data-bind="attr:{src:$model.getPictureUrl($object)},click:$model.showInfullScreen.bind($model,$object)" xid="image2"></img>
     <a data-bind="visible:$model.$state.get() == 'remove',click:$model.previewOrRemoveItem.bind($model),enable:$model.$access.get() % 4 &gt;= 2" class="x-remove-barget" xid="a1"></a></div> 
    <div class="x-doc-process" xid="div5">
     <div class="progress-bar x-doc-process-bar" role="progressbar" style="width:0%;" xid="div6"></div></div> 
    <div class="x-attachment-cell x-attachment-item" data-bind="visible:$state.get() == 'upload' &amp;&amp; (1 &gt; $attachmentItems.get().length)" xid="div7">
     <div class="x-item-icon x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256" xid="div8"></div></div> </div> </div></div> 
    </div> 
  </div> 
</div>
