$(document).ready(function() {
	var index = $(".div_with_divider").length;
	if($("#daily_id").val()){
		index--;//编辑页面多一个模板元素
	}
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
		var item = $("#daily_item").clone();
		item.removeAttr("id");
		item.attr("lang", "daily_item_" + index);
		item.find('.w-input').each(function(idx, ele) {
			var newName = $(ele).attr('name').replace(/0/, index);
			$(ele).attr('name', newName);
			var nid = $(ele).attr('id').replace(/0/, index);
			$(ele).attr('id', nid);
		});
		item.find('a[data-toggle="modal"]').each(function(idx, ele) {
//			var newHref = $(ele).attr('href').replace(/0/, index);
			var clik = $(ele).attr('onclick').replace(/0/, index);
//			$(ele).attr('href', newHref);
			$(ele).attr('onclick', clik);
		});
		item.find('a.hid').each(function(idx, ele) {
			$(ele).css("display","inline");
			var clik = $(ele).attr('onclick').replace(/0/, index);
			$(ele).attr('onclick', clik);
		});
		item.removeClass("item_template");
		item.insertBefore("#function_box");
		index++;
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
	//load project support
	$.ajax({
		url : '/project/portal/project',
		type : 'POST', // GET
		async : true, // 或false,是否异步
		timeout : 5000, // 超时时间
		success : function(data, textStatus, jqXHR) {
			$("#projectForm-box").html(data);
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
			confirm(data);
			$('#dailyModal').modal('hide');
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
function trig(index){
	$("#share_counter").val(index);
}
function refer(index, msg) {
	var summary = "summary_0".replace(/0/, index);
	var idd = "id_0".replace(/0/, index);
	$("#"+summary).val(msg.name);
	$("#"+idd).val(msg.id);
}
//删除单条记录
function delDailyItem(divID){
	$("div[lang=daily_item_" + divID +"]").remove();
}
//公用分页查询
function paging(fid) {
	$.ajax({
		cache : false,
		type : "POST",
		url : $('#' + fid).attr('action'),
		data : $('#' + fid).serialize(),
		async : false,
		error : function(request) {
			alert("Connection error");
		},
		success : function(data) {
			$("#" + fid + "-box").html(data);
		}
	});
}