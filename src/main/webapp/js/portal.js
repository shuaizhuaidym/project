$(document).ready(function() {
	var index = 1;
	// modal window
	$('#btnAppend').click(function() {
		var item = $("#daily_item").clone();
		item.removeAttr("id");
		item.find('.w-input').each(function(idx, ele) {
			var newName = $(ele).attr('name').replace(/0/, index);
			$(ele).attr('name', newName);
			var nid = $(ele).attr('id').replace(/0/, index);
			$(ele).attr('id', nid);
		});
		item.find('a').each(function(idx, ele) {
			var newHref = $(ele).attr('href').replace(/0/, index);
			$(ele).attr('href', newHref);
		});
		$('#frm_daily').append(item);
		index++;
	});
	// form window
	$("#btnInsert").click(function() {
		$("#daily_item").clone().insertBefore("#function_box");
	});
	// delete
	$("#btnDelete").click(function() {
		var items = $(".div_with_divider");
		if (items.length > 1) {
			$(".div_with_divider:last").remove();
		}
	});
	// save
	$("#btnSave").click(function() {
		sendDaily();
	});

	// load mission data
	$.ajax({
		url : '/project/portal/mission',
		type : 'POST', // GET
		async : true, // 或false,是否异步
		timeout : 5000, // 超时时间
		success : function(data, textStatus, jqXHR) {
			$("#missionForm-box").html(data);
		},
		error : function(xhr, textStatus) {
			alert('错误');
		}
	});

	// load bug data
	$.ajax({
		url : '/project/portal/bug',
		type : 'POST', // GET
		async : true, // 或false,是否异步
		timeout : 5000, // 超时时间
		success : function(data, textStatus, jqXHR) {
			$("#bugForm-box").html(data);
		},
		error : function(xhr, textStatus) {
			alert('错误');
		}
	});
});
//提交日报
function sendDaily() {
	$.ajax({
		cache : false,
		type : 'POST',
		url : '/project/daily/save',
		data : $('#frm_daily').serialize(),// 你的formid
		async : false,
		error : function(request) {
			alert('Connection error');
		},
		success : function(data) {
			$("#commonLayout_appcreshi").parent().html(data);
		}
	});
}
// 关联任务
function refMission(index) {
	// 增加隐藏域，记录任务ID；任务不同于人可以用名称唯一标识
	window.open("/project/mission/refer?mission_index=" + index, "_blank", "toolbar=no, "
			+ "location=no, " + "directories=no, " + "status=no, menubar=no, "
			+ "scrollbars=yes, resizable=no, " + "copyhistory=yes, "
			+ "width=640, height=480");
}

function refer(index, msg) {
	var summary = "summary_0".replace(/0/, index);
	var idd = "id_0".replace(/0/, index);
	$("#"+summary).val(msg);
	$("#"+idd).val(msg);
}