define(function(require) {
	var IM = require("$UI/chat/base/js/im");
	return {
		sendDelayMsgToPerson: function (personId, msg, delay){
			var internal = 1000; 
			if (delay){
				internal = delay;
			}
    		setTimeout(function () {  
					try{
						IM.sendTextMessageToPerson(personId,msg);  
					} catch(e){
						
					}
			}, internal);
		}
	};
});
