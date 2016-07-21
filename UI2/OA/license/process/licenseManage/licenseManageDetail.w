<?xml version="1.0" encoding="utf-8"?>

<div xmlns="http://www.w3.org/1999/xhtml" xid="window" class="window" component="$UI/system/components/justep/window/window"
  design="device:pc">  
  <div component="$UI/system/components/justep/model/model" xid="model" onModelConstructDone="modelModelConstructDone"
    style="height:auto;left:274px;top:53px;">
    <div component="$UI/system/components/justep/data/bizData" autoLoad="false"
      xid="dLicenseManage" concept="OA_LS_LicenseManage" onSaveCommit="dLicenseManageSaveCommit">
      <reader xid="default1" action="/OA/license/logic/action/queryLSLicenseManageAction"/>  
      <writer xid="default2" action="/OA/license/logic/action/saveLSLicenseManageAction"/>  
      <creator xid="default3" action="/OA/license/logic/action/createLSLicenseManageAction"/>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dIsCopy" idColumn="value">
      <column label="name" name="name" type="String" xid="xid1"/>  
      <column label="value" name="value" type="String" xid="xid2"/>  
      <data xid="default4">[{"name":"正本","value":"0"},{"name":"副本","value":"1"}]</data>
    </div>  
    <div component="$UI/system/components/justep/data/data" autoLoad="true"
      xid="dBtnState" idColumn="trgDeleteState">
      <column label="trgDeleteState" name="trgDeleteState" type="String" xid="xid3"/>
    </div>
  </div>  
  <div class="tab-pane" xid="tabContent2"> 
    <div xid="detailBar" component="$UI/system/components/justep/toolBar/toolBar"
      class="x-toolbar x-toolbar-spliter form-inline"> 
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dLicenseManage.new'}" xid="button2"> 
        <i xid="i3"/>  
        <span xid="span6"/>
      </a>
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        onClick="{'operation':'dLicenseManage.delete'}" xid="button1"> 
        <i xid="i2"/>  
        <span xid="span5"/>
      </a>
      <a component="$UI/system/components/justep/button/button" label=" 保存"
        class="btn btn-link btn-icon-left" onClick="{operation:'dLicenseManage.save'}"
        xid="saveBtn"> 
        <i xid="i1"/>  
        <span xid="span2">保存</span>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="button5" onClick="{&quot;operation&quot;:&quot;dLicenseManage.refresh&quot;}"> 
        <i xid="i8"/>  
        <span xid="span12"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="preBtn" onClick="{&quot;operation&quot;:&quot;dLicenseManage.prevRow&quot;}"> 
        <i xid="i4"/>  
        <span xid="span3"/>
      </a>  
      <a component="$UI/system/components/justep/button/button" class="btn btn-link btn-icon-left"
        xid="nextBtn" onClick="{&quot;operation&quot;:&quot;dLicenseManage.nextRow&quot;}"> 
        <i xid="i5"/>  
        <span xid="span4"/>
      </a> 
    </div>  
    <div xid="mainForm" class="form-horizontal container-fluid" component="$UI/system/components/bootstrap/form/form"> 
      <div component="$UI/system/components/bootstrap/row/row" class="row"
        xid="row1"> 
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col1"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit1"> 
            <label class="x-label" xid="label1" style="width:100px;">证照名称</label>  
            <div class="x-edit" xid="div8"> 
              <input xid="fUseStatus" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fLicenseName')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col2"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit2"> 
            <label class="x-label" xid="label2" style="width:100px;">状态</label>  
            <div class="x-edit" xid="div9"> 
              <input xid="fUseStatusName" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fUseStatusName')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col3"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit3"> 
            <label xid="fLicenseNoL" class="x-label" style="width:100px;">证照号</label>  
            <div class="x-edit" xid="div10"> 
              <input xid="fLicenseNo" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fLicenseNo')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col4"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit4"> 
            <label xid="fSerialNumberL" class="x-label" style="width:100px;">编号</label>  
            <div class="x-edit" xid="div11"> 
              <input xid="fSerialNumber" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fSerialNumber')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col5"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit5"> 
            <label xid="fLicenseNameL" class="x-label" style="width:100px;">颁发日期</label>  
            <div class="x-edit" xid="div12"> 
              <input xid="fLicenseName" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fReleaseDate')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col6"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit6"> 
            <label xid="fReleaseDeptIDL" class="x-label" style="width:100px;">颁发部门</label>  
            <div class="x-edit" xid="div13"> 
              <input xid="fReleaseDeptID" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fReleaseDeptName')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col7"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit7"> 
            <label xid="fReleaseDeptNameL" class="x-label" style="width:100px;">有效期</label>  
            <div class="x-edit" xid="div14"> 
              <input xid="fReleaseDeptName" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fValidityDate')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col8"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit8"> 
            <label xid="fReleaseDateL" class="x-label" style="width:100px;">年检周期</label>  
            <div class="x-edit" xid="div15"> 
              <input xid="fReleaseDate" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fReleaseDate')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col9"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit9"> 
            <label xid="fValidityDateL" class="x-label" style="width:100px;">年检网址</label>  
            <div class="x-edit" xid="div16"> 
              <input xid="fValidityDate" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fExamWebsite')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col10"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit10"> 
            <label xid="fExamPeriodL" class="x-label" style="width:100px;">下次年检时间</label>  
            <div class="x-edit" xid="div17"> 
              <input xid="fExamPeriod" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fNextExamDate')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col11"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit11"> 
            <label xid="fExamWebsiteL" class="x-label" style="width:100px;">年检部门</label>  
            <div class="x-edit" xid="div18"> 
              <input xid="fExamWebsite" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fExamDeptName')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col12"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit12"> 
            <label xid="fNextExamDateL" class="x-label" style="width:100px;">年检材料</label>  
            <div class="x-edit" xid="div19"> 
              <input xid="fNextExamDate" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fExamData')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col13"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit13"> 
            <label xid="fExamDeptNameL" class="x-label" style="width:100px;">网上填报系统</label>  
            <div class="x-edit" xid="div20"> 
              <input xid="fExamDeptName" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fWebSoft')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col14"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit14"> 
            <label xid="fExamDataL" class="x-label" style="width:100px;">正副本标识</label>  
            <div class="x-edit" xid="div21"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/gridSelect/gridSelect"
                xid="gridSelect1" bind-ref="dLicenseManage.ref('fIsCopy')" bind-labelRef="dLicenseManage.ref('fIsCopyName')"> 
                <option xid="option1" data="dIsCopy" value="value" label="name"/>
              </div>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col15"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit15"> 
            <label xid="fWebSoftL" class="x-label" style="width:100px;">保管部门</label>  
            <div class="x-edit" xid="div22"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                xid="orgSelectPC1" bind-ref="dLicenseManage.ref('fSafekeepDeptID')"
                bind-labelRef="dLicenseManage.ref('fSafekeepDeptName')" includeOrgKind="ogn,dpt"
                includeDisabled="false"> 
                <div component="$UI/system/components/justep/data/bizData"
                  autoLoad="false" xid="dOrg" limit="-1"/>  
                <option xid="option4" value="SA_OPOrg" label="sName"> 
                  <columns xid="columns1"> 
                    <column name="sName" xid="column1"/>
                  </columns> 
                </option> 
              </div>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col16"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit16"> 
            <label xid="fSafekeepDeptNameL" class="x-label" style="width:100px;">保管人</label>  
            <div class="x-edit" xid="div23"> 
              <div class="x-gridSelect" component="$UI/system/components/justep/org/orgSelectPC"
                xid="orgSelectPC2" bind-ref="dLicenseManage.ref('fKeeperID')" bind-labelRef="dLicenseManage.ref('fKeeperName')"
                includeDisabled="true" onShowOption="orgSelectPC2ShowOption" onHideOption="orgSelectPC2HideOption"
                includeOrgKind="psm"> 
                <div component="$UI/system/components/justep/data/bizData"
                  autoLoad="false" xid="dPsm" limit="-1"> 
                  <treeOption xid="default5" rootFilter="1=1"/>
                </div>  
                <option xid="option5" value="sPersonID" label="sName"> 
                  <columns xid="columns2"> 
                    <column name="sName" xid="column2"/>
                  </columns> 
                </option> 
              </div>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col17"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit17"> 
            <label xid="fKeeperNameL" class="x-label" style="width:100px;">录入人</label>  
            <div class="x-edit" xid="div24"> 
              <input xid="fKeeperName" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fOperatorName')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-6 col-md-6 col-lg-4" xid="col18"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit18"> 
            <label xid="fOperateDateL" class="x-label" style="width:100px;">录入日期</label>  
            <div class="x-edit" xid="div25"> 
              <input xid="fOperateDate" class="form-control" component="$UI/system/components/justep/input/input"
                bind-ref="dLicenseManage.ref('fOperateDate')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col19"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit19"> 
            <label xid="fOperateDateL" class="x-label" style="width:100px;">年检记录</label>  
            <div class="x-edit" xid="div26"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="fExamRec" bind-ref="dLicenseManage.ref('fExamRec')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col20"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit20"> 
            <label xid="fOperateDateL" class="x-label" style="width:100px;">备注</label>  
            <div class="x-edit" xid="div27"> 
              <textarea component="$UI/system/components/justep/textarea/textarea"
                class="form-control" xid="fRemark" bind-ref="dLicenseManage.ref('fRemark')"/>
            </div> 
          </div> 
        </div>  
        <div class="col col-xs-12 col-sm-12 col-md-12 col-lg-12" xid="col21"> 
          <div component="$UI/system/components/justep/labelEdit/labelEdit"
            class="x-label-edit" xid="labelEdit21"> 
            <label xid="fAttachmentL" class="x-label" style="width:100px;">附件</label>  
            <div class="x-edit" xid="div28"> 
              <div component="$UI/system/components/justep/attachment/attachment"
                access="duud" xid="attachmentPC1" bind-ref="dLicenseManage.ref('fAttachment')"> 
                <div class="x-attachment" xid="div8"> 
                  <div class="x-attachment-content x-card-border" xid="div9"> 
                    <div class="x-doc-process" xid="div10"> 
                      <div class="progress-bar x-doc-process-bar" role="progressbar"
                        style="width:0%;" xid="div11"/>
                    </div>  
                    <div data-bind="foreach:$attachmentItems" xid="div12"> 
                      <div class="x-attachment-cell" xid="div13"> 
                        <div class="x-attachment-item x-item-other" data-bind="click:$model.previewOrRemoveItem.bind($model),style:{opacity: $model.$access.get() % 4 &gt;= 2 || $model.$state.get() == 'remove' ? '1.0' : '0.5',backgroundImage:($model.previewPicture.bind($model,$object))()}"
                          xid="div14"> 
                          <a data-bind="visible:$model.$state.get() == 'remove'"
                            class="x-remove-barget" xid="a3"/>
                        </div> 
                      </div> 
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; ($limit.get() == '-1' || $limit.get() &gt; $attachmentItems.get().length)"
                      xid="div15"> 
                      <div class="x-attachment-item x-item-upload" data-bind="visible:$state.get() == 'upload' &amp;&amp; $access.get() % 512 &gt;= 256"
                        xid="div16"/>
                    </div>  
                    <div class="x-attachment-cell" data-bind="visible:$state.get() == 'upload' &amp;&amp; $attachmentItems.get().length &gt; 0"
                      xid="div17"> 
                      <div class="x-attachment-item x-item-remove" data-bind="click:changeState.bind($object,'remove'),visible:$access.get() % 2048 &gt;= 1024"
                        xid="div18"/>
                    </div>  
                    <div style="clear:both;" xid="div19"/>
                  </div> 
                </div> 
              </div> 
            </div> 
          </div> 
        </div> 
      </div> 
    </div> 
  </div>
</div>
