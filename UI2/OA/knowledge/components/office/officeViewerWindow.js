define(function(require){
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var DocUtils = require("$UI/system/components/justep/docCommon/docUtil");
	var officeViewer = require('$UI/system/components/justep/docCommon/officeViewer');
	
	
	
	
	var Model = function(){
		this.callParent();
	};

	Model.prototype.modelLoad = function(event){
		debugger;
		var param = this.getContext().getRequestParameter('param');
		if(!param){
			return false;
		}
		var $OV = officeViewer.$OV;
		$OV('ov').CreateOfficeViewer('100%','100%');
		//var param = justep.XML.getNodeText(this.getContext().getRequestBody());
		this.officeViewerInit(JSON.parse(param));
	};

	 Model.prototype.officeViewerInit = function(obj) {
	   debugger;
		 var $OV = officeViewer.$OV;
		 
    	if ($OV("ov").isOpened()){
    		return;
    	}
    	this.OVP = obj;
    	this.OVP.saving = false;
    	this.OVP.isRevision = false;
    	this.OVP.isModified = false;
		$OV("ov").Toolbars = false;
		$OV("ov").HttpInit();
		$OV("ov").HttpAddpostString("FileID", this.OVP.fileID);
		$OV("ov").HttpAddpostString("FileExt", this.OVP.fileExt);
		$OV("ov").HttpAddpostString("FileID", this.OVP.fileID);
		$OV("ov").HttpAddpostString("VersionID", this.OVP.versionID);
		$OV("ov").HttpAddpostString("PartType", this.OVP.partType);
		debugger;
		$OV("ov").HttpOpenFileFromStream(this.getHost(this.OVP.host,this.OVP.fileID));
		$OV("ov").OfficeProtectDocument();
    	if (this.OVP.showField && $OV("ov").IsWordOpened()) {
    		this.officeUpdateField();
    	}
    	$OV("ov").DisableOfficeButton();
    };
    
    Model.prototype.getHost = function(docPath,fileID){
    	if(!this.docUrl){
    		var u = DocUtils.InnerUtils.getdocServerAction(docPath, "/repository/file/cache/office/"+fileID,false,false,this.getContext());
			this.docUrl = u.indexOf(window.location.protocol) < 1 ? u : window.location.protocol+"//"+ window.location.host + u;
		}
		return this.docUrl;	 
    };
	return Model;
});