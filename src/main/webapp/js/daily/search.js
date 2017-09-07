	$(function() {
		var datePks = $("#queryForm").find("input.datetime");
		datePks.each(function() {
			$(this).datetimepicker({
				weekStart : 1,
				todayBtn : 1,
				autoclose : 1,
				todayHighlight : 1,
				startView : 2,
				minView : 2,
				forceParse : 0,
				format : "yyyy-mm-dd"
			});
			//避免和浏览器的记忆下拉冲突
			$(this).attr("readonly", "readonly");
		});
	});