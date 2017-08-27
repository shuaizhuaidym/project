function checkDate(val){
	return /^(\d{4})-(\d{2})-(\d{2})$/.test(val);
}
function validate(val1,val2) {
	if(!(checkDate(val1)&&checkDate(val2))){
		
	//}
	//if(/Invalid|NaN/.test(new Date(val1)) || /Invalid|NaN/.test(new Date(val2))){
		return 1;
	}else if(new Date(val1) >=new Date(val2)){
		return 2;
	}
	return 0;
}
$(document).ready(function(){
	//初始化日期控件
	var datePks=$("#myTabContent").find("input.datetime");
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
	});
	//初始化页标签控件
	$('#myTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	})
	//邦定查询事件
	$("#btnChart").click(function(){
		var begin = $("#dt_begin").val(), end=$("#dt_end").val();
		var result = validate(begin,end);
		if(result == 1){
			alert("请输入正确的开始日期和结束日期。");
			return false;
		}else if(result == 2){
			alert("开始日期不能大于结束日期。");
			return false;
		}
		var type=$("#myTab").find("li.active a:first").attr("title");
		if("engineer"==type){
			$("#imgengineer").attr("src",context+"/engineer_bar?begin="+begin+"&end="+end);
		}else if("issue_type"==type){
			$("#imgissue\_type").attr("src",context + "/issue_type_pie?begin="+begin+"&end="+end);
		}else if("industry"==type){
			$("#imgindustry").attr("src",context+"/industry_pie?begin="+begin+"&end="+end);
		}else{
			$("#imgrange").attr("src",context+"/range_line?begin="+begin+"&end="+end);
		}
	});
});