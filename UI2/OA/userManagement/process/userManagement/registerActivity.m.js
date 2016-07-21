define(function(require) {
	var $ = require("jquery");
	var justep = require("$UI/system/lib/justep");
	var MD5 = require('$UI/system/lib/base/md5');
	require("cordova!com.justep.cordova.plugin.security.mob");
	var md5 = new MD5();
	
	var Model = function() {
		this.callParent();

		this._deviceType = "pc"; // pc || wx || app
	};

	Model.prototype.sendsmsbuttonClick = function(event) {
		if (!navigator.mobsms) {
			justep.Util.hint("请安装最新版本(含插件)体验！");
			return;
		};
		var phoneInput = this.comp("phonenumber").val();
		var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
		if (reg.test(phoneInput)) {
			this.comp("sendsmsbutton").mytimer();
			navigator.mobsms.send({
				"zone" : "86",
				"phoneNumber" : phoneInput
			}, function(info) {
				//alert('发送成功');
			}, function(err) {
				justep.Util.hint(err);
			});
		} else {
			justep.Util.hint("手机号码不正确！")
		}
	};
	
	function Timmer(loopSecond, titile1, title2, lisentner) { // todo
		// 还要检查一个结果返回变量。
		this.loopSecond = loopSecond;
		this.waittime = loopSecond;
		var self = this;
		this.mytimer = function() {
			if (self.waittime <= 0) {
				self.set({
					"disabled" : false,
					"label" : titile1
				});
				this.waittime = loopSecond; // 可设 60秒
			} else {
				self.set({
					"disabled" : true,
					"label" : title2 + "(" + self.waittime + ")"
				});
				self.waittime--;
				setTimeout(function() {
					self.mytimer();
				}, 1000);
			}
		}

	};

	Model.prototype.okBtnClick = function(event) {
		var self = this;
		// 验证短信验证码是否正确
		var phoneInput = this.comp("phonenumber").val();
		var verifyCode = this.comp("verifyCode").val();
		var reg = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
		var verifyCodeReg = /^\d{4}$/;
//		if(true){
		if (verifyCodeReg.test(verifyCode) && reg.test(phoneInput)) {
			function success(info) {// 成功的回调
				// 验证两次输入的验证码是否一致
				// ^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$
				var passwordReg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]{8,16}$/; // 验证输入的密码格式（8-16位字母和数字的组合）
				var passwordAgain = self.comp('passwordAgain').val();
				var userPassword = self.comp('userPassword').val();
				var personID
				if (userPassword == '' || userPassword == undefined || userPassword == null) {
					alert('请填写密码！');
					return
				} else {
					if (passwordReg.test(userPassword)) {
						if (userPassword == passwordAgain) {
							debugger;
							var row = self.comp('regData').find(['sCode'], [phoneInput]);
							console.log(row);
							var personID = justep.UUID.createUUID();
							if (row.length == 0) {
								self.comp('regData').newData({
									'defaultValues' : [ {
										'sID' : personID,
										'sMobilePhone' : phoneInput,
										'sLoginName' : phoneInput,
										'sCode' : phoneInput,
										'sName' : self.comp('nameInput').val(),
										'sPasswordTimeLimit':90,
										'sPasswordModifyTime':new Date(),
										'sValidState' : 1,
										'sPassword' : md5.hex_md5_salt(userPassword)
									} ]
								});
								self.comp('regData').saveData();
								self.comp('orgsData').newData({
									'defaultValues' : [ {
										'sID' :justep.UUID.createUUID(),
										'SNAME' : self.comp('nameInput').val(),
										'SCODE' : phoneInput,
										'SFCODE' : null,
										'SFID' : null,
										'SORGKINDID' : 'psm',
										'SSEQUENCE' : '',
										'SPARENT' : null,
										'SPERSONID' : personID,
										'SNODEKIND' : 'nkLeaf'
									} ]
								});
								self.comp('orgsData').saveData();
								//justep.Shell.closePage();
								//justep.Shell.showPage("$UI/OA/organizationalStructure/process/organizationalStructure/roleActivity.w");
							}else{
								alert('您的手机号码，已经注册过铛铛！');
							}
						} else {
							alert("两次验证码输入不一致!");
						}
					} else {
						alert("密码格式不正确!");
					}
				}
			};//if(true)

			function fail(info) {
				alert("失败：" + JSON.stringify(info));
			}
			;

			this.verify({
				"zone" : "86",
				"phoneNumber" : phoneInput,
				"verificationCode" : verifyCode
			}, success, fail);
		} else {
			justep.Util.hint("验证码有误！");
		};
	};

	Model.prototype.verify = function(args, success, error) {
		navigator.mobsms.verify(args, success, error);
	};

	Model.prototype.modelLoad = function(event) {
		var self = this;
		var comp = this.comp("sendsmsbutton");
		Timmer.apply(comp, [ 60, "免费获取验证码", "重新发送" ]);

		if (justep.Browser.isX5App) {
			this._deviceType = "app";
		} else {
			this._deviceType = "web";
			window.navigator = window.navigator || {};
			window.navigator.mobsms = {
				init : function(appinfo) {
					alert("发送失败，只支持x5app");
				},
				send : function(appinfo) {
					alert("发送失败，只支持x5app");
				},
				verify : function(appinfo) {
					alert("无法验证，只支持x5app");
				}

			};
		}
	};
	
	return Model;
});