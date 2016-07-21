define(function(require) {
	var justep = require("$UI/system/lib/justep");

	return {

		arrRepeat : function(arr) {
			var result = [], hash = {};
			for (var i = 0; i < arr.length; i++) {
				if (!hash[arr[i]["BSSID"]]) {
					hash[arr[i]["BSSID"]] = true;
					result.push(arr[i]);
				}
			}

			return result;
		},

		ArrayFetch : function(arr1, arr2) {
			var result = [];
			if (arr2.length > 0) {
				for (var i = 0; i < arr1.length; i++) {
					for (var j = 0; j < arr2.length; j++) {
						if (arr1[i]["BSSID"] != arr2[j]["BSSID"]) {
							result.push(arr1[i]);
						}
					}
				}
			}else{
				result = arr1;
			}
			return result;
		}

	}
})