$(document).ready(function() {
	$("#btnAppend").click(function() {
		$("#frm_daily").append($("#daily_item").clone());
	});

	$("#btnInsert").click(function() {
		$("#daily_item").clone().insertBefore("#function_box");
	});

	// load mission data
	$.ajax({
		url : '/project/portal/mission',
		type : 'POST', //GET
		async : true, //或false,是否异步
		timeout : 5000, //超时时间
		success : function(data, textStatus, jqXHR) {
			$("#missionForm-box").html(data);
		},
		error : function(xhr, textStatus) {
			alert('错误');
		}
	});
	
	//load bug data
	$.ajax({
		url : '/project/portal/bug',
		type : 'POST', //GET
		async : true, //或false,是否异步
		timeout : 5000, //超时时间
		success : function(data, textStatus, jqXHR) {
			$("#bugForm-box").html(data);
		},
		error : function(xhr, textStatus) {
			alert('错误');
		}
	});
});
// 增加日报接收人
function addMailTo() {
	alert("open user list");
}

// 关联任务
function refMission() {
	// 增加隐藏域，记录任务ID；任务不同于人可以用名称唯一标识
	window.open("/project/mission/refer", "_blank", "toolbar=no, "
			+ "location=no, " + "directories=no, " + "status=no, menubar=no, "
			+ "scrollbars=yes, resizable=no, " + "copyhistory=yes, "
			+ "width=640, height=480");
}
function refer(msg) {
	//TODO 动态增加编号
	$("#summary1").val(msg);
}