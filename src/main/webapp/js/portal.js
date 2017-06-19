$(document).ready(function() {
	$("#btnAppend").click(function() {
		$("#frm_daily").append($("#daily_item").clone());
	});
	
	$("#btnInsert").click(function() {
		$("#daily_item").clone().insertBefore("#function_box");
	});
	
	// load data
	$.ajax();
});
// 增加日报接收人
function addMailTo() {
	alert("open user list");
}

// 关联任务
function refMission() {
	// 增加隐藏域，记录任务ID；任务不同于人可以用名称唯一标识
	window.open(
					"/project/mission/refer",
					"_blank",
					"toolbar=no, " +
					"location=no, " +
					"directories=no, " +
					"status=no, menubar=no, " +
					"scrollbars=yes, resizable=no, " +
					"copyhistory=yes, " +
					"width=640, height=480");
}
function refer(msg){
	$("#summary1").val(msg);
}