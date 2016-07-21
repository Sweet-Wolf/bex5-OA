<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="mdDocProcess"
    style="height:auto;left:192px;top:295px;"> 
    <div component="$UI/system/components/justep/data/bizData" xid="dDocProcess"
      concept="OA_DC_ReaderOpinion" limit="1"> 
      <reader xid="default1" action="/OA/doc/logic/action/queryOA_DC_ReaderOpinionAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/bizData" xid="dCommonWords"
      concept="AP_CommonWords"> 
      <reader xid="default2" action="/OA/common/logic/action/queryCommonWordsAction"/> 
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dData" idColumn="fOpinion"> 
      <column label="常用语" name="fOpinion" type="String" xid="default3"/>  
      <column label="fMasterID" name="fMasterID" type="String" xid="default4"/>  
      <column label="fActivityFName" name="fActivityFName" type="String" xid="default5"/>  
      <column label="fActivityLabel" name="fActivityLabel" type="String" xid="default6"/>  
      <column label="fState" name="fState" type="String" xid="default7"/>  
      <column label="fStateName" name="fStateName" type="String" xid="default8"/>  
      <column label="fCreatePsnID" name="fCreatePsnID" type="String" xid="default9"/> 
    </div> 
  </div>  
  <div component="$UI/system/components/justep/panel/panel" class="x-panel x-full"
    xid="panel1"> 
    <div class="x-panel-content" xid="content1"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1"> 
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col1"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelSelect1"> 
            <label class="x-label" xid="label1" style="width:100px;" bind-text="dData.label('fOpinion')"/>  
            <select component="$UI/system/components/justep/select/select" class="form-control x-edit"
              xid="selectCommonWords" bind-ref="dData.ref('fOpinion')" bind-options="dCommonWords"
              bind-optionsValue="fCommonWords" bind-optionsLabel="fCommonWords" bind-click="selectCommonWordsClick"/>  
            <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-only-icon"
              xid="btnCommonWord" icon="icon-edit" onClick="btnCommonWordDOMActivate"> 
              <i xid="i1" class="icon-edit"/>  
              <span xid="span1"/> 
            </a> 
          </div> 
        </div> 
      <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col3"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit" class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label2" style="width:100px;" />  
            <div class="x-edit" xid="div1">
              <textarea component="$UI/system/components/justep/textarea/textarea" class="form-control" xid="txtOpinion" bind-ref="dData.ref('fOpinion')" style="height:150px;width:95%;" />
            </div>
          </div>
        </div></div>  
      </div>  
    <div class="x-panel-bottom" xid="bottom1"> 
        
      <a class="btn btn-link btn-only-label x-dialog-button" component="$UI/system/components/justep/button/button" label="取    消" style="margin-left:30px;width:80px;" xid="cancelBtn" onClick="{operation:'windowReceiver.windowCancel'}"> 
        <i xid="i41" />  
        <span xid="span41">取 消</span> 
      </a><a component="$UI/system/components/justep/button/button" class="btn btn-primary x-dialog-button"
        label="保存" xid="btnSave" onClick="btnSaveDOMActivate"> 
        <i xid="i5"/>  
        <span xid="span5">保存</span> 
      </a> 
    </div> 
  </div>  
  <span component="$UI/system/components/justep/windowReceiver/windowReceiver"
    xid="windowReceiver" onReceive="windowReceiverReceive"/>  
  <span component="$UI/system/components/justep/windowDialog/windowDialog" xid="dlgCommonWords"
    src="$UI/OA/common/process/commonWords/mainActivity.w" title="编辑常用语" showTitle="true"
    status="normal" width="40%" height="50%"/> 
</div>
