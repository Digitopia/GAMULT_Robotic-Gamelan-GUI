outlets = 0;

function bang(){
 	var p = this.patcher.parentpatcher;
	var m = p.getnamed("inputModule").getvalueof();
	var n = m + " Velocity Map";
	this.patcher.wind.title = n;
}
