define(function(require) {
	var biz = require("$UI/system/lib/biz");

	var defaultLayout = {
		column1 : {
			cls : 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6',
			widgets : ["wNewAndPicPortlet", "TaskWaiting" ]
		},
		column2 : {
			cls : 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6',
			widgets : ["wNoticePortlet", "TaskSubmit" ]

		}
	};
	
	//  
	var layouts = {
		layout1: {
			column1 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6'
			},
			column2 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6'
			}
		},
		layout2: {
			column1 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			},
			column2 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			},
			column3 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			}
		},
		layout3: {
			column1 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-12 col-lg-12'
			},
			column2 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6'
			},
			column3 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-6 col-lg-6'
			},
		},
		layout4: {
			column1 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-12 col-lg-12'
			},
			column2 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			},
			column3 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			},
			column4 : {
				cls: 'x-column col-xs-12 col-sm-12 col-md-4 col-lg-4'
			}
		}
	};

	var Model = function() {
		this.callParent();
	};

	Model.prototype.button5Click = function(event) {
		this.comp('widgets').setLayout({
			'column1' : 'col col-xs-4',
			'column2' : 'col col-xs-4',
			'column3' : 'col col-xs-4'
		});
	};

	Model.prototype.modelLoad = function(event) {
		var me = this;
		this.layoutID = 'layout1';
		var widgetList = this.getContext().data.widgetList || (window.__justep.__portalContext && window.__justep.__portalContext.data.widgetList)
		if (!widgetList)
			throw '系统没有获得widget列表';
		this.widgetList = widgetList.menu.$children;
		this.widgetsComp = this.comp('widgets');
		// var widgetConfig = this.getWidgetConfig(this.getCustomLayout() ||
		// defaultLayout);
		var widgetConfig = this.getWidgetConfig(defaultLayout);
		this.widgetsComp.load(widgetConfig);
		this.widgetsComp.on('move', function(event) {
			me.saveCustomLayout();
		});
	};

	Model.prototype.getCustomLayout = function() {
		// 获取个人布局信息
		var result;
		var params = new biz.Request.ActionParam();
		var pID = this.getContext().getCurrentPersonID();
		params.setString("personID", pID);
		var options = {};
		options.context = this.getContext();
		options.action = "selectPortal3ProfilesAction";
		options.parameters = params;
		options.directExecute = true;
		options.contentType = biz.Request.JSON_TYPE;
		options.dataType = biz.Request.JSON_TYPE;
		options.process = "/portal2/process/portal/portalProcess";
		options.activity = "index";
		options.callback = function(options) {
			if (options.state) {
				if (options.response.sPortal) {
					eval('result = ' + options.response.sPortal);
				}
			}
		};
		biz.Request.sendBizRequest(options);
		return result;
	};

	Model.prototype.saveCustomLayout = function() {
		// 获取个人布局信息
		var params = new biz.Request.ActionParam();
		var pID = this.getContext().getCurrentPersonID();
		params.setString("personID", pID);
		params.setString('portal', JSON.stringify(this.widgetsComp.getConfig()));
		var options = {};
		options.context = this.getContext();
		options.action = "savePortal3ProfilesAction";
		options.parameters = params;
		options.directExecute = true;
		options.contentType = biz.Request.JSON_TYPE;
		options.dataType = biz.Request.JSON_TYPE;
		options.process = "/portal2/process/portal/portalProcess";
		options.activity = "index";
		options.callback = function(options) {
			if (options.state) {
			}
		};
		biz.Request.sendBizRequest(options);
	};

	Model.prototype.getWidgetConfig = function(layout) {
		for ( var col in layout) {
			if (layout.hasOwnProperty(col)) {
				var widgets = layout[col].widgets;
				for ( var i in widgets) {
					var widget = widgets[i];
					if (typeof widget == 'string')
						widget = {
							id : widget
						};
					var config = this.getWidget(widget.id);
					widget.title = config.title;
					widget.refresh = config.refresh;
					widget.url = config.url;
					widget.activity = config.activity;
					widget.process = config.process;
					widget.height = config.height;
					widget.psmCount = config.psmCount;
					if(config.$children && config.$children.length > 0){
						for(var j=0; j<config.$children.length; j++){
							var childCfg = config.$children[j];
							if(childCfg.$name == 'more'){
								widget.more = childCfg; 
							}
						}
					}
					widgets[i] = widget;
				}
			}
		}
		return layout;
	};

	Model.prototype.getWidget = function(id) {
		function walk(list) {
			var item;
			for ( var i in list) {
				item = list[i];
				if (item.id === id)
					return item;
				if (item.$children) {
					item = walk(item.$children);
					if (item)
						return item;
				}
			}
		}
		return walk(this.widgetList);
	};

	Model.prototype.configBtnClick = function(event) {
		this.comp("configDialog").open({
			data : {
				id : this.layoutID
			}
		});
	};

	Model.prototype.configDialogReceive = function(event) {
		var widgets = this.comp('widgets');
		if(this.layoutID !== event.data.layoutID){
			var config = layouts[event.data.layoutID];
			if(config){
				this.layoutID = event.data.layoutID;
				widgets.setLayout(config);
				this.saveCustomLayout();
			}
		}
		var opened = event.data.opened;
		if(opened){
			for(var id in opened){
				if(opened.hasOwnProperty(id)){
					if(opened[id] === false && widgets.hasWidget(id))
						widgets.removeWidget(id);
				}
			}
			for(var id in opened){
				if(opened.hasOwnProperty(id)){
					if(opened[id] === true && !widgets.hasWidget(id)){
						var config = this.getWidgetConfig(id);
						widgets.openWidget(config);
					}
				}
			}
		}
	};


	Model.prototype.modelActive = function(event){
		this.comp('widgets').activeAll();
	};



	return Model;
});