$(function() {
	//根据暂存还是提交 修改日报状态
	$("#btn_save_draft").click(function(){
		$("#daily_status").val("0");
		$("#frm_daily").submit();
	});
	$("#btn_save").click(function(){
		$("#daily_status").val("1");
	});
	
	$("#btn_save").click(function() {
		var hours = $("[name$='.hours']");
		var total8 = parseInt(0);
		hours.each(function(i, e) {
			total8 = total8 + parseInt(e.value);
		});
		if (8 != total8) {
			alert("总工作时间不等于8小时，请修改后再提交。");
			return false;
		}
	});
	//初始化日期控件
	var datePks=$("#frm_daily").find("input.datetime");
	datePks.each(function(){
		$(this).datetimepicker({
			weekStart : 1,
			todayBtn : 1,
			autoclose : 1,
			todayHighlight : 1,
			startView : 2,
			minView : 2,
			forceParse : 0,
			format:"yyyy-mm-dd"
		});
		//避免和浏览器的记忆下拉冲突
		$(this).attr("readonly","readonly");
	});
	$("#frm_daily").validate({
		errorPlacement : function(error, element) {
		},
		highlight : function(element, errorClass, validClass) {
			$(element).css("border-color", "red");
		},
		unhighlight : function(element, errorClass, validClass) {
			$(element).css("border-color", "#ccc");
		}
	});
});