$(function() {
	var datePks = $("#frm_mission").find("input.datetime");
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
	});
});
$(function() {
	$("#frm_project").validate({
		errorPlacement : function(error, element) {
			//error.addClass( "ui red pointing label transition" );
			//error.insertAfter( element.parent() );
		},
		highlight : function(element, errorClass, validClass) {
			$(element).css("border-color", "red");
		},
		unhighlight : function(element, errorClass, validClass) {
			$(element).css("border-color", "#ccc");
		}
	});
});