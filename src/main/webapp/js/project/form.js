$(function() {
	//初始化日期控件
	var datePks=$("#frm_project").find("input.datetime");
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
	
	//表单校验
	$( "#frm_project" ).validate( {
		errorPlacement : function(error, element) {},
		highlight : function(element, errorClass, validClass) {
			$(element).css("border-color", "red");
		},
		unhighlight : function(element, errorClass, validClass) {
			$(element).css("border-color", "#ccc");
		}
	});
	
	//动态校验：当状态为已完成，则完成时间必须填写
	$("#slt_state").change(function(){
		if ("已完成" == $(this).val()){
			$("#ta_proc").addClass("required");
			$("#txt_lc").addClass("required");
			$("#txt_fd").addClass("required");
		}else{
			$("#ta_proc").removeClass("required");
			$("#txt_lc").removeClass("required");
			$("#txt_fd").removeClass("required");
		}
	});
	$("#dateX").click(function(){
		var origin=$("#ta_proc").val();
		$("#ta_proc").val(origin+"\r\n"+getNowFormatDate()+"\r\n");
	});
});