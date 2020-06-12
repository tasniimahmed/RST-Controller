function RTW_rtwnameSIDMap() {
	this.rtwnameHashMap = new Array();
	this.sidHashMap = new Array();
	this.rtwnameHashMap["<Root>"] = {sid: "Mysubsystem"};
	this.sidHashMap["Mysubsystem"] = {rtwname: "<Root>"};
	this.rtwnameHashMap["<S1>"] = {sid: "System_20200611_0344_42:1"};
	this.sidHashMap["System_20200611_0344_42:1"] = {rtwname: "<S1>"};
	this.rtwnameHashMap["<S1>/In1"] = {sid: "System_20200611_0344_42:2"};
	this.sidHashMap["System_20200611_0344_42:2"] = {rtwname: "<S1>/In1"};
	this.rtwnameHashMap["<S1>/In2"] = {sid: "System_20200611_0344_42:4"};
	this.sidHashMap["System_20200611_0344_42:4"] = {rtwname: "<S1>/In2"};
	this.rtwnameHashMap["<S1>/1//S(z)"] = {sid: "System_20200611_0344_42:9"};
	this.sidHashMap["System_20200611_0344_42:9"] = {rtwname: "<S1>/1//S(z)"};
	this.rtwnameHashMap["<S1>/R(z)"] = {sid: "System_20200611_0344_42:16"};
	this.sidHashMap["System_20200611_0344_42:16"] = {rtwname: "<S1>/R(z)"};
	this.rtwnameHashMap["<S1>/Sum1"] = {sid: "System_20200611_0344_42:8"};
	this.sidHashMap["System_20200611_0344_42:8"] = {rtwname: "<S1>/Sum1"};
	this.rtwnameHashMap["<S1>/T(z)"] = {sid: "System_20200611_0344_42:7"};
	this.sidHashMap["System_20200611_0344_42:7"] = {rtwname: "<S1>/T(z)"};
	this.rtwnameHashMap["<S1>/Out1"] = {sid: "System_20200611_0344_42:3"};
	this.sidHashMap["System_20200611_0344_42:3"] = {rtwname: "<S1>/Out1"};
	this.getSID = function(rtwname) { return this.rtwnameHashMap[rtwname];}
	this.getRtwname = function(sid) { return this.sidHashMap[sid];}
}
RTW_rtwnameSIDMap.instance = new RTW_rtwnameSIDMap();
